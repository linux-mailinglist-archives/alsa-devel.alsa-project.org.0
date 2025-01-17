Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C522FA14A67
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2025 08:49:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A8AF603C1;
	Fri, 17 Jan 2025 08:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A8AF603C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737100193;
	bh=+yBmPoF4ogpbGxrxDVIFImhd0LLlFhUgbAtZq8Zp9fc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hQgd52GpatV4LGF/mYizQTw26BvM6rEM37bJSNoOFWXKIMQX7LjvbToGSg3XWhiKH
	 ahf59Z2Oi82MT5lCj209vCC53nHti6YMcXVc7qlLPr/fFmkCYDnU4l6cABT6XLlLf/
	 aeEAyBlr5/mjYjVMg+f088t/87p7aDJHtExoV24U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A84F805BB; Fri, 17 Jan 2025 08:49:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E88FF805B2;
	Fri, 17 Jan 2025 08:49:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF52F800B6; Fri, 17 Jan 2025 08:49:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79750F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2025 08:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79750F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=IagUcQbK
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 50H7mlK332353177,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1737100127; bh=+yBmPoF4ogpbGxrxDVIFImhd0LLlFhUgbAtZq8Zp9fc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version;
	b=IagUcQbKRs46148jsMZ/WZRywwRSIdO4zJok6JbQjKe62J/3/ZKI5+NP9TKzRsrlr
	 nLDPtdqxIeddWVvMOQ6dr4XHyH8mwxS2ImKXe0RnwmzoAhYIimV6UBmuX2feHoNYst
	 pbwYOGDlI3vfXyTSR2ySb4Uh8sLDdBHTzdE0oV4BS0EhhUYLT44OJcQKAwcsrwJnEJ
	 xGem5R0q5ZQoZuKr2msdwVcBrdKGf+YEX6MswXMLYSKF6pFulRO09f2vz+/P3tvwzl
	 YZOscdRxw9057FXMCQDHRURkgU7nIxb9j24oz28NHlLv+OS0m1RKU6t1uQuYP+HZXf
	 8/4usD1HIZeKA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 50H7mlK332353177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:48:47 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 17 Jan 2025 15:48:47 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 Jan 2025 15:48:47 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Fri, 17 Jan 2025 15:48:47 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, Evgeny Kapun <abacabadabacaba@gmail.com>
CC: Linux Sound Mailing List <linux-sound@vger.kernel.org>,
        "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Regressions Mailing List
	<regressions@lists.linux.dev>,
        Linux Stable Mailing List
	<stable@vger.kernel.org>,
        " (alsa-devel@alsa-project.org)"
	<alsa-devel@alsa-project.org>
Subject: RE: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
Thread-Topic: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
Thread-Index: 
 AQHbTvIxtyWK99B6LkqZbi3R9/JZE7LtROwAgAQfxYCAAA3tgIAB5qEAgAFmuDCAHI8ogIAH0iwAgAGookA=
Date: Fri, 17 Jan 2025 07:48:46 +0000
Message-ID: <0a89b6c18ed94378a105fa61e9f290e4@realtek.com>
References: <e142749b-7714-4733-9452-918fbe328c8f@gmail.com>
	<8734ijwru5.wl-tiwai@suse.de>
	<57883f2e-49cd-4aa4-9879-7dcdf7fec6df@gmail.com>
	<87ldw89l7e.wl-tiwai@suse.de>
	<fc506097-9d04-442c-9efd-c9e7ce0f3ace@gmail.com>
	<58300a2a06e34f3e89bf7a097b3cd4ca@realtek.com>
	<0494014b-3aa2-4102-8b5b-7625d8c864e2@gmail.com>
 <87a5bqj0mb.wl-tiwai@suse.de>
