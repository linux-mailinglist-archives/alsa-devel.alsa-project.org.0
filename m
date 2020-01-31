Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43514EE8B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 15:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 534701672;
	Fri, 31 Jan 2020 15:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 534701672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580481414;
	bh=vEA5UP+oRn7RF+4SnhktGD+OgtMqh1KdrVMAYEQjWu0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZCqaoFCDDEhcOPQgCCARiEAKxg5FiRwLynPCXdQdan7FftqVqTDKBsZhBiuBG3c+
	 hn/oh8Ei8AlIHa2D9ejOM9oYUJQYB1nu6Ez4JrbUg8pTzeELONXdwvrmp/3NbqTmCU
	 nly7N+1jKmIDga1tlu30ThYdtvqc9mxEljf0Of8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4223F80116;
	Fri, 31 Jan 2020 15:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC35F8021E; Fri, 31 Jan 2020 15:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFE24F80116
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 15:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFE24F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Cs92N2ZI"
Received: by mail-ed1-x544.google.com with SMTP id p3so7992618edx.7
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 06:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e+L0iX3tm8D59zvK+565nrkVCoUCzYBhBvxeDsG6SUQ=;
 b=Cs92N2ZINKPfHdeM1/OUztTdDDpWztVzBoW2706c9ZZXQKlTL80GOYZkpCIhg0ACCM
 l9PyboELzrezD4mYgUpEPeJ8I2PIQ45lHQK7hKrygZcavIgtNU4N6IBZIGQpo74Tn2dh
 q07QbEG+dZ4ZAZx0NR/NwFuYZTGCTVQ5nMVBJVZykgu2iSPObDKEfJOnvSktDPnNhXDn
 kgH7aZdF3XsjF2YE0/zbYzYpgGxKCmOa0diEogqp5OFU5XQhCOEc2orpom1dRIw8Gn/N
 lLru6xnxOhWRdh2wvOBMTNk5Qie4+WykL2zmrAeGE0BbJ9Q4okZRYK2DGPjq85HCd5zj
 0uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+L0iX3tm8D59zvK+565nrkVCoUCzYBhBvxeDsG6SUQ=;
 b=kogmhvgFGdXDkDuo9z3suOGM6wtjrOaqRXiAzIuBYfVx8/ThW+U7SFdNj1bFUMOBMt
 KLqGZRHzGog1OjKLhN/np3d6LemDnhE4QJ2UI4GJcslre1XRn4cSHgGOIabMSEXBinr3
 9CObnIZ9urFVfaUU/z4JJD4CcGhD6nOtEb5vctCUVciByUFxTFhu36aAOeS3Ufe74mre
 MV4didaWdztpjTNgH27zLu9OQ7et57uUPDWkFyZ0pk5LMZy2G9YtM4GCZmkhGAJAzEHE
 +2hSeP40772u6mdodLBv58b/fY9PFQlml1FjfdJxlyeG5UcheFa4x78KFHHXzh/OaH/l
 JDKQ==
X-Gm-Message-State: APjAAAUgW4R2E44AxqEBka8AWxEHt95BI+fun/jgaNMqueiQjyKyFL16
 GjdiA0x4T7CVUCan4AwlHDE=
X-Google-Smtp-Source: APXvYqyLVYadz3t7QzEt5g6a58I6klmZbuRSMlzUhuJgeiNPSqabB8cXOnMSGi9TKnxJanABOXEh8Q==
X-Received: by 2002:a50:dacd:: with SMTP id s13mr546095edj.194.1580481301293; 
 Fri, 31 Jan 2020 06:35:01 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id g31sm502417edd.53.2020.01.31.06.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 06:35:00 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
 <00ce0f46-4401-c1da-5513-4aa38d224a44@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aeced6f5-cd7d-bc57-ce83-541554a7dd40@gmail.com>
Date: Fri, 31 Jan 2020 17:34:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <00ce0f46-4401-c1da-5513-4aa38d224a44@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based
	AHUB driver
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

MzEuMDEuMjAyMCAwNjoxMiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMS8z
MC8yMDIwIDEwOjU1IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEV4dGVybmFsIGVtYWls
OiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4+Cj4+Cj4+IDMwLjAx
LjIwMjAgMTM6MzMsIFNhbWVlciBQdWphciDQv9C40YjQtdGCOgo+PiAuLi4KPj4+ICsjaW5jbHVk
ZSA8bGludXgvY2xrLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+Pj4gKyNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4K
Pj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+PiArI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4+PiArI2lu
Y2x1ZGUgPHNvdW5kL3NvYy5oPgo+Pj4gKyNpbmNsdWRlICJ0ZWdyYTIxMF9haHViLmgiCj4+IE5p
dDogSSdkIHNlcGFyYXRlIHRoZSBwZXItZGlyZWN0b3J5IGluY2x1ZGVzIHdpdGggYSBibGFuayBs
aW5lLCBsaWtlIGl0Cj4+IGRvbmUgYnkgdGhlIG1vc3Qgb2YgZXhpc3RpbmcgZHJpdmVycywgZm9y
IGNvbnNpc3RlbmN5Lgo+IAo+IEhpIERtaXRyeSwKPiAKPiBJJ2QgYXNzdW1lIHRoZXNlIGFyZSB0
aGUgb25seSByZXZpZXcgY29tbWVudHMgKHdoaWNoIGluY2x1ZGVzIHlvdXIgb3RoZXIKPiByZXBs
aWVzIGZvciB2MiA1LzkpIGZvciB0aGUgc2VyaWVzLgo+IExldCBtZSBrbm93IG90aGVyd2lzZS4K
PiAKPiBJdCB3b3VsZCBoZWxwIG1lIHRvIGRpc2N1c3MgYWxsIHRoZSBpc3N1ZXMgYXQgb25jZSwg
ZmluYWxpemUgY2hhbmdlcyBmb3IKPiB2MyBhbmQgc28gdGhhdCB3ZSBjYW4gYXZvaWQgbXVsdGlw
bGUgaXRlcmF0aW9ucy4KCkhlbGxvIFNhbWVlciwKCkknbGwgdGFrZSBhbm90aGVyIGxvb2sgYXQg
dGhlIHBhdGNoZXMgYXJvdW5kIE1vbmRheS4KCkluIGdlbmVyYWwsIHlvdSBzaG91bGQgd2FpdCBm
b3IgYSB3ZWVrIG9yIHR3byBpZiB5b3UncmUgZXhwZWN0aW5nIHRvIGdldAptb3JlIGNvbW1lbnRz
LgoKVGhlcmUgaXMgbm93IG1vcmUgdGhhbiBtb250aCBmb3IgeW91IHRvIGZpbmlzaCB0aGlzIHNl
cmllcy4gSWYgeW91IGhhdmUKYW55IG90aGVyIHBhdGNoZXMgdGhhdCBkZXBlbmQgb24gdGhpcyBz
ZXJpZXMsIHRoZW4geW91IG1heSBzZW5kIHRoZW0gYXMKUkZDIGFuZCBleHBsaWNpdGx5IHN0YXRl
IHRoYXQgdGhleSBkZXBlbmQgb24gYW5vdGhlciBzZXJpZXMuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
