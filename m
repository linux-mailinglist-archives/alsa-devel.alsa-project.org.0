Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF89776E8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 04:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333D6B76;
	Fri, 13 Sep 2024 04:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333D6B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726194610;
	bh=wDB/MmaREIlVIheggTMUFzevQWctTktcCq/9Zzf0yhw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fV3pxACQSu3mYQjj40xEq/k5ah0KkVwzWdFSRICBXIJyhk4cpKvKW/7W8Dc8LENpK
	 eKSmL7HUd4/0PGzlavaPAREjxm0e05OW4LLuuyrCm6kHScJ2MPAqBednBjtYjQ0zM4
	 l/VZEzj2gR32weY54pU72/QRVG9mvm4XFMXrqIYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05F9F805A8; Fri, 13 Sep 2024 04:29:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC07DF805AE;
	Fri, 13 Sep 2024 04:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C55F801F5; Fri, 13 Sep 2024 04:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAE44F8010B
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 04:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE44F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eRML0VwJ
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a08d3144d9so290565ab.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Sep 2024 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726194569; x=1726799369;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTMhgEbsFwO+pBfHozMIUKTCxeSJ9rkkx6pXiVEJYI4=;
        b=eRML0VwJA4GLR20MYaEuqB/m1zkXlaYCUuJYSR7KS0CrtUeAkPIVbf6owIYMOCRcpM
         hJwmykUGvLtKS8qBhnnRRmNQkKbDG4aooN9pFJCXmLPgqPjaTU69q4cFDfuZf5hPpX2u
         ci/Lc11kimG+SNOfe4HFU39kLbdaCL5pue2E1fXs9SW3dAhRBcgThkiAi0q5ej8dKwrp
         lwJruvhnwUsryvlsAogX20qiJH/0BmOsdx1/U3lBV+RmuxutILj02ZtyVG2J4oyMlMn9
         m6Um869bwvvUdDZVvU79ReIAOrwcgzvKU+J+UYtz3JKAZ0RRUr98qwCMrKIwCoheZhTO
         5dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726194569; x=1726799369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTMhgEbsFwO+pBfHozMIUKTCxeSJ9rkkx6pXiVEJYI4=;
        b=gi3WhQkNLvYYk+OAnhIZ5ZjL013wDwkBLLlP1pUVcywxhLlyjqdlt7tDX0ZLMGO0+q
         WV7BIwrwGDYqHTiZvT9DSH30bKuR14Z/DdiAtyeNmZrbYDMNo8/lWMWPx/LEkLYxsId9
         P1opZol4fvK5O2vxoSxABJLBMTDf/MOm+GpmSAr2fB3W11tJpRmYwNhfDQ93YS+vqyQU
         9eaCEvxURt92qOAWKNSXM3oSRdAjqfYv4xa65QHCNtbRrJ3StjokezfnifzRn4n6B8BV
         moapM5cgGLeriHTHyJnHtKfWeqTBIy4+3JPzda1QzCFTOtzPv2++k6jlVCoHlYX0Lwp9
         0Nrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq3W+DXE9H6PtatNzUptyHyzWcARtf/O4/oVdQrzBwwjTz2pcZ21jjcQtY/dSW921kV0y1UZSGWQ1p@alsa-project.org
X-Gm-Message-State: AOJu0Yx5eEobxfXiMt527b4kOLxnvKhjENM77ROJU9yJeCOeyERK6dXR
	ZGqzrW5dBpqdOHEY4EFkHDaRsOAa6FCOPHZoTmDRIwzoqIeB49XyidR4CIAICu5Bo5xoXl/WxWf
	FX0xx15rVv5HV4YjoFuVN+9BregU=
X-Google-Smtp-Source: 
 AGHT+IENKLUdj9+ZkJdPontbPGNcWKf/93O8fVsmGBQhknsCe7sTxPjA/0aEHZIrgYGLHSh2qlW9DaOFsfh/RDk3zVc=
X-Received: by 2002:a05:6e02:12c5:b0:39f:5efe:ae73 with SMTP id
 e9e14a558f8ab-3a0848eb2admr53336035ab.5.1726194569381; Thu, 12 Sep 2024
 19:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Sep 2024 10:29:13 +0800
Message-ID: 
 <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] ASoC: fsl: add memory to memory function for
 ASRC
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: X2KM2ZYCC3K3K6TGSCUDMQV3AYAYBTWO
X-Message-ID-Hash: X2KM2ZYCC3K3K6TGSCUDMQV3AYAYBTWO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2KM2ZYCC3K3K6TGSCUDMQV3AYAYBTWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 6, 2024 at 6:05=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> This function is base on the accelerator implementation
> for compress API:
> https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.5991=
1-1-perex@perex.cz/

Hi Jaroslav

    Shall I add this patch to my patch set next time? Last time I
reported an issue
about "list_for_each_entry_safe_reverse", I can help to add it.  or
will you send
another version by yourself?

Best regards
Shengjiu Wang

>
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
>
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
>
> User fills the input buffer to the asrc module, after conversion, then as=
rc
> sends back the output buffer to user. So it is not a traditional ALSA pla=
yback
> and capture case.
>
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the patch 1 and patch 2 is for refin=
ing
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
>
> Other change is to add memory to memory support for two kinds of i.MX ASR=
C
> modules.
>
> changes in v3:
> - use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
> - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
>   Will wait Jaroslav's update or other better method in the future.
> - Address some comments from Pierre.
>
> changes in v2:
> - Remove the changes in compress API
> - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> - define private metadata key value
>   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
>
> Shengjiu Wang (6):
>   ALSA: compress: Add output rate and output format support
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc_m2m: Add memory to memory function
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
>
>  include/uapi/sound/compress_params.h |  23 +-
>  sound/soc/fsl/Kconfig                |   1 +
>  sound/soc/fsl/Makefile               |   2 +-
>  sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
>  sound/soc/fsl/fsl_asrc.h             |   2 +
>  sound/soc/fsl/fsl_asrc_common.h      |  70 +++
>  sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
>  sound/soc/fsl/fsl_easrc.h            |   4 +
>  9 files changed, 1260 insertions(+), 9 deletions(-)
>  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
>
> --
> 2.34.1
>
