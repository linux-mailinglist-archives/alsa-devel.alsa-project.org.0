Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D68F7FB069
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 04:22:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6CB97F8;
	Tue, 28 Nov 2023 04:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6CB97F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701141734;
	bh=B3bawn0hlD6D8EYOg3T5FNcl8bOGAHf4DqqvsHFvP6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5IJEmErziBF9yKJO39mc2Mo3DgWA2b1iB4iTquufTcFijiulKJOCItlasJCaITOh
	 rbX+/jCzbWCJDj84CUDHPeojdrY2ptB3YT5ynItPB5Ak1IBKkok9R/XJjd2BB6j20C
	 HZHI9it6YlomaB1g1VjFlueCMqW97pEaSkd2LAdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 441D3F80570; Tue, 28 Nov 2023 04:21:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4CBF80571;
	Tue, 28 Nov 2023 04:21:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15437F801D5; Tue, 28 Nov 2023 04:17:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5225F80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 04:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5225F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jIQao/0l
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so6826427e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Nov 2023 19:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701141451; x=1701746251;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
        b=jIQao/0lZSSLIAWQy6Qn2t53s/NTEKM2MeGT5rxrRIsN26pgtVdmXDbW4GQSWnkkhy
         8uRCsVbneq6Rj6ntSD1Xg3x1C4vKExSjvmZp5tKxjv/wLI3G5NKk9jVPR+3n3yse/nvQ
         FHqTPg5C9M61WGmQyrZP1fywiDxvI/+AKskWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701141451; x=1701746251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wp5HnTgZ7ZLaUo9Q/M6nPjzjSUwa62T1Maa/se+gxo=;
        b=Mz11KzZNAqwiCyHul0ed3IuYhygKMGKU8FY0rYegdXtnn1NQue5UaN4FqFRocUqyfP
         N+raOX9owYMifkJkUeTVKMdoGyjVZwvevwho8U5ScNUOfIWWTDJAP6m7xIYlZsojP/G5
         kNEL6jTRKv3ZkKjTGouDgyy8VuQcZoi4s5wWVTAPohNVlPf72YBvcpKSqc8SeifB5O+p
         zCp3VBQK12hbFtefyfC/ivxDYCqyWfmTvqE3p0FwSYfkbQIBU/YFM5hm71HVTMappI7l
         rA5GiZpXLBru9+tPs/oxFF75wuhFLolZF9ZGZDYXxJheHXFWbvfbZfKt9fF+EBzLUA+T
         cXJg==
X-Gm-Message-State: AOJu0YwJPi9lSC8N/YAeTo3SGAVHFzFs1XBYo+7icSRQLO9cGRnDtXNO
	vgMMvFrCmP73+ojatATXQiaqilJsWde7JhRQ4hb1Bg==
X-Google-Smtp-Source: 
 AGHT+IGSvCVqHokq1V085rudx0pq9tIghj1AHgkp2YjyyUW/OKHrDERsAUTAxkQUm4r6WUQntkQt94tB1L8sdCreRbM=
X-Received: by 2002:a05:6512:3585:b0:500:d4d9:25b5 with SMTP id
 m5-20020a056512358500b00500d4d925b5mr7469216lfr.56.1701141451084; Mon, 27 Nov
 2023 19:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com>
 <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
In-Reply-To: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Nov 2023 11:17:20 +0800
Message-ID: 
 <CAGXv+5G2tP9i8VrUc6-xs2d72_nL9XH9iSCeixzA2AM7X5fXOQ@mail.gmail.com>
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
	allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-mediatek@lists.infradead.org,
 ajye_huang@compal.corp-partner.google.com,
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: M3DF4WNUVLVOVDFNABCAFITYDNIM7QFE
X-Message-ID-Hash: M3DF4WNUVLVOVDFNABCAFITYDNIM7QFE
X-MailFrom: wenst@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3DF4WNUVLVOVDFNABCAFITYDNIM7QFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 21, 2023 at 8:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> > Add audio support for it6505
> >
> > 1. Bridge to hdmi-codec to support audio feature. At the same time,
> >     the function of automatically detecting audio is removed.
> > 2. It is observed that some DP-to-HDMI dongles will get into bad
> >     states if sending InfoFrame without audio data. Defer to enable
> >     it6505's audio feature when PCM triggers START or RESUME.
> >
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>
> Hello Jiaxin,
> this patch doesn't apply anymore (and it won't build anymore) upstream.
>
> > ---
> >   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++--=
-
> >   1 file changed, 75 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 504d51c42f79..1cfcb0731288 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 =
*it6505)
> >
> >   static void it6505_link_train_ok(struct it6505 *it6505)
> >   {
> > -     struct device *dev =3D &it6505->client->dev;
>
> This is because this changed to `struct device *dev =3D it6505->dev;`
>
> >
> >       it6505->link_state =3D LINK_OK;
> >       /* disalbe mute enable avi info frame */
> > @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *=
it6505)
> >       it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
> >                       EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
> >
> > -     if (it6505_audio_input(it6505)) {
> > -             DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> > -             it6505_enable_audio(it6505);
> > -     }
> > -
> >       if (it6505->hdcp_desired)
> >               it6505_start_hdcp(it6505);
> >   }
> > @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown=
(struct device *dev, void *data)
> >               it6505_disable_audio(it6505);
> >   }
> >
> > +static int it6505_audio_hw_params(struct device *dev, void *data,
> > +                               struct hdmi_codec_daifmt *daifmt,
> > +                               struct hdmi_codec_params *params)
> > +{
> > +     struct it6505 *it6505 =3D dev_get_drvdata(dev);
> > +
> > +     return it6505_audio_setup_hw_params(it6505, params);
> > +}
> > +
> > +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> > +{
> > +     struct device *dev =3D &it6505->client->dev;
>
> ...and because you'll have to change this one, and other occurrences of t=
hat
> as well.
>
> Can you please respin this series?

Please also add a patch adding #sound-dai-cells to the it6505 binding.
