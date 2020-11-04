Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1A2A62DA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 12:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5576716A9;
	Wed,  4 Nov 2020 12:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5576716A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604487939;
	bh=XeWWOiasb/In2NQsJUU4g/FVckwg/lbYXX7xooqPBfc=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=EkeEbMFzu1YCET/9O9DJbgx/40WzYqXpKJEuOPJKtrct+m73Bsfhci5ZtYqvVugbY
	 IMqXLq/SdAtlKPIa5hr6UseG4jDE5anCg0aeIIh4gl2A8vzjQeMsDY0aR79gcfAGLL
	 gpcKxQ8iYSvuKVQnzPrcEiRAp22IfVs3OL3IfxsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B975DF8023E;
	Wed,  4 Nov 2020 12:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7E82F80234; Wed,  4 Nov 2020 12:04:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E78D1F8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 12:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E78D1F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="pJ1Igwtn"
Date: Wed, 04 Nov 2020 11:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1604487838;
 bh=qzog3icJIjZzD0XOIj9DOkVirQclmbAhmMu5Yt1Aq4g=;
 h=Date:To:From:Reply-To:Subject:From;
 b=pJ1IgwtnEZFsPipU9ZgghpnWjwT8CI/P36JDALd83PArr0kVROCl8FW9jv/FAmQoa
 44h47AEgzcNRJmZYL5SOpRWFgAYvdzFjQtm0am8c9gSIPd3l8oU3/NJldaHl1QodNz
 IVQAvr9nilDfvPYJX79WfwpD0o1+N6gLVLSY4Ey8=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: apt-ghetto <apt-ghetto@protonmail.com>
Subject: Re: on-board sound on ASUS TRX-40
Message-ID: <3P1J3F1eh4WQLgW3Wf_luBfQJmBLnlKQ9yYxn2X8-39X7R_QgnlXRlMRyxn3AzaLCJrVlbA59PjSPjMlI9sAlu93tjGSRqA6GS9zdjYE8aU=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------09b4ac691a5e62c09cdbeb1e4f75e424";
 charset=utf-8
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
Reply-To: apt-ghetto <apt-ghetto@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------09b4ac691a5e62c09cdbeb1e4f75e424
Content-Type: multipart/mixed;boundary=---------------------9e2d1aa99cda2970ef814e8c55929098

-----------------------9e2d1aa99cda2970ef814e8c55929098
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,

With the mainboard Asus Prime TRX40-Pro I do not have any on-board sound. =
I tried to fix it myself after reading here on the mailing list (thanks to=
 Dan Aloni and Takashi Iwai) and with the patch below, I was able to parti=
ally fix it. The front headphone still does not work and I did not test th=
e microphone(s) input. But at least I can hear sound when using the C/SUB,=
 REAR and LINE OUT at the rear.

As mentioned, the patch does not solve all problems, but it is a little pa=
ss towards a system with working sound. The patch below was tested by me o=
n Gentoo with 5.4.72 and on Arch Linux with 5.9.3. I hope, it will land in=
 the kernel sources somehow. Please feel free to modify and use it. Becaus=
e the real name is required, I cannot submit the patch myself.

Thank you for reading this and eventually considering to submit this to th=
e kernel sources.

----------- Begin tested patch -----------

diff -uprN -X linux-5.4.74-vanilla/Documentation/dontdiff linux-5.4.74-van=
illa/sound/usb/mixer_maps.c linux-5.4.74/sound/usb/mixer_maps.c
--- linux-5.4.74-vanilla/sound/usb/mixer_maps.c	2020-11-01 12:01:07.000000=
000 +0100
+++ linux-5.4.74/sound/usb/mixer_maps.c	2020-11-03 11:03:15.444424941 +010=
0
@@ -538,6 +538,11 @@ static struct usbmix_ctl_map usbmix_ctl_
 		.id =3D USB_ID(0x0b05, 0x1917),
 		.map =3D asus_rog_map,
 	},
