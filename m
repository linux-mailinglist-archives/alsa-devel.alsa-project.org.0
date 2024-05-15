Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6FA8C79F7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 18:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E64DFA;
	Thu, 16 May 2024 18:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E64DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715875268;
	bh=HG2E5ZzzY3Lbc+03GvuD+dWOrLJSMoB11TmWujlsBcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iVPFwnKJJquC2PI/9QuYVicdMeaphmeGotF4VL/xMLq/9M4cJMwIY/MFEgidovlOD
	 9u18sltyT7swirZ6Zf5UzR2pB26ic/FVVHADwZL6WbJ191WUbpGyigbwkc48vMFaqm
	 rNGkFVFvr7DWpXvHUdkykRikAwLBY4KX0ABKniEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4929AF805C3; Thu, 16 May 2024 18:00:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA63BF805AD;
	Thu, 16 May 2024 18:00:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36EA4F80224; Wed, 15 May 2024 16:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4367DF800E9
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 16:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4367DF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Iew4+SFk
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-420180b5898so21653355e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 15 May 2024 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715783282; x=1716388082;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpkv1XFXbjz013sYUtzM2chC9OslxeXahIcL6Fre16A=;
        b=Iew4+SFkIvsFSfQZaAm9PTPr0pPr0fpc5dtjyoGIzDp51kfb2jIWzQ0/KVQBMH+pVH
         0BSfJzygPkNd4UGi0cuw/efy6I8U8rbrZQOrItP1QDEdD3PyMbmDd9qao7f3Rq3vZfNt
         v9MD93YyaeCxsr556zcQg7xG9noxHx9X4+yWUIPK87EfCfJCXmrdEjgtMdS1YP4EZC++
         Qf7Oq2+2MLl04NL+p30Ul+BhKfsGEurBdXbt+vr10l8dzIGq4kyzosUg7qWClx4hxoSU
         B0Jpi4mGuAT/xMgik0c2QSiCpFUjOgsoM96huyf9VaSqZu/KL4KMdX/HixNmJs3Kmwfw
         DhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783282; x=1716388082;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zpkv1XFXbjz013sYUtzM2chC9OslxeXahIcL6Fre16A=;
        b=XHsHk2poOU9lRyOiDbaUL8H1qCPwvTaoSBjbPGmS+w1RZ/bVHTr6PKHonakmUr+s4z
         BHZ1WNJcOY1fc8ue9ojYqyVMLTMa+TkP491Wbq+bJfONAFSTJMMplw7ZxwuT9FMnagMb
         unMlhJGIpJVJHdDPn2oyOem5HYUvsdkubAUNoXJugE6NEwf3yzrHJFiyfWLer/eBmEoe
         QjVvpPfLyBpe7B1s6rdcfGr55R2j1HiGmnarKijTIfX+GZRJB5IgQNAuTyUBvW7AKjcU
         MYrBN9Uqvcima8Grq27H/LrlviwmoSsgySJoUD2/G0PbDgimXSBqRYzQSBUmacWVzNDb
         VrXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOWH5J5Ky4D3dVDOkXejV5/HsnPttqTIlswuovg5hgHIh1R8A+u40j1BgrIhrOzV05qVscHwT5DtZrAwejh6FQpxQrdoi4mAjDh+M=
X-Gm-Message-State: AOJu0YwzTrddGU8G2U4VzNcSSW4bJy6OzRqgjyCZgDB+jcEd2eDcIWwQ
	i5hvCYykLfR0cr8f3WOD34hsHPYGB+3zLey2k9eMNvBLYjAJFBWQi8Y63XXisLY=
X-Google-Smtp-Source: 
 AGHT+IEpa3TUE9I1rxGs398WImHaUYEZ/FcJ/c2lRyyHuQn6Pe5/4WN9tj8KS+nu2zboruPUmw5DXg==
X-Received: by 2002:a05:600c:4689:b0:420:509:714f with SMTP id
 5b1f17b1804b1-4200509728bmr104553345e9.14.1715783281672;
        Wed, 15 May 2024 07:28:01 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42014f563adsm122363295e9.38.2024.05.15.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:28:01 -0700 (PDT)
Date: Wed, 15 May 2024 16:28:00 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Message-ID: <d77a7d51-8357-4cc0-b233-be2e18d16908@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510175835.286775-2-srinivas.kandagatla@linaro.org>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZPWZ6RH3JWTFRB4EJUFWE46R7YOB765Y
X-Message-ID-Hash: ZPWZ6RH3JWTFRB4EJUFWE46R7YOB765Y
X-Mailman-Approved-At: Thu, 16 May 2024 16:00:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPWZ6RH3JWTFRB4EJUFWE46R7YOB765Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-codecs-lpass-macro-add-helpers-to-get-codec-version/20240511-020042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240510175835.286775-2-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec version
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120735.qbbiUPaX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405120735.qbbiUPaX-lkp@intel.com/

smatch warnings:
sound/soc/codecs/lpass-va-macro.c:1485 va_macro_set_lpass_codec_version() error: uninitialized symbol 'version'.

vim +/version +1485 sound/soc/codecs/lpass-va-macro.c

787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1464  static void va_macro_set_lpass_codec_version(struct va_macro *va)
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1465  {
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1466  	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1467  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1468  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1469  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1470  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1471  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1472  	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1473  		version = LPASS_CODEC_VERSION_2_0;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1474  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1475  		version = LPASS_CODEC_VERSION_2_1;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1476  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1477  		version = LPASS_CODEC_VERSION_2_5;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1478  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1479  		version = LPASS_CODEC_VERSION_2_6;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1480  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1481  		version = LPASS_CODEC_VERSION_2_7;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1482  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1483  		version = LPASS_CODEC_VERSION_2_8;

Uninitialized on else path.

787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1484  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10 @1485  	lpass_macro_set_codec_version(version);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1486  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1487  	dev_info(va->dev, "LPASS Codec Version %s\n",
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1488  			lpass_macro_get_codec_version_string(version));
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1489  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

