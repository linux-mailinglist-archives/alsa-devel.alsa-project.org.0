Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F7132434
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 11:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41468182F;
	Tue,  7 Jan 2020 11:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41468182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578394507;
	bh=l2uTm09tGGniZdFtHt8leF9rfIm4mL2UdO9/OH9mdRQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHii3bvBkwtw+Wu1+AHQS+L9xLjwjT+A+UdSISoHGYQqtDpdUQGVpPppbF45oN1FL
	 XmUnh4D8/zE0s/ojHgMGVSG8uIqZxleBvv+7PwRt9ojt43PGETiQXmtTRqn/H4Alyo
	 8YwH+DMHNkgMkonpE1Bbl42HKIcAE+ANIXMELCiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56617F8014A;
	Tue,  7 Jan 2020 11:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F7F8F80149; Mon,  6 Jan 2020 10:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D26F1F8010D
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 10:38:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D26F1F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com
 header.i=@bgdev-pl.20150623.gappssmtp.com header.b="D1o966Mx"
Received: by mail-io1-xd41.google.com with SMTP id t26so47961624ioi.13
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k2+obkL6rebOtdriVSVT+QmM5oPrNk9dBLg/jYY+wfo=;
 b=D1o966MxyHxQctJ7rWTwJMt3NjGv7Dvvox7er9lgSNNvWFHHGJwcWONCfWtZi6gN+G
 sRs4vR0DB2EcpFyAOnNBrO6Ga7QtFeR72FBTF9427T+497Qzcfm+8pl2pbBszlc9JvVQ
 5lkYYgLVWA+odDpMbgsGqK5RaUIs7BmqtrPT75mjcq5Cps8QL2hw57ZZN4r24h+9vHFL
 a+0FUA2QZ2/EndxTc3PDJardW9IZ7lhDOn+2+dkqYDe/IvqXD733Uy0eoMyHFCObNslD
 T6Kj74zvZbASdqOn7QT7jqwZ2Hbx2etpk6CtUIx5rIfvpbv2lv5teqA/qj36BoqxsUw4
 LIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k2+obkL6rebOtdriVSVT+QmM5oPrNk9dBLg/jYY+wfo=;
 b=rCEo0YPYubxjUz/BXzeXdgpUiD95U++z901p4ZSTOwoyFSic1qSpBj3s1s378WYzk9
 ZGrV9Sh+9sW2hPeJZRjwFvCTpkizP6VnB75KjxVgts9pPeuogZ/iV6JpvirmcJWVIoIr
 NJs20lg6a2hOQE+Ta7LbfNg3pE12fwDQwf7D5f5vCbe3khAM4OreClThZwil2bpBgtDO
 jHnZGWcgmF4QOy9zsT8be3U9XkEGZew6XWjUIKSuomk36WwkpUvT+nM2i310TFEi6aNV
 pbkKx/yWNev7aaRJ6Ho0IJgjsBMa9dMggmTJTpXllcTjbHXd7yebK9vY7oEHbjRV6ysJ
 gm/g==
X-Gm-Message-State: APjAAAVRDDwcukzThH3RUdKuj7Fu7mCw6cmEO3ujbynJAhNac9AMTOQU
 HmXwc/l/d5+GnIvf6v3uVl2c3LD1yEHJhm9LHD6FVA==
X-Google-Smtp-Source: APXvYqzE32XYz3+At4KghXnJsLBu7odv7vp28Pnk5lZat2Vp4MBrZzHnDvUV6gAXMdReOEfzJCGFp0QdxKmkLf29OSM=
X-Received: by 2002:a5d:9dd9:: with SMTP id 25mr58696986ioo.287.1578303496369; 
 Mon, 06 Jan 2020 01:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Jan 2020 10:38:05 +0100
Message-ID: <CAMRc=MeTC8X9wDV7bowEvjPxjUNH8hXSJC79iy9s9W9Yn6Fh8A@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
X-Mailman-Approved-At: Tue, 07 Jan 2020 11:53:23 +0100
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Julia Lawall <julia.lawall@lip6.fr>, linux-acpi@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] treewide: remove redundent IS_ERR() before
	error code check
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

cG9uLiwgNiBzdHkgMjAyMCBvIDA2OjAwIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5l
bC5vcmc+IG5hcGlzYcWCKGEpOgo+Cj4gJ1BUUl9FUlIocCkgPT0gLUUqJyBpcyBhIHN0cm9uZ2Vy
IGNvbmRpdGlvbiB0aGFuIElTX0VSUihwKS4KPiBIZW5jZSwgSVNfRVJSKHApIGlzIHVubmVlZGVk
Lgo+Cj4gVGhlIHNlbWFudGljIHBhdGNoIHRoYXQgZ2VuZXJhdGVzIHRoaXMgY29tbWl0IGlzIGFz
IGZvbGxvd3M6Cj4KPiAvLyA8c21wbD4KPiBAQAo+IGV4cHJlc3Npb24gcHRyOwo+IGNvbnN0YW50
IGVycm9yX2NvZGU7Cj4gQEAKPiAtSVNfRVJSKHB0cikgJiYgKFBUUl9FUlIocHRyKSA9PSAtIGVy
cm9yX2NvZGUpCj4gK1BUUl9FUlIocHRyKSA9PSAtIGVycm9yX2NvZGUKPiAvLyA8L3NtcGw+Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgoK
Rm9yIEdQSU86CgpBY2tlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJh
eWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
