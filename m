Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D9744E5B
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jul 2023 17:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 202047F1;
	Sun,  2 Jul 2023 17:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 202047F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688312202;
	bh=CCH1PdV4OvJr8XCEbuEUzTEA0gmAKqy+xMWp5PSJgq8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=veV4XAsNK/6RBAWlFKZbSqbh5U5LJ64L86rY+uPKk32hZlRpg8tnuhZuYZLHQxr9X
	 I2xLe2q6j1wm1Z5vLQD/9UtnFM9Mkn0KqoTAbYUh94yH58Lf7gYgO68dYWLWJScmx4
	 0d+xIkOj4aPmrarbdwngtIC33GlCPoIsXrEvS1SY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F5F0F8053B; Sun,  2 Jul 2023 17:35:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1456BF80124;
	Sun,  2 Jul 2023 17:35:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0ADF80125; Sun,  2 Jul 2023 17:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF104F80100
	for <alsa-devel@alsa-project.org>; Sun,  2 Jul 2023 17:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF104F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kali.org header.i=@kali.org header.a=rsa-sha256
 header.s=google header.b=ncb9y4df
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5728df0a7d9so44451127b3.1
        for <alsa-devel@alsa-project.org>;
 Sun, 02 Jul 2023 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1688312135; x=1690904135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HK/wrSX5ldIZqomEmAxF+1M9WN0YB3jXi2+hEI4hrg=;
        b=ncb9y4dfOfqMqt45fNkhQKp6f/7iiyaiAOdCPj0wKbAW0P+Okmbm8YPYWiI9eTNJ6+
         5fQcASIXIXNMbWtDy0+UtXg9+jVcH6dqn8gcS8x1gW6Imn+RwmiPncIMug/C2jQJX+ry
         vdqCiFGqQVu/tjNVPkPzV7k1DDPtnXy+bW91P7ThP4AR1wMMz5Ci9qpW7Ca+GmCwIjVp
         +Fe5ZPyu8hSLpGFdyMtsCJC4BAwmybnN8OgEIQoSH7D5xaiTxvwsChyUXw0VJkblj+Fj
         NCZ7U9viyMDeHgQsBJwrkwnbGXLYgWnTK8B3RgoXgupSnghljecukvA7SJqAbnlSJqim
         IL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688312135; x=1690904135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HK/wrSX5ldIZqomEmAxF+1M9WN0YB3jXi2+hEI4hrg=;
        b=ir8DtZhJ83hTVohQw3IbK8mjO3Jc90c5BkiUA1XLqqocySA9K/3BQ/4Vld/pCX/SyJ
         fDYGRieYzHDbzfcC+DqKOYpHxbX2JQw21D/zd19gwo4cE6UtSFrTRtvkH/cpI1ptGX5W
         Uj8yxI2ZesVJgAX1DeGyrKj8iATJ01I11uPkJlv/XJnVM9i93x75ij3XxP/rknI6sNwy
         5iwzUsIqv86KviS+94xwK25KR4/ZzMd/581j/XqE4QD3ATcdWVxuJVn0RL6vIIU+xK/O
         ilwq1NBh6tSCYbU75kWiVqsd7E6IguGjUSeE1ZIvfWNyDYn8T6LdTNbEv+PKJgIivQKA
         kfgQ==
X-Gm-Message-State: ABy/qLb86P5QNhIBYcTtzmAm6iZZxaO218mZt0yvsO/nxckTynzAkhfA
	7Vlh9JaalxEP5knPQ/F5eZuIo1GTysMXZDdQ62yn8g==
X-Google-Smtp-Source: 
 APBJJlF0b4377s+5bE0gPOT9vWcP0qN6qywjYOogZGjLDkgFAsoWN98kiIjISETvk66UZU5XS6FurxP1uZdzb1IyRhQ=
X-Received: by 2002:a81:5302:0:b0:56d:31a1:bd9b with SMTP id
 h2-20020a815302000000b0056d31a1bd9bmr7933811ywb.41.1688312134647; Sun, 02 Jul
 2023 08:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230701094723.29379-1-johan+linaro@kernel.org>
In-Reply-To: <20230701094723.29379-1-johan+linaro@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 2 Jul 2023 10:35:23 -0500
Message-ID: 
 <CAKXuJqjyjbRi2H=A_d=RgMOKSy=ZRqr0YVqsFObMYKtp66RyHA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix soundwire initialisation race
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5NDQ7JWL4ENS4PBT64FJSSQ6ODWXDAYD
X-Message-ID-Hash: 5NDQ7JWL4ENS4PBT64FJSSQ6ODWXDAYD
X-MailFrom: steev@kali.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NDQ7JWL4ENS4PBT64FJSSQ6ODWXDAYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 1, 2023 at 4:48=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Make sure that the soundwire device used for register accesses has been
> enumerated and initialised before trying to read the codec variant
> during component probe.
>
> This specifically avoids interpreting (a masked and shifted) -EBUSY
> errno as the variant:
>
>         wcd938x_codec audio-codec: ASoC: error at soc_component_read_no_l=
ock on audio-codec for register: [0x000034b0] -16
>
> in case the soundwire device has not yet been initialised, which in turn
> prevents some headphone controls from being registered.
>
> Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
> Cc: stable@vger.kernel.org      # 5.14
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  sound/soc/codecs/wcd938x.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index e3ae4fb2c4db..4571588fad62 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -3080,9 +3080,18 @@ static int wcd938x_irq_init(struct wcd938x_priv *w=
cd, struct device *dev)
>  static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  {
>         struct wcd938x_priv *wcd938x =3D snd_soc_component_get_drvdata(co=
mponent);
> +       struct sdw_slave *tx_sdw_dev =3D wcd938x->tx_sdw_dev;
>         struct device *dev =3D component->dev;
> +       unsigned long time_left;
>         int ret, i;
>
> +       time_left =3D wait_for_completion_timeout(&tx_sdw_dev->initializa=
tion_complete,
> +                                               msecs_to_jiffies(2000));
> +       if (!time_left) {
> +               dev_err(dev, "soundwire device init timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
>         snd_soc_component_init_regmap(component, wcd938x->regmap);
>
>         ret =3D pm_runtime_resume_and_get(dev);
> --
> 2.39.3
>

Thank you!  Tested with this and the other patch applied on my X13s
with a pair of Apple EarPods with 3.5mm Headphone Plug, audio is quite
nice through them.

Tested-by: Steev Klimaszewski <steev@kali.org>
