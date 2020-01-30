Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F714DFCE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 18:20:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A237A167A;
	Thu, 30 Jan 2020 18:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A237A167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580404826;
	bh=Q4hyTZbs3gumIwiRWpOd/I4If6M6W0GZMhGGeKRjY/8=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qlWTf2PsGdk3HCWXg/UXh4w1KV7xJ/+8axjjYYR9UGTC3z3qYhG6SyotGVhHvHMJx
	 b3FJXqF377+z/NKBcmOzpjFDik8+xc4e+X6QWiCjoqjyJzw5H7eIg+0YKLmcBv1tN3
	 7nQoKwPOWnkkTbvKpoRRzEs+PIKOZUY1o1mTKaRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71FACF8014B;
	Thu, 30 Jan 2020 18:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3244F80150; Thu, 30 Jan 2020 18:18:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790CAF80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 18:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790CAF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SztIeg2q"
Received: by mail-ed1-x541.google.com with SMTP id m8so4581634edi.13
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 09:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8D3nTAguvIqplzObM8ADcL8DB29MsLu3XHDyWA8ErwI=;
 b=SztIeg2qAmGyys78oPuc0B+llqop2JE4RwZD4idMUu3ObZ/sHCVYDeI7gFc3/gz5gV
 ic14C3DERF+MAayEZxmxpMtYDWBR4anQQ3K3y2+GhoSv7BYa6LLbbzBb+T1cVN2uyrJU
 rPF5XBoqu8s1p57eM+fC2YLfVgR/g27WixvVHVyXgfz+MW42UlXI7FQrvuAxMlrrcLPq
 3qha0jhqqi+i26Y9oUOhw7x+91cj6ornJTwkAVWwSTDkD0YpTosmWdA5iAx8hMB35Dr+
 ytILyALuqH0+Ksv0rvzpRCb1UMyTwRKEMjy55xx7LEE0E5UQCYSP7/mb2dVHcUSsU5H4
 zHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8D3nTAguvIqplzObM8ADcL8DB29MsLu3XHDyWA8ErwI=;
 b=PToRrbElUldWwL3/N9QmbrTPia0yaUTE/B5LOur/dB7LE2PtHt2pGtEAcD7e7BwxAQ
 o7k88IfDb+uOZj0A1/7gax5u/F41eqnRrBkmIpBnD2DqpPblB1qSoXPCR1+3SCNBiy1G
 5M9PN0q3YSWUwoYPBMo8vZ0IBig1gCqboqdP/Bm94n1OQGk9cnQAK+8LHhoTqPcReLU2
 OpwmtPXMSgJ3szR5/XczKDB0LbnCQsOzIE3RUoWv90MeAYm11saMMkX85hOl7/c8hRVZ
 Ae8jHgn54pJuk7fMWICLspEtOYuuW4ViMN4L8GbSMRbM6OCWNqbQ8AJRNMf1JCIsGVDp
 qvUw==
X-Gm-Message-State: APjAAAXqQ0hVC75nUR9kb9y5/EnLiyPCl4allKN3beGg5M1NZFJSTeg4
 uKcn3q4x9E9+dWrS2jItP60=
X-Google-Smtp-Source: APXvYqyaqSRiJKtRlJIEZRpmEczULCkL7DfyZ6QlrCeACutPmtwyTeL3GSEw2hFOZXNyQmaUKrwA0w==
X-Received: by 2002:a17:906:52cb:: with SMTP id
 w11mr5230760ejn.59.1580404716284; 
 Thu, 30 Jan 2020 09:18:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id x2sm450476edi.95.2020.01.30.09.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 09:18:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
Message-ID: <f8c04460-f2ea-3102-4723-a5a75ba535ba@gmail.com>
Date: Thu, 30 Jan 2020 20:18:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
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

MzAuMDEuMjAyMCAyMDowOSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMzAuMDEuMjAy
MCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gLi4uCj4+ICsJCWRldl9lcnIoJnBk
ZXYtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBjb21wb25lbnQsIGVycjogJWRcbiIsCgo+IAkJ
ZGV2X2VycihkZXYsICJjYW4ndCByZWdpc3RlciBJMlMgY29tcG9uZW50LCBlcnI6ICVkXG4iLCBy
ZXQpOwoKCkFsc28sIHdpbGwgYmUgbmljZSB0byBoYXZlIHdvcmRpbmcgb2YgdGhlIHRleHQgbWVz
c2FnZXMgdG8gYmUgY29uc2lzdGVudApldmVyeXdoZXJlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
