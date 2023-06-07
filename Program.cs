using System.Net.Quic;
using System.Runtime.Versioning;

// We need these attributes because the .NET QUIC APIs have the same.
[assembly: SupportedOSPlatform("linux")]
[assembly: SupportedOSPlatform("macOS")]
[assembly: SupportedOSPlatform("windows")]

if (QuicConnection.IsSupported)
{
    Console.WriteLine("QIC is supported :)");
}
else
{
    Console.WriteLine("QIC is not supported :(");
}
