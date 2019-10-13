Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1FAD5551
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 10:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCB3166F;
	Sun, 13 Oct 2019 10:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCB3166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570954959;
	bh=Z2AdyxUidEx3mvivdmsgjYfEuIgAuke3lSwRGBR69cY=;
	h=Date:From:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAqxGuBEt72+xMwp1o4rUhIM33a30qYP1UCdvs+rWntc3pph9XXCDKHoERtFA/7gP
	 Wq6LwGyodMRw0mEgZvZk19VwjsSmbIMdf238cxTmtJ3hMhbhZ8ePYj0yDD11Hw1iB4
	 aVRkwumsreVXEuKHJ8XH9+SViXXBMUYl9Rvan8ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A4EF80377;
	Sun, 13 Oct 2019 10:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5243F80362; Sun, 13 Oct 2019 10:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.6 required=5.0 tests=FREEMAIL_FROM,
 MALFORMED_FREEMAIL,MISSING_HEADERS,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C369F80362
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 10:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C369F80362
Received: from ladybug (unknown [37.165.46.255])
 (Authenticated sender: subscript)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 659B95FF6C
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 10:20:37 +0200 (CEST)
Date: Sun, 13 Oct 2019 10:20:30 +0200
From: wwp <subscript@free.fr>
Cc: alsa-devel@alsa-project.org
Message-ID: <20191013102030.50d7c8d0@ladybug>
X-Mailer: Claws Mail 3.17.4git48 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
User-Agent: DOH
X-Face: 9x'hO=<A?%6*-4(@CJIAZa76:2U]#n7hu##-c.@?as>puy,
 x7GILB]CjB5[R"/@e8LHs#mq
 :>z.ziF; S^1k#Q&M7o"]ff+U|,o2]03`:m[B3N_TSP-p(:x[Y1s/|"AP+~kJ(>>>B7cC]URQW}Cf5R
 [.$i$]W/Cms{l]itD;=B&F6fPm1GF4
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX9x7aws4vD
 2ekyQlOrRVP//////f9jDrkCAAACMElEQVQ4jVWUy5KjMAxFzYTKGhEXezvVXg8x
 NesQXP0BU4XX2B3r/z9hJPHKeNHV0UEPX11QMx+kE+e5FPmvcEgdAAtH0MAHKFEI
 8iOtcYVzBcSIS6WUZCXs6AmcFT9GCXoI4ckgdy1wTEDBd+BzpZzkrHFzWXtE1AKG
 0GFube4OsCYE31OKBtuVbapYDxxvFNV637zjiVcglZ4y8g+l5fZ/wAkEvAVbUMDW
 +9KDgK7FDcSa45P/vQCA97o9mm9TqcqH5+TTa9cqLmHtnrxvqLk7wNZENZexIvAh
 +0UuEiaA2vef+1jCs+b2QzP5x5kREa6s4zQQY4A7SK5DHkBT/GW6IoD+xOyMw9s0
 Bu/9HzzBjDaNbpk0xWkofSxqjtbc/Xa+8caO2VbbOZJbzgD9HY9FJRFvPb3V3TEu
 qQrWUg7wtPkAWedMpkHrkETHc+d5tMnFghFn790HSNayl8hemSqRgw4A4MhslPND
 ldCUHfyl5hZaxwkkQ4eniGh4UHenDkjqnIBW1xraNzkut3iCsgvyiJaSyg4wmh0Y
 rrgCEoyaUqVdE//YAdUFl4/46gZV5Bq/UMTtbzD5fhsXMZD/xol1xdTAC7ep8A2g
 lLr5FtkVSl9XUMi4o1IVvRMMKgVP7k2mjjVn6GuR179q9Fj4ygojF4JvWTEN0qhw
 FcNhrBulR6nL7++o/NfqxJiCHtaGfKdL2L1LCjYS5dL0kTi+JXxzLPJDwMfXB7cG
 LDP/EvAPpzg/DzW8HhEAAAAASUVORK5CYII=
MIME-Version: 1.0
Subject: [alsa-devel] Focusrite Scarlett 18i8 3rd Gen audio interface
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0810433678775620943=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============0810433678775620943==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/um6K/DWzoiNc=Vr8m5PbxT1"; protocol="application/pgp-signature"

--Sig_/um6K/DWzoiNc=Vr8m5PbxT1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

I've recently bought a Focusrite Scarlett 18i8 3rd Gen audio interface,
great device, but in CentOS 7, with either the available 3.x or 4.x
kernels, the device just appears in the available Alsa devices, but no
mixer is available, the device direct hardware monitor output is also
not working (it is, by default, and works well in Windows, but I
presume that w/ no mixer support in Alsa, it's expected that nothing
works). I'm able to bound I/O ports in QJackCtl but nothing goes out of
the device.

Of course, adding the 0x1235:8214 USB ID to the quirks just doesn't
work. I presume there's more work like the patch submitted here (I saw
the archives) in the "[PATCH RFC V2] ALSA: usb-audio: Scarlett Gen 2
mixer interface" mail thread?

Do you it is worth trying applying that 2nd Gen patch to one of the v4
kernel available for CentOS 7, adding the 3rd Gen quirks and see how it
behaves? Or is there already progress on supporting the 3rd Gen one too?

Regards,

--=20
wwp
https://useplaintext.email/

--Sig_/um6K/DWzoiNc=Vr8m5PbxT1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJdot5UAAoJEEnFZ+hWA4VJAxEQAJjSNv5hQqJ0qBTwVbe9WLo5
P0miS5fnhxGV/h2pi4DZzR4saHwhr7uAwUEgj2vnoiKZ6x/NMikfTEjlF5pUaNhX
DxZMGKmTqul7z0hssU09+Q92nURwMKY6E6OX6eCl1MlRjQrbmn/vz2G74ceZsKab
QhQW5eUTFZZFfCFhNtcQ5n43qPzRU/F28p8J6q1QGNrs9GzM1rBFAtHJmjmKoG9Q
iTj8NNlELK/EQPWgsFM1H6FYUBj5RIPai6VEc4+mvX2vHtOr349YhBNF5IVdMVHS
waYQQ85yPYMJv+07vtEqa86ddwYIej9cfErLXzXgqQPy29Emk4jmftANHv6Mmtga
fvpk0IfMUeD+kIC6AdWt5vvtyX/kEZxWYpB9vwx6DmvlsiZml1TV2xJMsPUfxhQj
qfO986ReYEJQau26GDRlEvEVvK31FXCOYCx0Wp5nnoITJ3G6LCXd1KqJuZePO625
ahuraNZ7yiqx/9owwl9L6xELN6yc/1tPPbvrzB6jcJHuyHjOgVymCmjXfPUFVj4h
a94qxsMnuWmv6mkA5fW+PDKvvl5C6DeY9AktiHijPOuVsEhMPdxQu41fd6vzRMts
g8WveTxR031j2UYa/Jpdx//Cq6GioUuFrKvhlkKlCIiQK4RAtnOCNA3KxMJpkHpE
AAHQ0MwAJ9VRRB3+H7PT
=M8Bu
-----END PGP SIGNATURE-----

--Sig_/um6K/DWzoiNc=Vr8m5PbxT1--

--===============0810433678775620943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0810433678775620943==--
