Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D507881B76
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 04:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF0F22AB;
	Thu, 21 Mar 2024 04:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF0F22AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710991642;
	bh=ke/oAGc/MrcXkP76/nykPwcNPE4ORuVefrIwaF6dT7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WSJFPMa/sCBMaNMbvaCQM2jIjch6Eov33qv5/UV6OyMlE7QVzQbnNrO9Qhbvm1PCe
	 77zm2KVfIIy5U6nhQCoNBtZFdZbqHPs32pq6et5/Ya08wn5QjvnNFKMIgUMQnvJfdO
	 y9c+vFKNifE5EkXHqxtIdBUxGtZlU4CxODET1p8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B207F805B3; Thu, 21 Mar 2024 04:26:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E2DF8057B;
	Thu, 21 Mar 2024 04:26:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E6CF804E7; Thu, 21 Mar 2024 04:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C3AAF8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 04:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3AAF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B1R1Jwlz
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-366bed3a440so2427465ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 20:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710991595; x=1711596395;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0MuB5ySDlf80mKLJwWBjBqQwGvGCqX7FdKX4jErWIQ=;
        b=B1R1JwlzIm06B9/AmcVY/2/QdyZSAEk5k4hwt8PEC134W/saANAKj2H6JHFCmacMs1
         H9j0tPm0ZZIqxidqil8LTD3AJZqqYGgmo/ywvGP7QrjexP/3CPQPZtt0MPHV8AyFVC9G
         J+96IbhdHR4D14qbcZedJS016mnITiE9VKFq8BVOFuvlUyyX2GzlBcIm5XuLEzzqGqlU
         kfbXdFkHvaxod91Z+wX+T2fCdtny6a69tUm8fVLtt+qeTS2elF+ToTJ4TXTjarD+3hWJ
         RRSuFCyrdv8j7Mvuu3SWp2GdDPhJGxZAaxexZh4ZCeAhKonMs8dVZat1hUTdtXD3fHMT
         qoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710991595; x=1711596395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0MuB5ySDlf80mKLJwWBjBqQwGvGCqX7FdKX4jErWIQ=;
        b=OAHbni7QIDC3BIU7+snA0s4JjNvyptvfrjpMfBMJuFpzNq5AqYYyz7YAa7gTMjihzw
         kOFeoZ3jaHMy5tqqt+fmJ97hCMs2oRankjK9CWc/HFFKcY+fEOH4+A82JPgotCdhG/Rl
         ybUTd8OpdBNHPZNioDOXAx4Q9lY7z3nETRQQe7TvWJAvdZVc//P9SMynxnHjqw9RbIoU
         Dz9ThRUrVDo5w8Dfiw7934OZlaEkkBOLlt0c27Qn2fqikNDvOdUb/My2P/FPwHM/0uhv
         YvlNxA524A6I5eP7MVIBpZzxZkOIVS9HfP7eDVLT7IF48im19Nb6lwgVCVrayKtxJi7h
         CBig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3U+hBoZZNWMW9yyaMpG9BboLsFV6LxU4Pbo9Mf2fHCaRZusvjxde/63hm/p1F8XHygqaAvW6IcVB1kdLgJH0BhOo98QXq/w7IZJ0=
X-Gm-Message-State: AOJu0YzEbe5+AqpRVPpi0HtnpmGO/qC85u37H5pWG4o80Ca4obTzc6LN
	leG0uu1luUL3ICje2CauJgpNl+iRnzZSOPi26Ut/4Un8Dna2EkaFeoFCtwZlopMa94CO95t72Ms
	DZD9Jy8xg9pYHxiVcUGV/XmIE0Qk=
X-Google-Smtp-Source: 
 AGHT+IFc9RGbcaS9BK4282AsGdS9WHC1k3cMjtHAAfPxbdpowTsLcJUO6T6GCfuC6nwd3Y1eBaJZ6K2ufci7CeLK2Bg=
X-Received: by 2002:a92:d812:0:b0:366:43bd:f0f5 with SMTP id
 y18-20020a92d812000000b0036643bdf0f5mr4561373ilm.17.1710991594728; Wed, 20
 Mar 2024 20:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240311111349.723256-1-chancel.liu@nxp.com>
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Mar 2024 11:26:23 +0800
Message-ID: 
 <CAA+D8ANGAw3MVPiR7oXY0-FDxvGfs3KDQ5CqxhLQa3Oaxd5jwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC: fsl: Support register and unregister rpmsg
 sound card through remoteproc
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-imx@nxp.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CKEQ2QRONHHKAWYMAYJ7DJZVN3S4X5OH
X-Message-ID-Hash: CKEQ2QRONHHKAWYMAYJ7DJZVN3S4X5OH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKEQ2QRONHHKAWYMAYJ7DJZVN3S4X5OH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 11, 2024 at 7:14=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
>         echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/fir=
mware
> (A)     echo start > /sys/class/remoteproc/remoteproc0/state
> (B)     echo stop > /sys/class/remoteproc/remoteproc0/state
>
> The rpmsg sound card is registered in (A) and unregistered in (B).
> After "start", imx-audio-rpmsg registers devices for ASoC platform driver
> and machine driver. Then sound card is registered. After "stop",
> imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
> driver. Then sound card is unregistered.

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang

>
> changes in v2
> - Fix build errors reported by kernel test robot
>
> changes in v3
> - Add a new patch for fsl_rpmsg to register CPU DAI with rpmsg channel
>   name
> - Update imx-rpmsg.c to get DT node of ASoC CPU DAI device with rpmsg
>   channel name instead of using undocumented bindings
>
> Chancel Liu (5):
>   ASoC: fsl: imx-pcm-rpmsg: Register component with rpmsg channel name
>   ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
>   ASoC: fsl: Let imx-audio-rpmsg register platform device for card
>   ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
>   ASoC: fsl: imx-rpmsg: Update to correct DT node
>
>  sound/soc/fsl/fsl_rpmsg.c       | 43 ++++++++++++++++++++-------------
>  sound/soc/fsl/imx-audio-rpmsg.c | 21 +++++++++++++---
>  sound/soc/fsl/imx-pcm-rpmsg.c   | 11 ++++++---
>  sound/soc/fsl/imx-rpmsg.c       | 28 ++++++++++++++-------
>  4 files changed, 71 insertions(+), 32 deletions(-)
>
> --
> 2.43.0
>
