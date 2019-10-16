Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3AD8F97
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 13:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5F1615E0;
	Wed, 16 Oct 2019 13:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5F1615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571225583;
	bh=Ds45BfKN30N9V4om6eOiESSz9dq+rkWYTTI90fCHjME=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AeSloHkXBALf6PFtQdZt300O01OkWLAC9hClms9PFxbSnBxScqpaDuqw9xQMmBLj5
	 kYbdsSxAsIbgVIDnYzIOquxp93LcblxdnajUf+ZXxnFv+JCxdhVtzFytIk4kosfy3+
	 P4rk8yGW4PYCbXSHX3rOmjeYc1cBFsbDE+m0g5Js=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56DF9F8036C;
	Wed, 16 Oct 2019 13:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC003F80362; Wed, 16 Oct 2019 13:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE42F80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 13:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE42F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="meM31bXT"
Received: by mail-vs1-xe44.google.com with SMTP id d3so15371885vsr.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Cw22Pywatq+LHrxYjeaB4H7mrM1VjscQlQIMLcZrkM=;
 b=meM31bXTyq6Nzi7PKCHyYJ5rrBNzJ3/C7xEKKYFxvtYMTOk2JHQilJ5seuXWvpZD6L
 qtFYdePiY5XrZ0BZApsMwM1M7MN0l56ozTT451UN1pLkdXozik7zGQwJYVigO9hjoiFh
 T+D49Z8WM8IapFB+ROGSxXAa0Wo/1ZMvXiAH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Cw22Pywatq+LHrxYjeaB4H7mrM1VjscQlQIMLcZrkM=;
 b=I0waB/FMN40kp9KVFPCYfnkUG/xPuPjIS0nwVFlIvzMUCwi9R4EXSN+w41bNOAKKZe
 xHDznERqQU90p5nJqPHZdDyRN2HQM+5tTsf9Ju+qzAtZSPQ8/WkwJjrgMW6KCJh+a8is
 BqVsR6ijEfoEqoz74aKqAtrX7j5JBHDx0FYpBRSBRha6ELdPCymmfv85dqq3eC9b+ezy
 MBR6f35t+80h4W8Ub+adVBpKEoybrvdsY+FgwR8Seri4O1oadDvscBTQc/+HRdkTTJTh
 V6H5XC1C779y74lH7yPqzRElXzZsdMbH32KgeWEJ+PmOcDzNJUteCTOLC6h/QLsp7sYv
 yOBQ==
X-Gm-Message-State: APjAAAU81e5Uj8zmexbFCOZm3Fy2cQngMWHfL5WwouQ9PvlSJ9VkW1wC
 +Le41/cZQtWlkFbCXfVIrO9letlbuAsWimcEsxbM+A==
X-Google-Smtp-Source: APXvYqxdhXp2tXGTAgyM7RiQdRyneC1F//PDZpEQMP8DUiq8xcabmu64tFB2eXhH/EwN99RYP7nBUsKdVCYBk41reVA=
X-Received: by 2002:a67:7a86:: with SMTP id
 v128mr22527558vsc.163.1571225470640; 
 Wed, 16 Oct 2019 04:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085845.11672-1-shumingf@realtek.com>
 <20191016112349.GC4881@sirena.co.uk>
 <fb55fba1f6e8441983fbd563e4b89e45@realtek.com>
In-Reply-To: <fb55fba1f6e8441983fbd563e4b89e45@realtek.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 16 Oct 2019 19:30:44 +0800
Message-ID: <CAFv8NwK+sFw2tyTLjFFanYbJnPBZjF2BkqL-b2TKrsWzwFeBKw@mail.gmail.com>
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: Read and apply r0 and
	temperature device property
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

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNzoyOSBQTSBTaHVtaW5nIFvojIPmm7jpiphdIDxzaHVt
aW5nZkByZWFsdGVrLmNvbT4gd3JvdGU6Cj4KPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0
OjU4OjQ1UE0gKzA4MDAsIHNodW1pbmdmQHJlYWx0ZWsuY29tIHdyb3RlOgo+ID4KPiA+ID4gK3N0
YXRpYyBpbnQgcnQxMDExX3BhcnNlX2RwKHN0cnVjdCBydDEwMTFfcHJpdiAqcnQxMDExLCBzdHJ1
Y3QgZGV2aWNlCj4gPiA+ICsqZGV2KSB7Cj4gPiA+ICsgICBkZXZpY2VfcHJvcGVydHlfcmVhZF91
MzIoZGV2LCAicmVhbHRlayx0ZW1wZXJhdHVyZV9jYWxpYiIsCj4gPiA+ICsgICAgICAgICAgICZy
dDEwMTEtPnRlbXBlcmF0dXJlX2NhbGliKTsKPiA+ID4gKyAgIGRldmljZV9wcm9wZXJ0eV9yZWFk
X3UzMihkZXYsICJyZWFsdGVrLHIwX2NhbGliIiwKPiA+ID4gKyAgICAgICAgICAgJnJ0MTAxMS0+
cjBfY2FsaWIpOwo+ID4KPiA+IFRoZXNlIGFyZSBuZXcgRFQgYmluZGluZ3MgYW5kIG5lZWQgdG8g
YmUgYWRkZWQgdG8gdGhlIGJpbmRpbmcgZG9jdW1lbnQuCj4KPiBTdXJlLCBjb3VsZCBJIHNlbmQg
YW5vdGhlciBwYXRjaCBmb3IgaXQ/Cj4KPiA+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52
aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLgpIaSBTaHVtaW5nLApZZXMsIHlv
dSB3aWxsIG5lZWQgYSBwYXRjaCBiZWZvcmUgdGhpcyBvbmUgdG8gYWRkIHRoZSBiaW5kaW5nIGRv
Y3VtZW50YXRpb24uClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
