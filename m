Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AE7B5B3B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 21:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35B2A4A;
	Mon,  2 Oct 2023 21:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35B2A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696274758;
	bh=8XpaGSp4HNCwzkLa0W6cdAh4A35ekt0CBRD0Q4PDeyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q6mu2FF6WDdPfYLQoPr+tU4Mjxge8cdg4sj7KfLtweJzIQ6Psta5Tludex9HX/tod
	 x3RM6pK1j84TAtkUzIieFdFhB2ST/LRIcnPBHj/j+v8QOwjnziYJseqoX+FMQXpqOD
	 aYoElu84P7M4JBjMn3L2wjpg8rEmKF7+AbKOOYVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71471F80549; Mon,  2 Oct 2023 21:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F537F802E8;
	Mon,  2 Oct 2023 21:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D491F80310; Mon,  2 Oct 2023 21:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66532F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 21:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66532F801EB
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5a1ec43870cso1880487b3.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 12:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696274675; x=1696879475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVY5oe6cxZolq597xXeHHc74+BUTHOMrBBxd13HG4jU=;
        b=e/q42cevVOCZrWMc4Y3QjodfJfNq5UEpPdkUfb5uAAOYdshE7wn02Xdfjk8xNXM1DV
         fDBXfROen04cDaMKeDxMHKScKFI24NlHpv7w6lS04skJmG/APwgIKoxH7mCClFMuLoVp
         0QMIF5/1TF3C90mhzouLyL1fulqG20gWFTj+almmN76aun0uacH9YTu0iT6s0BHnmi8F
         9Yq5Uk/B5yWj4z2TudLxIGA8/5iNJ5HM6MDtL6u974szNsuMDSDfgRcCkVu1/jI/9YYc
         xsl0F1/wo3VfcWv0y1ZThYn5eY3y+woWSJr6T3LfmeizbzCVJk13Nn8ug8t+oO8qEO6D
         Knlg==
X-Gm-Message-State: AOJu0YzYXNKs65YUCpxS0b4RVV4j5efobS+C5aD4zsc/YLmUhlsh3UDX
	0KkVzCwaeg6VhZ0Qu8ItQkCtQCs//KQnPQ==
X-Google-Smtp-Source: 
 AGHT+IFHz57Ss1K/dqQ8UuQyEoZul9I3O5ieXfdAq7ZMmFJVZL28SdNQK5W73clexX9RGLQ12AHtIQ==
X-Received: by 2002:a05:690c:a8d:b0:59e:9fbc:a16c with SMTP id
 ci13-20020a05690c0a8d00b0059e9fbca16cmr12826760ywb.35.1696274674970;
        Mon, 02 Oct 2023 12:24:34 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id
 z188-20020a8165c5000000b005929fd6a6c7sm7955751ywb.41.2023.10.02.12.24.34
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 12:24:34 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-59f6441215dso1683767b3.2
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 12:24:34 -0700 (PDT)
X-Received: by 2002:a0d:d9c2:0:b0:576:7dfc:e73e with SMTP id
 b185-20020a0dd9c2000000b005767dfce73emr12588061ywe.32.1696274674269; Mon, 02
 Oct 2023 12:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231002090434.1896-1-shenghao-ding@ti.com>
In-Reply-To: <20231002090434.1896-1-shenghao-ding@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Oct 2023 21:24:21 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
Message-ID: 
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: fixed compiling issue in m68k
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, 13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XFJKBLCEBBOLADTP6P4IL6PZKGAXJ3JZ
X-Message-ID-Hash: XFJKBLCEBBOLADTP6P4IL6PZKGAXJ3JZ
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFJKBLCEBBOLADTP6P4IL6PZKGAXJ3JZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

Thanks for your patch!

On Mon, Oct 2, 2023 at 4:38=E2=80=AFPM Shenghao Ding <shenghao-ding@ti.com>=
 wrote:
> fixed m68k compiling issue: mapping table can save code field; storing th=
e

