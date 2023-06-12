Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C551572C841
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25209823;
	Mon, 12 Jun 2023 16:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25209823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579878;
	bh=fQutAilllSdFbeFgHKQ2u3rZErlWrK/c3YGy8eu/nrI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QTVF3DN+0OkzZfPACczTmLGBXweo1XuC1WgubN1KtZ2xdsOxrYUSkfh1YvMi2y2oz
	 giflezI8M+tbvw4F2Tjtp69W1JC7cd6N0AzJJtIIqJ1WX03uMyRiQY5Haiu8t3idj3
	 +WpyGEeX6LTp9WVcU5ZKrbZCpZykxs+W/IvRCJkM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73FAAF80155; Mon, 12 Jun 2023 16:23:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03326F80132;
	Mon, 12 Jun 2023 16:23:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE87FF80149; Mon, 12 Jun 2023 16:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 260EBF800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260EBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=BP6Ce52A
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-43b56039611so780904137.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579818; x=1689171818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAElZJWTZKtCyjwBqCa5bz8aeRRx4uwejBBuNcxb/pA=;
        b=BP6Ce52ALdrFgHc35k2qFqALsvDMxzVCP02F23z1eSPjsCyvRvEbDYavqAGkz3kz+e
         95foU5x8poYimo8U7OfiiLgkP+DW35b3oyacBWxP4bNuJGdw1DLgxet+j+tv2QAgRP7o
         0P3dBDxWeCfd77mPbm5zxrY2UX7/Q+d4ZrVn5D0p8mKVpHSipMw4X6EpKVvYmXOFvrOq
         IkqT0ps8Kf7gUf9eMnx+teBLbz0tWXWtjVHV3E1gGicoivMf27+v6aZ4MDrp6yUIl2XF
         hM+6/9oUrq1NamAX+7c7ZaAfdeKDz44zvcUqb6PBHTzyJUrab9gTvzHSCay9w2sdmEqs
         pvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579818; x=1689171818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAElZJWTZKtCyjwBqCa5bz8aeRRx4uwejBBuNcxb/pA=;
        b=Ad6RWaF6EUgDRTPTPsMlHXhMJnUmGzGCmKjTnwToyu1mA5ZD2fHcMPL0Ph6CRiL+8q
         51BycNylk4mEmglYEQPSWdKnaa9mpL1mSX+QVl0SRQkYKfIqwqj3KeIICRIodcJSGvMY
         rRxw+18/FN0PttbGQsLQep73ZCO1JtF+TsZCnd5VhZpwFr2i9r8RC+h1YrffeWfB0u9T
         k5IWOSfThC5Sn0zw8koKvkqKsxpFOKzstw4+z1zKIvEn3VhGDQVIeWWqvoOg9pqPr1/l
         fb3AwfUjImUwLa83rn9KJaYQNpBLsPWBjDxiEk4H41zHt5BxyTf+TGuO8BfezdI61nZL
         YTgQ==
X-Gm-Message-State: AC+VfDzHXcuIwfEYjTvR7LZSX10kQTbEa4DLdeahJVwukID+25zGqi0j
	+4woP7zLZ00jTUNqIFT37KwpYAWI7kPLg5LUmmA=
X-Google-Smtp-Source: 
 ACHHUZ5jBYb6Tn9naltNOXlzcvmtmpF3VFB2vHEk56WLmqrRsmzyPsSq54+vQNmusJItbZnPLcUM8m5tpsQOqoQ7Hpg=
X-Received: by 2002:a05:6102:521:b0:43b:159b:f2c5 with SMTP id
 m1-20020a056102052100b0043b159bf2c5mr2672624vsa.32.1686579817954; Mon, 12 Jun
 2023 07:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-11-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-11-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:23:02 +0300
Message-ID: 
 <CAHp75VcZPFAzB8Sw_m1J4cU=+_YKJ6Ru8o7tCiZ3Z0haQre-zg@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] ASoC: soc-dapm.h: Convert macros to return a
 compound litteral
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TQYYPMPCJSFVJ6KG5P6OGHJVQKW5REHR
X-Message-ID-Hash: TQYYPMPCJSFVJ6KG5P6OGHJVQKW5REHR
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQYYPMPCJSFVJ6KG5P6OGHJVQKW5REHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> The SND_SOC_DAPM_* helpers family are used to build widgets array in a
> static way.
>
> Convert them to return a compound litteral in order to use them in both

literal

> static and dynamic way.
> With this conversion, the different SND_SOC_DAPM_* parameters can be
> computed by the code and the widget can be built based on this parameter
> computation.
>   static int create_widget(char *input_name)
>   {
>           struct snd_soc_dapm_widget widget;
>           char name*;
>           ...
>           name =3D input_name;
>           if (!name)
>                   name =3D "default";
>
>           widget =3D SND_SOC_DAPM_INPUT(name);
>           ...
>   }

