Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 693497D8571
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74596828;
	Thu, 26 Oct 2023 17:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74596828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698332516;
	bh=E3TbXSZFtJIGay/zBzgKcMrSIq3nyoCPzTNhBTttaRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lRQ+v8gtJq0julbF78gS7Sdvk2yQJlFpDkvRblJSLaaFkxRz5RBqGHVQj3VsKz0Pl
	 /fO8PCozATZcKY7/lBLBR6GONhE4/UTrSB8HAVTEmfVc0Nw4Ci8AcSxm6jI+07O3w7
	 RU9MDHGspU6iWM6CF48+ZL8sfiWSfOf28Aig1Gs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FB60F8010B; Thu, 26 Oct 2023 17:00:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBEC6F80165;
	Thu, 26 Oct 2023 17:00:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9FB1F8019B; Thu, 26 Oct 2023 17:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45A9AF8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A9AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QbbYOA4A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D457CE3920
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5950C433CC
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698332428;
	bh=E3TbXSZFtJIGay/zBzgKcMrSIq3nyoCPzTNhBTttaRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QbbYOA4AIKe0PnNSEeCqrmoVWRqyCIz0kV0G4d9xPHm9AMTEJvReFhew+PSQx5nW0
	 piNEx1+bAoU163+rZmDCr9/GnmZ2h4E2ZqRWuSrn+XMduMFGjU3qR+6O5A4oPitp0A
	 2lwcnsvG7LKpQXXfanqUQzNfkTtuA48JTfJxEEarPf+Lr6dmRZkZDIJD69rWI9FFxh
	 H3gm42BFLOIF7N2QdI8qoJ11HuWbMy5N9r8OcEKnWt2JOV3xC4tFiACns0PABq7PUh
	 kamqIIbMFMSqf29fWWXj9WSasHJkN/V28DKdyzNzuFBIi5Qz17tNxYRjYaGttETWU8
	 BPN/jZt/zyUkg==
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-27d425a2dd0so825942a91.2
        for <alsa-devel@alsa-project.org>;
 Thu, 26 Oct 2023 08:00:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzbbmOoH8p33CE+SeFCRQTkzCwdGx4eH69eoEsci0VBBMkfNriB
	l7jpKN0wfWi43zzDfDdLXGq9nZCD22ISkqXwTXU=
X-Google-Smtp-Source: 
 AGHT+IFf/g3FdqTRlgRtfXQqdXPHTJRFWHub3LPFf7a501CHy+ga2wMn592H/yQa+gSLyAOqZ9Ydut0bLJAcDbwMk14=
X-Received: by 2002:a17:90b:fd2:b0:27d:30d5:c0f8 with SMTP id
 gd18-20020a17090b0fd200b0027d30d5c0f8mr17665525pjb.43.1698332428375; Thu, 26
 Oct 2023 08:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <edeebfab-e26c-4c18-8126-190c3e834521@kernel.org>
 <12c8c0f3-8364-4f25-976e-8cca29b5e17f@amd.com>
In-Reply-To: <12c8c0f3-8364-4f25-976e-8cca29b5e17f@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 26 Oct 2023 17:00:17 +0200
X-Gmail-Original-Message-ID: 
 <CAJKOXPe+kSgxDFjrk+-ycsiyjp1r_SNNrFyy2B_-UDuqDV07XQ@mail.gmail.com>
Message-ID: 
 <CAJKOXPe+kSgxDFjrk+-ycsiyjp1r_SNNrFyy2B_-UDuqDV07XQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ASoC: amd: acp: Add acp6.3 pci legacy driver
 support
To: syed saba kareem <ssabakar@amd.com>
Cc: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	arungopal.kondaveeti@amd.com, mastan.katragadda@amd.com,
	juan.martinez@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: OKZ33FZYRXMQLDOOPZXQCWMXPTW2A2DU
X-Message-ID-Hash: OKZ33FZYRXMQLDOOPZXQCWMXPTW2A2DU
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKZ33FZYRXMQLDOOPZXQCWMXPTW2A2DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 26 Oct 2023 at 12:09, syed saba kareem <ssabakar@amd.com> wrote:
> +
> +module_platform_driver(acp63_driver);
> +
> +MODULE_DESCRIPTION("AMD ACP acp63 Driver");
> +MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
>
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong.
>
> It is platform driver ,for auto loading MODULE_ALIAS() is required.

Hm, not really. platform_driver does not need MODULE_ALIAS(). At least
99% of them do not need it. Please help us understand what is broken
here that this one platform driver needs alias.

BR,
Krzysztof
