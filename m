Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0180D8EA0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 12:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F9B847;
	Wed, 16 Oct 2019 12:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F9B847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571223102;
	bh=jZaZcPuJ8udW85Jz7fklzTfkSMqPM6lwq1l/hjqrzTo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkfwHpqLFYtq4RLH6FJHqgFNJt0BOv1KjBKu3zUW7eb/Uptp9U88wjiOqMhcyxOTv
	 WGkDpb6Mx706PQ8Cf15oetSeeXn8Kzp0NKBEUBGpkEfgys7cign9CY4+wQhuk0VZIc
	 mZmZ+ULeKUsrmlSs3PgKtQ47dIr9YhaOx8VKwtbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D08B2F80362;
	Wed, 16 Oct 2019 12:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB61F80362; Wed, 16 Oct 2019 12:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 242F1F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 12:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 242F1F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ObFq94ms"
Received: by mail-ua1-x941.google.com with SMTP id b14so7066145uap.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojjYtDjrw8larMFBVqkWTImOnD6WOKIQeRui6WWFfto=;
 b=ObFq94ms9X3CQrY1WWzpVDO/R4Gxvt5oWIwvlatRSnxbRKgd5LfLd6VhpQIRxwCz4c
 elHtdBktcm7bhzJdPS/IOQJchWw2fdqUFLX5toqTJHfdhDuQMhJyCD3UMK1yXRlwDgMp
 ukNRSgYQPuMpSZLxH4P/RCY2/OE5zlVXrrSeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojjYtDjrw8larMFBVqkWTImOnD6WOKIQeRui6WWFfto=;
 b=E/VdvEfrFkxHzJWe39aKnUcn2JWWx1m8pxP8i4rmUeNjlVa2TuLNjdFaU6/cdV/Vwv
 ySKWMazZn3xf75PGmj9y24QBuzAkJBNZdJIPBrA07nhyzIiroAn4rlzZUup+fQT5Abaf
 CPuqnLmdoqytTIJc2A5Daik3758sw4cx4OmRfr1AqB01fW0gqURYhsgUTTjtIrXmYG6w
 k7uxK9E1jt5AYqRQih6lDLntesl6nwf3Da3NsFhNl5eykvrSOOzBehu1h5Hhsr7G+h2L
 5DoR2mIR0j74zr4Aoe1dPTkgCY1eXnRJhAfLehUrlWEX3gv+cUQlKb4oSpvhO93Qmka0
 t8KA==
X-Gm-Message-State: APjAAAVmTWogWgSNqQzwg/nTv8RTqHdoIiEaSx/cY5uyobd2WhEncYDI
 AxNW4GsDt/oxXgaK0K7DQJlq/hlpMuX11pqK2d72Cw==
X-Google-Smtp-Source: APXvYqwf88w45dhDT8yfkbrMZQ+MyA7ULlWXC++gbSROyRckhhTO5Q3OJ6k4y9KXa5R1OTP4Q/biYfECxE8iyGmNxLo=
X-Received: by 2002:ab0:2bcf:: with SMTP id s15mr3591671uar.55.1571222989485; 
 Wed, 16 Oct 2019 03:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085845.11672-1-shumingf@realtek.com>
