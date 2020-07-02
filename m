Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BA212CA6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2288C16D4;
	Thu,  2 Jul 2020 20:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2288C16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593716274;
	bh=HcGKm8Y5ba6plaar7Tpen6IUaTQxUP42sL9mpMfbwXg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQLu7rGyoFmabvertp/uioh85f8vc971VOl7bLJlTd1lNxQmcp8kcW+IXpCi+hMed
	 dCHvuWo6gE3IDHW2YF4mhPcFsU680W10ly6ClihvCHowhYlbZf/MT9HqH4MqZH4HQD
	 nZi5D1VqRsrpxo5DydzRWlfs+HodfW8gdXWSaZmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49892F80245;
	Thu,  2 Jul 2020 20:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F107DF8022D; Thu,  2 Jul 2020 20:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A504CF80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A504CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A3G4MtAN"
Received: by mail-pl1-x644.google.com with SMTP id g17so11650779plq.12
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qBFSIEqb3Ng7/lC0JUelHpDcsFXn4/YiY3KJn+e0D5Y=;
 b=A3G4MtANzT6glf9L54RU8hc1oacj7n2KB3QD7g0+kHEo/8S28CgBxelB4vKRcvhnc3
 RSnK4atX1dx5Qih53uU7m0JQvP9hx1zMxNvFzp7+kEavqGXpPcfBUUXibPw5AEBVkSUW
 CpQ82qvhwyIsH9H84QtLcbpcR5C0Xe9EKZhqpVrvMckIzbA8EvZNHDCRzqpqWXVmOo6u
 2b25n3RkYBpMCZnTiTlNwEQDAhnVecoxMzHzgobV4ZxLWKRAqqPFu5bcBygECag2dI2x
 IT9Nf76Z1P0cPoKdTmSIC3Y+fSJeUwVLG1Z0Jj2dgYvKb9bZ3p8Wq1jYn9xzLe1y6b1T
 D9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qBFSIEqb3Ng7/lC0JUelHpDcsFXn4/YiY3KJn+e0D5Y=;
 b=i3obvZqYO0L9BzhfRjwYmz9+isQow1PxNgDnwKHy8xD3JtyoJdWfNmpG2w7P6F1Jvk
 2fSY18SkDo3C85MErowK9eGykYPbBE89uy9WCLlSvGrGX82W9Xi0sCfETizZZGRxj2J3
 hTO4CFbFcTFznK6FJ+2lRDBlX8pgqz0jNkgCZa25Gbv4GmLcCDgMKjUjZTTBqXf+U2Fb
 ixaWAepkr0OxKx6mqX1Whczy4E45BmmTL07JF4VH2Vzu5leMYLTWQ3Lqr1crYYfDJ2Y/
 qaLpCx6575vgBs8Zu3HFubnsT1vQaJ6VFqrGjlXfYAJctnvx4O2/DcXAdOynkqbay27N
 8mYw==
X-Gm-Message-State: AOAM533PSa9npkgDWeTPpV8Fe+nkrBxY5tQsUM1JVW2n+D3FhK42BB89
 kaJgW1qdWMuNZZsg4Eoikh8=
X-Google-Smtp-Source: ABdhPJzmLnrOT4bL83BOEWHbMjWQcuvAWjX4ZOEdS5WteN03EusTe1EhtKuJZhn9XxejD3G2LQnkxw==
X-Received: by 2002:a17:90a:2465:: with SMTP id
 h92mr3998120pje.26.1593716161116; 
 Thu, 02 Jul 2020 11:56:01 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id m92sm8863055pje.13.2020.07.02.11.56.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:56:00 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:55:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 6/6] ASoC: fsl: fsl_esai: fix kernel-doc
Message-ID: <20200702185556.GG23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 02, 2020 at 12:22:27PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. Fix kernel-doc syntax and add missing parameters.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> + * fsl_esai_set_dai_sysclk - This function mainly configures the clock frequency of MCLK (HCKT/HCKR)

Can drop "This function mainly"

>  /**
> - * This function configures the related dividers according to the bclk rate
> + * fsl_esai_set_bclk - This function configures the related dividers according to the bclk rate

Here too -- dropping "This function"

Otherwise,
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks!
