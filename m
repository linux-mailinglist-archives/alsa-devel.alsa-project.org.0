Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5A7663F0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 08:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4457083E;
	Fri, 28 Jul 2023 08:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4457083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690524827;
	bh=sXy7iw+ZZoclaAMcdMhCpeKMionlGegyviNtd+Go+H8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0B6JwgrpFl0cdjCnM+MNWKmsOsihjPyT9939IOcvaWun9mYpSMiJI2wE+QvTlg61
	 kW4/aEAukz/lmc49LnoJG9H7qybYSWnynXPklhjLgPhzHEVpimZgLjxQnkX1pxlAzt
	 btZy9F/oGeBzdcayKyaCXAVXVmcfX3c/XFykPvL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4277F800D2; Fri, 28 Jul 2023 08:12:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD74F80163;
	Fri, 28 Jul 2023 08:12:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2257FF80549; Fri, 28 Jul 2023 08:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25451F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 08:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25451F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=k/usju2P
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-26809f86bd5so1035489a91.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 23:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690524581; x=1691129381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSPzUFn7T9Qz9TrVlHhzbkYGwIMpJxTQp56qvApeEX4=;
        b=k/usju2PRtT1P+4dpMnusZIB/xQkf0dxnP+t6TOlRc4NXz80vbzDMqxeZ0rOKuxDS9
         oI9jCMDGZvZIvAnqPs9klVLXnCdrYl2rX55l6xbNHIdVX9D3N89Afv92hyyWqvOymWMq
         8taVsRj+Sd1HBXISml+Ui/Jz9QpLEV3wToQiZYWFpcZFgDmeGUcJUbd5wP6x3lZMu7M4
         bp6UpIHATBTiwYU3W9X34ZC5TfyhEdB0/td/L5NTccjJnA93CQ8uz56AFDyMBtuY4fXk
         +z0LMoZSeiPQWnfZNP8pmVmWyWxtBFyaUw7GTht1s+5QhoWH9O1zpB4Q46L6CSVFRDSp
         KUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524581; x=1691129381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSPzUFn7T9Qz9TrVlHhzbkYGwIMpJxTQp56qvApeEX4=;
        b=Fc4JcRikhqzTiY710ZfdSMPFGGXRmartUWCtEEPb3LFyqtfv5pmLAn8BncOGYNXrji
         jqlQIP4ZkDC95zzFLfxR2h8EBGn/d0QPNoGPEK2Fny9BbzK4SrkW3Uo360sv7OVy4Cnr
         eLbnWeXRkI0ueRgcm7axh0h8Fr/+YIV7Lc3Ht7NTQFAUi2/rN+vDPQU82tH5I11j99jQ
         szRSX/kZMu3zw62/6Oh29p8kA7eOdHLDV0lDv37vqKO53+kG9gnGKyTPwDjk16rslGmz
         LHnh12c5g814bkey7MGVAOZB9q4QEkCeJcQx/WT2lbkVCtXfgKtcW+ii6Fx4GgAZ3c+Z
         Z7UQ==
X-Gm-Message-State: ABy/qLalryhAVhEv7k5oU+qpPWRJrNgENu5W2Tio/DnWG9NahvRc4QNx
	QxPQau3wuVLAVGLVhUX+26e+4y3LumKj8GK6z8o=
X-Google-Smtp-Source: 
 APBJJlG/5xFeiRqFQxQDPi57L91+bFxPqPd08vVd/Py5OE3Ms0hSsb3q5fBFgDwBacXJGeoF39ZnTCJ+vhIZTuEFqYk=
X-Received: by 2002:a17:90a:6c04:b0:268:7dde:d90d with SMTP id
 x4-20020a17090a6c0400b002687dded90dmr560153pjj.11.1690524581403; Thu, 27 Jul
 2023 23:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
In-Reply-To: <20230727-sound-soc-fsl-v1-1-4fc0ed7e0366@google.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Jul 2023 14:09:30 +0800
Message-ID: 
 <CAA+D8AOCgX042Ji=jqdtPRvm=zWXOCpg-hLR4pLbJn8o1yb0_Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: refactor deprecated strncpy
