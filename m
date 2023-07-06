Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A9E749A3B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF803E8;
	Thu,  6 Jul 2023 13:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF803E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641717;
	bh=SwOpodRnB3ffuce9Z/kjWaWSwHW0xGOEYRTBTFp1c/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YUcfRGf2MWuQ9kyZFOlvNqLpPteg0Nu8hSN21uiXyEbKB2eQ5nS+C41YLx3ux4kRK
	 SdEjk/96eHjm79kRPpxEtVF5ao5CP1yEy70Sze5W2YhkVsBCMhvD27h3gXWiN3HhSW
	 O/AiFO/CcsoGx5Agwh2nyVsYAMkZVJNuIIxkF/C4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1263BF80124; Thu,  6 Jul 2023 13:07:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E97F80124;
	Thu,  6 Jul 2023 13:07:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4D7F80125; Thu,  6 Jul 2023 13:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFC67F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFC67F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=R7E8RAw4
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39eab4bbe8aso553417b6e.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641627; x=1691233627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzqPcSN9Vd/IVbG/fo+eCKrJ2YfhdLWxRg+A86chNIU=;
        b=R7E8RAw4+FxWCEiGeop9uO+y4epNSqD3q5MFvwBvSm2oWpydSmYVVM+o0fAGNFkEKm
         cpriBE0BRfAyNJu4FTXMQZZrIekCWxktra5aKj9Jiw2vwU1qvBw5Ydg6DlXcVBXg4Ez7
         XzSd4Xim7Ve3is/cFql0rVQDFZMmevf38+gjAfTbxE7lmUZXA2cXdcxOKYhSlTQDyJCv
         /JkMoJMJmL0CgQz9g1gT5tZA9nETadu3zd9J8yHqw2dMp8RMkQ6akGAO9UNB2Gtd3sDv
         mAzUlp1pARvqUc4E3QPKrhoeHuL3d42ZBWaMQCUlx1S+i7YpSotQix4xkz+qBHKLwjjr
         8Oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641627; x=1691233627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzqPcSN9Vd/IVbG/fo+eCKrJ2YfhdLWxRg+A86chNIU=;
        b=VLfGz87RqalSvs9kdBV3AhJXhmUt4IW3JdiVGQbQ0H4YVs4C498/al+rOwz9iKBkRK
         0p/RwW8UjffB9hqQY6vbTaDWBKeJ04R0eUgrHxmmP7mtvrAMameSdX729KCInepacw5U
         FcWP0Pt/JnWfsED3WLFO0Fvk4iLXCDqGcMVBogkD0Gyuk04xkiLohP3HlJf8S5ny0J1M
         avO2O5b2AjcRCoaInR0TjiLMrR5sVZHbJLJrFnhIkK3QbvWeCO2rF98PuQh7AwRs1vJk
         EA/7aKYnCxzuZZSlyCbKQ5DqACuR1UthXYD56cmlW5ysEYObu0gVEziTmEWyyBTJmXV8
         gNcw==
X-Gm-Message-State: ABy/qLa3AxuqIPpN0qmpJfvSnEgR5Gg+XK1V3pGyZEQOz8u1bJ/is/jn
	I0RAcl0B7DTca4pNlE0BPzikjfL81rvsNsCr4No=
X-Google-Smtp-Source: 
 APBJJlF3SHs+c9jEMdQvPZlDR7xI7csftfEEm7tj+Vf0/seQLrNI1/AWHwr/2vYyp9l5ePgk8H8xDwVCZ+04mRCaRIU=
X-Received: by 2002:a05:6808:23c4:b0:3a1:b2d4:5f64 with SMTP id
 bq4-20020a05680823c400b003a1b2d45f64mr1255855oib.54.1688641626501; Thu, 06
 Jul 2023 04:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
In-Reply-To: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jul 2023 19:06:55 +0800
Message-ID: 
 <CAA+D8AO0LMLqvV2WQuKS=524-ct+qyPcm-916tU7M+ejHSVpwg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
