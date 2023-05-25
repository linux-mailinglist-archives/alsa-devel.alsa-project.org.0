Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95584710C03
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 14:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA7D1FE;
	Thu, 25 May 2023 14:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA7D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685017709;
	bh=nPLi6EEwgavxY7AgCdefrX8Qkyq/D3Fgli8gSHwJ3W0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QtveYlkUIOzVVhK/Hg1hsrDZP8LhWjIuv1pbONfeLyya+A51hBDoavJYHNcLFv/Me
	 wslHoKLRZJ3zlwUmAQUiUP8JyKlLWMfcAd4u7asV2zBxkBFRueM9MKAWhI26kQ47zT
	 1CIqmYYdYsg0zizDtXNjkAKhPKFmbYQR/KHO6Eio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D2BFF80053; Thu, 25 May 2023 14:27:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2674F8016A;
	Thu, 25 May 2023 14:27:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E481F80249; Thu, 25 May 2023 14:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0813F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 14:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0813F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rnQ0tZE2
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-96f9cfa7eddso100866566b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685017650; x=1687609650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvtCOkSJ1hLTpfTIe7dnnQ5oJVLpvePI0UcoHsPVr88=;
        b=rnQ0tZE2U5oV4ZOo0akozOdNKJxo/agK2VlMHzEek/5TolQqyKyAHV5cfKbHqngcl9
         5gVqamgLDFXPFSk2p1FOP6yTt0ZXRatdVRRCKcS63OgzD3mg1gMDz8mM49gABps2+0X/
         nwAcyjm9RGTdxHNWU7/LxCpFd9oea8vi9efYPmzWZt23iAFMJrVuvm+yn/dA7qTAp88H
         njMcW+H04uWM9mDUAEqfUFriLEbGqVDe3Ilsk/Yg8B5eTyR85lgCg0hPQegKYJmzH7Cs
         JhomoXskWtiuamodypAOZ6S214nWDLZUvm1PtkmwDdXMoYeOyGY4VOiRX1+RgDQ5mnLS
         2Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017650; x=1687609650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvtCOkSJ1hLTpfTIe7dnnQ5oJVLpvePI0UcoHsPVr88=;
        b=YYEogN2H9UyEM+Pss7H6g6R65pgb9tX7wxd+2aew+kadMjgKDWbEObLshsf9sxMMaz
         zLgZp/wIeeD5Yqcmb6ooDglzL+E9t31cRIV9PDRt/JqzgFjH6ucg5GFLetMsenkbrnmV
         b66lgWUaadeq064CGzWTdytk//d83i+rL8BuAFKwXJ8iLkoAk/1gNbv9jO1et2LMjr9X
         8OEaHEyflMUzKluoMNM/pk+9P3XpegoYtUZe6L+MKvciM5DW+0VSIBs/4evfAFULvoTp
         pI2FuY1AYEsu+0iICL6q/tsTXo+8PrP2SrzOY8oezSp/tLHLGh/HsSIzS6xdWMx0JNzJ
         /uzw==
X-Gm-Message-State: AC+VfDz6Fk5Qp6EvM19g2g0COh8ebwz7BOiV/vadRCE66UtaYe+tOYuv
	kShQUNbQBEtvizVOSq3AxIqo3JToVM1UPy1IMuU=
X-Google-Smtp-Source: 
 ACHHUZ6JdEIWi2e9dAuwaN4KMmQbk4Bgx1kpd9m4V9ZJz9shZj29YNaMmmri+i7DPVlnx9uaHRO5vAVnOpaO/wyaUqY=
X-Received: by 2002:a17:906:478a:b0:973:9f60:c57e with SMTP id
 cw10-20020a170906478a00b009739f60c57emr1660585ejc.2.1685017650420; Thu, 25
 May 2023 05:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230525122112.647963-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20230525122112.647963-1-daniel.baluta@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 May 2023 15:27:18 +0300
Message-ID: 
 <CAEnQRZBEVTghdM0hceMbATnNO-cfEJwgtchyhohAVuDTFSHYTg@mail.gmail.com>
Subject: Re: [PATCH linux-nxp] ASoC: SOF: imx: Add OF machine descriptors for
 i.MX platforms
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, linux-imx@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SBCLZKBDF42FXN6EVZLNNDIVC7GQGVSA
X-Message-ID-Hash: SBCLZKBDF42FXN6EVZLNNDIVC7GQGVSA
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBCLZKBDF42FXN6EVZLNNDIVC7GQGVSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Disregard this. Sent the patch from internal nxp folder.

