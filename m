Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086228068FE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB77EDF1;
	Wed,  6 Dec 2023 08:55:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB77EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701849352;
	bh=Vk5U9uWnHSRqYVR55S41M+SXB4BdimiVcOHnwYsY6og=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vqHs9YwdYLG4TLbHjZC4t3EgHyh8YbDJ03tzx4c6gdHoPhtM1g9BXVxZjIIlGaAIe
	 rOqRIizv4z0uH6bqG4u9CanpoV+h2/ruvomVESG08UBRiGwxK4HcPIH60zgfqFhe9M
	 QpHZyCXzH61oxxOdkTec+oQKegkcef65Z8IqWUek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB7AF805B2; Wed,  6 Dec 2023 08:55:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6616F805BA;
	Wed,  6 Dec 2023 08:55:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AADA8F8025A; Wed,  6 Dec 2023 06:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C80E1F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 06:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C80E1F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rE2wQFBs
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso43215625e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 21:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701841153; x=1702445953;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4u7u9EhMLinCMKXbsJZZCgBovG/kdzoMMlzODKZOcY=;
        b=rE2wQFBsD3FSzlBYMo67IYuEeOklW2Gh//ECpF0XKRv4OxOkoMEbSX6xX330nq44kE
         4kinHoQib2hveTAPUggrHfEYyb8fBgZJeWmVxCIRZwhXju1cPJWUbiDw87mMemlHLnys
         d7Rya7kKk3g2eTvH5NPzRUmNI5TTCHUgr14Pq+ixVIeMgwVgoKglIJ6u4ElmTB4o10qd
         +z/j2JQM9IxFvshwjrlrVkA2OMDBpS5zYYQ7jdqLWHszclCS1OSIk6pnihI5GYxfQQPR
         CxWFAQ8RgqaUOCtl/BLwf1wqM/iSLzldpdWkY4MS7Tj5D21En3WARe1kNe1sVZaegSYh
         yAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701841153; x=1702445953;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4u7u9EhMLinCMKXbsJZZCgBovG/kdzoMMlzODKZOcY=;
        b=gXLllNmeEk3oG6jnhGcUcyj/PzI521GfT68tIkN2v0O22INN2Zv4lklM0BjQowrSoo
         Vk1QS+9aA0qDKmCUSkHel1m7ikHpPYz93SBgqw35Avd6Ra2xtfM2hGZGLmptuqR0L3oA
         wNM+hJZJ/2Sc8Keg/bPHIYf9NOeJ8tNZtg9qsn9c48W/jca+E9xJ3QMGkRtP/7Qj/Qaf
         NCPENz197z2CL7YQ2XBamBs68xPLOUhBKm36ixaXBUSDvv7bJOcimwOvEvLtQXM0EEKr
         XxijHe3kuvuZQVg+vScmLwULZ0xkY1NgyuI7rMDgn9rFaTTR+I0GvL8gaPF90MbseZwT
         8fbQ==
X-Gm-Message-State: AOJu0YwNcBoXCQwn2rQI1PjgJjuoA4ZZn3AO13TcRW4S9HNy6Tx8TIFI
	LXw9VzDLdoz4uuwoijGCy82MnA==
X-Google-Smtp-Source: 
 AGHT+IFAy6YDNnloe+CZg+064fYW1hphxl7Aimv9oj+A8PdlsOtVdmaSug/MC0yOqj37RYmzI49Gwg==
X-Received: by 2002:a05:600c:4f15:b0:40c:192f:6ae8 with SMTP id
 l21-20020a05600c4f1500b0040c192f6ae8mr258952wmq.115.1701841153488;
        Tue, 05 Dec 2023 21:39:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 fs16-20020a05600c3f9000b0040b48690c49sm20593171wmb.6.2023.12.05.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:39:13 -0800 (PST)
Date: Wed, 6 Dec 2023 08:39:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <1a09512c-aaff-4fb6-914e-db755ce6e667@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa@linaro.org>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CNGHI3BVOOER3AFNTS75DCMDQ72UPUPQ
X-Message-ID-Hash: CNGHI3BVOOER3AFNTS75DCMDQ72UPUPQ
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:41:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Neil,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-dt-bindings-document-WCD939x-Audio-Codec/20231202-000916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-5-94ed814b25aa%40linaro.org
patch subject: [PATCH v2 5/5] ASoC: codecs: Add WCD939x Codec driver
config: powerpc64-randconfig-r081-20231204 (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060127.FLhplIP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312060127.FLhplIP3-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/wcd939x.c:3168 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3221 wcd939x_swap_gnd_mic() warn: signedness bug returning '(-22)'

Old smatch warnings:
sound/soc/codecs/wcd939x.c:3170 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3173 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3174 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3176 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3177 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()
sound/soc/codecs/wcd939x.c:3179 wcd939x_typec_mux_set() error: 'wcd939x' dereferencing possible ERR_PTR()

vim +/wcd939x +3168 sound/soc/codecs/wcd939x.c

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3164  static int wcd939x_typec_mux_set(struct typec_mux_dev *mux,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3165  				 struct typec_mux_state *state)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3166  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3167  	struct wcd939x_priv *wcd939x = typec_mux_get_drvdata(mux);
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3168  	unsigned int previous_mode = wcd939x->typec_mode;

The Kconfig should probably depend on CONFIG_TYPEC to avoid a crash here.

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3169  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3170  	if (!wcd939x->wcd_mbhc)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3171  		return -EINVAL;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3172  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3173  	if (wcd939x->typec_mode != state->mode) {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3174  		wcd939x->typec_mode = state->mode;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3175  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3176  		if (wcd939x->typec_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3177  			return wcd_mbhc_typec_report_plug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3178  		else if (previous_mode == TYPEC_MODE_AUDIO)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3179  			return wcd_mbhc_typec_report_unplug(wcd939x->wcd_mbhc);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3180  	}
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3181  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3182  	return 0;
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3183  }

[ snip ]

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3216  static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3217  {
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3218  	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3219  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3220  	if (!wcd939x->typec_analog_mux || !wcd939x->typec_switch)
6c302e2f95b1d1 Neil Armstrong 2023-12-01 @3221  		return -EINVAL;

This is type bool.  return false?

6c302e2f95b1d1 Neil Armstrong 2023-12-01  3222  
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3223  	/* Report inversion via Type Switch of USBSS */
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3224  	return typec_switch_set(wcd939x->typec_switch,
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3225  				wcd939x->typec_orientation == TYPEC_ORIENTATION_REVERSE ?
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3226  					TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE);
6c302e2f95b1d1 Neil Armstrong 2023-12-01  3227  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

