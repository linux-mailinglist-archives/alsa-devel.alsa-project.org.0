Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEF8116DD1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 14:18:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC241661;
	Mon,  9 Dec 2019 14:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC241661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575897497;
	bh=NSO6gKvDzue+JN9BYwO4CbrkvXCNvF1+9Aw5GUqqn98=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0UqT5Y06Xl52huDlg2BimPqUPGHuV3uQ4alghM+nvvKB7ATqiVNJJB0KMWbE6L6m
	 OkQ+sw45akxDAyP9h8knTMEsQ8FPBpCuyAFnjoCH4NKdUCVSiFAkDfPprTcsSfDNW9
	 QXO3SXR0Sg9sLIapMPYXR4fqjwfMmJosHEaRy/po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACB4F80234;
	Mon,  9 Dec 2019 14:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11EA0F80234; Mon,  9 Dec 2019 14:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D98AF8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 14:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D98AF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Fluep6Cy"
Received: by mail-wr1-x441.google.com with SMTP id z7so16057136wrl.13
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6JKjS8ULGOzUFR7zV+Ndftoq/ev83XREiug0BBdNIeE=;
 b=Fluep6Cy08Kzg9mPraMCdGJvXYVj7EnADOl1PYagnYKgrHsKt1Xsp9NRKUB+ooeph/
 vP1+nnfyracffXp6R4IWPuaA7oCZWLkd6UpAvbwPT8oMhZKdDaZDYxR8YyhaW5CtdN0/
 jQMOwkxHx0EfxlhkGxlS4Wm+dDO/tKc/uQdzSCJyN6rnJNfK3QiH4T3LcvbHymztIO/X
 exCokdFITCA6+DJkwR6Z7p+pwf7cFCKcyxsQ3LPAyLO9rtDkjaFip8op45XbbJ62+Bnv
 YtOSlyoy1OXRn487KoaySckqJh++QDJvxdhmXQLOe1XR0g1/u96bV0K5wTZYTF2bPDLS
 2i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6JKjS8ULGOzUFR7zV+Ndftoq/ev83XREiug0BBdNIeE=;
 b=nlTcT3lMpEAiDclY55/1My3mey24qFE31Jt5CB4tWMvgwKTymfGKc83RjoYKtVXotD
 VypZOtURZF2zkhigKHtdxD8bhFjmnGCKUcIggy42GVr32vvkpLsg8uk/sYT8QMp8gUer
 7O/IixJygED5qsBTBC22aes0GEW/ndB0xH/majhUCzMucdY6QuCCpVQDPd/b1I8PlOkt
 yqYC3A51+feaoE57FmEBtnE6/4gsUvEggRBeBcvPaulkx3JTS+MVryDYiP8LRRqoKU1v
 ImXZR374hXIcEavDPeXzH3FUWitSL8/4xYIlHcV3G1g4pu5q2rwPjpbO54mWz2oCa7ol
 Fyfg==
X-Gm-Message-State: APjAAAXHU+fylQAoP91laI7WAwNfeQQgHwpUPnYZQK5sxi2ibghcyXA8
 yg41LpLCIRfAekwuWLZKItxVdw==
X-Google-Smtp-Source: APXvYqyfJb9ulY7eYGRni5x1EoiZ65N/w4IbXiFtTbTgqXufBVfAXngFIBRVWJ/guKS6mVh9b6EFmQ==
X-Received: by 2002:adf:8041:: with SMTP id 59mr2019145wrk.257.1575897385263; 
 Mon, 09 Dec 2019 05:16:25 -0800 (PST)
Received: from dell ([2.27.35.145])
 by smtp.gmail.com with ESMTPSA id d8sm26935218wre.13.2019.12.09.05.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 05:16:24 -0800 (PST)
Date: Mon, 9 Dec 2019 13:16:18 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191209131618.GL3468@dell>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121170509.10579-4-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v4 03/12] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVGh1LCAyMSBOb3YgMjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKCj4gUXVhbGNv
bW0gV0NEOTM0MC9XQ0Q5MzQxIENvZGVjIGlzIGEgc3RhbmRhbG9uZSBIaS1GaSBhdWRpbyBjb2Rl
YyBJQy4KPiAKPiBUaGlzIGNvZGVjIGhhcyBpbnRlZ3JhdGVkIFNvdW5kV2lyZSBjb250cm9sbGVy
LCBwaW4gY29udHJvbGxlciBhbmQKPiBpbnRlcnJ1cHQgY29udHJvbGxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5v
cmc+Cj4gLS0tCj4gQ2hhbmdlIHNpbmNlIHYzOgo+ICBGaXhlZCBsb3djYXNlIHVzYWdlIG9mIHdj
ZDkzNHggYXMgc3VnZ2VzdGVkIGJ5IExlZS4KPiAgVXBkYXRlZCBmZXcgaWYgY2hlY2tzIGFzIHJl
Y29tbWVuZGVkLgo+ICBhZGQgZGVmaW5lcyBmb3IgU0xJTSBkZXZpYyBhbmQgSW5zdGFuY2UgSUQg
b2YgV0NEOTM0eAo+ICBVcGRhdGVkIGRldmljZSBuYW1lIGFuZCBjb21wYXRpYmxlIGZvciBncGlv
IGNvbnRyb2xsZXIgZHJpdmVyLgo+IAo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgIHwgIDEyICsKPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIGRyaXZlcnMvbWZkL3djZDkzNHguYyAgICAgICAgICAgICAgICAgfCAzMDYgKysr
KysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvcmVnaXN0ZXJzLmggfCA1
MzEgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9tZmQvd2NkOTM0
eC93Y2Q5MzR4LmggICB8ICAzMSArKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDg4MSBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC93Y2Q5MzR4LmMKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvcmVnaXN0ZXJzLmgKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3djZDkzNHgvd2NkOTM0eC5oCgpGb3Ig
bXkgb3duIHJlZmVyZW5jZToKICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
