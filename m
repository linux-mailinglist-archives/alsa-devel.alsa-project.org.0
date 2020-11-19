Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81C2B8BD4
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 07:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03291705;
	Thu, 19 Nov 2020 07:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03291705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605768823;
	bh=Hzlu15YBWU82JbdsmVliNo2XbcjzSiNEqhfpkE8/aVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/7peGlp5GpFAnzdXVK7+PFDbmfY/YGkiya5dC7m4NZoa70JxWnKL/iM61NEOTXqu
	 g7abCxxKlhLfDAdnlAV5RtNXWNxnh6EOJb1AdFi9moloQywY83UCHa8Jrz0tEg9yB9
	 zruSxAUlrbt6RTRLI198OHVpgDsKBCYKKgUU8pPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3635F800EE;
	Thu, 19 Nov 2020 07:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C03F801ED; Thu, 19 Nov 2020 07:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F5BCF800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 07:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5BCF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jbuo9kaE"
Received: by mail-pl1-x641.google.com with SMTP id d17so2428563plr.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 22:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YdZEJFrKMqOKwqEHM2SMsgDlq62AjmhaiDfpu3ifyuI=;
 b=jbuo9kaEqlrzfBtB8xdHG/ABifiR/DNQ/ty/tTE8v/3XGOFwJGEj60vaW7+EToRIS9
 j/RewspM2uK8jaGUgXUgItDPW/u3Ij5QNuzGqpfr8txs/pidD5qZttqcEngOy0Ra8j4z
 dhE7WiKNgaC7fmWqaZQtkcJWFqUoXcaJncuO1Caa9CoMttRmkN8aj0PRPEZnkKRNjp/j
 I11/RthsHxm68vtFm1Yypu7bfCsbTB++dBEDnqCu07cFwzJUCFCgPKuDyqZlmO46DAs4
 LIgM/1C9/xVIzBYYqYO8GsgaCW77wrx9aYrZxa8VKTLNSNpukiLYg36Oy9zVP5uSrMGt
 gbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YdZEJFrKMqOKwqEHM2SMsgDlq62AjmhaiDfpu3ifyuI=;
 b=dZfQXwrz3F1yDuHQV3g6e0NnKLFMSR3Fl9/A1OAlaIqFT0Q1vv1mPqrMxQbmq6eOcS
 uyoHjwQ0tMON/0xMWhkWvbCA47Qx1aP36n47qCJ7VRMmOtWkb0+toA9F7zOceGfoGn8F
 RP1s1ChZk7fxNYLr7cBNC1PYbp3gyGxi0hbhXK16VSyl4LcS8FLJLx7KZ8yHx29qc/XD
 QIeo+cEFVbh3g/s6j/HOg709kImoXXDXrtw3cWNdWBuUkUxqxLIuGsVPd6oZe+Uxf5RU
 nX9gIK4M13l8yxDVghtbKfEJt2lp7mrZmnN21h9DC5yn9UUmxv/dYKliAWugM8o2NX4t
 p9Ow==
X-Gm-Message-State: AOAM532AEY0SeiQpbshOKzipIfcsUvxigITBVsLUYjRbU3VfDz3JmwD+
 a2kXYD1W1fRq/EVrruSxmgc=
X-Google-Smtp-Source: ABdhPJwNjcaPO4z56nqOXPwx8RuDahj5FRpIkqxLnLyLvLIbuMAUb/EcTDMnhRUfdl2utjiWINvCbA==
X-Received: by 2002:a17:902:401:b029:d7:d0af:f897 with SMTP id
 1-20020a1709020401b02900d7d0aff897mr7828053ple.18.1605768710494; 
 Wed, 18 Nov 2020 22:51:50 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id j11sm23890863pgp.82.2020.11.18.22.51.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 22:51:50 -0800 (PST)
Date: Wed, 18 Nov 2020 22:51:23 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Correct the clock source for mclk0
Message-ID: <20201119065122.GA9858@Asurada-Nvidia>
References: <1605768038-4582-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605768038-4582-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, Nov 19, 2020 at 02:40:38PM +0800, Shengjiu Wang wrote:
> On VF610, mclk0 = bus_clk;
> On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> On i.MX7ULP, mclk0 = bus_clk;
> On i.MX8QM/8QXP, mclk0 = bus_clk;
> On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> 
> So add variable mclk0_is_mclk1 in fsl_sai_soc_data to
> distinguish these platforms.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
