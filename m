Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4275A7D7C74
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 07:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 625A9850;
	Thu, 26 Oct 2023 07:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 625A9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698299133;
	bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QrPxXsPZuWkTKJ+5dh56h2+cLdCi9JRvZ5f7bn9E52ki7+iidHzc7HUpsvWeezZZF
	 AoDvQgl42sJMRWZtwF6eW3whle5Yh8zvZ4GQ1sLPxdeYPGQFI0qoLy/NYRYp6spe2m
	 r+bmSlPiTIuxUI24uX0rVcC8grExSr5uxt0fiySs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCC4AF8014B; Thu, 26 Oct 2023 07:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE7FF8024E;
	Thu, 26 Oct 2023 07:43:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E81BDF80165; Thu, 26 Oct 2023 07:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ECDEF8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 07:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ECDEF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UVYzceJE
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9be3b66f254so70904166b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298944; x=1698903744;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=;
        b=UVYzceJEU6PfOM9wuUFoUDtBDrPKpG3xXwTyCVO/kxA//hF9UuibbktZf3Hl4TRpdr
         hOyHtYOTCjPrCoFSGoD4T5621YIOWkGfDMzr36kb9Wd5TFTHLKk2YqufYdKWy13ySHNy
         qNE8hfUaFjQjenLtcNeOYCVCwgV5UTY/rGioB/MvegvAat2ReaaDyn2eN498LszxMpVh
         DvRa2tvvGzAvZWbZWylTOU+/fcNWLxc3cG3MPP6Jbs4jSIvVuY8ph+bQVLzosD2O6XnP
         hVxxhc9JEC0mPlqvRdk1C62momHVxKrd2SfnMd4YDqT8PMMF+eewDxJeh1x0/bGfYbg+
         SAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298944; x=1698903744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=;
        b=oP24r9arnMX3SuQFpO1aHKiL3OHwHwUt3cNVDYigxkhVN5w2HxiVrhqpE6TrJhuq+A
         X6TcHCdiXlUWRVWo/TnqwYDhXCDpesDOX+OFnbuPQaPySs2dCY7hH+da8r/AB3P39ygX
         4Yk+iPexlRhQV2xqZ1ZPza7zk07kr2CkIZ/OwzJKwWS5hVoE5UU1xkWUHEABwzdLkPUk
         H4FCOXg2eN8LJufVIn3yYmyunGHR3plzqN/bJxcUjaVkdyHJbInFQlwct0e2KhTuvJ8W
         GyfSgLXwpaFafCXzuogLmnbBGKmx0xIB+7EuYN9BqeBg+ZwpNc1xvuOg1AKIAmavP7vb
         Q/Gg==
X-Gm-Message-State: AOJu0YwZDuilFc1MMpIIMywgKzEOllFAQW1ORhXN8WbW5jLqwo9SAnXk
	yHSEFWlLWp3jx5EhFUhzM3M=
X-Google-Smtp-Source: 
 AGHT+IHmMO3TLhv7sxxKLpdaJx+E9H3rUYUWCTNqp9Fy0oskRy3AJT3yW6Ydo3VAks2ONiqNvcp/xg==
X-Received: by 2002:a17:907:3d9f:b0:9c1:9b3a:4cd1 with SMTP id
 he31-20020a1709073d9f00b009c19b3a4cd1mr12788174ejc.3.1698298943815;
        Wed, 25 Oct 2023 22:42:23 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc?
 ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id
 10-20020a17090602ca00b009b2f2451381sm11117028ejk.182.2023.10.25.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:42:23 -0700 (PDT)
Message-ID: <65d6ffc4c7bd6ce0ae75f7fb7d1f622467bfe9a7.camel@gmail.com>
Subject: Re: [RFT PATCH 05/17] ASoC: codecs: max9867: Handle component name
 prefix
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,  patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Date: Thu, 26 Oct 2023 07:42:22 +0200
In-Reply-To: <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Message-ID-Hash: HGZ4T2UBRKHURLHU5UWES4LVZVTGHCWV
X-Message-ID-Hash: HGZ4T2UBRKHURLHU5UWES4LVZVTGHCWV
X-MailFrom: noname.nuno@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGZ4T2UBRKHURLHU5UWES4LVZVTGHCWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCAyMDIzLTEwLTIzIGF0IDExOjU0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IFVzZSBzbmRfc29jX2RhcG1fd2lkZ2V0X25hbWVfY21wKCkgaGVscGVyIHdoZW4gY29t
cGFyaW5nIHdpZGdldCBuYW1lcywKPiB0byBpbmNsdWRlIGFsc28gdGhlIGNvbXBvbmVudCdzIG5h
bWUgcHJlZml4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBOdW5vIFNhIDxu
dW5vLnNhQGFuYWxvZy5jb20+Cgo+IMKgc291bmQvc29jL2NvZGVjcy9tYXg5ODY3LmMgfCA4ICsr
KystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4NjcuYyBiL3NvdW5kL3Nv
Yy9jb2RlY3MvbWF4OTg2Ny5jCj4gaW5kZXggYjYxNmFkMzk4NThjLi4zYjlkZDE1OGMzNGIgMTAw
NjQ0Cj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODY3LmMKPiArKysgYi9zb3VuZC9zb2Mv
Y29kZWNzL21heDk4NjcuYwo+IEBAIC01NiwxMyArNTYsMTMgQEAgc3RhdGljIGludCBtYXg5ODY3
X2FkY19kYWNfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBtYXg5ODY3X3ByaXYgKm1heDk4NjcgPSBzbmRfc29jX2NvbXBvbmVudF9n
ZXRfZHJ2ZGF0YShjb21wb25lbnQpOwo+IMKgwqDCoMKgwqDCoMKgwqBlbnVtIG1heDk4NjdfYWRj
X2RhYyBhZGNfZGFjOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFzdHJjbXAody0+bmFtZSwg
IkFEQ0wiKSkKPiArwqDCoMKgwqDCoMKgwqBpZiAoIXNuZF9zb2NfZGFwbV93aWRnZXRfbmFtZV9j
bXAodywgIkFEQ0wiKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkY19kYWMg
PSBNQVg5ODY3X0FEQ19MRUZUOwo+IC3CoMKgwqDCoMKgwqDCoGVsc2UgaWYgKCFzdHJjbXAody0+
bmFtZSwgIkFEQ1IiKSkKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmICghc25kX3NvY19kYXBtX3dp
ZGdldF9uYW1lX2NtcCh3LCAiQURDUiIpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYWRjX2RhYyA9IE1BWDk4NjdfQURDX1JJR0hUOwo+IC3CoMKgwqDCoMKgwqDCoGVsc2UgaWYg
KCFzdHJjbXAody0+bmFtZSwgIkRBQ0wiKSkKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmICghc25k
X3NvY19kYXBtX3dpZGdldF9uYW1lX2NtcCh3LCAiREFDTCIpKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYWRjX2RhYyA9IE1BWDk4NjdfREFDX0xFRlQ7Cj4gLcKgwqDCoMKgwqDC
oMKgZWxzZSBpZiAoIXN0cmNtcCh3LT5uYW1lLCAiREFDUiIpKQo+ICvCoMKgwqDCoMKgwqDCoGVs
c2UgaWYgKCFzbmRfc29jX2RhcG1fd2lkZ2V0X25hbWVfY21wKHcsICJEQUNSIikpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGNfZGFjID0gTUFYOTg2N19EQUNfUklHSFQ7Cj4g
wqDCoMKgwqDCoMKgwqDCoGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAwOwoK

