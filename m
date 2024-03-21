Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D7881B8E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 04:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20C5233F;
	Thu, 21 Mar 2024 04:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20C5233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710991906;
	bh=K7ACct98TIwxrqMdk+AxZSWhzr/d3sKhj06HGb1TgHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gHzOBUVAZLwRZY7pzLzuMxnIcFwk5nLzsvk0M00b7MbP8Sdpc06AQmDP5jybBNxO3
	 dpHyjSAmAVgDDaRwHL/a4mB0vETDxN8ahmz5vH9vfg1CP6BHnXt/OoVFAH7dzJYb8z
	 LukaqahMOmOjVMtv47D9ybU+hXl91xn8C7ftBwsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 815F4F8057B; Thu, 21 Mar 2024 04:31:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B3BF805A0;
	Thu, 21 Mar 2024 04:31:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A19F804E7; Thu, 21 Mar 2024 04:31:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98E78F8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 04:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E78F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X4/l1I/x
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-366e0d79cf3so2705095ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710991861; x=1711596661;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkcCPZV2rPe2mAIICfSKEdznaBH5x94qD30ycxtS6yw=;
        b=X4/l1I/x1kJgf4MOK/EJ0m9d5Uqt0snEexX7bi31j1IwqJeY8d1JHy15RtLNV4rQsj
         OnsAPZChQGXtadJvuRHEd6OMutNAHRkJjnoUv+xqCU+P0e6XI8kST1nM+9NdYwWeM+3l
         Pgqz59o0Z5bylhXNXJmn2Yxg46mQ/3P1gZBd8H6Dz5trWZoVxR1IlbIxv26pvHLamn0n
         ShLZerRosv7906wmcKDk8ckDJek+thngZsjlz94aYe+zRbqCawpg9QUjcqWJLSfd4Kgd
         3iJNZUTnIo4VVJMUH7BXlznS0DOqjv3KbSn0yTEj9h8rAvjTV1cpP6ta1kaqCwBv7Sxk
         x31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710991861; x=1711596661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkcCPZV2rPe2mAIICfSKEdznaBH5x94qD30ycxtS6yw=;
        b=jLlUBFOH2+j9h5/iLZnRA83W6duDbm2J5RHfP9x9DoQBbF0SCwWuGr8uHtCe6BALdJ
         A+fqjEeZnvBnJe5i/FTHRjnWirZ+jBV+Dd6hHsWOAwgwn5DQyjUfaXwoF6YhGRK5KEhx
         kgz0lPXIqGp1oRHj0sUCqggia0s81WQUfR6cpYfgCC64lyRH6py1LskX5c3E9bU2k2Dw
         Am3aqrL9B54JTBT5Q3Gb56ZTAULJEqsasGmHrQPlhgjRkWwJWzZSExdOVbi5VXGp089I
         Rzy7eDHp23wBwB1iBCeHeO7SzsoGqhNt5IjRYocanNSy9OQHLLeCHw6R8LVBbYIuDukj
         GPiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE7klh48j7akZYWLQojo0iPS5fR2s5gW8Y3teu+BC4gCVEPT3bAWrBEUojxQdfxglpvN5whCWf89anEFtyZIuvdGNKaW1rBksqSYA=
X-Gm-Message-State: AOJu0YyUaM/nMsZKKFiD5wKp86b99MjEppwhZ0ToAi4NRdqx7ifsqOaS
	BPH/mkhNPv47JG4CtwB/EtRNqjmpogyR2pUtGaEI2EsDjMPLuT/zrTBVivw+F1L5wNxEaZuLO20
	ynEgapbZkU31PQhMZMHPunkX6TkA=
X-Google-Smtp-Source: 
 AGHT+IFIZlapfD6kquVxMjP6vNIkczhJV1lbowblT0uRu6rB6UIdztD13JlWALUuzaKkGcAhpgwoNBsxh+aHMUBnGiE=
X-Received: by 2002:a92:c90f:0:b0:366:9220:821f with SMTP id
 t15-20020a92c90f000000b003669220821fmr7596072ilp.7.1710991861315; Wed, 20 Mar
 2024 20:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Mar 2024 11:30:50 +0800
Message-ID: 
 <CAA+D8APwNH2wf4p9DzZCy3b6xC8K-FPpMGw2V4kRMsX7U3=3Jg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA init
 fails
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 44DPHZM5Q6MOJS7B5ODUMUYYG5PY4ETA
X-Message-ID-Hash: 44DPHZM5Q6MOJS7B5ODUMUYYG5PY4ETA
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44DPHZM5Q6MOJS7B5ODUMUYYG5PY4ETA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 14, 2024 at 10:16=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This happens especially if this driver is built-in, but SDMA driver
> is configured as module.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best Regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_ssi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index ab6ec1974807..4ca3a16f7ac0 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -1401,8 +1401,10 @@ static int fsl_ssi_imx_probe(struct platform_devic=
e *pdev,
>                         goto error_pcm;
>         } else {
>                 ret =3D imx_pcm_dma_init(pdev);
> -               if (ret)
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "Failed to init PCM DMA\n=
");
>                         goto error_pcm;
> +               }
>         }
>
>         return 0;
> --
> 2.34.1
>
