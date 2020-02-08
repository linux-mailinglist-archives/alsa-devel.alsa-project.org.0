Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8109156571
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Feb 2020 17:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965FA16A5;
	Sat,  8 Feb 2020 17:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965FA16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581178876;
	bh=hnNXe0uSSdgeNaxN7I87CxaycLjJC6bwNMMDcbu78Dk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIyV+57M8W59XW31umhUaSvcX+SO5WMZqrkBkyVW1gUSuOeevxt6oQgywfCdK8oay
	 9ouTRPyfT8mRSrtKr4VzpHEwTFM1/MRG04OCTXKDCU60bHh+aBUz9VhvYROVa5f4sb
	 rFjcnGl4akQBFKftrxwwrZ5Idu4b9dTYmaX7ymUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80659F80085;
	Sat,  8 Feb 2020 17:19:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C7BF80162; Sat,  8 Feb 2020 17:19:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 590E8F80085
 for <alsa-devel@alsa-project.org>; Sat,  8 Feb 2020 17:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 590E8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IsLTdWXi"
Received: by mail-ed1-x541.google.com with SMTP id r18so3134078edl.1
 for <alsa-devel@alsa-project.org>; Sat, 08 Feb 2020 08:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mv9CXRSXinT9pUfCdHcC8w/h9QEiS/MWjIBy22YGISM=;
 b=IsLTdWXitIJnPxQXm5N2vrrx0+APBrwkC/lnKsI+ChUKkiUEiVVPn248x6uc4OOL2B
 WhKCF0Us5CQF4bS5ItrgRSGtz9T37DVULgpurgkW0f65s6bwZAJlNpqmFcd8DsMy7Wbv
 O0ov72kMYwoxQT01discBEfj5U5fnYzFv0sANSzzWctL4Ql+cqDht5KvCvIio5uFpJkQ
 C9MrdLSykbv6TfVl5DDD7At4PosJU2zbgrckyvESDCRYYXuGg5jFfcb8gv3FY1kwS183
 3Ur14qf7IMKVGdWpcdFXWG+1Z9RYSMBHv5CAj16blJMb/E7RM0Lsm6ZSl1qFFOcdWymd
 g3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mv9CXRSXinT9pUfCdHcC8w/h9QEiS/MWjIBy22YGISM=;
 b=javFI3isN2TQfb3us43Q2zCYwvziz4zQD0ZceVSXZIphpR81YHS0mkXwhEZCHCkLnE
 QGpOTPHTnyuW9wU8uE7zTJI++Oq8dzUMuaJxeLoo/2abcdYZmZfjSZeRVdSMDbmM0YkF
 OrkABTpje35uTk/riZiIxWI1diuJi1IaiCcPoIfipyE62CLl+ByoxSLidVQD2r/dDJLU
 BB+sCFmMJH5GqENH1jzePPxaAnHjnRt74WC5rLzBMA6kgPHX1ILI3XD+96jbz76ayWMZ
 clyqoun0GPdshbMiYuwx3KSFMwO+FsZPVJ9S+k6LkGFAlRQuSBSHwHdTF4NT0Fq6dWTo
 N+SA==
X-Gm-Message-State: APjAAAXB0QMd1C56QeHA5ZR4/tblBnk1HV9knIqdiOaf4Ej2hQbzkCrL
 5s2kGos5IbyFyC3QFuE6TJE=
X-Google-Smtp-Source: APXvYqxFBrwSNHP8rHVNvl1+mdeTMxa3S7krUi5FWVenbML3btPUFFaRm+GkItM8LB7NGYZjrmgBFQ==
X-Received: by 2002:a17:906:2596:: with SMTP id
 m22mr4635957ejb.167.1581178769061; 
 Sat, 08 Feb 2020 08:19:29 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id w18sm717049eja.57.2020.02.08.08.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2020 08:19:28 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
 <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
 <3e89e75d-2f5a-dc42-98f7-8e1262afe380@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b635bf45-f61e-266e-89bd-2b57ed47a807@gmail.com>
