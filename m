Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1777AFBA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 04:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA92828;
	Mon, 14 Aug 2023 04:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA92828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691981812;
	bh=yTu9F/tKTG0Gn8re1xw+tQFw2Wzd4bDVMALInJn3jqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pApr3u+ZusWRtEivTM0QdySM5hpY5bd/Gf84+Goqhw8GAyK3Aw+LhJq/JGEyNqbDJ
	 mY0rSIvtRcwu/U6gC+/sgXD7qfr1/W5cD7/rZkNb0dFaf05dObnQQDZwbRuvp/9I0G
	 TUUQcl6SnUiyBP1XuGcv2smVtP7n0BmakDjStl/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64AF6F80549; Mon, 14 Aug 2023 04:56:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C25BF8025F;
	Mon, 14 Aug 2023 04:56:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589C3F80290; Mon, 14 Aug 2023 04:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92BF6F801EB
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 04:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BF6F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=5fdxfd6F
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-58419517920so42686237b3.0
        for <alsa-devel@alsa-project.org>;
 Sun, 13 Aug 2023 19:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691981741; x=1692586541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smIMHxHMXsRlFYyRESAqNumkyyEmxXc2Ju+pIkoWNX4=;
        b=5fdxfd6F6QHgKWiN5mW0zFkn7HZ95IC9hzQtDBwX9+4px886A+/RyLZUzVZDMtkR/X
         jwYX3Fzbhiea8ecprls7+NAuymhEt0MZal5FkOD3kC1Gll/RId99A19ZN3lHPbYJxlvK
         +m5yhBRqq5jRIbbw8VMdM2jRQpTYMe34ek98FQ0btSRoW65rc+krBqjh1NjeUBkpL8AB
         Aha+3axkgMK4/BYaqpNf5RqwC6G9HdllnNeo207tiBQU8ME9ZEX9VQoBl5dPrJTV8vO2
         e9RaCgXYnntqxpD8jJVOwa50iYmBDbEUcFEBuu3Cpzjf02ZuCIqLV7nGnVZiu+/SQTma
         1Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691981741; x=1692586541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smIMHxHMXsRlFYyRESAqNumkyyEmxXc2Ju+pIkoWNX4=;
        b=lfOnwy98KpuaYjS0DGjZaRMJXGSOGcmS+2421C5FCwZecAE8RdPTgmH9uy6NBZuDkO
         Dnt2tdKJw9t90wwxRySfW34MB78NbL1kfrfCP15ZvkXRLdXL7Maf3+WbZ8rQEwhU033i
         oHwSRZK7QsnLMJAlXA1cG+4kIz6JyY2b2c/jmShr6EFifTRumrBKmM5dkg6Jq5Beg3pg
         RiS9OIJxRtINd8VsH4cgJ2KT3s19BH1cV/9EGX9QO/F5gszfNLaAwKgEBL9VIxXP7BdH
         8oWJz2tnIw5rpwjpA0OeWYkR1wz5Las4062orNj1rDsJu1e7jtdU0qx/tGeRy0bM/6wv
         XWlg==
X-Gm-Message-State: AOJu0YyvySrLwPlzUpQQ0VHamYRCYoArKjLu0bykhGFDNtuAqCiVhpbf
	T+Ps6L3Solx+RUgX+dxa6ZSqcSwttEI1MCKBKsFY6w==
X-Google-Smtp-Source: 
 AGHT+IG5eGVA1fgt8OFg2gwjL9D77uPDNx98fJbKn/EmTxH945w+jh9Kjey/fFBygOqCrohF2XjCqJrJ4rFV2RY0dFk=
X-Received: by 2002:a81:5fc5:0:b0:57a:6e41:948e with SMTP id
 t188-20020a815fc5000000b0057a6e41948emr9043483ywb.11.1691981741173; Sun, 13
 Aug 2023 19:55:41 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 14 Aug 2023 10:55:30 +0800
Message-ID: 
 <CALprXBaxhSiDdX49vtUrw6d5cLh+Qv5cTUBHM_c8VBABmEujGQ@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: Intel: Add rpl_nau8318_8825 driver
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
 Libin Yang <libin.yang@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>, David Lin <CTLIN0@nuvoton.com>,
	Brent Lu <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.com>,
	Terry Cheong <htcheong@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, apoorv <apoorv@intel.com>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ICZSILHDJKR5QV3NPL722WT3G4SSAV3X
X-Message-ID-Hash: ICZSILHDJKR5QV3NPL722WT3G4SSAV3X
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICZSILHDJKR5QV3NPL722WT3G4SSAV3X/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

Could we have your reviews?

Before we had your reviews on "adl_nau8318_nau8825" driver name last year.
And now the adl and rpl ids were split, so add "rpl_nau8318_8825" back
to maintain support.

Thanks

On Fri, Aug 4, 2023 at 4:57=E2=80=AFPM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Boards were using this in older kernels before adl and rpl ids were
> split. Add this back to maintain support.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  sound/soc/intel/boards/sof_nau8825.c              | 10 ++++++++++
>  sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/board=
s/sof_nau8825.c
> index 4fc6e1c6aef3..46b7ecf6f9f1 100644
> --- a/sound/soc/intel/boards/sof_nau8825.c
> +++ b/sound/soc/intel/boards/sof_nau8825.c
> @@ -684,6 +684,16 @@ static const struct platform_device_id board_ids[] =
=3D {
>                                         SOF_BT_OFFLOAD_SSP(2) |
>                                         SOF_SSP_BT_OFFLOAD_PRESENT),
>         },
> +       {
> +               .name =3D "rpl_nau8318_8825",
> +               .driver_data =3D (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0=
) |
> +                                       SOF_SPEAKER_AMP_PRESENT |
> +                                       SOF_NAU8318_SPEAKER_AMP_PRESENT |
> +                                       SOF_NAU8825_SSP_AMP(1) |
> +                                       SOF_NAU8825_NUM_HDMIDEV(4) |
> +                                       SOF_BT_OFFLOAD_SSP(2) |
> +                                       SOF_SSP_BT_OFFLOAD_PRESENT),
> +       },
>         { }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/so=
c/intel/common/soc-acpi-intel-rpl-match.c
> index 4eefdb2dd45c..1dd699181765 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
> @@ -351,6 +351,11 @@ static const struct snd_soc_acpi_codecs rpl_rt1019p_=
amp =3D {
>         .codecs =3D {"RTL1019"}
>  };
>
> +static const struct snd_soc_acpi_codecs rpl_nau8318_amp =3D {
> +       .num_codecs =3D 1,
> +       .codecs =3D {"NVTN2012"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] =3D {
>         {
>                 .comp_ids =3D &rpl_rt5682_hp,
> @@ -373,6 +378,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_mach=
ines[] =3D {
>                 .quirk_data =3D &rpl_max98373_amp,
>                 .sof_tplg_filename =3D "sof-rpl-max98373-nau8825.tplg",
>         },
> +       {
> +               .id =3D "10508825",
> +               .drv_name =3D "rpl_nau8318_8825",
> +               .machine_quirk =3D snd_soc_acpi_codec_list,
> +               .quirk_data =3D &rpl_nau8318_amp,
> +               .sof_tplg_filename =3D "sof-rpl-nau8318-nau8825.tplg",
> +       },
>         {
>                 .comp_ids =3D &rpl_rt5682_hp,
>                 .drv_name =3D "rpl_rt1019_rt5682",
> --
> 2.25.1
>
