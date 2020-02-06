Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3B1549DE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 18:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFB316CC;
	Thu,  6 Feb 2020 18:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFB316CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581008473;
	bh=Y5ZAbhiaAZO0aRy+P8m/Olt83ztMfMQYX7vXbcLYF10=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peJsqGAZ7YduhQiL+Txy0jJ0dYx/75rRipZD0/B371vow8jYi3NA2nVASH5YqmJ7M
	 kdfI7+8yTEpsAe6MoyRMw4gE3Xk1dUGkLOd5gQqxH4u3Xfw879AYQ4pogUoPo9n555
	 INYWchAl7qqSO1qyCb9L5Lunfn4qR0tzjtvmxLmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E44DF800AB;
	Thu,  6 Feb 2020 17:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43066F8015B; Thu,  6 Feb 2020 17:59:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F590F80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F590F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HRo6PM95"
Received: by mail-lj1-x241.google.com with SMTP id q8so6835363ljj.11
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 08:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=og0ADzsSpshRIcdeT+Ks5xnjpqRL7rIYjLZFqgQChC8=;
 b=HRo6PM95VaVbLvysaWne6f1YcD6Xn8ky7qGhXssAk+65rmhIhxrSsaq1vkT4jVTRWJ
 Vcg3sSdqitzIy5JSWb03RkBU8I/AWKITP9G5QxgsvxVSJKIIUUoUpfPzFdybKYxboX8m
 KiwDB9pm+oXNwHJ9gMCaR2lVltrz6cj9O2C4RTILmHCSu4jevdPaDT0WkensyZEykNCQ
 XevyWbBJbNfxFTQOsguMTpusj2kEjDl3Ppqzd0/Cs7bjkxI2lZIqBmbkqUSZDhOkxPwj
 CCAIvnNKUrs1OdnnVGd5zb99/zb075vJPrcfM0c76n9AoWoiQVOsJdJkoAYvK++HUC0j
 NSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=og0ADzsSpshRIcdeT+Ks5xnjpqRL7rIYjLZFqgQChC8=;
 b=PxJoCNMuyBEGHsxgk3vVX95/dXgoxPxShEQ6LKOBR8JvV8WjJUKse25u3zC6ImnlFY
 SIuNLhzwjrao+Et9OFTO2ob+c8YH8B3qQQBJgk2bkIU7vjjAeLpX2WKu/lnNrkVOhcni
 bnOFzTtmJVbawrSiFZXE9ZxLrGvFIMm1DDlSPaTJhuTz3TPOz7Q26rIKo6nWc+SIvBUZ
 ffAZ83LZBtW0sIL02wRSxxQ74LHojeM0orY10ufh4vW84jAn4l/I6qjucoWWugzoPlri
 PrTvLqiSlvq46ANNyAmps9oP7wU3UJlykyeA3xyllkTLfAtLxCTZGYSykpDU/Wvja2Xs
 cBgA==
X-Gm-Message-State: APjAAAXKCUnovg8C2UxFetW/yu+JhhNOmCQE/ph7S2n2O6uYrfhiMTgX
 VtmdRvlH0FPH2wmx5X4KUFs=
X-Google-Smtp-Source: APXvYqyguhImDG7VTsNciB0wVBuwnFI+0C60WcsTjlt52pFAY46lNafpCyeCJnDDsMLILiEPwTOYGg==
X-Received: by 2002:a2e:9c85:: with SMTP id x5mr2681644lji.50.1581008366212;
 Thu, 06 Feb 2020 08:59:26 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id p15sm1546166lfo.88.2020.02.06.08.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 08:59:25 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
Date: Thu, 6 Feb 2020 19:59:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-5-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICtzdGF0aWMg
Y29uc3QgaW50IHRlZ3JhMjEwX2NpZl9mbXRbXSA9IHsKPiArCTAsCj4gKwlURUdSQV9BQ0lGX0JJ
VFNfMTYsCj4gKwlURUdSQV9BQ0lGX0JJVFNfMzIsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3Qg
aW50IHRlZ3JhMjEwX2kyc19iaXRfZm10W10gPSB7Cj4gKwkwLAo+ICsJSTJTX0JJVFNfMTYsCj4g
KwlJMlNfQklUU18zMiwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBpbnQgdGVncmEyMTBfaTJz
X3NhbXBsZV9zaXplW10gPSB7Cj4gKwkwLAo+ICsJMTYsCj4gKwkzMiwKPiArfTsKCnN0YXRpYyBj
b25zdCAqdW5zaWduZWQqIGludD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
