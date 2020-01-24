Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B52A1476BE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 02:30:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22B61669;
	Fri, 24 Jan 2020 02:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22B61669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579829421;
	bh=0uyl4OkZSBhc/arLXJnU4cEQyO5Q1wKQEO71g6/sdNs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2n/W6jB0xwe4RfUErlp5txJIEp3d1AuIstUDk3Tg4PgIQ9f1Pu/dqCfm+u56ehAY
	 fmtYnajt+zfsLwaPQJDM4diCbYqfTn3ZzhGWCqvGP2N73OQ9TBM2CHt0RM8DXqwlG6
	 bgGFdTrf+gIic+AlwpZMo3g/GJ1Mi8wTK2BxSOwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F4CF801D9;
	Fri, 24 Jan 2020 02:28:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00093F801D9; Fri, 24 Jan 2020 02:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C6BF80112
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 02:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C6BF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IWhyOeQU"
Received: by mail-lj1-x243.google.com with SMTP id y6so606797lji.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 17:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WI+Ptr4jWGvf9sG0CsP+d/rPdqVcRiXjBDng4X6qfAo=;
 b=IWhyOeQUSmo3xu9H4u2oZLkCl+B28KSQ//kzmtueEdrjJiCkgUjc7xObfFUYgg/3Jt
 WN6L5BVjS+aylpgwq+HKPF6cSQGg2SpcNPPqkpyNtIijZZWdxhJceRTrR0bGrlLxcPDk
 ZQcuU4cVj9OwzCr0XvpZUQSIasa3gbZUYiBewpoDd+cDqe6z0Dl8/isN64cRDYqFaZX2
 1I50PCGlrYq8sBgAMOJKGS+QhZPiC4lyjXWNtp+pw3giQ027CEr6U1bMUTkndSUP7cuK
 bE4SsWAHFJ90iDLnniZGCZ3IfhKuWbiQQIwshPTNGUrrTjYFhFk7kSkAZm7ErxlcB6Mv
 Hlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WI+Ptr4jWGvf9sG0CsP+d/rPdqVcRiXjBDng4X6qfAo=;
 b=nrafs5a/vm4j52NOwnfGk7bI1Kte22KEoRiboiTyZbzCQulHNfksLBJiC/rvTiU1kD
 3JSSq6s/BKsUeqvACBongJyzKIjnEyEBb8Fn/cZGh8Os1mlOz86NJ9B0NI9Qkp5/KHt6
 FrtlYBi5Ef6JOggqqoa7OvbS99o3S+1uco9BI8UJ3FiVKAHJqJ2QhQTrlN7imo0Kq8gG
 rUNpgOUd/CCsIe2ZU60l47us+B6Q1zXwKA/yETLWlutVbQIDsWZlpzhuE9ryWKL4nbEE
 CZR1cnfl+ZbWX+79QRUTKBZHhHfDAzGgZfjV3+elyEoQJ1i5lDDSo78Z82vQFKtQf5Bx
 D3UA==
X-Gm-Message-State: APjAAAUopc+1YuWa6T6RQKGDNFahH8Gd541KHTRsUURUBWoZ3gYHDrL0
 K3t5BXGykO69L5yxJr4rkKU=
X-Google-Smtp-Source: APXvYqwGOnXwDuyIxTBQaJTSzHJLm33JXg0GYndn6ydyGv3O+5zNh+qRhrfYF9Q5iyLM8WQFQtOLfQ==
X-Received: by 2002:a2e:9592:: with SMTP id w18mr711637ljh.98.1579829309536;
 Thu, 23 Jan 2020 17:28:29 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id l28sm1886927lfk.21.2020.01.23.17.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 17:28:28 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
Date: Fri, 24 Jan 2020 04:28:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1579530198-13431-8-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
 driver
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

MjAuMDEuMjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6CltzbmlwXQo+ICtzdGF0
aWMgYm9vbCB0ZWdyYV9hZG1haWZfd3JfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQg
aW50IHJlZykKPiArewo+ICsJc3RydWN0IHRlZ3JhX2FkbWFpZiAqYWRtYWlmID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4gKwl1bnNpZ25lZCBpbnQgY2hfc3RyaWRlID0gVEVHUkFfQURNQUlGX0NI
QU5ORUxfUkVHX1NUUklERTsKPiArCXVuc2lnbmVkIGludCBudW1fY2ggPSBhZG1haWYtPnNvY19k
YXRhLT5udW1fY2g7Cj4gKwl1bnNpZ25lZCBpbnQgcnhfYmFzZSA9IGFkbWFpZi0+c29jX2RhdGEt
PnJ4X2Jhc2U7Cj4gKwl1bnNpZ25lZCBpbnQgdHhfYmFzZSA9IGFkbWFpZi0+c29jX2RhdGEtPnR4
X2Jhc2U7Cj4gKwl1bnNpZ25lZCBpbnQgZ2xvYmFsX2Jhc2UgPSBhZG1haWYtPnNvY19kYXRhLT5n
bG9iYWxfYmFzZTsKPiArCXVuc2lnbmVkIGludCByZWdfbWF4ID0gYWRtYWlmLT5zb2NfZGF0YS0+
cmVnbWFwX2NvbmYtPm1heF9yZWdpc3RlcjsKPiArCXVuc2lnbmVkIGludCByeF9tYXggPSByeF9i
YXNlICsgKG51bV9jaCAqIGNoX3N0cmlkZSk7Cj4gKwl1bnNpZ25lZCBpbnQgdHhfbWF4ID0gdHhf
YmFzZSArIChudW1fY2ggKiBjaF9zdHJpZGUpOwo+ICsKPiArCWlmICgocmVnID49IHJ4X2Jhc2Up
ICYmIChyZWcgPCByeF9tYXgpKSB7CgpUaGUgYnJhY2VzIGFyZSBub3QgbmVlZGVkIGFyb3VuZCB0
aGUgY29tcGFyaXNvbnMgYmVjYXVzZSB0aGV5IHByZWNlZGUKdGhlIEFORC4gU2FtZSBmb3IgYWxs
IG90aGVyIHNpbWlsYXIgb2NjdXJyZW5jZXMgaW4gdGhlIGNvZGUuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