Suggested-by:?

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/sound/soc-dapm.h | 138 ++++++++++++++++++++++++++-------------
>  1 file changed, 92 insertions(+), 46 deletions(-)
>
> diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
> index 87f8e1793af1..2e38dff16779 100644
> --- a/include/sound/soc-dapm.h
> +++ b/include/sound/soc-dapm.h
> @@ -42,36 +42,45 @@ struct soc_enum;
>
>  /* codec domain */
>  #define SND_SOC_DAPM_VMID(wname) \
> -{      .id =3D snd_soc_dapm_vmid, .name =3D wname, .kcontrol_news =3D NU=
LL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_vmid, .name =3D wname, .kcontrol_news =3D NU=
LL, \
>         .num_kcontrols =3D 0}
>
>  /* platform domain */
>  #define SND_SOC_DAPM_SIGGEN(wname) \
> -{      .id =3D snd_soc_dapm_siggen, .name =3D wname, .kcontrol_news =3D =
NULL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_siggen, .name =3D wname, .kcontrol_news =3D =
NULL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM }
>  #define SND_SOC_DAPM_SINK(wname) \
> -{      .id =3D snd_soc_dapm_sink, .name =3D wname, .kcontrol_news =3D NU=
LL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_sink, .name =3D wname, .kcontrol_news =3D NU=
LL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM }
>  #define SND_SOC_DAPM_INPUT(wname) \
> -{      .id =3D snd_soc_dapm_input, .name =3D wname, .kcontrol_news =3D N=
ULL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_input, .name =3D wname, .kcontrol_news =3D N=
ULL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM }
>  #define SND_SOC_DAPM_OUTPUT(wname) \
> -{      .id =3D snd_soc_dapm_output, .name =3D wname, .kcontrol_news =3D =
NULL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_output, .name =3D wname, .kcontrol_news =3D =
NULL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM }
>  #define SND_SOC_DAPM_MIC(wname, wevent) \
> -{      .id =3D snd_soc_dapm_mic, .name =3D wname, .kcontrol_news =3D NUL=
L, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mic, .name =3D wname, .kcontrol_news =3D NUL=
L, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD}
>  #define SND_SOC_DAPM_HP(wname, wevent) \
> -{      .id =3D snd_soc_dapm_hp, .name =3D wname, .kcontrol_news =3D NULL=
, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_hp, .name =3D wname, .kcontrol_news =3D NULL=
, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
>  #define SND_SOC_DAPM_SPK(wname, wevent) \
> -{      .id =3D snd_soc_dapm_spk, .name =3D wname, .kcontrol_news =3D NUL=
L, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_spk, .name =3D wname, .kcontrol_news =3D NUL=
L, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
>  #define SND_SOC_DAPM_LINE(wname, wevent) \
> -{      .id =3D snd_soc_dapm_line, .name =3D wname, .kcontrol_news =3D NU=
LL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_line, .name =3D wname, .kcontrol_news =3D NU=
LL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD}
>
> @@ -82,93 +91,110 @@ struct soc_enum;
>  /* path domain */
>  #define SND_SOC_DAPM_PGA(wname, wreg, wshift, winvert,\
>          wcontrols, wncontrols) \
> -{      .id =3D snd_soc_dapm_pga, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pga, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols}
>  #define SND_SOC_DAPM_OUT_DRV(wname, wreg, wshift, winvert,\
>          wcontrols, wncontrols) \
> -{      .id =3D snd_soc_dapm_out_drv, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_out_drv, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols}
>  #define SND_SOC_DAPM_MIXER(wname, wreg, wshift, winvert, \
>          wcontrols, wncontrols)\
> -{      .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols}
>  #define SND_SOC_DAPM_MIXER_NAMED_CTL(wname, wreg, wshift, winvert, \
>          wcontrols, wncontrols)\
> -{       .id =3D snd_soc_dapm_mixer_named_ctl, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer_named_ctl, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols}
>  /* DEPRECATED: use SND_SOC_DAPM_SUPPLY */
>  #define SND_SOC_DAPM_MICBIAS(wname, wreg, wshift, winvert) \
> -{      .id =3D snd_soc_dapm_micbias, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_micbias, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D NULL, .num_kcontrols =3D 0}
>  #define SND_SOC_DAPM_SWITCH(wname, wreg, wshift, winvert, wcontrols) \
> -{      .id =3D snd_soc_dapm_switch, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_switch, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D 1}
>  #define SND_SOC_DAPM_MUX(wname, wreg, wshift, winvert, wcontrols) \
> -{      .id =3D snd_soc_dapm_mux, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mux, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D 1}
>  #define SND_SOC_DAPM_DEMUX(wname, wreg, wshift, winvert, wcontrols) \
> -{      .id =3D snd_soc_dapm_demux, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_demux, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D 1}
>
>  /* Simplified versions of above macros, assuming wncontrols =3D ARRAY_SI=
ZE(wcontrols) */
>  #define SOC_PGA_ARRAY(wname, wreg, wshift, winvert,\
>          wcontrols) \
> -{      .id =3D snd_soc_dapm_pga, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pga, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols)}
>  #define SOC_MIXER_ARRAY(wname, wreg, wshift, winvert, \
>          wcontrols)\
> -{      .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols)}
>  #define SOC_MIXER_NAMED_CTL_ARRAY(wname, wreg, wshift, winvert, \
>          wcontrols)\
> -{       .id =3D snd_soc_dapm_mixer_named_ctl, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer_named_ctl, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols)}
>
>  /* path domain with event - event handler must return 0 for success */
>  #define SND_SOC_DAPM_PGA_E(wname, wreg, wshift, winvert, wcontrols, \
>         wncontrols, wevent, wflags) \
> -{      .id =3D snd_soc_dapm_pga, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pga, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols, \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_OUT_DRV_E(wname, wreg, wshift, winvert, wcontrols, =
\
>         wncontrols, wevent, wflags) \
> -{      .id =3D snd_soc_dapm_out_drv, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_out_drv, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols, \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_MIXER_E(wname, wreg, wshift, winvert, wcontrols, \
>         wncontrols, wevent, wflags) \
> -{      .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D wncontrols, \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_MIXER_NAMED_CTL_E(wname, wreg, wshift, winvert, \
>         wcontrols, wncontrols, wevent, wflags) \
> -{       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, \
>         .num_kcontrols =3D wncontrols, .event =3D wevent, .event_flags =
=3D wflags}
>  #define SND_SOC_DAPM_SWITCH_E(wname, wreg, wshift, winvert, wcontrols, \
>         wevent, wflags) \
> -{      .id =3D snd_soc_dapm_switch, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_switch, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D 1, \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_MUX_E(wname, wreg, wshift, winvert, wcontrols, \
>         wevent, wflags) \
> -{      .id =3D snd_soc_dapm_mux, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mux, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D 1, \
>         .event =3D wevent, .event_flags =3D wflags}
> @@ -176,101 +202,121 @@ struct soc_enum;
>  /* additional sequencing control within an event type */
>  #define SND_SOC_DAPM_PGA_S(wname, wsubseq, wreg, wshift, winvert, \
>         wevent, wflags) \
> -{      .id =3D snd_soc_dapm_pga, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pga, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .event =3D wevent, .event_flags =3D wflags, \
>         .subseq =3D wsubseq}
>  #define SND_SOC_DAPM_SUPPLY_S(wname, wsubseq, wreg, wshift, winvert, wev=
ent, \
>         wflags) \
> -{      .id =3D snd_soc_dapm_supply, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_supply, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .event =3D wevent, .event_flags =3D wflags, .subseq =3D wsubseq}
>
>  /* Simplified versions of above macros, assuming wncontrols =3D ARRAY_SI=
ZE(wcontrols) */
>  #define SOC_PGA_E_ARRAY(wname, wreg, wshift, winvert, wcontrols, \
>         wevent, wflags) \
> -{      .id =3D snd_soc_dapm_pga, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pga, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols), \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SOC_MIXER_E_ARRAY(wname, wreg, wshift, winvert, wcontrols, \
>         wevent, wflags) \
> -{      .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols), \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SOC_MIXER_NAMED_CTL_E_ARRAY(wname, wreg, wshift, winvert, \
>         wcontrols, wevent, wflags) \
> -{       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_mixer, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .kcontrol_news =3D wcontrols, .num_kcontrols =3D ARRAY_SIZE(wcont=
rols), \
>         .event =3D wevent, .event_flags =3D wflags}
>
>  /* events that are pre and post DAPM */
>  #define SND_SOC_DAPM_PRE(wname, wevent) \
> -{      .id =3D snd_soc_dapm_pre, .name =3D wname, .kcontrol_news =3D NUL=
L, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pre, .name =3D wname, .kcontrol_news =3D NUL=
L, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD}
>  #define SND_SOC_DAPM_POST(wname, wevent) \
> -{      .id =3D snd_soc_dapm_post, .name =3D wname, .kcontrol_news =3D NU=
LL, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_post, .name =3D wname, .kcontrol_news =3D NU=
LL, \
>         .num_kcontrols =3D 0, .reg =3D SND_SOC_NOPM, .event =3D wevent, \
>         .event_flags =3D SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD}
>
>  /* stream domain */
>  #define SND_SOC_DAPM_AIF_IN(wname, stname, wchan, wreg, wshift, winvert)=
 \
