Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBD2B8B3F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 07:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87EB01702;
	Thu, 19 Nov 2020 07:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87EB01702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605766016;
	bh=YiobUckqmz8Hux+siYgE/NAyOt3Ktu/lPwmNFDbrASM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RklRMQy4VhbEx/+Zr8H/0aN/62pkf8c/WcvoSwsHexBglyHAdWGXzQmZNIksX7KEf
	 4qeOBBwfqMz7smP/EWa1X/TSt8bMjGYkHrF1ymMWICdkZeAQwhm+UMT5/DyTvbViXj
	 CTnYQ3BnFpVqs8nDlXtWpCFmAw1MVJZJlejITCt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B688F801F5;
	Thu, 19 Nov 2020 07:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2232BF801ED; Thu, 19 Nov 2020 07:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A2FFF8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 07:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A2FFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GeHvjHAa"
Received: by mail-qk1-x744.google.com with SMTP id k4so4338707qko.13
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 22:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afgDn2umda6QgnA0T4nNfO0qOaQP4kyxzthFa3SdSFE=;
 b=GeHvjHAaXVWHe47UtcIRS4vrSBEdINyrcJ8wDFKIB70hQKrcBT4vdCSHWLHGPdHnDK
 /OLAYZm7nD/ldSC0YfZGtTGbgrMUxOHGNh5nCPHxT7A205g/KwJuag6SPrs5thp5Dbga
 zYoZMz2LzUBnDq2HeyPzro/Q6J2HyeKjhej5QlHs9OJITgS1BEDefIpjE9ST9P9k8/oJ
 idI1krkePOsHfIKHMsSxkTnp/I9NDY53hW1RTe5/Ejd7wsKyM/kppCa86DIs1kgYL9j3
 GHohFLV4MITqLk56Iw8ogdu+emoHOO01cce4PfJw9UObyGt7q+WHlj9A65gXYxm7lSSx
 SRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afgDn2umda6QgnA0T4nNfO0qOaQP4kyxzthFa3SdSFE=;
 b=sDvdixvDr4p/H9EIu55Jy5sQspaG85ssFRzSU93rJqsJjQpwbvFMto0N2r8n49DLW/
 Kc4S/VypXj8N8xCTJ70zrgfAcYXFjDRGGE3d5U3KXkhlqQ5HTynnZOLmWiJke+0aRW6m
 rvOqkyzb0iXv+rj/L1SELePTPem6cfsFUXeezMbjZigZoTkSwR+N2TrYevcBfm984bAj
 PfQraQ4xkJds84t9daKPGrGtDJUKmv30IPea1t2mZ74ZG1XvcgG9KMikSyR9qfKbfH/U
 pAd+tFeHWIoP/Te14oo85/uhef81O4jR+PJzr2YdigNVbAhOS7s24v7DeOAHqSmZyp1z
 pYbQ==
X-Gm-Message-State: AOAM532FyHsYipC5dQIDuPAY2f44D4TggRhEAKa5wk3Umqft/Yr4v5uh
 dJ28m2Ou+EeQBNUn80pHIww1GGms3V5AmbkS3vU=
X-Google-Smtp-Source: ABdhPJw4ldiy0UOoaJKLIc/wQOv2QQLlKmJpH68m7Y/6USvRX1laUXgpAW85JgEWR6O1s71WFQ37KQdGxadYdcOaBdI=
X-Received: by 2002:ae9:e317:: with SMTP id v23mr9438913qkf.152.1605765908487; 
 Wed, 18 Nov 2020 22:05:08 -0800 (PST)
MIME-Version: 1.0
References: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
 <20201119050120.GA7124@Asurada-Nvidia>
 <CAA+D8AOuaeZCnvY0h2stzkiMnNCe7zvK_D4M2irT7y7NC+iZFg@mail.gmail.com>
 <20201119055340.GA1666@Asurada-Nvidia>
In-Reply-To: <20201119055340.GA1666@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2020 14:04:57 +0800
Message-ID: <CAA+D8AOkios28X0n0cC4RbVnkkQ5U3fWaBNrp1AvN0rr_wbb-g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 19, 2020 at 1:54 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 01:28:32PM +0800, Shengjiu Wang wrote:
> > On Thu, Nov 19, 2020 at 1:02 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 10:29:16AM +0800, Shengjiu Wang wrote:
> > > > On VF610, mclk0 = bus_clk;
> > > > On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> > > > On i.MX7ULP, mclk0 = bus_clk;
> > > > On i.MX8QM/8QXP, mclk0 = bus_clk;
> > > > On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> > > >
> > > > So add variable mclk0_mclk1_match in fsl_sai_soc_data To
> > >
> > > Not in favor of "mclk0_mclk1_match" as it doesn't sound explicit
> > > to me. Instead, "mclk0_is_bus_clk" or "mclk0_is_mclk1" might be
> > > better. Or in case that you foresee some other implementation:
> > >
> > > enum {
> > >         MCLK0_IS_BUS_CLK,
> > >         MCLK0_IS_MCLK1,
> > > };
> > >
> > > static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> > > +       .mclk0_alias = MCLK0_IS_BUS_CLK,
> > > };
> >
> > No problem.
> >
> > But I just find this patch doesn't consider the mqs case.
> > MCLK0 can't be used for mqs, it needs MCLK1, even
> > the MCLK0 is same as MCLK1,  MCLK1 need to be
> > selected for mqs case.
> >
> > Is there a decent way for this case?
>
> Is there any use case that we have to use MCLK0 instead of MCLK1
> on SoCs where MCLK0=MCLK1? If no, how about skip MCLK0 at all in
> the for-loop at fsl_sai_set_bclk?
>
>         /*
>          * There is no point in polling MCLK0 if it is identical to MCLK1.
>          * And given that MQS use case has to use MCLK1 though two clocks
>          * are the same, we simply skip MCLK0 and start to find from MCLK1.
>          */
>         id = mclk0_is_mclk1 ? 1 : 0;
>
>         for (; id < FSL_SAI_MCLK_MAX; id++) {

Ok, thanks, will update the patch.

best regards
wang shengjiu
