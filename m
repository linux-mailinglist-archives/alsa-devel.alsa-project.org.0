Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98F879F991
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 06:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12A4950;
	Thu, 14 Sep 2023 06:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12A4950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694666045;
	bh=S64CCdcFCaVDh08HsNXN8nQuKt1aKTaOL0roTrAAAlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ejtg+KDNU4MR4oL+sAR88nKBWvfx10gM5jpVFCyvDvcuGG2vILaIgXQqnatY176eW
	 fGYfrwvnnd3YrFXPJ0fuugCb1gsV7sTdHtnUe0Hr3y3Wpnuwaa4UzUCWYPhI6HRCTX
	 4CtYkEnY1EzfsnY/2ss1FqhQJCLAeHh1CFvn0+pM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5E09F80552; Thu, 14 Sep 2023 06:33:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB664F80246;
	Thu, 14 Sep 2023 06:33:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCDC9F80246; Thu, 14 Sep 2023 06:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A945DF801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 06:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A945DF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=X3mGXIqK
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-573d52030fbso425939a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 21:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694664980; x=1695269780;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8puwwYQ2UBHFNT37XGmqgv1DiqsgZEnUlgOGxcY1CkI=;
        b=X3mGXIqKchgzprdHF27+IsZmqSFWrfJGfgPSm2r03q4fCsvDLx701IUaIM/iRbrz/h
         19/yDKhM8A/JfjUzo7Ctus6mgJBRPMSRcp+5CtwxiRHV7WfNv00vEE1HUMebqUvQtaTw
         OWej/fodb0NsQn2dTNGR5MZh3w2yGxzL1dDYDoXfdtvfhAegg3fVKuXEkrvT/WgfPjgO
         BLc+0eZdjWz5GucYLqxbdNAaurCkHeJjCxxqN613xkA7iTvkmkxok3Yf1bzBGem3cat/
         XI/y3RNtlk30SqxO0gLx0uI3UVeKcqRrp/tQ/Qvop329Msv80/gnzwzFJ0Vc0g2q9MKE
         OrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694664980; x=1695269780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8puwwYQ2UBHFNT37XGmqgv1DiqsgZEnUlgOGxcY1CkI=;
        b=RdHqi67i0ouySltmWIqWZ5cEwatZdZzqIhMoslgbOfU9x9oR1PSISAnMvhOXVlw/qz
         iJgt0yYbUDElMtui7uJqRr8Np4oKCuNnUpQQ9BXl2JRci7yZiv4snGcavd8FgwvLBrcG
         Wvxm6zGNGUgkYRbzlRMvnODyPV0agCKQNX0GxAuhgqkH1zUmTHuQRZ0CVSE8xcN/eIsi
         Jsx5C3mF9ZjeeZiE6vpLzHul9dt4YTol0MBkav+SPKgmJCnHLmYbrD4u1/U/KuF59lvY
         G7IdDdeTNptv7wRw7VFg+zkqN27AsFnugoLPTVRea+/OPUoDZdFh/n8QhbgSWtH9WG4B
         pYew==
X-Gm-Message-State: AOJu0YzHV49MtJ8Pn3tPutaq0CK77pbO+NTiOJHVS+xz1JIhNKfN4yBH
	2Vcw4feC6QWmscs2zs/pY9fO6GKJGFhj7NoaKQw=
X-Google-Smtp-Source: 
 AGHT+IG1H/excJAZALaS7Szk8UIlXc6WBaAkKS8RGfBe1uXqguojuCxZhqPLQuUcfrs4/2j7RKsHN6OjN5qPo+LU23U=
X-Received: by 2002:a05:6a21:4886:b0:13a:e955:d958 with SMTP id
 av6-20020a056a21488600b0013ae955d958mr4295356pzc.7.1694664979937; Wed, 13 Sep
 2023 21:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230913102656.2966757-1-chancel.liu@nxp.com>
In-Reply-To: <20230913102656.2966757-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 14 Sep 2023 12:16:08 +0800
Message-ID: 
 <CAA+D8ANDcxY_SZ0qNax7LvkJj_yaY5syzEc6RoOmxjYEut0NOw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OOE5A2Y463IN4MZLCYS772ZFENOFZC27
X-Message-ID-Hash: OOE5A2Y463IN4MZLCYS772ZFENOFZC27
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOE5A2Y463IN4MZLCYS772ZFENOFZC27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 13, 2023 at 6:27=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
> by CPU DAI driver in hw_free(). Some codec requires MCLK present at
> power up/down sequence. So need to set ignore_pmdown_time to power down
> codec immediately before MCLK is turned off.
>
> Take WM8962 as an example, if MCLK is disabled before DAPM power down
> playback stream, FIFO error will arise in WM8962 which will have bad
> impact on playback next.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu
> ---
>  sound/soc/fsl/imx-rpmsg.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 3c7b95db2eac..b578f9a32d7f 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -89,6 +89,14 @@ static int imx_rpmsg_probe(struct platform_device *pde=
v)
>                             SND_SOC_DAIFMT_NB_NF |
>                             SND_SOC_DAIFMT_CBC_CFC;
>
> +       /*
> +        * i.MX rpmsg sound cards work on codec slave mode. MCLK will be
> +        * disabled by CPU DAI driver in hw_free(). Some codec requires M=
CLK
> +        * present at power up/down sequence. So need to set ignore_pmdow=
n_time
> +        * to power down codec immediately before MCLK is turned off.
> +        */
> +       data->dai.ignore_pmdown_time =3D 1;
> +
>         /* Optional codec node */
>         ret =3D of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0,=
 &args);
>         if (ret) {
> --
> 2.25.1
>
