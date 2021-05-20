Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11038B5CE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 20:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FEA516A6;
	Thu, 20 May 2021 20:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FEA516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621534452;
	bh=V0NpKlHa0s8ZooNTGDMRikHweLzNinIvrWw+RiMvkWE=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDIC5jZsi6fZD96b6K/WfWTiOGmn39aC3Aucxt9V0JnShCRSlIXc1O8YnEs6vsyPF
	 9Dp8M8GN/NWs22isGoQUZNLk2nZBchCmYaJD2QYg1D6h4S6BXyUHIu71o2IsbhmB+R
	 mTxeA3p/0rUY0i1APERy0uSxM66pxCsvSDOK0I6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7FEEF80229;
	Thu, 20 May 2021 20:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87EB1F80217; Thu, 20 May 2021 20:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D54D8F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 20:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54D8F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PK+x0rqP"
Received: by mail-lf1-x12e.google.com with SMTP id q7so24516797lfr.6
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NWQLbjqaSr16R/PNxaSSu+zkzXrzSBFweb42I5zYe8k=;
 b=PK+x0rqPqzeI9pAzqQe6aIc7BA0ICpwOcJCPGJa9IJXTgzUDi5ZfViSsXQLpKGIKsE
 37knsHsjMwqok3+9lVr+jhmSCbcUfufqtrfLMDacQpFon+xzGJxDPCQfKeDbQ/dGWn1V
 DuIWMHPFCOAjH0/MzCXTgq4UXq7aS2nRQ24u1vFcTx93yoAj8m62hhWyre92OgIHsNl7
 by8lVQEEynnWlvHnUL2XulPbGOjU1DP82cLPlZZXXV/FHL94wQz5UAqG2a3PHu548eqQ
 JddrFYFmIV54CPMCFD49uskRPZbimEypKDbA2wVQrrb007MvO0CcNhnzwzFlEcBcrYCc
 8j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NWQLbjqaSr16R/PNxaSSu+zkzXrzSBFweb42I5zYe8k=;
 b=Mw3RbgporLqlJhEcveLzrjiVMUSmccHsneFvLXqyo26clQOwHet2yXad3nAGbQMDIa
 dvO6W3NdpdBmARiJLcQ0ksB09ioH06jgRBUfcPcVZiy/NATyeGGf5PWNkzpWsX74CrUl
 ww+VlgU3TcBWQexzcHlsy2FcimsI/L32Cf2+s8ay3uANx90mAJ2KL5kjhEow+YEPV/gj
 idjabgtHs4XIkhQmdP/b9HtEUFYauROYivG9ph6AKOMkSJLuzaGfpXBd5GQagCwiSrAT
 f0Hfv2gdttJtKtuc43WduLln0NwlDJ4BPdm3GYo8EXC3HrGn3NRu/s+RiAnwZ6DW2YLQ
 BI6w==
X-Gm-Message-State: AOAM531jGcil9CuJDlTsJXQF+FEo/OwDCe9aGl/gnASLEAON3RRdfY8A
 68AfMEAskr2JhzlZLr776hI=
X-Google-Smtp-Source: ABdhPJyCypt5x2T6bL1CZz+kMGRD4Q6YHedxXO7wfpqWKweLlxHgJhSgqtj3X5qo/eGJvWtTNXuB8g==
X-Received: by 2002:a05:6512:3d0b:: with SMTP id
 d11mr3856695lfv.405.1621534355395; 
 Thu, 20 May 2021 11:12:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-88.dynamic.spd-mgts.ru.
 [109.252.193.88])
 by smtp.googlemail.com with ESMTPSA id h16sm363670lfj.194.2021.05.20.11.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 11:12:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] ASoC: tegra: Set driver_name=tegra for all machine
 drivers
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-2-digetx@gmail.com>
Message-ID: <c05c2cd0-726d-3f37-be0d-05d8b9122c69@gmail.com>
Date: Thu, 20 May 2021 21:12:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520175054.28308-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

20.05.2021 20:50, Dmitry Osipenko пишет:
>  static struct snd_soc_dai_driver tegra20_ac97_dai = {
>  	.name = "tegra-ac97-pcm",
> +	.driver_name = "tegra",
>  	.probe = tegra20_ac97_probe,
>  	.playback = {

This is incorrect version of the patch, snd_soc_dai_driver doesn't have
driver_name. I missed to fix it properly on rebase of the patches. The
rest of the patches is okay. This will be fixed in v3 if we'll agree
that this is the correct approach, I'm waiting for the v2 feedback for now.
