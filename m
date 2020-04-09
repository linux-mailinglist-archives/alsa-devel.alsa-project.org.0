Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2D1A3650
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 16:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A27B11616;
	Thu,  9 Apr 2020 16:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A27B11616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586444044;
	bh=tYUDglEsHslP4KlclkY1J/dtmwtGgm3B3z6/Ls6DKJ4=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4qelAiukycK4mwMFjU3P/FlYZyNMNGcSiiwT81aOfEcldF3/CNjIEZSplO4SBwt6
	 6/hqI5CpIw7jRzj+rAcTrLXODlWP+DX5q85RfMehqPTSumZttFzC3YKdW0e1cHxS+k
	 xSBGBj1qnu3+qBeZug4EMlBO1+cSFVTTrtSSu/84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA9C0F801F9;
	Thu,  9 Apr 2020 16:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29830F801DA; Thu,  9 Apr 2020 16:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E8E3F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 16:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E8E3F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EtJmkLcK"
Received: by mail-lf1-x143.google.com with SMTP id m2so8111725lfo.6
 for <alsa-devel@alsa-project.org>; Thu, 09 Apr 2020 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ze/V2JXU5Dd6o3pQccxKMS1reN02+30rheQBo6CTvd8=;
 b=EtJmkLcKWT1VvBoekMfVi4G/IdP51lOLqGI3DCGWKvYoSJX9VTKrBV7CfBuc5fCDo+
 uKw1cbIpserHPhUs/W//5NfRkr2B1Iac8FMcQImayUXWPy/IBMA1wJ4WHZtvOBI8XGtd
 LjpQ/cco9NMOtKBsQIWtLsallphNy3kVNYKHwJ7U5SYaMeVK6CwILbQbp103mlI/l2gy
 My75x9UeDmhAx+bzfZERtqKjTOH2oZcR67OlnF+0H9OBzBudwTyYEIt0nBZqDch6WHIn
 kaVycaWjKQ+S4qRGChhI68gskphg55kBWYyKUcCGSoT021hFDuf8nOBT475Ue3sjuNQJ
 CcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ze/V2JXU5Dd6o3pQccxKMS1reN02+30rheQBo6CTvd8=;
 b=eZXAMKfn0gvtHB1/a0fdSUIdJ9vNpHKLbScvlees0eg4Q0I3oJJ32V1Kwbe/pR6y7M
 mvvGtLG4NHY7GyiUlygV8B2CqakGq+RPyoOTjGJNSbn3mBPMuG5E9hX+7Hz3NwyppyAg
 AS5kH2PnwRpS0D4UGOmnZSICRD3zkFVpWyp8wpiiUBLjiVIITHnM/VQZY6em1eD2Ixd+
 PPh6ucnr5CRmhbS50p2H00vutHD7ttiLSWJmdlxlhuSqthpN0i7qal8HEPMDP2UxN+JA
 eDiRwQiSbrJnGu6cHVgzQVj1INaDc9Srtqsomk2EN7rlaD97fcBSAJSlD63YlyP8Iup9
 GPpQ==
X-Gm-Message-State: AGi0PuapyTD6uL/a6bo/ib00PItFZsh3FcOhEdvDdL+ZSZphTkRcl8tV
 dIJrmp3qHJ1Tm4Hu5PpTAUo=
X-Google-Smtp-Source: APiQypKEJgsBG72cT7T421h/LiCZlt01kMa/HHAJAkrMz6hTbZ3iGPgQpuFAJHbdjXE3AzP9I6kzuw==
X-Received: by 2002:ac2:4c34:: with SMTP id u20mr8073483lfq.40.1586443931852; 
 Thu, 09 Apr 2020 07:52:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id v17sm3353142lfe.34.2020.04.09.07.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 07:52:11 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20200330204011.18465-1-digetx@gmail.com>
Message-ID: <5c9c995a-a571-e543-e680-30739cb1561c@gmail.com>
Date: Thu, 9 Apr 2020 17:52:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330204011.18465-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

30.03.2020 23:40, Dmitry Osipenko пишет:
> Hello,
> 
> Some devices have a 4-pin jack instead of a 3-pin and currently the
> WM8903 configuration is hardcoded to the case of 3-pin jack in the
> Tegra's ASoC driver. A new device-tree property is required in order
> to convey that hardware has a 4-pin jack, and thus, microphone's
> detection needs to be done in a different way.
> 
> In particular this is needed for Acer A500 tablet device that has
> a 4-pin headset jack, otherwise userspace sees headset instead of
> headphones and internal microphone isn't enabled by ALSA UCM rule
> when it should be. Please review and apply, thanks in advance.
> 
> Dmitry Osipenko (2):
>   dt-bindings: sound: tegra-wm8903: Document new nvidia,headset property
>   ASoC: tegra: tegra_wm8903: Support nvidia,headset property
> 
>  .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt | 1 +
>  sound/soc/tegra/tegra_wm8903.c                              | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Jon / Stephen, are you okay with this patchset? Could you please ack it?
Thanks in advance.
