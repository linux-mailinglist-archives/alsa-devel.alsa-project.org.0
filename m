Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBD413C59
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48C13165D;
	Tue, 21 Sep 2021 23:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48C13165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259470;
	bh=NyTR9Q2AmZwKC9gtmONDlhJRvDD9ALEm9Hy8ULvgYeo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BP988E7Cb46bGQckok9GYMYAuUpN/lRPZqBxwju91ND3hOAQ/SkcnYgMXWffp2z0y
	 gMNb5BGpq9ay9cDx6C6Sp3Cihmy+bcgkhw61QFrPSXeBmuxZZXyip67M1b403UfYCs
	 TABCEkAe8iJtGukaqVtXAapwRSMBxP24iDik9UDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F64F8025F;
	Tue, 21 Sep 2021 23:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298DAF80268; Tue, 21 Sep 2021 23:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42648F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42648F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lI3L7AvT"
Received: by mail-lf1-x12a.google.com with SMTP id e15so2871162lfr.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMGBZJhgLdjiD4sy6cvbQdtvYs//rHG8iQfh3SyGQf8=;
 b=lI3L7AvTi8Iwun3OAtga1QWsPwv819yMUHiXdIjyijYaXbZGLRJdlBdPWNnhc/W+CP
 GtHqPnf6DG/G+NmbIGEOxKIELz32liqbbzAHUW4HlqGaqQ65VHFcYKCOfIJrDTVKHaDi
 nKkB2LWkAtVz0b3mjluoh3WtLbSVOxCB4012SXFWbrlrnjl9cAj0wL8pSbswY9HUAMb0
 p2GtI7koz10lmy87cAztrXAFKzLJJNJoCdbeewQCwGL+2Or3EARVRV4Qlkdncywzom65
 Aaw8Q2IDjRq2yQgOefyOkSG0NuyrXsLaAdILz82GXpcZQhvR4/OnRZdoW5D8/ivXT4ud
 0gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMGBZJhgLdjiD4sy6cvbQdtvYs//rHG8iQfh3SyGQf8=;
 b=6veRILkimGD8KNsuQf73cT8gM9Ny+T1xkg0m5uFSdYRIFO79ST3UItG4Khupr8z52n
 p21Zd6wnS0tOezSFBh8N16haeBiyCwXI8TdDJhgg6T6LLCBMrToj6qMK+TUVTWndId4f
 jTcr4+oE8O4CBOtgi67lEpcFOWRmgRRwb4fxQrVCtM5rJPE8uhSInXAJ2OVWdXQFze+w
 KQo5RiHn9tsZe2ZHfHgJ8VdT4aoIrO/CoCwIQpc3e9yNoYQSqEhGRipMiq8MXDpQ6Gwk
 S4AIVT5gueB54Bk7GWVpy+xBl4y8GNXCfSqjRWXiRN8dL56Zo8IQs+o3beDInSlYgdqY
 GVbw==
X-Gm-Message-State: AOAM530qS1NVcCV9h1uixplEXiJhDglGEpI7wnwbB/m4Daw54vY7ZeV0
 DS78CuXZUgqPiBebEmEDfv62xRNrHPLp+pIxU60=
X-Google-Smtp-Source: ABdhPJxh9a81q0IGJIP/0g9LetfBcvltXmBhzVLEXSEszysh/R+YS6sunrAf1NcvezczNUoT95Ngg/cgfPC3kf6k6sE=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr24597919lfq.113.1632259382841; 
 Tue, 21 Sep 2021 14:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210921211040.11624-1-broonie@kernel.org>
 <20210921211040.11624-3-broonie@kernel.org>
In-Reply-To: <20210921211040.11624-3-broonie@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Sep 2021 18:22:51 -0300
Message-ID: <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
Subject: Re: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Sep 21, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:
>
> As part of moving to remove the old style defines for the bus clocks update
> the fsl-audmix driver to use more modern terminology for clocking.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/fsl/fsl_audmix.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index f931288e256c..db2dde597edc 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>                 return -EINVAL;
>         }
>
> -       /* For playback the AUDMIX is slave, and for record is master */
> -       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -       case SND_SOC_DAIFMT_CBM_CFM:
> -       case SND_SOC_DAIFMT_CBS_CFS:
> +       /* For playback the AUDMIX is provider, and for record is consumer */
> +       switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {

I think the comment should be the other way around:

       /* For playback the AUDMIX is consumer, and for record is provider */

Other than that, the series looks good.
