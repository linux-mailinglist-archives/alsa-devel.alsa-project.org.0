Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11856C1ED6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33DB0846;
	Mon, 20 Mar 2023 19:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33DB0846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335266;
	bh=eprEgglWw6DhYOkLmd0I/2vy983ce3eTWxfhUmH22Tg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T9OKkqUOhfqIFYS4vAAmbl6IMygoCasuaRiYF0NHEgGNunvVDvu9qauC2AL0Q0kFO
	 DE6+ovyPqKlYLABfssa4AA1t909jfIrCzPkwProUMNfkM3oujKCb667pItQSxLXd0L
	 SlFIPzumyV3KjZcuhkrr884wqVSLOOUg1j+pA4r0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B12F805AD;
	Mon, 20 Mar 2023 18:58:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75DACF80423; Wed, 15 Mar 2023 22:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01olkn0829.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::829])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC1A1F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 22:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1A1F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=PlN6FgUW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwnVPUgaOqH1hHmGwLWlf5sUweTYtmVCSJGJOtBdgy8qWcFzCjeOaYdHWPspAyNzR6X/HFfVZwQcaN4PtU0OYdXudFTGjjuhBVfW15nwvd057RoUj9rW2ivMCka90C2YVp2VoLvB/Haff1v945sPSeaupaMN8e/+kVyLBVrHvfYbKoF0GfRivBdXNugF0HhAIy0nO8WCmtJ2U0mx2N4R2JesyTli3ESQV+IcbnYrJ26xdTGY14hDzGYFP/yQQr0JVPNWtE7xH2JoywnarFRzVHcimKuff3iWiE0BhOedoAS/HXt6LO/tEwodwBnZXAaq0Y3sbNIysgTZx+6Y4i6p4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXJ9rkTVeTGZMeNTNjqhA4454Z5PaY0Jd+gIEwkbiyM=;
 b=AtMXHNd+Ev51hbCwWe/+Uls5b9QVuHPMT2ibvLzUGdlMr6zbxQDixkAVUC60MYiFuwG+8ba7M5vxnXMo7IZrHVR69ZI5Pn16OnF7zFzdCW96O5QnclrNjsQQDY25P4iJGFqiE/a0X5ymSsCko6GacylQXUIm69jGrCwAv0OnIW1kJmPk0AOtwwC4p34O27wPDZ2UsWbEK/yO08liSZ4OAo5Gcr5ndk+JamYhj3DRoCFS85TsKQrCMnFYzPLAmswTbgQrzPT9I33QONPYO28oGrCNQki16YN+pN/o3iECgqoghWOsjydOylcN6Sgmfei7HfjTPxReFpp7k5SaS1cXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXJ9rkTVeTGZMeNTNjqhA4454Z5PaY0Jd+gIEwkbiyM=;
 b=PlN6FgUWdy6aUND6OcYEBeeelKHDZwnfzO0hzquuCtHlxHpSBJydtLSMDcLUJ1k+ng3vgrJUObfnCVLpxInT9Fr4pCULnl7zn8P0O9n4/a6SALIJMeJZP7GvMF/JhcarV9oBdq50ITm9+ccKlbS2DlFTyyX71AIZCYlGUyVyFJcwa8xbZk6veAzcr6xpNJsZn3dfJspb36U0SEaNF0Fs6U/c+xb2OJgBas6iMlhmL5WQe8GOs+r8NNmAXdPZc85B19s/Rd8BZBgtSt9Hnn8OrZivKPut1NccYeupST+ofotLEkSvK+cnLjTtgsZ5ivG3RtGP7QsSpURtyk+9ff7eCQ==
Received: from PAVP195MB2261.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:2f5::16)
 by GV1P195MB1689.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 21:26:00 +0000
Received: from PAVP195MB2261.EURP195.PROD.OUTLOOK.COM
 ([fe80::4b22:b4f:eec9:6ae2]) by PAVP195MB2261.EURP195.PROD.OUTLOOK.COM
 ([fe80::4b22:b4f:eec9:6ae2%4]) with mapi id 15.20.6178.030; Wed, 15 Mar 2023
 21:26:00 +0000
From: Ge-org Brohammer <gbrohammer@outlook.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop
 16-e1xxx (8A22)
Thread-Topic: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP
 Laptop 16-e1xxx (8A22)
Thread-Index: AQHZV4QMrJRu+pzAoEmvU7xHqKq+CA==
Date: Wed, 15 Mar 2023 21:26:00 +0000
Message-ID: 
 <PAVP195MB22610BD3A98379E740C93C08DABF9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM>