Cc: Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Message-ID-Hash: XADOPTUW4K27ER7FNVTBQLZMKVRYQCEC
X-Message-ID-Hash: XADOPTUW4K27ER7FNVTBQLZMKVRYQCEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XADOPTUW4K27ER7FNVTBQLZMKVRYQCEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCA0OjQ34oCvUE0gQW5kcmVhcyBIZW5yaWtzc29uIDxhbmRy
ZWFzQGZhdGFsLnNlPiB3cm90ZToNCg0KPiBIZWxsbyBTaGVuZ2ppdSwgRmFiaW8sDQo+DQo+IE9u
IFRodSwgTWF5IDE5LCAyMDIyIGF0IDEwOjIzOjA2QU0gLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3Jv
dGU6DQo+ID4gSGkgU2hlbmdqaXUsDQo+ID4NCj4gPiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCA5
OjQ5IEFNIFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYyBiL3NvdW5kL3Nv
Yy9mc2wvZnNsX3NhaS5jDQo+ID4gPiBpbmRleCBmYTk1MGRkZTUzMTAuLmRhZTE2YTE0ZjE3NyAx
MDA2NDQNCj4gPiA+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+ID4gPiArKysgYi9z
b3VuZC9zb2MvZnNsL2ZzbF9zYWkuYw0KPiA+ID4gQEAgLTQzNyw2ICs0MzcsMTIgQEAgc3RhdGlj
IGludCBmc2xfc2FpX3NldF9iY2xrKHN0cnVjdCBzbmRfc29jX2RhaQ0KPiAqZGFpLCBib29sIHR4
LCB1MzIgZnJlcSkNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRlNM
X1NBSV9DUjJfRElWX01BU0sgfA0KPiBGU0xfU0FJX0NSMl9CWVAsDQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNhdmVkaXYgLyAyIC0gMSk7DQo+ID4gPg0KPiA+ID4g
KyAgICAgICBpZiAoc2FpLT5zb2NfZGF0YS0+bWF4X3JlZ2lzdGVyID49IEZTTF9TQUlfTUNUTCkg
ew0KPiA+DQo+ID4gSXNuJ3QgaXQgYSBiaXQgZnJhZ2lsZSB0byB0YWtlIHRoaXMgZGVjaXNpb24g
YmFzZWQgb24gdGhlIG51bWJlciBvZg0KPiA+IFNBSSByZWdpc3RlcnMgaW4gdGhlIFNvQz8NCj4g
Pg0KPiA+IFdoYXQgYWJvdXQgYWRkaW5nIGEgc3BlY2lmaWMgZmllbGQgaW4gc29jX2RhdGEgZm9y
IHN1Y2ggYSBwdXJwb3NlPw0KPg0KPiBXZSd2ZSBiZWVuIHdvcmtpbmcgb24gYW4gaS5NWDhNUCB3
aGVyZSBNQ0xLIG5lZWRzIHRvIGJlIGlucHV0IGFuZCBmb3VuZA0KPiB0aGF0IHRoaXMgZW5hYmxl
cyB0aGUgTUNMSyBhcyBvdXRwdXQgZGVzcGl0ZSBub3QgaGF2aW5nIHNldCB0aGUNCj4gYGZzbCxz
YWktbWNsay1kaXJlY3Rpb24tb3V0cHV0O2AgZGV2aWNldHJlZSBwcm9wZXJ0eSBpbiBvdXIgRFQu
DQo+IFJldmVydGluZyB0aGUgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlcyBmb3IgdXMuDQo+DQo+IEdv
b2QgY2F0Y2guIHNlZW1zIHRoZXJlIGlzIGFuIGlzc3VlIGhlcmUuDQoNCmJlc3QgcmVnYXJkcw0K
d2FuZyBzaGVuZ2ppdQ0KDQpJIGhhdmUgdG8gc2F5IHRoYXQgdGhlIGNvZGUgY29tbWVudCBtYWRl
IG1lIGEgYml0IGNvbmZ1c2VkLCBidXQgb25jZQ0KPiBJIGZvdW5kIHRoZSBjb21taXQgbWVzc2Fn
ZSBJIHVuZGVyc3Rvb2Qgd2h5IHRoaXMgY29kZSBleGlzdGVkLg0KPiBJZiB0aGlzIGlzIHJlYWxs
eSBpLk1YOE1NIHNwZWNpZmljIG1heWJlIG1lbnRpb24gdGhhdCBpbiB0aGUgY29kZQ0KPiBjb21t
ZW50IGFuZCBwbGVhc2UgbWFrZSB0aGUgY29kZSBhY3R1YWxseSBvbmx5IHRyaWdnZXIgb24gaS5N
WDhNTS4NCj4gSXQgc2VlbXMgdG8gbWUgbGlrZSB0aGVzZSBhbGwgZnVsZmlsbCB0aGUgY3VycmVu
dCBjcml0ZXJpYToNCj4gaW14N3VscCwgaW14OG1xLCBpbXg4bW0sIGlteDhtcCwgaW14OHVscCwg
aW14OTMNCj4NCj4gU2hvdWxkIEkgcmVwb3J0IHRoaXMgaW4gYnVnemlsbGEua2VybmVsLm9yZyA/
DQo+DQo+IFJlZ2FyZHMsDQo+IEFuZHJlYXMgSGVucmlrc3Nvbg0KPg0K