In-Reply-To: <20191016085845.11672-1-shumingf@realtek.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 16 Oct 2019 18:49:23 +0800
Message-ID: <CAFv8NwLzXpOQdLgjppYwgTQtFzfMVP==tSGyFM7g5iyUosKihw@mail.gmail.com>
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: Read and apply r0 and
	temperature device property
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 16, 2019 at 4:59 PM <shumingf@realtek.com> wrote:
>
> From: Shuming Fan <shumingf@realtek.com>
>
> Typically, the r0 (calibration data) and temperature were measured in the factory.
> This information is written into the non-volatile area
> where keeps data whether factory reset or OS update.
> In Chromium OS case, the coreboot will read the info from VPD and create
> the device property for each rt1011.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/codecs/rt1011.c | 41 ++++++++++++++++++++++++++++++++++++++-
>  sound/soc/codecs/rt1011.h |  1 +
>  2 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
> index b927e61b32df..ad049cfddcb0 100644
> --- a/sound/soc/codecs/rt1011.c
> +++ b/sound/soc/codecs/rt1011.c
> @@ -2328,8 +2328,12 @@ static void rt1011_calibration_work(struct work_struct *work)
>         struct rt1011_priv *rt1011 =
>                 container_of(work, struct rt1011_priv, cali_work);
>         struct snd_soc_component *component = rt1011->component;
> +       unsigned int r0_integer, r0_factor, format;
>
> -       rt1011_calibrate(rt1011, 1);
> +       if (rt1011->r0_calib)
> +               rt1011_calibrate(rt1011, 0);
> +       else
> +               rt1011_calibrate(rt1011, 1);
>
>         /*
>          * This flag should reset after booting.
> @@ -2340,6 +2344,39 @@ static void rt1011_calibration_work(struct work_struct *work)
>
>         /* initial */
>         rt1011_reg_init(component);
> +
> +       /* Apply temperature and calibration data from device property */
> +       if (rt1011->temperature_calib) {
> +               snd_soc_component_update_bits(component,
> +                       RT1011_STP_INITIAL_RESISTANCE_TEMP, 0x3ff,
> +                       (rt1011->temperature_calib << 2));
> +       }
> +
> +       if (rt1011->r0_calib) {
> +               rt1011->r0_reg = rt1011->r0_calib;
> +
> +               format = 2147483648U; /* 2^24 * 128 */
> +               r0_integer = format / rt1011->r0_reg / 128;
> +               r0_factor = ((format / rt1011->r0_reg * 100) / 128)
> +                                               - (r0_integer * 100);
> +               dev_info(component->dev,        "DP r0 resistance about %d.%02d ohm, reg=0x%X\n",
> +                       r0_integer, r0_factor, rt1011->r0_reg);
> +
> +               rt1011_r0_load(rt1011);
> +       }
> +}
> +
> +static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
> +{
> +       device_property_read_u32(dev, "realtek,temperature_calib",
> +               &rt1011->temperature_calib);
> +       device_property_read_u32(dev, "realtek,r0_calib",
> +               &rt1011->r0_calib);
> +
> +       dev_dbg(dev, "%s: r0_calib: 0x%x, temperture_calib: 0x%x",
> +               __func__, rt1011->r0_calib, rt1011->temperature_calib);
> +
> +       return 0;
>  }
>
>  static int rt1011_i2c_probe(struct i2c_client *i2c,
> @@ -2356,6 +2393,8 @@ static int rt1011_i2c_probe(struct i2c_client *i2c,
>
>         i2c_set_clientdata(i2c, rt1011);
>
> +       rt1011_parse_dp(rt1011, &i2c->dev);
> +
>         rt1011->regmap = devm_regmap_init_i2c(i2c, &rt1011_regmap);
>         if (IS_ERR(rt1011->regmap)) {
>                 ret = PTR_ERR(rt1011->regmap);
> diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
> index 3f7dea1191ad..68fadc15fa8c 100644
> --- a/sound/soc/codecs/rt1011.h
> +++ b/sound/soc/codecs/rt1011.h
> @@ -690,6 +690,7 @@ struct rt1011_priv {
>
>         int bq_drc_set;
>         unsigned int r0_reg, cali_done;
> +       unsigned int r0_calib, temperature_calib;
>         int recv_spk_mode;
>  };
>
> --
> 2.23.0
>
FYI, the relevant coreboot patch series is at
https://review.coreboot.org/c/coreboot/+/36031
I have tested it with coreboot changes.

Tested-By: Cheng-Yi Chiang <cychiang@chromium.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
