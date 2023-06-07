using System.Net.Quic;

if (QuicConnection.IsSupported)
{
    Console.WriteLine("QIC is supported :)");
}
else
{
    Console.WriteLine("QIC is not supported :(");
}