+	{       /* ASUS Prime TRX40-Pro  */
+	        .id =3D USB_ID(0x0b05, 0x1918),
+		.map =3D trx40_mobo_map,
+		.connector_map =3D trx40_mobo_connector_map,
+	},
 	{	/* MSI TRX40 Creator */
 		.id =3D USB_ID(0x0db0, 0x0d64),
 		.map =3D trx40_mobo_map,
diff -uprN -X linux-5.4.74-vanilla/Documentation/dontdiff linux-5.4.74-van=
illa/sound/usb/quirks-table.h linux-5.4.74/sound/usb/quirks-table.h
--- linux-5.4.74-vanilla/sound/usb/quirks-table.h	2020-11-03 10:53:24.0003=
96963 +0100
+++ linux-5.4.74/sound/usb/quirks-table.h	2020-11-03 10:59:02.699412985 +0=
100
@@ -3667,6 +3667,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge
 	} \
 }
 ALC1220_VB_DESKTOP(0x0414, 0xa002), /* Gigabyte TRX40 Aorus Pro WiFi */
+ALC1220_VB_DESKTOP(0x0b05, 0x1918), /* ASUS Prime TRX40-Pro */
 ALC1220_VB_DESKTOP(0x0db0, 0x0d64), /* MSI TRX40 Creator */
 ALC1220_VB_DESKTOP(0x0db0, 0x543d), /* MSI TRX40 */
 ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */

----------- End tested patch -----------

Here is the version for the master branch, but totally untested:

----------- Begin untested patch from master branch -----------

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fa764b61fe9c..b6c1ffb65f69 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -393,6 +393,10 @@ static const struct usb_audio_device_name usb_audio_n=
ames[] =3D {
 	DEVICE_NAME(0x0d8c, 0x0102, NULL, "ICUSBAUDIO7D"),
 	DEVICE_NAME(0x0d8c, 0x0103, NULL, "Audio Advantage MicroII"),
 =


+	/* ASUS Prime TRX40-Pro */
+	PROFILE_NAME(0x0b05, 0x1918,
+	             "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+
 	/* MSI TRX40 Creator */
 	PROFILE_NAME(0x0db0, 0x0d64,
 		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index c369c81e74c4..6323faf49d67 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -563,6 +563,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] =
=3D {
 		.id =3D USB_ID(0x0b05, 0x1917),
 		.map =3D asus_rog_map,
 	},
+	{       /* ASUS Prime TRX40-Pro */
+	        .id =3D USB_ID(0x0b05, 0x1918),
+		.map =3D trx40_mobo_map,
+		.connector_map =3D trx40_mobo_connector_map,
+	},
 	{	/* MSI TRX40 Creator */
 		.id =3D USB_ID(0x0db0, 0x0d64),
 		.map =3D trx40_mobo_map,

----------- End untested patch from master branch -----------


Sent with ProtonMail Secure Email.


-----------------------9e2d1aa99cda2970ef814e8c55929098
Content-Type: application/pgp-keys; filename="publickey - apt-ghetto@protonmail.com - 0xDDAEC934.asc"; name="publickey - apt-ghetto@protonmail.com - 0xDDAEC934.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - apt-ghetto@protonmail.com - 0xDDAEC934.asc"; name="publickey - apt-ghetto@protonmail.com - 0xDDAEC934.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tDQpWZXJzaW9uOiBPcGVuUEdQLmpz
IHY0LjEwLjgNCkNvbW1lbnQ6IGh0dHBzOi8vb3BlbnBncGpzLm9yZw0KDQp4c0ZOQkZ4Vm82Z0JF
QURjQm1uUWZqZkJ0ckI5bmVuVmR3dk1ROWhKMjVLR1A5S3Y5ajJrYmNKZTZtQ0kNClN5ekZOSGxZ
cGROYXY3YzVQSHdIRmFrNDgvQkNmVStVcHIwc2hKaGRnRDV3TXZ1cWlIbEZZV0NhYis3NQ0KSG9q
ZVM2TW5hT0RONkk0ZFplYWFKREJyUUtzTWp2UlhPZHphNUJldDFhNUxYL25PZTdFakdrK2gwOE5l
DQpBS3EzVUxqbC9OZDJQMUNGMGVlU0FGRnNwckZ6aURjaUhDWEJGQ09oMWRNZTBJenE0d1VWcVh4
dk5qYU4NCjJNMWpNS3d6K0FmdWMreHorZWZOQndMZEMzczJTc0puQ3NCOFJOeWVwMDBYS1pkYTlQ
U2NEUURiK2p5aw0KUmN5NGpBUDF4ZCtxbnBYZ3d4SjFzaHlWK1Z6WFdTUldkUW9MbWlNci9wcFFm
NFJtL211STI4ajRwNEpnDQpQNnVXaVhWcmVQdStHYW8vMlBPcHlTVFhkNGFiZU9TTDFDUERSVkZV
VzhGcTBUS0RmU3MvZVdkcjVTbUUNCmtxaDBSNGNMYWpUZ0dXdDZXanZHeThJRnVITGJKdk93UVZa
VDhEYnFXZGYrQlk4czEwVUs4d2xrMklORg0KN0l2ZFBHamlnKzk1K1RKUDhjY2pEWVVwaTlnZjJI
RE5JemQyL0tmRzdDWGt2N0ttbTNsNzRjZEQzZzltDQphM3FMTGU4RktVTTFSZTVGN08vYVFLeHZq
ZUVXZThyT2l0cTJwRmRHbTI5dVQyQXNzNW9MTDQvVlRJV0gNCktBYkNqV3MyQ2QydVUwNUtOcjVM
VkVvTDhKeXFNY3hldnJHbWpHUGxWN1U5cUhyTmdqYUdTVEhUK3IyKw0KeFhmeGNabGwya0lDVXd2
bkhOc0ErWGZXd3RVdWNZc2VVY1ZqSXdBUkFRQUJ6VGNpWVhCMExXZG9aWFIwDQpiMEJ3Y205MGIy
NXRZV2xzTG1OdmJTSWdQR0Z3ZEMxbmFHVjBkRzlBY0hKdmRHOXViV0ZwYkM1amIyMCsNCndzRjFC
QkFCQ0FBZkJRSmNWY1cxQmdzSkJ3Z0RBZ1FWQ0FvQ0F4WUNBUUlaQVFJYkF3SWVBUUFLQ1JETQ0K
UFN0Smt4b2tFbFRrRUFDQXQyRE5XU3VrRWtSdzRJL2s0UE9rdXQ2TjZvWEVmYlhGdUxtcUczUFoz
d29iDQoxV0xnY3I3ZlNKRXoxTVQrRUpBaDJjRCtKdkZRMTRrci9nN1hrazQ3RHFOYzIxTERmUk9H
TGlZZENzZ2cNCmN6UzNEWEN2NlJDM1V2dkRvVHlxTXkrU3ZtMzNzRytEeFJUbVl6cmtCUFRKeEN6
eWxGMGpmTnBjcFJqbQ0KcjlnT2xsY3JHRWdiNndLOGhwN2xlUjJPc29yUzdyNVpYdXo5dXRBYUpw
SW5DNDZkaTdLVnFIaUM0VVpqDQpkaWNYOWJzVm5zMS9KN080SDNLSTNlbnVzQ0JEVlB6RU1ZTStT
R2xqOVhwOU5HYUEzQ0RRd09yaHNNdnANCmJpTGhKeEZ0QXVFbnZHcE9odXRUOHdPT2RCMWlHQll5
UXNrZGRpMFVpaFJTY1d5Tk9UTElNVUpVL3dLcA0KUXkvM2svclVESXBRK0hUdmtXUVpRWHVzdita
R2RjbXlZM2hMUUhFVUhLQmRxK05KYnJsZFVtTXNvV2M3DQpuR3lhK1RvaXZaZHp0MWxZeEdyY1Zv
WXZMNlZ4OU1QREh0ajhxbVlzQVoreDRBY0poSE05M1RuWTZuaFINCmtCVFhKZ2Jnak9mOHZwbmRN
ZzQ0dzBidGVkRGdxcnJOZ1hNd1RZQ2xmeTJPT2dNUCtoWFIxVTRINS9GYQ0KV3RleHVYVm5jNFBx
SDlLcUxvNWx5Yy93Nyt6S3lsZmJZWjRneWJVTkQ1M2ZPUEFpM3A0TnlEYkxpZmsxDQo2MXhMa0w3
L1RDNFFZQjU1bUU2WkRIS2VxVEVodVpZWTQwRGpiaFA2U0V1S3NkMFp6RkpTeHpHUWEyOUcNCnFU
dVEzZzA3UWRpZUtBSVpZalFaNDdmUHJkUlhPN3dJSUtzd3U4N0JUUVJjVmFPb0FSQUF5OFovT21T
Qw0KOXJ3MXl0R3YyQjNXMmxMNXV3bmkyc2JkR0h6WTlVSEx4UXJ2aG1rQWZFQUV0LzdPSmx0L0o1
VDVqYVF0DQoxUXAyNHZHckZLUzR1NW96WUF3aFNZOXV6dFQweGxTVVNUL3hlaE5IY0hQWVVhWE5J
aHgyZW9XV09YTUoNCktldUdMUFlpODdmVW9TKy8vNDBqU2pCeFNNZVJQYlhXSVFvUXhVUy9wMEdN
by9ISTJvUnRaQmYzWEw3dw0KRGludUtFZTRjNXIxa1g3Y1h6Z3U5TXBxbXc4NFlYR3ZOcTBDU2d2
UWpMVVhZSHpncW5DaFYvRkpqT1lDDQpuQ3lGOTZKcXdQcldERjVwVEVjYnJzNGUvV2ExcUJHRjhR
Z1VSbnJORVJYV2JXVVE5eDJlZ01OWGc4dTINCk5DOWsvOGtaRDRrTDBRdFozdGhrNW44dFR1dUZK
ZWtqVG5lWFBTYVNFclQ3TURuNDlsamNmcVo1VEVndw0KZUlEZEhTYTBuS3VVRnhnWmszQjVSYTF4
N1F2VUlkbE9xOTU3Z0VjUGcxUDVFcE1nWFFWRHBjZXQybElsDQpsRzB3bHFaZ1R5Yk9HZC95NlFx
cWtuenZYRzRpREpnZ2hXT1ZzMXl4OWpxWElaSmhNblJWN1RIbWlGcjUNCkw2QlRHakRvNEFhT2lB
dzJOZG9vQlIrdWFvb2RmQ1M1ZUlBQm5qQXdoQlBoYW5ZR3JTNnJZL1JlTUUrNw0KZVlKQXBVSGlM
cFErMi9CdEhzVTF1bzMwSWdrK2dnTTUzbFYxdGVuOFpSZjE2SFJZTyt1Z0JPK3lGM0tYDQoxNDJV
ZUJMbDVobitySmFnVE5ObVhPTytiV0R4Q00xQzV2Nlg3NStWUEllRm1VY0pBa0poVjcwZDB6b3gN
CklRQmV4MWdmWXYwNlRzMEFFUUVBQWNMQlh3UVlBUWdBQ1FVQ1hGWEZ0UUliREFBS0NSRE1QU3RK
a3hvaw0KRWxuQkQvOXIyVjNOVVVuNEltRU9nNFVTeGNwRHgzaDhBcXU3cnhtRndSdmJKeGoxbFhG
dHJ5Z0h5U2E5DQpVRnFnRlRyT2tXd3IxWDI5ZTJqRUd1R3BkODlKSWQ4RytCZmpteTBUNVNCQzV5
NnlpeldWV3krQUdRYXYNCkJlYzZGc253aVIwKzRManh4ZUlSbm52UzZvYncxTHh0QW9PV1dYcmhV
OEVxRng4S0VTRFhCZ1Y0L3ZJbw0KcWs3RVdkSktsRUNwK2tjZW8yY3hjaDYxUEZ1TVIwVE13alZm
dW5udzNGemljYktWMWQxMmJuaTdIOGFKDQo3Rkl5VjgyQ0pIMEdUaW5jNm9BaktZcmk0OFNITy9Y
VnE4bmJoSmJkMlJUY2tlMEZnaW9GQ2NjWFNGWkUNCm5kTUV6VVpmRHdaTitkZGViMHJZc2U1a2R6
cHlLUTIvTFZSSUtMYVh0VjRDblA2SGlLWHUzRGVjZkhQdw0KaUZYVXUzNDlrNzJpRFlIak91bkNr
RXM3K1Q1NTY2WUtwNVJETGFvenFUb1p1MXhMWW9tcFhJc2txUlprDQpma2MyVndIQUJUSDFvZjZI
aVVQMzlzNkk4ejBTUy9VazBaOHBpNUpKaGtSLzFxNmxocmx3L0tFQ3RlTVgNClE5T0R6VmdkWTVs
dDdmUG5uRGdVdEpzNUlSM1dCcTF6U203U3lzd0diNndrS1c2elhETjFHaVlxZnFwaA0Kcm52VXho
Rm5iV1hlQi9xRDZ0STNJOG5pNHlCdFhlS3NFYkRWcmFxcDZScGFDb3ZOb3MvQ05LV0xXL0tWDQpX
bUxGWmhMNzVjbHdhRE9LSUxqcVRWS3JjeXN3THdpK0JmNitDdFZwZFFDdlBNNVdLdUI3UmJUM1Vn
bWsNCnZXRmNZQjMwZ2VZektUWVFrR2VnMXBnc0ljamI2UT09DQo9dTI3Sw0KLS0tLS1FTkQgUEdQ
IFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ0K
-----------------------9e2d1aa99cda2970ef814e8c55929098--

-----------------------09b4ac691a5e62c09cdbeb1e4f75e424
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsFzBAEBCAAGBQJfooqbACEJEMw9K0mTGiQSFiEE3a7JNC3bc7vK6Z9VzD0r
SZMaJBLFThAA2TigRy8eK3sK8bza2hYDsr3Es5VLKdRgOTCp/hT2EPcxs5xG
sY7aGFWd6kZJQkQeWiJHAhpPnEW0mPxUZlck370PcAAfExp/AyD/ZnFyG91D
t88oU9y7Udsz8jGw4OXmz3HMVlBOWapUH83e3OQ2GOj5OPexx9Ebg/tpPkys
3aBQSHq9XkpYbP9wxvP1I8yjKV1TtZpLClDBIBA7+Z5z2fsf4C2kG6q657+F
jPPLXPcWU4ewxVqp5tepIhJ9X2uQWLdbTRzdFQGMVeY6QdJTfx9mxcAmaOyo
sPvnSK7MNyAM2jHb3N8rE+/lhEUuMDnPNfVbqhIQmJfxpwaN1ity3hqDzWMj
97JQDk0PQpdfHF5/m4R6VzpXzkiVPjRBHGqbPNrOMXuQ5/OGwIYrRK/FkfJo
CzlRM1iuuRpH82Zle4jryG87x5iKwTgVRFDsUnn5eXbSkv1mflQlWNHHoPMU
Y61r2/2AvFK6AkjoSFAhfo7xYC6dyBRW0zNu3a03MDgertmWvQDqK8hTJpts
5mEcYv7PilNNrCOOFYIPpiQG0Ld+wmBo6zbotjZ/Vp0yBG1E3Y2kZTf7x5cb
OPJ0EadzBmuEunO5S1EMZwKhY0Pvh7PC5ePvzr2d+fCtcKM/07CX0Fv1GlO5
1ejCLAy0K56EtEIf4HQePsVosA8UeI+rQvk=
=Lp/4
-----END PGP SIGNATURE-----


-----------------------09b4ac691a5e62c09cdbeb1e4f75e424--