> -{      .id =3D snd_soc_dapm_aif_in, .name =3D wname, .sname =3D stname, =
\
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_aif_in, .name =3D wname, .sname =3D stname, =
\
>         .channel =3D wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winve=
rt), }
>  #define SND_SOC_DAPM_AIF_IN_E(wname, stname, wchan, wreg, wshift, winver=
t, \
>                               wevent, wflags)                           \
> -{      .id =3D snd_soc_dapm_aif_in, .name =3D wname, .sname =3D stname, =
\
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_aif_in, .name =3D wname, .sname =3D stname, =
\
>         .channel =3D wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winve=
rt), \
>         .event =3D wevent, .event_flags =3D wflags }
>  #define SND_SOC_DAPM_AIF_OUT(wname, stname, wchan, wreg, wshift, winvert=
) \
> -{      .id =3D snd_soc_dapm_aif_out, .name =3D wname, .sname =3D stname,=
 \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_aif_out, .name =3D wname, .sname =3D stname,=
 \
>         .channel =3D wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winve=
rt), }
>  #define SND_SOC_DAPM_AIF_OUT_E(wname, stname, wchan, wreg, wshift, winve=
rt, \
>                              wevent, wflags)                            \
> -{      .id =3D snd_soc_dapm_aif_out, .name =3D wname, .sname =3D stname,=
 \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_aif_out, .name =3D wname, .sname =3D stname,=
 \
>         .channel =3D wchan, SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winve=
rt), \
>         .event =3D wevent, .event_flags =3D wflags }
>  #define SND_SOC_DAPM_DAC(wname, stname, wreg, wshift, winvert) \
> -{      .id =3D snd_soc_dapm_dac, .name =3D wname, .sname =3D stname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_dac, .name =3D wname, .sname =3D stname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert) }
>  #define SND_SOC_DAPM_DAC_E(wname, stname, wreg, wshift, winvert, \
>                            wevent, wflags)                              \
> -{      .id =3D snd_soc_dapm_dac, .name =3D wname, .sname =3D stname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_dac, .name =3D wname, .sname =3D stname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .event =3D wevent, .event_flags =3D wflags}
>
>  #define SND_SOC_DAPM_ADC(wname, stname, wreg, wshift, winvert) \
> -{      .id =3D snd_soc_dapm_adc, .name =3D wname, .sname =3D stname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_adc, .name =3D wname, .sname =3D stname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), }
>  #define SND_SOC_DAPM_ADC_E(wname, stname, wreg, wshift, winvert, \
>                            wevent, wflags)                              \
> -{      .id =3D snd_soc_dapm_adc, .name =3D wname, .sname =3D stname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_adc, .name =3D wname, .sname =3D stname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_CLOCK_SUPPLY(wname) \
> -{      .id =3D snd_soc_dapm_clock_supply, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_clock_supply, .name =3D wname, \
>         .reg =3D SND_SOC_NOPM, .event =3D dapm_clock_event, \
>         .event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
>
>  /* generic widgets */
>  #define SND_SOC_DAPM_REG(wid, wname, wreg, wshift, wmask, won_val, woff_=
val) \
> -{      .id =3D wid, .name =3D wname, .kcontrol_news =3D NULL, .num_kcont=
rols =3D 0, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D wid, .name =3D wname, .kcontrol_news =3D NULL, .num_kcont=
rols =3D 0, \
>         .reg =3D wreg, .shift =3D wshift, .mask =3D wmask, \
>         .on_val =3D won_val, .off_val =3D woff_val, }
>  #define SND_SOC_DAPM_SUPPLY(wname, wreg, wshift, winvert, wevent, wflags=
) \
> -{      .id =3D snd_soc_dapm_supply, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_supply, .name =3D wname, \
>         SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>         .event =3D wevent, .event_flags =3D wflags}
>  #define SND_SOC_DAPM_REGULATOR_SUPPLY(wname, wdelay, wflags)       \
> -{      .id =3D snd_soc_dapm_regulator_supply, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_regulator_supply, .name =3D wname, \
>         .reg =3D SND_SOC_NOPM, .shift =3D wdelay, .event =3D dapm_regulat=
or_event, \
>         .event_flags =3D SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD, \
>         .on_val =3D wflags}
>  #define SND_SOC_DAPM_PINCTRL(wname, active, sleep) \
> -{      .id =3D snd_soc_dapm_pinctrl, .name =3D wname, \
> +(struct snd_soc_dapm_widget) { \
> +       .id =3D snd_soc_dapm_pinctrl, .name =3D wname, \
>         .priv =3D (&(struct snd_soc_dapm_pinctrl_priv) \
>                 { .active_state =3D active, .sleep_state =3D sleep,}), \
>         .reg =3D SND_SOC_NOPM, .event =3D dapm_pinctrl_event, \
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
