Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE746E721A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 06:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FD7EAE;
	Wed, 19 Apr 2023 06:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FD7EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681877365;
	bh=oNbci+8OiuU1g6iWOMokyc7CGbSUM56G8KSr4edp0gU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UVJP1hk4BlRmpVL9/50ieEfplRNG2OHIeVCSTqB85oKY7BybvNEI6mfekA0Hdh74b
	 HtnIv4VUB4P1EJiHY3MXGscLa8U+ETKzjdHYa/0phKX59H92m4IomGvwm1FzdNZnft
	 766YXwlOHYSlXhdpfBoOdZ0XTPvRHGnew1M5Pao4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2341DF80149;
	Wed, 19 Apr 2023 06:08:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD643F80155; Wed, 19 Apr 2023 06:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A53B6F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 06:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53B6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=cISFcM3F
Received: by mail-wm1-x335.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso781762wmb.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 21:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877294; x=1684469294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4XiNSYWgcLQuFxvkCNT3Vf0nczCpBov3KqNEUIXrcn0=;
        b=cISFcM3FK8NlEQ/j69bU9vzPaK1RQd/OLdKanNtMb9Ks1ScubJ1xa+cr9nDAM59aXN
         oflZAG489ztY98TpYlKduZB114YxDnfeuoh8dXLNIy4S7EhZoqNEYICqepDs3Jq2CxbI
         AUzeK/gwPGWIL45O2gmzuqe4jr7Pmi+M5CUL8pLguoy04dQCJA6vRvhWoR6muGIjhtPx
         yEiQGeSRVgd4LwkbTRKuxScztYb6QxsSp5lHiB1D45sZIwAxWkdzBqZCYOTwkSRPDL5F
         Q27eJg7nO6lqKOnI4M08VJ3TOxTaa7z6JUzYPA/QmlVOuPOeP+5DTUYFsfF9nev1FIJu
         y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877294; x=1684469294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XiNSYWgcLQuFxvkCNT3Vf0nczCpBov3KqNEUIXrcn0=;
        b=OJ+M1NaFIis15AueQ6p7+0QErNnSnEMbn4Z9Y3aJdopRe1LlLt1+IbNie2oiR5bHii
         Yet1huhZGoWuIYz5uddq+FIUyjMReu+i7hdkwXTXV3LCOWJNzWTtylp5/al+AcZb/p7J
         5dC8ESoK/i71cntrk6u376OrUutibfk7akkWxFOWxGEYOHiBXKAGuUztoOKPYcFjoS7B
         xgPnP/4ur2jQQ20nM1KKsap4ye0ETGFPtQjRT7OeWCqx+O44VbUp4fImOtV219gA8aYi
         REIq6lDGrIotzef9IXBBbz7jQDMcP+9TcFdCq+ZjtKZQXwk+RkcJ88n5OJyKvu7EQwnt
         0Q+A==
X-Gm-Message-State: AAQBX9d7/NOAx91QM8dH+2BOXtYnbMGqE6Dbjc7gSMfL12TgaK9T9Px/
	x4mbK6w2O+lIOFhBY86oJSSEfP5hhf/F1AZ1xXI=
X-Google-Smtp-Source: 
 AKy350b/gytWfcCTSq6cXvf5OHycptkSDSBQ37Bh+xbM1B7LJ48m9ZeT/1hDwyo0u8RxtqSRH9/FGup/ogPibY4n5j4=
X-Received: by 2002:a05:600c:244:b0:3e2:1a3f:4ea2 with SMTP id
 4-20020a05600c024400b003e21a3f4ea2mr4003260wmj.7.1681877294476; Tue, 18 Apr
 2023 21:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230418094259.4150771-1-chancel.liu@nxp.com>
In-Reply-To: <20230418094259.4150771-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:08:03 +0800
Message-ID: 
 <CAA+D8AO4R-gEiSo1aL7tC_162XzJbOSkGZP_Ki8xDgmTx4RchA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
To: Chancel Liu <chancel.liu@nxp.com>
Message-ID-Hash: N6SY2FXUG7ZGGFNXJ4MEWUY5XPM5VAKV
X-Message-ID-Hash: N6SY2FXUG7ZGGFNXJ4MEWUY5XPM5VAKV
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
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6SY2FXUG7ZGGFNXJ4MEWUY5XPM5VAKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgNTo0NOKAr1BNIENoYW5jZWwgTGl1IDxjaGFuY2VsLmxp
dUBueHAuY29tPiB3cm90ZToNCg0KPiBTQUkgb24gaS5NWDhRTSBwbGF0Zm9ybSBzdXBwb3J0cyB0
aGUgZGF0YSBsaW5lcyB1cCB0byA0LiBTbyB0aGUgcGlucw0KPiBzZXR0aW5nIHNob3VsZCBiZSBj
b3JyZWN0ZWQgdG8gNC4NCj4NCj4gRml4ZXM6IGViYTBmMDA3NzUxOSAoIkFTb0M6IGZzbF9zYWk6
IEVuYWJsZSBjb21iaW5lIG1vZGUgc29mdCIpDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5jZWwgTGl1
IDxjaGFuY2VsLmxpdUBueHAuY29tPg0KPg0KDQpBY2tlZC1ieTogU2hlbmdqaXUgV2FuZyA8c2hl
bmdqaXUud2FuZ0BnbWFpbC5jb20+DQoNCkJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2ppdQ0KDQo+
IC0tLQ0KPiAgc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9mc2wvZnNsX3NhaS5jIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gaW5kZXggMDdk
MTNkY2E4NTJlLi5hYmRhZmZiMDBmYmQgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNs
X3NhaS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+IEBAIC0xNTQ0LDcgKzE1
NDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZzbF9zYWlfc29jX2RhdGENCj4gZnNsX3NhaV9p
bXg4cW1fZGF0YSA9IHsNCj4gICAgICAgICAudXNlX2lteF9wY20gPSB0cnVlLA0KPiAgICAgICAg
IC51c2VfZWRtYSA9IHRydWUsDQo+ICAgICAgICAgLmZpZm9fZGVwdGggPSA2NCwNCj4gLSAgICAg
ICAucGlucyA9IDEsDQo+ICsgICAgICAgLnBpbnMgPSA0LA0KPiAgICAgICAgIC5yZWdfb2Zmc2V0
ID0gMCwNCj4gICAgICAgICAubWNsazBfaXNfbWNsazEgPSBmYWxzZSwNCj4gICAgICAgICAuZmxh
Z3MgPSAwLA0KPiAtLQ0KPiAyLjI1LjENCj4NCj4NCg==