Please replicate the actual error message from the compiler, so it
is recorded in the commit description, and easy to find when someone
searches for the actual error message

>From the Reported-by (which is not included in the actual description,
as it is below the "---"):

       {standard input}: Assembler messages:
    >> {standard input}:992: Error: value -148 out of range
       {standard input}:992: Error: value of ffffff6c too large for
field of 1 byte at 0000045f

> dev_idx as a member of block can reduce unnecessary  time and system
> resource comsumption of dev_idx mapping every time the block data writing
> to the dsp.

I am sorry, but I don't understand what this means.
Can you please elaborate?

Also, can you please explain what the real issue is?
(My first guess when seeing the error message before was that a  signed
 integer is truncated to an unsigned char or so, but I couldn't see
 immediately where that is happening)

> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>
> ---
> Changes in v1:
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes:
>    | https://lore.kernel.org/oe-kbuild-all/202309222048.RnSqEIK5-lkp@inte=
l.
>    | com/

> --- a/include/sound/tas2781-dsp.h
> +++ b/include/sound/tas2781-dsp.h
> @@ -77,6 +77,11 @@ struct tasdev_blk {
>         unsigned int nr_cmds;
>         unsigned int blk_size;
>         unsigned int nr_subblocks;
> +       /* fixed m68k compiling issue, storing the dev_idx as a member of=
 block
> +        * can reduce unnecessary timeand system resource comsumption of
> +        * dev_idx mapping every time the block data writing to the dsp.
> +        */

What is so special about "m68k" that it (1) fails there (and only there?
and only for some config/compiler combos, as it builds fine for me?),
and (2) is needed to mention this in comments all over the place?

> +       unsigned char dev_idx;
>         unsigned char *data;
>  };
>
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781=
-fmwlib.c
> index eb55abae0d7b..e27775d834e9 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -80,10 +80,72 @@ struct tas_crc {
>         unsigned char len;
>  };
>
> +struct blktyp_devidx_map {
> +       unsigned char blktyp;
> +       unsigned char dev_idx;
> +};
> +
>  static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] =3D {
>         1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4
>  };
>
> +/* fixed m68k compiling issue: mapping table can save code field */
> +static const struct blktyp_devidx_map ppc3_tas2781_mapping_table[] =3D {
> +       { MAIN_ALL_DEVICES_1X, 0x80 },
> +       { MAIN_DEVICE_A_1X, 0x81 },
> +       { COEFF_DEVICE_A_1X, 0xC1 },
> +       { PRE_DEVICE_A_1X, 0xC1 },
> +       { PRE_SOFTWARE_RESET_DEVICE_A, 0xC1 },
> +       { POST_SOFTWARE_RESET_DEVICE_A, 0xC1 },
> +       { MAIN_DEVICE_B_1X, 0x82 },
> +       { COEFF_DEVICE_B_1X, 0xC2 },
> +       { PRE_DEVICE_B_1X, 0xC2 },
> +       { PRE_SOFTWARE_RESET_DEVICE_B, 0xC2 },
> +       { POST_SOFTWARE_RESET_DEVICE_B, 0xC2 },
> +       { MAIN_DEVICE_C_1X, 0x83 },
> +       { COEFF_DEVICE_C_1X, 0xC3 },
> +       { PRE_DEVICE_C_1X, 0xC3 },
> +       { PRE_SOFTWARE_RESET_DEVICE_C, 0xC3 },
> +       { POST_SOFTWARE_RESET_DEVICE_C, 0xC3 },
> +       { MAIN_DEVICE_D_1X, 0x84 },
> +       { COEFF_DEVICE_D_1X, 0xC4 },
> +       { PRE_DEVICE_D_1X, 0xC4 },
> +       { PRE_SOFTWARE_RESET_DEVICE_D, 0xC4 },
> +       { POST_SOFTWARE_RESET_DEVICE_D, 0xC4 },
> +};
> +
> +static const struct blktyp_devidx_map ppc3_mapping_table[] =3D {
> +       { MAIN_ALL_DEVICES_1X, 0x80 },
> +       { MAIN_DEVICE_A_1X, 0x81 },
> +       { COEFF_DEVICE_A_1X, 0xC1 },
> +       { PRE_DEVICE_A_1X, 0xC1 },
> +       { MAIN_DEVICE_B_1X, 0x82 },
> +       { COEFF_DEVICE_B_1X, 0xC2 },
> +       { PRE_DEVICE_B_1X, 0xC2 },
> +       { MAIN_DEVICE_C_1X, 0x83 },
> +       { COEFF_DEVICE_C_1X, 0xC3 },
> +       { PRE_DEVICE_C_1X, 0xC3 },
> +       { MAIN_DEVICE_D_1X, 0x84 },
> +       { COEFF_DEVICE_D_1X, 0xC4 },
> +       { PRE_DEVICE_D_1X, 0xC4 },
> +};
> +
> +static const struct blktyp_devidx_map non_ppc3_mapping_table[] =3D {
> +       { MAIN_ALL_DEVICES, 0x80 },
> +       { MAIN_DEVICE_A, 0x81 },
> +       { COEFF_DEVICE_A, 0xC1 },
> +       { PRE_DEVICE_A, 0xC1 },
> +       { MAIN_DEVICE_B, 0x82 },
> +       { COEFF_DEVICE_B, 0xC2 },
> +       { PRE_DEVICE_B, 0xC2 },
> +       { MAIN_DEVICE_C, 0x83 },
> +       { COEFF_DEVICE_C, 0xC3 },
> +       { PRE_DEVICE_C, 0xC3 },
> +       { MAIN_DEVICE_D, 0x84 },
> +       { COEFF_DEVICE_D, 0xC4 },
> +       { PRE_DEVICE_D, 0xC4 },
> +};
> +
>  static struct tasdevice_config_info *tasdevice_add_config(
>         struct tasdevice_priv *tas_priv, unsigned char *config_data,
>         unsigned int config_size, int *status)
> @@ -316,6 +378,37 @@ int tasdevice_rca_parser(void *context, const struct=
 firmware *fmw)