Accept-Language: en-ZA, en-US
Content-Language: en-ZA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [q1BZ5PEHFcwtnXtuF++zQxpbX017cu0P]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVP195MB2261:EE_|GV1P195MB1689:EE_
x-ms-office365-filtering-correlation-id: f5e5cf70-02e8-42c3-839e-08db259bdf77
x-ms-exchange-slblob-mailprops: 
 obhAqMD0nT+tKFjPsU7SjRuFYSHqldalxqqW0TGjo9+sgO1JwF8vJQw2hXjlBpnkdqwpKYskxSbSYx8AhZ3aH+3lvyH7yZjwOdN2qX9ruLIWv4aVYf0XoIc7VX/cX5c9I0yFrfCL0VRKzc+m7tu0v4/riqEUDsxJc+IJvUzNZlpH9KvQ5Eqle8bSdqAxczwy4A6GbCJdWYbtmfhbq+XLbCeW2FtNOv8ExiJd3HGULmw86Pn1JEK6T5FwSPcAECc/G4bhhWNxBQuuV5ChfexJ85nu/wNtIXNHPJexsTWn6wCDe5o/+Ji+VyoBpfIxejrbLnmphHVYESPwexnu4MDucHwgZlA69J3h+WlaJMWaMobysQ7e2Uyjpp01TZGOZS2ZSp0ieSdskDwR0NvAhki8fvmjGJepjOW2HAsCkwvdN1/YZx+WekLpL2n5+m3Z8z3IjrL5VRPsXAbtsqA/+chtoxtIwfpcNWc3rxh6+NdBRoVL9Y61rUr239Mtgmk5+QalcfLnwOuMvq3oBitfOL2fqXgaSuo+ZXcF7xhSIhnh0+PxF91vbMsghoN82vJQVkyLxtCsNyhY80ij4TStIENHKfsKn91nVc/0o4WQsZvkk75mRM0KwT+HR6FDXXqBWjnZk6dMKpXCUdf1iPh2F6ljeSICB/lmEfTUQNlj4TF/7xph2u99hDMABmzUu85wWsxc5FH1L8H2IO8ureTXdxITQD7LF/mOsn9Jue5EL2S3OA/acaaN4nh2pLSKZQusZWIq6sowq8ecMiTUbYdujfGgP/X6jFZjk64MaVZ/5hkz53vBqJZftekBPxiIuv2CPtdg
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nzvTVnVjyfn/+48WGxaBOCJ5cIf7y58zBhHuHbU/vapIv9IIiVzE/cBbcl/N+8xrigzl0mzDhy0J7r1s/xt9ocrSVpcXSiTaB0mtj7Q0KOx9boJg7SJKoEB8EbVAFOs7RuLjqNZitqmSrgUM/joSgj3juvVVV88qh76hv5T7PDFPrxPYgywxTUOEKl2XlpLvU6AcgcJKH9qJJadcrExXFDZFEVizYDCc6R1hnaj3Ua7gQh2Sy09Z0JEOnUTJoilQmRQENVpF8YvMW8mbadnTiYSjG+W3iyHfaaBtN0zLnahoMi4wbTPZfCJkwudkIDethHDZqhBdAh1wHG3TkwA+nPNcNtvsqLrB8rjuE3QmQhJfL/vNDui/HMGVceAsB6LzxZtqbQ4SLjbOdJSVaq5znWJli2d4jiV5+lS/LW984ux6qlCQnvmSJ/9zZp5R9w/Vz3ZpMwvvXS9N4uGfs5JPU/Uj6WVw+QoIYIXAj7+zlqfgBzGVIsXNPSxxxo9CsYuo7dxfiXddqXj42TT7gvZYXlxmE4OB/rkRMeOl80esI3oZpJMcq0tu4TPOMFUy5U6GRgcWyKHDJqXWgfWreSU4w6GeyxdVdPvA8Be+YAndgAgpoDCJhYxJkwOqBgANKFRRBeehw/o/7tLngQwDvBJ0Sg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?E6ota0mkqTlSdIn85tzA+24aDy9z02RQecE1K8WN0EJ4rfLAmjrOpih/+w?=
 =?iso-8859-1?Q?YT6QSugYmsdG6FX4vfVroOHR0Px0Zf+bFoNG8U2A0o6KKHbN/P0wifDDM5?=
 =?iso-8859-1?Q?0BMm8+dvO4YHtcgqjTRJpBmC3x23KK6+1wXGQ8pJN6C5Qhrt9EQblgfp9L?=
 =?iso-8859-1?Q?aDFiMdqZuF/y4xT9gPL7aVdJ0v+IJYolr03Dz7cEXZbRzHjFqAWGEPTV/U?=
 =?iso-8859-1?Q?q83LaFvO7QiZ00vvpNO6sAowd9jtOH1NJiVluaobJM6q0jHIUK8OdJdTY2?=
 =?iso-8859-1?Q?R5XsRY56byhYShUVDu94RZ2MxL6YFy1L+RIwyxuOtEv+65Dywk6CF9++KO?=
 =?iso-8859-1?Q?lePMu+lht+QsAuDNRQ89/pll1x1Id4LmMI+6FIdzlvM2B/JCIUphd4XHog?=
 =?iso-8859-1?Q?vll1fwArjPrT8aVS98rrjnspkjhGLxbP6Ic/Yflk/ywv2VuXDpA1Vgi6+i?=
 =?iso-8859-1?Q?6iKI77bx1EDe24qxFRXNHUppW6v/RvRYIZtvTAX/Zbayvupr3vr0TkcPXC?=
 =?iso-8859-1?Q?pfNDlS9jqwIiFu5nW7D7z6ynpWCHGmVTX8R6tQd/hkMq3Ayg1q9t5GgH6o?=
 =?iso-8859-1?Q?crqJEpmiFL81/ELHN/GTckoETNRSAtt4Di7cav8XL4ppCmsDQOFXzIen8l?=
 =?iso-8859-1?Q?ZkI2NudyqsKusIV7rDLYJ1e4epHlze8bnzT3QUa9PhogTFSMTqvavAu9Wj?=
 =?iso-8859-1?Q?Zn0IRC+W6UZoIoGIBlvtWIn6Bu3AIyABHLWVQh8re81CvIItwGpadf9ZeR?=
 =?iso-8859-1?Q?gu/0RYLsRkB3tCFJz6HK1w0x8jQMSRf0u/LWKpbwGvWzNyRmBrkhCi0GXV?=
 =?iso-8859-1?Q?g7t3QCiUw8pcj2GY0JcJCsekSEp5LfjzIRqfS/wvJceFR6MgIqld10l97e?=
 =?iso-8859-1?Q?URttO+83H6TVWe+dFHGCCdzDs70Vj61D8R7vsPiMy8s+abHqsn6wYo7AMQ?=
 =?iso-8859-1?Q?TqcvcGTFrz3/kc3K6fwEtqs3YaQndnB8gKUilh1b5WjvuPpllP40lGcUa1?=
 =?iso-8859-1?Q?TAu72nbvf8Nac8EiHEU3N01ZXFsgPQevY7uR3r8dy81sWb0lZQ06iD/45i?=
 =?iso-8859-1?Q?5c0VKFl3ufWMx3wseATaMKFjYsKh/fWGMcP4pLAqb5CCFOrkm/kvJ6QXix?=
 =?iso-8859-1?Q?FFddusre1Mr72c3fKt3kE4CX6wRFhdXOf6YMVeMntIo/hJ/ksMSBjcDpEh?=
 =?iso-8859-1?Q?ubUuE+pIq2m++sRGyd7ffH+TxlbbzOkAL2h+VO7PkUfWYT8nblxalRu65l?=
 =?iso-8859-1?Q?LpGsIa6Eyhauh3C8RAcjEoTQgDg35hYkSfI97pC5D0SOAcOIqZyaiVDZVC?=
 =?iso-8859-1?Q?msGO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVP195MB2261.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5e5cf70-02e8-42c3-839e-08db259bdf77
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 21:26:00.1742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1689
X-MailFrom: gbrohammer@outlook.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 22SDB2E5FLB4ANFRUZ4GIWCFC6F2XOQD
X-Message-ID-Hash: 22SDB2E5FLB4ANFRUZ4GIWCFC6F2XOQD
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:58:14 +0000
CC: Ge-org Brohammer <gbrohammer@outlook.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTPO5RYQSFS7UPPATESM24ZSFGIHN34H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This model requires an additional detection quirk to=0A=
enable the internal microphone.=0A=
=0A=
Signed-off-by: Ge-org Brohammer <gbrohammer@outlook.com>=0A=
---=0A=
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++=0A=
 1 file changed, 7 insertions(+)=0A=
=0A=
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c=
=0A=
index 4a69ce702360..0acdf0156f07 100644=0A=
--- a/sound/soc/amd/yc/acp6x-mach.c=0A=
+++ b/sound/soc/amd/yc/acp6x-mach.c=0A=
@@ -269,6 +269,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {=0A=
                        DMI_MATCH(DMI_BOARD_NAME, "8A43"),=0A=
                }=0A=
        },=0A=
+       {=0A=
+               .driver_data =3D &acp6x_card,=0A=
+               .matches =3D {=0A=
+                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),=0A=
+                       DMI_MATCH(DMI_BOARD_NAME, "8A22"),=0A=
+               }=0A=
+       },=0A=
        {}=0A=
 };=0A=
 =0A=
-- =0A=
2.37.2=0A=