To: Justin Stitt <justinstitt@google.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Message-ID-Hash: DJYGN3I4F5HWZYSTYHX63LNQWBV6UCAH
X-Message-ID-Hash: DJYGN3I4F5HWZYSTYHX63LNQWBV6UCAH
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJYGN3I4F5HWZYSTYHX63LNQWBV6UCAH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNjoyNuKAr0FNIEp1c3RpbiBTdGl0dCA8anVzdGluc3Rp
dHRAZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gYHN0cm5jcHlgIGlzIGRlcHJlY2F0ZWQgZm9yIHVz
ZSBvbiBOVUwtdGVybWluYXRlZCBkZXN0aW5hdGlvbiBzdHJpbmdzIFsxXS4NCj4NCj4gQSBzdWl0
YWJsZSByZXBsYWNlbWVudCBpcyBgc3Ryc2NweWAgWzJdIGR1ZSB0byB0aGUgZmFjdCB0aGF0IGl0
DQo+IGd1YXJhbnRlZXMgTlVMLXRlcm1pbmF0aW9uIG9uIGl0cyBkZXN0aW5hdGlvbiBidWZmZXIg
YXJndW1lbnQgd2hpY2ggaXMNCj4gX25vdF8gYWx3YXlzIHRoZSBjYXNlIGZvciBgc3RybmNweWAh
DQo+DQo+IEluIHRoaXMgY2FzZSwgdGhvdWdoLCB0aGVyZSB3YXMgZ3JlYXQgY2FyZSB0YWtlbiB0
byBlbnN1cmUgdGhhdCB0aGUNCj4gZGVzdGluYXRpb24gYnVmZmVyIHdvdWxkIGJlIE5VTC10ZXJt
aW5hdGVkIHRocm91Z2ggdGhlIHVzZSBvZiBgbGVuIC0gMWANCj4gZW5zdXJpbmcgdGhhdCB0aGUg
cHJldmlvdXNseSB6ZXJvLWluaXRpYWxpemVkIGJ1ZmZlciB3b3VsZCBub3Qgb3ZlcndyaXRlDQo+
IHRoZSBsYXN0IE5VTCBieXRlLiBUaGlzIG1lYW5zIHRoYXQgdGhlcmUncyBubyBidWcgaGVyZS4N
Cj4NCj4gSG93ZXZlciwgYHN0cnNjcHlgIHdpbGwgYWRkIGEgbWFuZGF0b3J5IE5VTCBieXRlIHRv
IHRoZSBkZXN0aW5hdGlvbg0KPiBidWZmZXIgYXMgcHJvbWlzZWQgYnkgdGhlIGZvbGxvd2luZyBg
c3Ryc2NweWAgaW1wbGVtZW50YXRpb24gWzNdOg0KPiB8ICAgICAgIC8qIEhpdCBidWZmZXIgbGVu
Z3RoIHdpdGhvdXQgZmluZGluZyBhIE5VTDsgZm9yY2UgTlVMLXRlcm1pbmF0aW9uLg0KPiAqLw0K
PiB8ICAgICAgIGlmIChyZXMpDQo+IHwgICAgICAgICAgICAgICBkZXN0W3Jlcy0xXSA9ICdcMCc7
DQo+DQo+IFRoaXMgbWVhbnMgd2UgY2FuIGxvc2UgdGhlIGAtIDFgIHdoaWNoIGNsZWFycyB1cCB3
aGF0cyBoYXBwZW5pbmcgaGVyZS4NCj4gQWxsIHRoZSB3aGlsZSwgd2UgZ2V0IG9uZSBzdGVwIGNs
b3NlciB0byBlbGltaW5hdGluZyB0aGUgYW1iaWd1b3VzDQo+IGBzdHJuY3B5YCBhcGkgaW4gZmF2
b3Igb2YgaXRzIGxlc3MgYW1iaWd1b3VzIHJlcGxhY2VtZW50IGxpa2UgYHN0cnNjcHlgLA0KPiBg
c3Ryc2NweV9wYWRgLCBgc3RydG9tZW1gIGFuZCBgc3RydG9tZW1fcGFkYCBhbW9uZ3N0IG90aGVy
cy4NCj4NCj4gWzFdOg0KPiB3d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9k
ZXByZWNhdGVkLmh0bWwjc3RybmNweS1vbi1udWwtdGVybWluYXRlZC1zdHJpbmdzDQo+IFsyXTog
bWFucGFnZXMuZGViaWFuLm9yZy90ZXN0aW5nL2xpbnV4LW1hbnVhbC00Ljgvc3Ryc2NweS45LmVu
Lmh0bWwNCj4gWzNdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4zL3NvdXJj
ZS9saWIvc3RyaW5nLmMjTDE4Mw0KPg0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9s
aW51eC9pc3N1ZXMvOTANCj4gU2lnbmVkLW9mZi1ieTogSnVzdGluIFN0aXR0IDxqdXN0aW5zdGl0
dEBnb29nbGUuY29tPg0KPg0KDQpBY2tlZC1ieTogU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2Fu
Z0BnbWFpbC5jb20+DQoNCkJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2ppdQ0KDQo+IC0tLQ0KPiAg
c291bmQvc29jL2ZzbC9mc2xfbWljZmlsLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9m
c2wvZnNsX21pY2ZpbC5jIGIvc291bmQvc29jL2ZzbC9mc2xfbWljZmlsLmMNCj4gaW5kZXggM2Yw
ODA4MmE1NWJlLi5mZTI4YjI3ZTUwZDAgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNs
X21pY2ZpbC5jDQo+ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNsX21pY2ZpbC5jDQo+IEBAIC0xMDQ0
LDcgKzEwNDQsNyBAQCBzdGF0aWMgaW50IGZzbF9taWNmaWxfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZQ0KPiAqcGRldikNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPg0K
PiAgICAgICAgIG1pY2ZpbC0+cGRldiA9IHBkZXY7DQo+IC0gICAgICAgc3RybmNweShtaWNmaWwt
Pm5hbWUsIG5wLT5uYW1lLCBzaXplb2YobWljZmlsLT5uYW1lKSAtIDEpOw0KPiArICAgICAgIHN0
cnNjcHkobWljZmlsLT5uYW1lLCBucC0+bmFtZSwgc2l6ZW9mKG1pY2ZpbC0+bmFtZSkpOw0KPg0K
PiAgICAgICAgIG1pY2ZpbC0+c29jID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5k
ZXYpOw0KPg0KPg0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDU3MDEyYzU3NTM2Zjg4MTRkZWM5MmU3
NDE5N2VlOTZjMzQ5OGQyNGUNCj4gY2hhbmdlLWlkOiAyMDIzMDcyNy1zb3VuZC1zb2MtZnNsLTRm
YzU1NjlkNzcxZQ0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEp1c3RpbiBTdGl0dCA8anVz
dGluc3RpdHRAZ29vZ2xlLmNvbT4NCj4NCj4NCg==
