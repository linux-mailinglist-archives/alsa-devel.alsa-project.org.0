Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A959D2B8B28
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 06:56:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44BDC1701;
	Thu, 19 Nov 2020 06:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44BDC1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605765360;
	bh=WA/4MRB36QQpyDyGwrADw8lQKnmAT4hJ+WvKrcSDKXc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vx8CqewiojzSbpD0prbh91wKiedFeAXEM+3uLfzcmWAUB92xs0yktMMaSjj7iODIm
	 BqHkLHQ2iQSS5Q6x0jz4sVLkrXa5kcAR5EuiWFTwyVMchoqSdD2uAzxVxGKUsUhSm4
	 CS9E858LmWhKQStqOHbiidncX/nb/GUBhBAwrqEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1203F8015A;
	Thu, 19 Nov 2020 06:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0719F801ED; Thu, 19 Nov 2020 06:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A82AF8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 06:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A82AF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jcTSHx7i"
Received: by mail-pf1-x443.google.com with SMTP id v12so3379847pfm.13
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W+/WJCvab/Hgugh+VunRbyQx3J7VABdiIFZZOJfo1TY=;
 b=jcTSHx7ixnOfDz+kuB8ZRPKp/lqdE5UHKP+d8CVEEqI93FNGKZLVph7FLYgD1JN+pv
 /DdJEYApwcXEIZLUeqkVkaHdbZbUOH0B1Gs3ytKpcYvoa/uCILTYC9BtvWPUyEX3sb9G
 07LvFQyVqUQXlZJwa/HQlnkMjFKIYsmwn6vxvq1p4DOlfS8bGa9fWYitBwjGBwIwEAx3
 +uHf0UhsMiop63FjT2nQ0dQX0SB9YvtOfZdIiGy1vc8lTLzHBQ9BL/1trJJNVtnqOuf0
 7eX9aDm4eZYAhwR9NyC5dgDiOaEAqnSa/L/+aT7UnlWsbc6m+pzzStA2bcoYYRUe9ee0
 yhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W+/WJCvab/Hgugh+VunRbyQx3J7VABdiIFZZOJfo1TY=;
 b=T4lHDvEYZ3ShzDFabCcGBDZ3isqGKM4k7WG/O/v3MQ4EobTRr6Gm7YXBXHVS/taet7
 nytSwOrYNB6gE8EXh+hH3YMqxrMR3UKtotsYHoLKssVVtVQ4v94qSIPjX0hdti14duWZ
 zbtX/6TzKxcshPwugjolBPjh88IGwBipYQPkp6X77vV2AiLGHYAwrA3QrGHXwXcVXwGh
 6rx4D7KTQ0SGJjDvsI7LLEiCEdTTRKfGLtsf1Pzb1cMiIQ2VRrLePXkw5sIUqeGwzfjB
 ntQY70WAnQ1CksJ+/YHkygG+W5qRYXDNm437mN8CycPc6sMTxnUdDS5JS9KsoH08ZWun
 b/xQ==
X-Gm-Message-State: AOAM532mIqIw83jDJjxlbDY59vlOQWahHYAnvsIGQL5gUvhPi/i/lOfa
 tP/pjJ7sKgcNNY6B9kvFdgU=
X-Google-Smtp-Source: ABdhPJynlE37JqiWB11KpgkMSim1NZ0+qLh6TpiXRD+r+aYGCY8JpQYcvhso0TeNNN7BWmAZ7yAP8g==
X-Received: by 2002:aa7:8c16:0:b029:196:33d2:721f with SMTP id
 c22-20020aa78c160000b029019633d2721fmr7465723pfd.70.1605765248175; 
 Wed, 18 Nov 2020 21:54:08 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t9sm4682874pjq.46.2020.11.18.21.54.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 21:54:07 -0800 (PST)
Date: Wed, 18 Nov 2020 21:53:41 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
Message-ID: <20201119055340.GA1666@Asurada-Nvidia>
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
 <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Thu, Nov 19, 2020 at 01:28:32PM +0800, Shengjiu Wang wrote:
> On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > > On VF610, mclk0 = bus_clk;
> > > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > > On i.MX7ULP, mclk0 = bus_clk;
> > > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> > >
> > > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
> >
> > Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> > to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> > better. Or in case that you foresee some other implementation:
> >
> > enum {
> >         MCLK0_IS_BUS_CLK,
> >         MCLK0_IS_MCLK1,
> > };
> >
> > static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> > +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> > };
> 
> No problem.
> 
> But I just find this patch doesn't consider the mqs case.
> MCLK0 can't be used for mqs, it needs MCLK1, even
> the MCLK0 is same as MCLK1,  MCLK1 need to be
> selected for mqs case.
> 
> Is there a decent way for this case?

Is there any use case that we have to use MCLK0 instead of MCLK1
on SoCs where MCLK0=MCLK1? If no, how about skip MCLK0 at all in
the for-loop at fsl_sai_set_bclk?

	/*
	 * There is no point in polling MCLK0 if it is identical to MCLK1.
	 * And given that MQS use case has to use MCLK1 though two clocks
	 * are the same, we simply skip MCLK0 and start to find from MCLK1.
	 */
	id = mclk0_is_mclk1 ? 1 : 0;

	for (; id < FSL_SAI_MCLK_MAX; id++) {
