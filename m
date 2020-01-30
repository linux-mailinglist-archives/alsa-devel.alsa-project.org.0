Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74B14DFAB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 18:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3951678;
	Thu, 30 Jan 2020 18:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3951678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580404292;
	bh=+tiATu9nrzHEgBYgCGwojwbCrAh09cLFQ4K9JZlFrqc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7YJmhK2Nc3apLsTJUxcI90CZzKiIVp9rLwGvAfhHqwMBhzFSo4t5Axtuh+49b9/H
	 hKFKkikAg/OQnYmAlS8qG5o2arTTp6elFtercXohiOASvvRA3cIHZwqCXMFhc+a9ws
	 /06Go/Hi3XIJ7YjjOsVpkimTXv6s0HZaBkYWGp38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E2A7F80150;
	Thu, 30 Jan 2020 18:09:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F01BFF80150; Thu, 30 Jan 2020 18:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CB41F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 18:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB41F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="McU784o+"
Received: by mail-ed1-x544.google.com with SMTP id dc19so4575466edb.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 09:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yel/LjQW25KcQEFu+jzZC73Egkh1tqmmLbvqWmoKP8c=;
 b=McU784o+BlKHiU8m5vavNqQyA3oFBpzOf3HlAuCMmdNFGz14lvO6yRPhgp4Ds4XVp6
 xpAvGZTEv5SCKQaFFrYwvi75BMEkZDA8i++ymWsMVkOxfW8HgsbWyQQk17cRno5N8yNy
 +eIYCA09AdUds5GQp5XlCVuz/67NmydI1ExgXMUGQFlMcp5FGKG/ZtrQ/KCpvil1xyVO
 0ksORwuZ0HqRtD5JoqebvM+XYG3wA0+1+jUB9RegC363PKmF5T0++3mtERGo7eQT9ejz
 sToBBqbfHIJj1AGeYQFSLG+RrdNaGhNET4V1YnbxG1yRxsjjVFAvJtCdYFhJBthvZJ94
 0Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yel/LjQW25KcQEFu+jzZC73Egkh1tqmmLbvqWmoKP8c=;
 b=Jj/kByOpa5XjKKVS0ivR+y+GYvSN4xSCUFYoWemvrvkuDns2QeIwD6R6EjwifB3hQc
 DFJ234zSyRcUsAR6GRM7I+YiPzRAcj2q+e8UH2unkqKEDAXd3YyTp/P1prEKhpgtPzzC
 cunE2JPFcKtivJ7cSYNP2rSYtgBGSaa52Kle9nOdUUEcTtXF2uRg+2Adsk0hxLtYnbIt
 Th6y2qNR6KDbxgtZkmzOtVoCUMQVOqvxy/sprCaD5GrefG9yU7EIyxEFtz8txq3Yw1wB
 8JX1YVcCL1V4oopwmpsBHNQyO9rr51YS/VPilvyQC3HFCIFSkM6vhhEe7ecJu9+FZySx
 dHXQ==
X-Gm-Message-State: APjAAAXioyWQ01c38lohylouqM7MibEPMm2F84ce3vnmBHcL9CODyxP8
 y0Kxrao5dM/J2g7q35fs3Uc=
X-Google-Smtp-Source: APXvYqwq3GK/kZ6ctkM0oUPdYfKKLpmFsfdQxaEw47STW+5vOHF65mQWT7BC3nPoioz0sKAOgdJxuA==
X-Received: by 2002:a05:6402:168c:: with SMTP id
 a12mr4871067edv.43.1580404185669; 
 Thu, 30 Jan 2020 09:09:45 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u9sm493512edt.91.2020.01.30.09.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 09:09:44 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
Date: Thu, 30 Jan 2020 20:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICsJcmV0ID0g
ZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgmcGRldi0+ZGV2LAo+ICsJCQkJCSAgICAg
IGFodWItPnNvY19kYXRhLT5jbXBudF9kcnYsCj4gKwkJCQkJICAgICAgYWh1Yi0+c29jX2RhdGEt
PmRhaV9kcnYsCj4gKwkJCQkJICAgICAgYWh1Yi0+c29jX2RhdGEtPm51bV9kYWlzKTsKPiArCWlm
IChyZXQgPCAwKSB7Cj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVy
IGNvbXBvbmVudCwgZXJyOiAlZFxuIiwKPiArCQkJcmV0KTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJ
fQpJbiB0aGUgdGhlIHBhdGNoICM0ICgiQVNvQzogdGVncmE6IGFkZCBUZWdyYTIxMCBiYXNlZCBJ
MlMgZHJpdmVyIikgSSBzZWUKdGhlIGZvbGxvd2luZzoKCglyZXQgPSBkZXZtX3NuZF9zb2NfcmVn
aXN0ZXJfY29tcG9uZW50KGRldiwgJnRlZ3JhMjEwX2kyc19jbXBudCwKCQkJCQl0ZWdyYTIxMF9p
MnNfZGFpcywKCQkJCQlBUlJBWV9TSVpFKHRlZ3JhMjEwX2kyc19kYWlzKSk7CglpZiAocmV0ICE9
IDApIHsKCQlkZXZfZXJyKGRldiwgImNhbid0IHJlZ2lzdGVyIEkyUyBjb21wb25lbnQsIGVycjog
JWRcbiIsIHJldCk7CgkJcmV0dXJuIHJldDsKCX0KClBsZWFzZSBiZSBjb25zaXN0ZW50IGluIHJl
Z2FyZHMgdG8gZXJyb3JzIGNoZWNraW5nLiBUaGUgY29ycmVjdCB2YXJpYW50CnNob3VsZCBiZTog
aWYgKHJldCAhPSAwKS4gVXN1YWxseSBlcnJvciBjb2RlcyBhcmUgYSBuZWdhdGl2ZSB2YWx1ZSwg
YnV0Cml0IGlzIG11Y2ggc2FmZXIgdG8gY2hlY2sgd2hldGhlciB2YWx1ZSBpc24ndCAwIGluIGFs
bCBjYXNlcyB3aGVyZQpwb3NpdGl2ZSB2YWx1ZSBpc24ndCBleHBlY3RlZCB0byBoYXBwZW4uCgpJ
J2QgYWxzbyByZWNvbW1lbmQgdG8gcmVuYW1lIGFsbCAicmV0IiB2YXJpYWJsZXMgdG8gImVyciIg
ZXZlcnl3aGVyZSBpbgp0aGUgY29kZSB3aGVyZSByZXR1cm5lZCB2YWx1ZSBpcyB1c2VkIG9ubHkg
Zm9yIGVycm9ycyBjaGVja2luZy4gVGhpcwp3aWxsIG1ha2UgY29kZSBtb3JlIGV4cGxpY2l0LCBh
bmQgaGVuY2UsIGVhc2llciB0byByZWFkIGFuZCBmb2xsb3cuCgpTbywgaXQgd2lsbCBiZSBuaWNl
ciB0byB3cml0ZSBpdCBhczoKCgllcnIgPSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY29tcG9uZW50
KCZwZGV2LT5kZXYsCgkJCQkJYWh1Yi0+c29jX2RhdGEtPmNtcG50X2RydiwKCQkJCQlhaHViLT5z
b2NfZGF0YS0+ZGFpX2RydiwKCQkJCQlhaHViLT5zb2NfZGF0YS0+bnVtX2RhaXMpOwoJaWYgKGVy
cikgewoJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBjb21wb25lbnQ6
ICVkXG4iLCBlcnIpOwoJCXJldHVybiBlcnI7Cgl9Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
