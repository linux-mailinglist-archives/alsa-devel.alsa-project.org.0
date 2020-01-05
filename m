Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A3130578
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 02:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D16174B;
	Sun,  5 Jan 2020 02:49:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D16174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578189033;
	bh=5oZcMPd6oPjzHQj7gS4Z/EQl9bg/SrMLLjMevqI938A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/YQgUJ/z1fLd3jDdNFHNxBqyV9GQgch1L1WODEfkMedgl0X00LctTdy62LbpALVF
	 wC94eCYRBClg+6ykJTNRKRlIOz7cghcEsVcLFaWomrmGmUYXfAt10aSvm0ge9xeVMu
	 rRSULvNZ5WXdLJ+vyWqEobOTZseYiacXmmvP5M7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D23F8014F;
	Sun,  5 Jan 2020 02:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D86BF80157; Sun,  5 Jan 2020 02:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4916DF80100
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 02:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4916DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="u8C5/gnQ"
Received: by mail-lj1-x241.google.com with SMTP id y6so39430378lji.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Jan 2020 17:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YYag+Bc8AuQ7klC6LwKp3Hqd/h8+XJbeqg437KyxSlA=;
 b=u8C5/gnQacpAqtDL/CmqTIYYzjgQHBG0/50u/4qrhiaFI6jaqtiZim+Cm8sK6HtLYn
 cx6aggoW001ADqCIW1ikAc3NdzHazWvQkCiI1W+FjL0kSmQDpwChCekTYrZpEqCivhz1
 +stTvqeCxVdwRi/QdJJiSw1YwPQprgTL1zbIewtrJDU9VUOlFtlqLCVhe1zGXCON3pEI
 Ufr2CZ7/yeqohf/PVG2yrzCKD5lWl04tWqDkUzQx4+qSLu8fCrM/H1QYPDIT6LcIGKT6
 XwLonkvX2jonmgz49vG+TOiLCMIMML+0orlspr8sQJIcvV2wdvFRo5naJuWg/L+37tqn
 voSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYag+Bc8AuQ7klC6LwKp3Hqd/h8+XJbeqg437KyxSlA=;
 b=ANf3hMwbmXa2vbpe/WVmumC3foG/QtKsxEuN04nTZKGN3Tcb3QBKGH3qviWrgELhhc
 bxaz8wpZQWyzluuPIBgg06El9f863wczZ7xaWod8KqBzJbAheT+GTWL70CMtF5/Ly6et
 cnY5xL9ntq6cMgT320ELtnYoE6Etz5e+6yqQrMfomrsoA6zKHUJbpOhpcs/WCuDLCCEu
 yt2YylaKeX0bT4uVjTitxS1kWEgjgdLK4GnntX2/P/L5MptcddfBqwql8+2ZYdtGdSWc
 uSvtd5KX3Vu0liSKXQujCvo4mhETHHQr2a+L5irIZWcNmFIrFURd94vRnVpMC5Xh8+6G
 LL6A==
X-Gm-Message-State: APjAAAWp9ARdOwjGh7vMyLXrT+5q+eNMErd+nNcDvyGxN4jnnmN8XqQ1
 LBddM5fEwA7uKWftaClKNZ0=
X-Google-Smtp-Source: APXvYqzc/NcJedpT9MyHDjIJJxCle4dtSZ4sBeS25vT4lpq+Siy29EZNy3T13RozFRPJ8GprmHgUaA==
X-Received: by 2002:a2e:5304:: with SMTP id h4mr58319418ljb.75.1578188921055; 
 Sat, 04 Jan 2020 17:48:41 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id t27sm27192468ljd.26.2020.01.04.17.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jan 2020 17:48:40 -0800 (PST)
To: Ben Dooks <ben.dooks@codethink.co.uk>, Jon Hunter <jonathanh@nvidia.com>, 
 linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
Date: Sun, 5 Jan 2020 04:48:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

MDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4gW3NuaXBdCj4gCj4gSSd2
ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+IAo+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMg
c2hvdyAxNiBhbmQgMzItYml0cyB3b3JrLgo+IAo+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBi
ZSB3ZWlyZCwgaXQgbG9va3MgbGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPiAyNCBiaXQgc2FtcGxl
cyBpbiAzMiBiaXQgd29yZHMuIEkgY2FuJ3Qgc2VlIGFueSBwYWNraW5nIG9wdGlvbnMgdG8KPiBk
byAyNCBiaXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBs
ZSBzdXBwb3J0Cj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4gCj4gTXkgcHJlZmVyZW5jZSBpcyB0byBy
ZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4gCgpJbnRl
cmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRiaXQgZm9ybWF0
IGlzbid0CnVzYWJsZSBvbiBUMzA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