Date: Sat, 8 Feb 2020 19:19:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3e89e75d-2f5a-dc42-98f7-8e1262afe380@nvidia.com>
Content-Language: en-US
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 3/9] ASoC: tegra: add Tegra210 based
	DMIC driver
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

MDcuMDIuMjAyMCAxNDowNiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMi82
LzIwMjAgMTA6MjMgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6
IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gMzAuMDEu
MjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVnX2RlZmF1bHQgdGVncmEyMTBfZG1pY19yZWdfZGVmYXVsdHNbXSA9IHsK
Pj4+ICvCoMKgwqDCoCB7IFRFR1JBMjEwX0RNSUNfVFhfSU5UX01BU0ssIDB4MDAwMDAwMDF9LAo+
Pj4gK8KgwqDCoMKgIHsgVEVHUkEyMTBfRE1JQ19UWF9DSUZfQ1RSTCwgMHgwMDAwNzcwMH0sCj4+
PiArwqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0NHLCAweDF9LAo+Pj4gK8KgwqDCoMKgIHsgVEVH
UkEyMTBfRE1JQ19DVFJMLCAweDAwMDAwMzAxfSwKPj4+ICvCoMKgwqDCoCAvKiBCZWxvdyBlbmFi
bGVzIGFsbCBmaWx0ZXJzIC0gRENSLCBMUCBhbmQgU0MgKi8KPj4+ICvCoMKgwqDCoCB7IFRFR1JB
MjEwX0RNSUNfREJHX0NUUkwsIDB4ZSB9LAo+Pj4gK8KgwqDCoMKgIC8qIEJlbG93IGFzIHBlciBs
YXRlc3QgUE9SIHZhbHVlICovCj4+PiArwqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0RDUl9CSVFV
QURfMF9DT0VGXzQsIDB4MH0sCj4+PiArwqDCoMKgwqAgLyogTFAgZmlsdGVyIGlzIGNvbmZpZ3Vy
ZWQgZm9yIHBhc3MgdGhyb3VnaCBhbmQgdXNlZCB0byBhcHBseQo+Pj4gZ2FpbiAqLwo+Pj4gK8Kg
wqDCoMKgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzAsIDB4MDA4MDAwMDB9LAo+
Pj4gK8KgwqDCoMKgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzEsIDB4MH0sCj4+
PiArwqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8wX0NPRUZfMiwgMHgwfSwKPj4+
ICvCoMKgwqDCoCB7IFRFR1JBMjEwX0RNSUNfTFBfQklRVUFEXzBfQ09FRl8zLCAweDB9LAo+Pj4g
K8KgwqDCoMKgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzQsIDB4MH0sCj4+PiAr
wqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8xX0NPRUZfMCwgMHgwMDgwMDAwMH0s
Cj4+PiArwqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8xX0NPRUZfMSwgMHgwfSwK
Pj4+ICvCoMKgwqDCoCB7IFRFR1JBMjEwX0RNSUNfTFBfQklRVUFEXzFfQ09FRl8yLCAweDB9LAo+
Pj4gK8KgwqDCoMKgIHsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMV9DT0VGXzMsIDB4MH0sCj4+
PiArwqDCoMKgwqAgeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8xX0NPRUZfNCwgMHgwfSwKPj4+
ICt9Owo+PiBJJ2QgYWRkIGEgc3BhY2Ugb24gdGhlIHJpZ2h0IHNpZGUgb2YgYH1gLCBmb3IgY29u
c2lzdGVuY3kgd2l0aCB0aGUgbGVmdC4KPiAKPiBEbyB5b3UgbWVhbiBsaWtlIHRoaXM/Cj4geyBU
RUdSQTIxMF9ETUlDX1RYX0lOVF9NQVNLLCAweDAwMDAwMDAxIH0sCj4geyBURUdSQTIxMF9ETUlD
X1RYX0NJRl9DVFJMLCAweDAwMDA3NzAwIH0sCj4gwqDCoMKgIC4gLiAuCgpZZXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