On Thu, May 25, 2023 at 3:21=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> From: Paul Olaru <paul.olaru@nxp.com>
>
> Covered platforms: i.MX8QXP, i.MX8QM, i.MX8MP, i.MX8ULP.
>
> These descriptors are used to locate the machine driver and topology
> filenames.
>
> Note: because the compatible values for the boards do not change between
> the cs42888 and the wm8960 cases, I have selected a common topology
> filename, which is intended to be a symlink to either the wm8960 or the
> cs42888 topology file. For uniformity I did the same for i.MX8ULP.
>
> Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c    | 16 ++++++++++++++++
>  sound/soc/sof/imx/imx8m.c   | 10 ++++++++++
>  sound/soc/sof/imx/imx8ulp.c | 10 ++++++++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 7e7d1f5c1147..2b91bfc8fb5b 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -624,7 +624,22 @@ static struct snd_sof_dsp_ops sof_imx8x_ops =3D {
>                         SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
>  };
>
> +static struct snd_sof_of_mach sof_imx8_machs[] =3D {
> +       {
> +               .compatible =3D "fsl,imx8qxp",
> +               .drv_name =3D "asoc-simple-card",
> +               .sof_tplg_filename =3D "sof-imx8.tplg",
> +       },
> +       {
> +               .compatible =3D "fsl,imx8qm",
> +               .drv_name =3D "asoc-simple-card",
> +               .sof_tplg_filename =3D "sof-imx8.tplg",
> +       },
> +       {}
> +};
> +
>  static struct sof_dev_desc sof_of_imx8qxp_desc =3D {
> +       .of_machines =3D sof_imx8_machs,
>         .ipc_supported_mask     =3D BIT(SOF_IPC),
>         .ipc_default            =3D SOF_IPC,
>         .default_fw_path =3D {
> @@ -641,6 +656,7 @@ static struct sof_dev_desc sof_of_imx8qxp_desc =3D {
>  };
>
>  static struct sof_dev_desc sof_of_imx8qm_desc =3D {
> +       .of_machines =3D sof_imx8_machs,
>         .ipc_supported_mask     =3D BIT(SOF_IPC),
>         .ipc_default            =3D SOF_IPC,
>         .default_fw_path =3D {
> diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> index d20011349b43..a05497eb8d89 100644
> --- a/sound/soc/sof/imx/imx8m.c
> +++ b/sound/soc/sof/imx/imx8m.c
> @@ -487,7 +487,17 @@ static struct snd_sof_dsp_ops sof_imx8m_ops =3D {
>                 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
>  };
>
> +static struct snd_sof_of_mach sof_imx8m_machs[] =3D {
> +       {
> +               .compatible =3D "fsl,imx8mp",
> +               .drv_name =3D "asoc-simple-card",
> +               .sof_tplg_filename =3D "sof-imx8m.tplg",
> +       },
> +       {}
> +};
> +
>  static struct sof_dev_desc sof_of_imx8mp_desc =3D {
> +       .of_machines =3D sof_imx8m_machs,
>         .ipc_supported_mask     =3D BIT(SOF_IPC),
>         .ipc_default            =3D SOF_IPC,
>         .default_fw_path =3D {
> diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
> index 52c357ba570e..0c9878c2c420 100644
> --- a/sound/soc/sof/imx/imx8ulp.c
> +++ b/sound/soc/sof/imx/imx8ulp.c
> @@ -496,7 +496,17 @@ static struct snd_sof_dsp_ops sof_imx8ulp_ops =3D {
>         .set_power_state        =3D imx8ulp_dsp_set_power_state,
>  };
>
> +static struct snd_sof_of_mach sof_imx8ulp_machs[] =3D {
> +       {
> +               .compatible =3D "fsl,imx8ulp",
> +               .drv_name =3D "asoc-simple-card",
> +               .sof_tplg_filename =3D "sof-imx8ulp.tplg",
> +       },
> +       {}
> +};
> +
>  static struct sof_dev_desc sof_of_imx8ulp_desc =3D {
> +       .of_machines =3D sof_imx8ulp_machs,
>         .ipc_supported_mask     =3D BIT(SOF_IPC),
>         .ipc_default            =3D SOF_IPC,
>         .default_fw_path =3D {
> --
> 2.40.1
>
