Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612931F74F9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 10:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53E91607;
	Fri, 12 Jun 2020 10:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53E91607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591948962;
	bh=9uNrthPUGVGhfuUfcZE/O0NOCViBkwKuU6RkyOb0YHo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRj4F0P3+riZuEIIgCxMh1LTREBtJfrQw+6wgtWM+PC/Np8pU3Gu7DURPRWkCUWwD
	 XH0BgPPYQp6KiAsDDqLje4l+qGlaay+y6GejA5FZ0VnZNXLnmkZ37dNoQhplMcGOwA
	 0yYLKSBv3oRggER8y7L9zbfADlMecgT+VPN1dGYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7F90F800C7;
	Fri, 12 Jun 2020 10:01:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91769F8021C; Fri, 12 Jun 2020 10:01:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93853F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 10:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93853F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KpLD6GPa"
Received: by mail-pf1-x443.google.com with SMTP id b16so3920425pfi.13
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tf6ndzUcORoBXdwJ742om4LN/SmZ3Qj0kiAjVJpLMKc=;
 b=KpLD6GPa1LiJdiGXWZtlAf3FCCQaL2P+jEHXZXpY0DK6/JwqBCfMEUa6SycwKn36pV
 fIU7NQzgMPjlZDT6/IgfHOy47FlKgE318Lpks/2XmKxd5ssYI/JhxLhUQ75NrwSA+FgI
 WwR9W/Kd/eb/WW1vtpNmQ9luP94CdVn8iknLZhGVcTLxXCE6AOHNN7mJqKJ9Lc/iCNKJ
 AmEDtdeCOQrtGcSJIcVAUggLVeknItOjsof4ZZKoN+u8vQ8mGV1UW+HWOCH9ZqIxe4wq
 8t6k+b6hVLXOTtMTvWBax2XusbsF8sNZOXOOhxUDzzwcEiUU8r0WY8sevY40vdjtQHLE
 pVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tf6ndzUcORoBXdwJ742om4LN/SmZ3Qj0kiAjVJpLMKc=;
 b=gIsKeiiVD53OUPIji0u+Q2p36DX3pT2Ex5wx8GdTBgmHgh+Re0V8qkPdyshsMPIhnM
 XtrDciBo7fZnUVazpg2VQQ9a54+b6Qnp11VztxNgv+ySLgV3c9FZpW3LQxNnpl0BMVqq
 qYc/qGHE35QcBeWDXngMWJmttr8Yg2dWY2SNTIjMKEZ7+SoA3ybaYezrQfs8/pscYrbf
 Hp0BD/e9WHjoh6v0REoWlPuLCrdMQhrN/nt2vmXcR85NyInNYLJG3x8pSAvWJ0Sk7O/h
 Q9cWXUbeK+VGMViZ8HxfBDdJ0N/+UQRCwzZqbVm0d62L2BLMo9BS/3jJBBsPfPbr2D7A
 uZLw==
X-Gm-Message-State: AOAM5320ZORX7ItL0yHAtEzEvPtj0n+qaDNCkSxCDCzP8/0rag0LAZvt
 rBfmjPtk52CXuHu4HXTv9C+dZS+Gl2Y=
X-Google-Smtp-Source: ABdhPJw376HozhA54nKnNRb/izTEe/+VX9TjxpQMNrnO9HjCzAoOeOAkAY3whh0s2i+FcSh4Kp67PA==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr9654512pgb.389.1591948851063; 
 Fri, 12 Jun 2020 01:00:51 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id ca6sm4579180pjb.46.2020.06.12.01.00.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 01:00:50 -0700 (PDT)
Date: Fri, 12 Jun 2020 01:00:38 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 1/4] ASoC: soc-card: export
 snd_soc_lookup_component_nolocked
Message-ID: <20200612080037.GA22422@Asurada-Nvidia>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
 <55f6e0d76f67a517b9a44136d790ff2a06b5caa8.1591947428.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55f6e0d76f67a517b9a44136d790ff2a06b5caa8.1591947428.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com
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

On Fri, Jun 12, 2020 at 03:37:48PM +0800, Shengjiu Wang wrote:
> snd_soc_lookup_component_nolocked can be used for the DPCM case
> that Front-End needs to get the unused platform component but
> added by Back-End cpu dai driver.
> 
> If the component is gotten, then we can get the dma chan created
> by Back-End component and reused it in Front-End.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