In-Reply-To: <87a5bqj0mb.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_0a89b6c18ed94378a105fa61e9f290e4realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: BYMOH2BEBM4A6JJXQ2WXXQ6VMJJCYNI7
X-Message-ID-Hash: BYMOH2BEBM4A6JJXQ2WXXQ6VMJJCYNI7
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYMOH2BEBM4A6JJXQ2WXXQ6VMJJCYNI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_0a89b6c18ed94378a105fa61e9f290e4realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, January 16, 2025 10:27 PM
> To: Evgeny Kapun <abacabadabacaba@gmail.com>
> Cc: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>; Linux
> Sound Mailing List <linux-sound@vger.kernel.org>; Linux Kernel Mailing Li=
st
> <linux-kernel@vger.kernel.org>; Linux Regressions Mailing List
> <regressions@lists.linux.dev>; Linux Stable Mailing List
> <stable@vger.kernel.org>
> Subject: Re: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Sat, 11 Jan 2025 16:00:33 +0100,
> Evgeny Kapun wrote:
> >
> > On 12/24/24 04:54, Kailang wrote:
> > > Please test attach patch.
> >
> > This patch, when applied to kernel version 6.12.8, appears to fix the
> > issue. There are no distortions, and the left and the right channel
> > can be controlled independently.
>=20
> Good to hear.
>=20
> Kailang, care to submit a proper patch for merging?
>=20
>=20
> thanks,
>=20
> Takashi

--_002_0a89b6c18ed94378a105fa61e9f290e4realtekcom_
Content-Type: application/octet-stream; name="0000-acer-a115.patch"
Content-Description: 0000-acer-a115.patch
Content-Disposition: attachment; filename="0000-acer-a115.patch"; size=1342;
	creation-date="Tue, 24 Dec 2024 02:52:43 GMT";
	modification-date="Fri, 17 Jan 2025 07:45:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2YTI2MmVmZTkzZWFhMjQ2NmYzZDRkMTAzNDRlZTU1Y2UyNjI1NmMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMzAgRGVjIDIwMjQgMTQ6NDQ6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIGhlYWRwaG9uZSBkaXN0b3J0ZWQgc291bmQgb24gQWNlciBB
c3BpcmUgQTExNS0zMSBsYXB0b3AKClNvdW5kIHBsYXllZCB0aHJvdWdoIGhlYWRwaG9uZXMgaXMg
ZGlzdG9ydGVkLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc291bmQvZTE0
Mjc0OWItNzcxNC00NzMzLTk0NTItOTE4ZmJlMzI4YzhmQGdtYWlsLmNvbS8KU2lnbmVkLW9mZi1i
eTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMK
aW5kZXggNjFiYTVkYzM1YjhiLi4yOTM0Nzk5YjZlMDcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBA
IC0xMDE1OCw2ICsxMDE1OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2
OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTAyNSwgMHgxMzA4LCAiQWNlciBB
c3BpcmUgWjI0LTg5MCIsIEFMQzI4Nl9GSVhVUF9BQ0VSX0FJT19IRUFEU0VUX01JQyksCiAJU05E
X1BDSV9RVUlSSygweDEwMjUsIDB4MTMyYSwgIkFjZXIgVHJhdmVsTWF0ZSBCMTE0LTIxIiwgQUxD
MjMzX0ZJWFVQX0FDRVJfSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI1LCAweDEz
MzAsICJBY2VyIFRyYXZlbE1hdGUgWDUxNC01MVQiLCBBTEMyNTVfRklYVVBfQUNFUl9IRUFEU0VU
X01JQyksCisJU05EX1BDSV9RVUlSSygweDEwMjUsIDB4MTM2MCwgIkFjZXIgQXNwaXJlIEExMTUi
LCBBTEMyNTVfRklYVVBfQUNFUl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgx
MDI1LCAweDE0MWYsICJBY2VyIFNwaW4gU1A1MTMtNTROIiwgQUxDMjU1X0ZJWFVQX0FDRVJfTUlD
X05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyNSwgMHgxNDJiLCAiQWNlciBTd2lm
dCBTRjMxNC00MiIsIEFMQzI1NV9GSVhVUF9BQ0VSX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BD
SV9RVUlSSygweDEwMjUsIDB4MTQzMCwgIkFjZXIgVHJhdmVsTWF0ZSBCMzExUi0zMSIsIEFMQzI1
Nl9GSVhVUF9BQ0VSX01JQ19OT19QUkVTRU5DRSksCg==

--_002_0a89b6c18ed94378a105fa61e9f290e4realtekcom_--
