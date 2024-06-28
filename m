Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AC91C0B9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 16:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69019233F;
	Fri, 28 Jun 2024 16:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69019233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719584410;
	bh=X5an3abTWdvL8qtlTK3g1nKT+T6J9UFiLnTAbmQhG/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SB8xS6QC0ks1oI5U73GEDi7HUR8YJjxUHt400np+ceqN3bZxFE18+R4f27feqTUle
	 Rqdtd992XvWvZTDAA0tF3zLfCf6C2WDjrTpdyDr5/BketCddpiaTbbrgcvaywV+2c3
	 canltEgD7W4OvFyUTfif9CrWJBjvliv7xuAVU9Ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 789DDF805B0; Fri, 28 Jun 2024 16:19:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05644F805AF;
	Fri, 28 Jun 2024 16:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D824F80423; Fri, 28 Jun 2024 16:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A282F800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 16:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A282F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fVncJFBs
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-64361817e78so6531457b3.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719584251; x=1720189051;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DGMldhhxstZD2VHINPtgUkJtig9Dn80WfHZSFwMmp2Q=;
        b=fVncJFBs8F986zLwtyqYxbyux9J1s5GYiZt4icobb8vjQ858TkxtlnKCWXneIxEVcE
         MNXww3a8S0Wg1Eqetvsqsdcq5kJnI700T9YhWMJTmYdXktm/ClvP7pJroQ1FQkSMmW6f
         yIlhuN+r3MINc4FQt8mGKdE2j7DuoSlLCm/BSnK+eokUkIrwdUeoB/U5l02uJsPZd/Qa
         mhVNbbOr+ZG+F5OXNDJdt6+A53lOIXxVr1Oj6waUunAKazYYt+OSs3kgpkIybMctKiCq
         YjAf9DwJKjW0LAnJ9lzkoBJjd/qrMdczfh4egL4xAHOkzGOhAVlo4PyOvnRHT4//NXSX
         P63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584251; x=1720189051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGMldhhxstZD2VHINPtgUkJtig9Dn80WfHZSFwMmp2Q=;
        b=BH3CkdaDk3Cjtu7NFectesXU2aA2sovsDii1pNwpCcgo8f1/j5DKEiJDh5d/djA3ky
         nQGLeJ3lE+LEjpe9DEC5Wx9zj4wKjBo8Rz33lfBY92WhBrQLMJVFEs2QxjCjuS/7BEik
         IcnYiIRzKdaOdsOaV7lf7f+f738hO9ReG14cg2tx09aH/jgoU6/3G7A0dJV20glPe1R3
         C57GpiRBEAS7yO7R21hHSUy0cbOqYH/3wdO3dlZnuZ+IHxML5Uxk3TyZtPdV72PsCEko
         CVFcOxdKRa4p6VMZgMeicMUedL4Fmf3Wz6AAhtGLaHQVXfypyDyus7FK2cc8jFBH2eZH
         9sXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUVuoZWfBmpezqt8TfeQfdlRleKHmvOegu5X3Qe3IDFvMwBrN5qhCKtqS9Bv80F7tOMeTwsp7SWEa1h7kQH4FkX34Z3IsOlRTmDhM=
X-Gm-Message-State: AOJu0YyhXNkwuGMc6WLMiuL++U8ifMEZc5BwJrbDl6w5yLUSvHs/+B4E
	SAHS+Z4RO3jMnd3ZT2V2FqMGKWkRYjveQiFGN94GuBW2dp58RaMllOsFYnUHzFpv4d5BBHHhxZt
	LHvmmhF55Csze4w04kfXXKKEGhSL6eRlUYcEwXg==
X-Google-Smtp-Source: 
 AGHT+IEnqc4gKd8d3/4CtY+9Z2dX/nIjYsaIb1fXkGgwuAAIIiovBHfJVK2XUUGwxWXGgo5SDGMIF1irekTJMnwHlS8=
X-Received: by 2002:a81:de4d:0:b0:627:778f:b0a8 with SMTP id
 00721157ae682-643aba4654bmr165212747b3.42.1719584250582; Fri, 28 Jun 2024
 07:17:30 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
 <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
 <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
In-Reply-To: <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jun 2024 17:17:20 +0300
Message-ID: 
 <CAA8EJpq_2RUs3go6JZ+uVuJ5PJKzv0e2T8uS5QJMrB_JUAtNPw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: GZ4NIMN2GNA5Z3GPQZ3R6RASXHL43S3R
X-Message-ID-Hash: GZ4NIMN2GNA5Z3GPQZ3R6RASXHL43S3R
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZ4NIMN2GNA5Z3GPQZ3R6RASXHL43S3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jun 2024 at 11:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/06/2024 10:34, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
> >> The driver has static 'struct regmap_config', which is then customized
> >> depending on device version.  This works fine, because there should not
> >> be two devices in a system simultaneously and even less likely that such
> >> two devices would have different versions, thus different regmap config.
> >> However code is cleaner and more obvious when static data in the driver
> >> is also const - it serves as a template.
> >>
> >> Mark the 'struct regmap_config' as const and duplicate it in the probe()
> >> with devm_kmemdup to allow customizing per detected device variant.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
> >>  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >>
> >> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> >> index 59fe76b13cdb..3d8149665439 100644
> >> --- a/sound/soc/codecs/lpass-rx-macro.c
> >> +++ b/sound/soc/codecs/lpass-rx-macro.c
> >> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
> >>      return rx_is_rw_register(dev, reg);
> >>  }
> >>
> >> -static struct regmap_config rx_regmap_config = {
> >> +static const struct regmap_config rx_regmap_config = {
> >>      .name = "rx_macro",
> >>      .reg_bits = 16,
> >>      .val_bits = 32, /* 8 but with 32 bit read/write */
> >> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
> >>  static int rx_macro_probe(struct platform_device *pdev)
> >>  {
> >>      struct reg_default *reg_defaults;
> >> +    struct regmap_config *reg_config;
> >>      struct device *dev = &pdev->dev;
> >>      kernel_ulong_t flags;
> >>      struct rx_macro *rx;
> >> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
> >>              goto err;
> >>      }
> >>
> >> -    rx_regmap_config.reg_defaults = reg_defaults;
> >> -    rx_regmap_config.num_reg_defaults = def_count;
> >> +    reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
> >> +                              GFP_KERNEL);
> >> +    if (!reg_config) {
> >> +            ret = -ENOMEM;
> >> +            goto err;
> >> +    }
> >>
> >> -    rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> >> +    reg_config->reg_defaults = reg_defaults;
> >> +    reg_config->num_reg_defaults = def_count;
> >> +
> >> +    rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
> >>      if (IS_ERR(rx->regmap)) {
> >>              ret = PTR_ERR(rx->regmap);
> >>              goto err;
> >>      }
> >> +    devm_kfree(dev, reg_config);
> >>      devm_kfree(dev, reg_defaults);
> >
> > Seeing devm_kfree in the non-error path makes me feel strange. Maybe
> > it's one of the rare occasions when I can say that __free is suitable
> > here.
>
> These would have a bit different meaning in such case. The __free would
> not clean it in this spot, but on exit from the scope. I wanted to
> kfree() here, because the config (and reg_defaults) are not used by past
> regmap_init. I mentioned it briefly in previous patch msg.
>
> To me this code is readable and obvious - past this point nothing uses
> that allocation. However maybe instead of devm(), the code would be
> easier to read if non-devm-malloc + __free()?

Yes, that's what I was thinking about. But it's definitely an optional
topic. Your code is correct.


-- 
With best wishes
Dmitry
