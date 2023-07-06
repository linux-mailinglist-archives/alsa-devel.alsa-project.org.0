Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F293F74D9E4
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C316D3E7;
	Mon, 10 Jul 2023 17:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C316D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689003044;
	bh=JgAS7+H/bXuGN7P4jhyATEkL5iXN8WwS5vNdjCpDTKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h4nQR3LOwzJ+n56J8T8RwDyxqPxWUc2l/1tQcIXn6Zw24sacdEXQEK2oRbp5AEErD
	 qwX+Fd8ZD6Y0dU5PXzM8YrhceJjKYSJAZa31CNU972ShjJjJboe0PWd1nW4LwQ9rHO
	 MsPTgIHDJvUrNXXI168VEaoojLBC/P7qj2TdlkmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1793F80290; Mon, 10 Jul 2023 17:29:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00035F80153;
	Mon, 10 Jul 2023 17:29:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0386DF80125; Thu,  6 Jul 2023 10:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from pi.fatal.se (andreasfatal-1-pt.tunnel.tserv3.fmt2.ipv6.he.net
 [IPv6:2001:470:1f04:f16::2])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F97F80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 10:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F97F80093
Received: by pi.fatal.se (Postfix, from userid 1000)
	id 49B302A8D9; Thu,  6 Jul 2023 10:47:06 +0200 (CEST)
Date: Thu, 6 Jul 2023 10:47:06 +0200
From: Andreas Henriksson <andreas@fatal.se>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Hans =?iso-8859-1?Q?S=F6derlund?= <hans.soderlund@realbit.se>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
Message-ID: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-MailFrom: ah@fatal.se
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 43HMEGOLBLQ7PGGLELCIMF4DXJ5II4JS
X-Message-ID-Hash: 43HMEGOLBLQ7PGGLELCIMF4DXJ5II4JS
X-Mailman-Approved-At: Mon, 10 Jul 2023 15:29:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43HMEGOLBLQ7PGGLELCIMF4DXJ5II4JS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Shengjiu, Fabio,

On Thu, May 19, 2022 at 10:23:06AM -0300, Fabio Estevam wrote:
> Hi Shengjiu,
> 
> On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> 
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index fa950dde5310..dae16a14f177 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
> >                                    FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP,
> >                                    savediv / 2 - 1);
> >
> > +       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
> 
> Isn't it a bit fragile to take this decision based on the number of
> SAI registers in the SoC?
> 
> What about adding a specific field in soc_data for such a purpose?

We've been working on an i.MX8MP where MCLK needs to be input and found
that this enables the MCLK as output despite not having set the
`fsl,sai-mclk-direction-output;` devicetree property in our DT.
Reverting the patch fixes the issues for us.

I have to say that the code comment made me a bit confused, but once
I found the commit message I understood why this code existed.
If this is really i.MX8MM specific maybe mention that in the code
comment and please make the code actually only trigger on i.MX8MM.
It seems to me like these all fulfill the current criteria:
imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93

Should I report this in bugzilla.kernel.org ?

Regards,
Andreas Henriksson
