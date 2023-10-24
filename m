Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819C7D56B8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 17:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2D41ED;
	Tue, 24 Oct 2023 17:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2D41ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698162133;
	bh=8xJTtk5SnUoXb46WK5pUEnLM/6wK8QowSM65zes46xM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WwdagWWd5UGUAdZn7uJ+298iRWHVNGp72d9VSYooeVZosS4XLKJiwjtYPSADASqfz
	 CPEeVSUKcwwQhDMqyECQ1vWmgUf/mky5TDB2ndLhUkl4sQ7OsjWq4dTW3MiJk9L9rJ
	 IEwrd2e+878tr6JWgpIv4Q0X46kkR3rDWLkHSwig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09C95F80165; Tue, 24 Oct 2023 17:41:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35568F8014B;
	Tue, 24 Oct 2023 17:41:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C84F80165; Tue, 24 Oct 2023 11:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16D68F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 11:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D68F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IB5Lq4wN
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso61130251fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698141038; x=1698745838;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRcJgtOXzZCq78BJkOWm+e6iKA7h9pUUytY6k6Mj9iQ=;
        b=IB5Lq4wNOpAFLrWQhE/gJg37n+3bV6a4ogvdZ/M6Lk1V8FnXpX7tEwydSF1LjKMslt
         YlB/HLeRnmMl2MMEdEOPm/tEWAc56C1/QqPoI6eKPoA+oKffMQ9ZQC0lAwUbeossKlth
         4xNH+7wutr+yyT1+kIVOCTcACwNSNkObxW+73mHlCBhUY/8lWp4kBAoO9QjddrsrMrOW
         4DdwG9SPh6MEJK/HWkN33g2MzbDA3SlmCcS9HVKNmgQTszlsffORUTUk6+txUe9rWq65
         WmM4KpxFawxRj8uVc6kSW9bls+xIoBBSZAmc4+FKCaf9cVkhkLlJc2GqWH89eG5LMCjI
         Q0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698141038; x=1698745838;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRcJgtOXzZCq78BJkOWm+e6iKA7h9pUUytY6k6Mj9iQ=;
        b=IY7BW99/SbTtybvzvxz+eaTUNwI9/FzE5w/TfbLe7t3ORoqZ86ZuBuJ/pRCx6i9NdG
         ieytR3yLoWqxgl7YcSeZlvzKAxwL6eiXHFMAE8H5WUKAfKxCqIj6D2zP0LMgZYnhNcLl
         Xgw4+qohF+vMoARVkZjhihD2a2ovVppLxG/BJWva+waqmm8r50K0wwba0V/bQ0zs3JUm
         0MgsSi2sZhU2wtPSvJ0diDyOXri0Bso19WEIDLb+uae28lf9UgYLK2DDep82S8Hod/Cq
         2xbZzTI9cZzzMswBv5XsrH2K41tfxiHjdyeN4VjQVMme+7gitvnuo9dqEcE80prm8iSY
         ShCA==
X-Gm-Message-State: AOJu0Yxj/aveN3hkUsSahinqYEgW6i3/DVWgjHeUizxdhPElIwlOAaWU
	Hq0bz4scM8aUT8r/Oaxaf7+lbg==
X-Google-Smtp-Source: 
 AGHT+IFiX19lnhtqPimlOxmYAB2b36pROe6pniV6FuuyFcIL6OHyN+w+nvbKah8C8imGEyU7/00BlQ==
X-Received: by 2002:a2e:3c0f:0:b0:2c0:a99:68e7 with SMTP id
 j15-20020a2e3c0f000000b002c00a9968e7mr7945677lja.19.1698141038514;
        Tue, 24 Oct 2023 02:50:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 x17-20020a5d60d1000000b0032d8f075810sm9609616wrt.10.2023.10.24.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:50:38 -0700 (PDT)
Date: Tue, 24 Oct 2023 12:50:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: xiazhengqiao@huaqin.corp-partner.google.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [bug report] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-ID: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O3WLPLY4GRBFLCTSTSWNYM4GCCM5BRRZ
X-Message-ID-Hash: O3WLPLY4GRBFLCTSTSWNYM4GCCM5BRRZ
X-Mailman-Approved-At: Tue, 24 Oct 2023 15:41:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3WLPLY4GRBFLCTSTSWNYM4GCCM5BRRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello xiazhengqiao,

The patch d88c43383101: "ASoC: mediatek:
mt8186_mt6366_rt1019_rt5682s: add rt5650 support" from Oct 19, 2023
(linux-next), leads to the following Smatch static checker warning:

	sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:198 mt8186_rt5682s_init()
	warn: does endianness matter for 'type'?

sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
    161 static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
    162 {
    163         struct snd_soc_component *cmpnt_afe =
    164                 snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
    165         struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
    166         struct mtk_soc_card_data *soc_card_data =
    167                 snd_soc_card_get_drvdata(rtd->card);
    168         struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
    169         struct snd_soc_jack *jack = &priv->headset_jack;
    170         struct snd_soc_component *cmpnt_codec =
    171                 snd_soc_rtd_to_codec(rtd, 0)->component;
    172         int ret;
    173         int type;
    174 
    175         ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
    176         if (ret) {
    177                 dev_err(rtd->dev, "Failed to set up shared clocks\n");
    178                 return ret;
    179         }
    180 
    181         ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
    182                                     SND_JACK_HEADSET | SND_JACK_BTN_0 |
    183                                     SND_JACK_BTN_1 | SND_JACK_BTN_2 |
    184                                     SND_JACK_BTN_3,
    185                                     jack, mt8186_jack_pins,
    186                                     ARRAY_SIZE(mt8186_jack_pins));
    187         if (ret) {
    188                 dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
    189                 return ret;
    190         }
    191 
    192         snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
    193         snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
    194         snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
    195         snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
    196 
    197         type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
--> 198         return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);

This is an unpublished Smatch check where I manually review casts to see
if they are correct.  Quite often they aren't because of an endian bug
or a 64 bit vs 32 bit issue.

Here it's not clear to me what's happening.  Normally with this sort of
pass a void pointer code, you can tie it very easily to the same driver.
But in this case it's much more difficult.

There are two functions which use the void *data pointer,
rt5640_set_jack() and rt5645_component_set_jack().  One takes an int and
the other takes a struct rt5640_set_jack_data pointer.  So presumably
we know that the cmpnt_codec->driver->set_jack points to
rt5645_component_set_jack().  But how do we know that?

Is there a trick for me as a reviewer to use?

    199 }

regards,
dan carpenter
