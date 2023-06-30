Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624A743322
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 05:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAD37F4;
	Fri, 30 Jun 2023 05:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAD37F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688095491;
	bh=lRQtsIUlGu5mjthdw9zf0Jy8ld/xcTn1JkU4v9qVJAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f+JfeiQOGwEXpGA4bMHG9835pc6w4efYcfSUk3phpJoO/bvapttJTrn/DkBqfMLxs
	 NC+oBJMNd/DiCIjA6NqiEmgV9CZItskxBPNqC32+RFRljEjC0isOkCcBg5LIHmB7oA
	 upcyrbPuq4+3+KxL11NCGaLkDwIY/8J9Dx1Op3sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1799F80544; Fri, 30 Jun 2023 05:24:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDC1CF80124;
	Fri, 30 Jun 2023 05:23:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9346DF80246; Fri, 30 Jun 2023 05:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF5AF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 05:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF5AF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QjT20Boc
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7673180224bso108799285a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688095427; x=1690687427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IjYCS8I41AmnJ/jiB/mH47GSobNE4UeRiXT/NLT9rIk=;
        b=QjT20Bocjo7V2+WuEcEfGM9qN0KMRB0zu5rTHauEkaiizZ9CmIjWp1pJFi+gUA/Xqf
         Zo2lLKDl41qjUG6QjJIsMaK+8SruNUZvf0yaZmYDx424JVideejkaghGeEh6pPCqw8ic
         c0PncTQjc41XZtEfG42paEUL5tScFsDy65Zp8qEnz7Q0R0kZmhRmI+zo5tFg+cyaxzPl
         WljEW9lbK+14m3uiYR0Clb9DGbjGt1jdKS6vNfowxBzgQLQxv1oNfwmnNah1O91jYx9/
         XM2IY6BbMMDs++QWvZp9mpMVySQDv1nKxmd/XcJ95lwoV+CHXGyGTYdaVoeHYEm0upn+
         PEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688095427; x=1690687427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjYCS8I41AmnJ/jiB/mH47GSobNE4UeRiXT/NLT9rIk=;
        b=ZbknciZHY1lS5eE0VOHAQTdWYz7d2EE9GCUPzVimqnlQENpVgfwgk4O/NVSsWq3wfe
         r3GX71+WVhNklPqLEzSiwR4YQNrrMUdVbnewqrhk232TwKJ7OM48Ol/WO3vaMkkaO94X
         p48retIKWglcWO4gNSqdR4zG3KteQkbizXJ/ZG5jx6q9YDJhEBgvyo1uwcJCOF73GFYP
         0Q7sfPr/Qp9SM05XyU/VACOt/jHdgGkQ4Lz5ZD96p+lH5+cxIWPdKcd+BKcK0xyHCL3C
         lVkT0uVKgQ0ZMVk5zk8NyimUpAy6kIMapVJezon8gEIgGMIb7axQ7KeIhBJ9HwG7+C7S
         WRFQ==
X-Gm-Message-State: AC+VfDwg720efyuOjPwx2xisTY+nN+GjGIUeVQ+Fn3Sm0eOpDqIaPCUw
	tIM6fDrrJzeQLZQ31UVUDC7vWrSRltyoV4cUOrX0P+Y2
X-Google-Smtp-Source: 
 ACHHUZ5+v+RvhrJVNX6QDozyS/EPB42R4fBJoAMAyJjZEOJYRBibA9sTI6d0WUr3KKVTQMZ2wi2evjar1gEgdFfTABw=
X-Received: by 2002:a05:620a:22c4:b0:767:1197:9a9c with SMTP id
 o4-20020a05620a22c400b0076711979a9cmr984386qki.8.1688095427431; Thu, 29 Jun
 2023 20:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-4-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5DPHmm7YuHBfYHpx2-g4R6t1BQ93GBAZvyyb_rBz7+hFg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jun 2023 11:23:36 +0800
Message-ID: 
 <CAA+D8AMw+9sEcBi+H41qMnK7H1Stkip7pQ9hvWPh5ZtujGJtBQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_easrc: define functions for memory to
 memory usage
To: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
 m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Message-ID-Hash: EX3FO3NJL4GAK3LVD7AQ3LQMTUC6SXWQ
X-Message-ID-Hash: EX3FO3NJL4GAK3LVD7AQ3LQMTUC6SXWQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EX3FO3NJL4GAK3LVD7AQ3LQMTUC6SXWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgNzowMOKAr1BNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gSGkgU2hlbmdqaXUsDQo+DQo+IE9uIFdlZCwgSnVuIDI4
LCAyMDIzIGF0IDExOjEw4oCvUE0gU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29t
Pg0KPiB3cm90ZToNCj4gPg0KPiA+IEFTUkMgY2FuIGJlIHVzZWQgb24gbWVtb3J5IHRvIG1lbW9y
eSBjYXNlLCBkZWZpbmUgc2V2ZXJhbA0KPiA+IGZ1bmN0aW9ucyBmb3IgbTJtIHVzYWdlIGFuZCBl
eHBvcnQgdGhlbSBhcyBmdW5jdGlvbiBwb2ludGVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
U2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29tPg0KPg0KPiBDb3VsZCB5b3UgcGxl
YXNlIGV4cGxhaW4gd2hhdCBpcyB0aGUgYmVuZWZpdCBvZiB1c2luZyBNMk0gaW4gdGhlIEVBU1JD
DQo+IGRyaXZlcj8NCj4NCj4gVXNlcnMgbWF5IHdhbnQgdG8gZ2V0IHRoZSBBU1JDIG91dHB1dCBp
biB0aGUgdXNlciBzcGFjZSwgdGhlbiBkbyBtaXhpbmcNCndpdGgNCm90aGVyIHN0cmVhbXMgYmVm
b3JlIHNlbmRpbmcgdG8gREFDLg0Kc28gdGhpcyBwYXRjaC1zZXQgaXMgdG8gdXNlIHRoZSB2NGwy
IEFQSSBmb3IgdGhpcyB1c2FnZSwgYmVjYXVzZSB0aGVyZSBpcw0Kbm8gc3VjaA0KQVBJIGluIEFT
b0MuDQoNCg0KPiBBIGZldyB3ZWVrcyBhZ28sIGFuIGlteDhtbiB1c2VyIHJlcG9ydGVkIHRoYXQg
dGhlIEVBU1JDIHdpdGggdGhlDQo+IG1haW5saW5lIGtlcm5lbCBpbnRyb2R1Y2VzIGh1Z2UgZGVs
YXlzLg0KPg0KPiBEb2VzIE0yTSBoZWxwIHdpdGggdGhpcyBhc3BlY3Q/DQo+DQpObywgTTJNIGNh
bid0IGhlbHAgd2l0aCB0aGUgZGVsYXlzIGlzc3VlLiAgIFRoZSBkZWxheSBpc3N1ZSBtYXliZSBj
YXVzZWQNCmJ5IHRoZSBidWZmZXIgc2l6ZSBvciB0aGUgcHJlZmlsbGVkIGRhdGEgbmVlZHMgYnkg
RUFTUkMuDQoNCkJlc3QgcmVnYXJkcw0Kd2FuZyBzaGVuZ2ppdQ0KDQo+DQo+IFRoYW5rcw0KPg0K
