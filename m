Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426152141CC
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 00:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA79C16C0;
	Sat,  4 Jul 2020 00:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA79C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593816542;
	bh=eRDwjagXW/S0eBsXNpxAdgOFwpV5NBdndzpFCB/jI6c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6kRCoN0/y3ZBbths1pBWpd3FeVLmUirOSRy8dx/hLA/Vmtuij3mpgN/3eHjUApQT
	 Lue4TFGjKFxxsEpDbL3abxQkVo2ZrKQM4BhJHkTeXfzV8LdHRvtpm7IAHItaV+ViMs
	 tV/CzCjfklNCFrk2tL9F1U/6KTc01PcxBRsC7W1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDFDCF8021D;
	Sat,  4 Jul 2020 00:47:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE22F80217; Sat,  4 Jul 2020 00:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0208AF800ED
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 00:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0208AF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mJlRtmq6"
Received: by mail-pg1-x543.google.com with SMTP id o13so12704233pgf.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KRBtbtG1j7Xe51Bh35XbQdV4rjnwLDY23WxNX/FI3wQ=;
 b=mJlRtmq6CpTsfGG8dI6jlPat89G7ZcO9ohU/lVmVrVAf4wiRNMRUbw03oycBMXcYJt
 dRf7KgkxWAa4M7I03cFI2YPOM7PVAyUnaPLFY8zT/mg2iI9nHhheihiwpulSefM3lVOy
 HpKkNmtdhDewZUmMsQ3UrKixCjY3+/o/T2Fd2w8oknSmXd4hqEpMaEAyHUp+rysnKI4l
 D/AibesffdHEZnm7prdjvBFlBT/8DaBTBcqWvNjuFCmphc44G5k73dcUWpxHIrKyjbuI
 6R3WLlxLulKtuzGcGRLVvTUiH+/r/QaJOhICYh3WdF9Dtc4eSwH8HyK6dY/gr0O86s6c
 NC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KRBtbtG1j7Xe51Bh35XbQdV4rjnwLDY23WxNX/FI3wQ=;
 b=OfaKwACXS4fbL8FSwdNYsI84njtzN68iOMszVny/Ta0AbFIHOq/fIYE17LGGXFURje
 ryJ9u1SzzKLbh9wAp2lTY6EXUfMZ9bY04MOjDoStuTbLn/Ef++DO/sZ6wYZNyLi+6831
 KBOhtjdnFC6wA9s0rOh5ebvTrvZEOUaSCeXLwdk4gjTQ6l6AWCZvPj0YJfiTVoLY1Gyj
 2kMEmaR6p/DC3zK9JqS2fZkkALuh+wmBVkl9XLeVd9XnPhU9YDUuUZJ21wyRTvdyOBuQ
 3NkiE5jgYNGdEzMnskNWrpTHi8idZeYjOgngiU6Hujqq8w9CpL5gYNzj5m1Dm9PdXI6x
 NNZA==
X-Gm-Message-State: AOAM530oSszHEKQIGLn/yRPkp6SoPqHB80wPNPt0g9GfpQ2I9Sw3ePDt
 wGVzoMdcg+ynLEtup1rbxJw=
X-Google-Smtp-Source: ABdhPJzcL3ocgTh9rFr1T1bDjb89oAsQukPkRkoy7Vq4NHGe0lAA0gG7Ha4pAjS96ri2k5zN7cGOwA==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr36997999pfo.166.1593816427129; 
 Fri, 03 Jul 2020 15:47:07 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s23sm13281151pfs.157.2020.07.03.15.47.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 15:47:06 -0700 (PDT)
Date: Fri, 3 Jul 2020 15:46:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703224656.GA16467@Asurada-Nvidia>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, festevam@gmail.com,
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

Hi Mark,

On Fri, Jul 03, 2020 at 06:03:43PM +0100, Mark Brown wrote:
> On Tue, 30 Jun 2020 16:47:56 +0800, Shengjiu Wang wrote:
> > The ASRC not only supports ideal ratio mode, but also supports
> > internal ratio mode.
> > 
> > For internal rato mode, the rate of clock source should be divided
> > with no remainder by sample rate, otherwise there is sound
> > distortion.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
>       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

You already applied v3 of this change:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html

And it's already in linux-next also. Not sure what's happening...