>  }
>  EXPORT_SYMBOL_NS_GPL(tasdevice_rca_parser, SND_SOC_TAS2781_FMWLIB);
>
> +/* fixed m68k compiling issue: mapping table can save code field */
> +static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
> +       struct tasdev_blk *block)
> +{
> +
> +       struct blktyp_devidx_map *p =3D
> +               (struct blktyp_devidx_map *)non_ppc3_mapping_table;

Please do not cast away constness when not needed (also below).

> +       struct tasdevice_dspfw_hdr *fw_hdr =3D &(tas_fmw->fw_hdr);
> +       struct tasdevice_fw_fixed_hdr *fw_fixed_hdr =3D &(fw_hdr->fixed_h=
dr);
> +
> +       int i, n =3D ARRAY_SIZE(non_ppc3_mapping_table);

size_t

> +       unsigned char dev_idx =3D 0;
> +
> +       if (fw_fixed_hdr->ppcver >=3D PPC3_VERSION_TAS2781) {
> +               p =3D (struct blktyp_devidx_map *)ppc3_tas2781_mapping_ta=
ble;
> +               n =3D ARRAY_SIZE(ppc3_tas2781_mapping_table);
> +       } else if (fw_fixed_hdr->ppcver >=3D PPC3_VERSION) {
> +               p =3D (struct blktyp_devidx_map *)ppc3_mapping_table;
> +               n =3D ARRAY_SIZE(ppc3_mapping_table);
> +       }
> +
> +       for (i =3D 0; i < n; i++) {
> +               if (block->type =3D=3D p[i].blktyp) {
> +                       dev_idx =3D p[i].dev_idx;
> +                       break;
> +               }
> +       }
> +
> +       return dev_idx;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
