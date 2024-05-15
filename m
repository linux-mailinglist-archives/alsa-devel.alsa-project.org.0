Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65368C79F8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 18:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C17E64;
	Thu, 16 May 2024 18:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C17E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715875279;
	bh=FJ2eBXbO8vpTkPzE8Mvt0pkkX4uGg4MxaYaeWNoJBDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VMsfb8wCjrSaREraVR4tBN62ycZutFO8uqJBx1jkH1xDUqt0qksJMT0e7njqNLvWw
	 jxXV1ngejZAflkqmACsVLkitQ7v/4mytVmW3uppvjhs/o1bAkBMfd+JpO1h/uNRWO/
	 FLQ+jm/lEa6y3b+SbYDiDgYfssSWlLwIn4IX9c0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D863CF805F4; Thu, 16 May 2024 18:00:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 372D6F805FD;
	Thu, 16 May 2024 18:00:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DA2DF80224; Wed, 15 May 2024 16:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEC36F800E9
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 16:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC36F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=au3VI82p
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e6f51f9de4so15538401fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 15 May 2024 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715783435; x=1716388235;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPgHPlPg4z/THFdqd+dmbhXF+tbKTikEHsl9ECbp00Q=;
        b=au3VI82p9GlDKU9gRcnoMCAj2XlfXyt+0Dxg782611HhY3PtKVKDEiqsAhMILTpCrZ
         p000qjHywll9qQF16KbCUs8BUdeKLNHHAwYR/Zo8UgS06tXrsm737RgmvR5SiJ05DHyV
         iBj6JzpNdou56p0Aw43OQ/M+snypX+V3YEdrMErQXLTaZ3nnykIOX0vW8W3iyqtX5aFS
         8g+bo/SqIfuQjBbCM74jOtNNRIfbIjT71G+AW0Mx4D2l0OeZlN7ywdgyQ/+jcKnRCjI2
         Zr3HT3dOCjs8eWWnYXtW/yjFz5APTti+31YeId1fAtEbn2Q3V2ehflmnY9vS+7OYcFSR
         CvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783435; x=1716388235;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPgHPlPg4z/THFdqd+dmbhXF+tbKTikEHsl9ECbp00Q=;
        b=WNedaLO49CGEdPe8ZreUHB4l3JSx2SbA6s/5/EHesldka9Bslbq8RdRrOZLBSxjw6E
         BUeyyfC616lUeD2egXYWnxIA7POuiiDOJTgj1CpDdQgHmnktqLb5lIxm1Jzlvylc5Vui
         fJWJJEJ2purfGDKo65B6maNwBXY+PTtz0VyBJz4Bf9tGnXuGnsn4wm1L6Rv/ChdJTGgf
         0wHmyutXpGd67VjXeKJOfs3A/KMQZ1BtfyEDDiBZ39Y6Luq/OMhUDzEDQJ82GdQei4I+
         cs6c986llFGweyOa2FYOkFEsLcX69PtIc9Os/TQIiApSGXJ4npTeZZN37l+OFo0yA2wf
         Uoew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjT+bc0DC4bUEDVyAe8BrdXr7pIYB56DbWdVKkNofaM0LGn4cm2Tu3QYxX0M+jzJAu6C5C6GLkB72gn7t2ysik412lO875sx+LJGQ=
X-Gm-Message-State: AOJu0Yz+q2vIrwWsSeuFj6HZWWz92HxTq/Hqh6TFl+SKsQndsQL0fsy/
	YfsXgXyMN7dXBV7Cqp7yS1VvU0MwG525YpF1jxZ09UsxNv19vG2jiWKHfe8Uxso=
X-Google-Smtp-Source: 
 AGHT+IE+5P0zdenKt93+/U2+iY3LaE7sw6f15UF3ChMBiwteWuyPu2HomrlVqtSp2lZaMUjtSnlRXQ==
X-Received: by 2002:a05:651c:149:b0:2e2:9842:a9d3 with SMTP id
 38308e7fff4ca-2e52039dc3emr129296701fa.46.1715783434087;
        Wed, 15 May 2024 07:30:34 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b2653bsm269958665e9.4.2024.05.15.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:30:33 -0700 (PDT)
Date: Wed, 15 May 2024 16:30:32 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6
 codec version
Message-ID: <38d2ba2d-5cea-4238-bcb8-9736d34e5e3c@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510175835.286775-3-srinivas.kandagatla@linaro.org>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Q7O7KPW6NLC5EWRAP5XLQCIBOKV6V7G2
X-Message-ID-Hash: Q7O7KPW6NLC5EWRAP5XLQCIBOKV6V7G2
X-Mailman-Approved-At: Thu, 16 May 2024 16:00:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7O7KPW6NLC5EWRAP5XLQCIBOKV6V7G2/>
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
patch link:    https://lore.kernel.org/r/20240510175835.286775-3-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6 codec version
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120902.nPmp732h-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405120902.nPmp732h-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/lpass-rx-macro.c:3899 rx_macro_probe() error: uninitialized symbol 'reg_defaults'.
sound/soc/codecs/lpass-rx-macro.c:3813 rx_macro_probe() warn: missing unwind goto?

vim +/reg_defaults +3899 sound/soc/codecs/lpass-rx-macro.c

af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3749  static int rx_macro_probe(struct platform_device *pdev)
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3750  {
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3751  	struct reg_default *reg_defaults;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3752  	struct device *dev = &pdev->dev;
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3753  	kernel_ulong_t flags;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3754  	struct rx_macro *rx;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3755  	void __iomem *base;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3756  	int ret, def_count;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3757  
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3758  	flags = (kernel_ulong_t)device_get_match_data(dev);
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3759  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3760  	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3761  	if (!rx)
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3762  		return -ENOMEM;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3763  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3764  	rx->macro = devm_clk_get_optional(dev, "macro");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3765  	if (IS_ERR(rx->macro))
f54e3474507427 Bjorn Andersson         2023-07-21  3766  		return dev_err_probe(dev, PTR_ERR(rx->macro), "unable to get macro clock\n");
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3767  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3768  	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3769  	if (IS_ERR(rx->dcodec))
f54e3474507427 Bjorn Andersson         2023-07-21  3770  		return dev_err_probe(dev, PTR_ERR(rx->dcodec), "unable to get dcodec clock\n");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3771  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3772  	rx->mclk = devm_clk_get(dev, "mclk");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3773  	if (IS_ERR(rx->mclk))
f54e3474507427 Bjorn Andersson         2023-07-21  3774  		return dev_err_probe(dev, PTR_ERR(rx->mclk), "unable to get mclk clock\n");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3775  
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3776  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
43b647d9940454 Srinivas Kandagatla     2022-02-24  3777  		rx->npl = devm_clk_get(dev, "npl");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3778  		if (IS_ERR(rx->npl))
f54e3474507427 Bjorn Andersson         2023-07-21  3779  			return dev_err_probe(dev, PTR_ERR(rx->npl), "unable to get npl clock\n");
492fe974fed075 Krzysztof Kozlowski     2023-03-13  3780  	}
43b647d9940454 Srinivas Kandagatla     2022-02-24  3781  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3782  	rx->fsgen = devm_clk_get(dev, "fsgen");
43b647d9940454 Srinivas Kandagatla     2022-02-24  3783  	if (IS_ERR(rx->fsgen))
f54e3474507427 Bjorn Andersson         2023-07-21  3784  		return dev_err_probe(dev, PTR_ERR(rx->fsgen), "unable to get fsgen clock\n");
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3785  
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3786  	rx->pds = lpass_macro_pds_init(dev);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3787  	if (IS_ERR(rx->pds))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  3788  		return PTR_ERR(rx->pds);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3789  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3790  	base = devm_platform_ioremap_resource(pdev, 0);
ddfd5345281466 Christophe JAILLET      2022-04-03  3791  	if (IS_ERR(base)) {
ddfd5345281466 Christophe JAILLET      2022-04-03  3792  		ret = PTR_ERR(base);
ddfd5345281466 Christophe JAILLET      2022-04-03  3793  		goto err;

reg_defaults is uninitialized here.

ddfd5345281466 Christophe JAILLET      2022-04-03  3794  	}
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3795  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3796  	rx->codec_version = lpass_macro_get_codec_version();
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3797  	switch (rx->codec_version) {
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3798  	case LPASS_CODEC_VERSION_2_6:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3799  		rx->rxn_reg_offset = 0xc0;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3800  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_6_defaults);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3801  		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3802  		if (!reg_defaults)
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3803  			return -ENOMEM;

need to call lpass_macro_pds_exit(rx->pds) before returning.

0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3804  		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3805  		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3806  				rx_2_6_defaults, sizeof(rx_2_6_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3807  		break;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3808  	default:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3809  		rx->rxn_reg_offset = 0x80;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3810  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_6_defaults);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3811  		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3812  		if (!reg_defaults)
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10 @3813  			return -ENOMEM;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3814  		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3815  		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3816  				rx_pre_2_6_defaults, sizeof(rx_pre_2_6_defaults));
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3817  		break;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3818  	}
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3819  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3820  	rx_regmap_config.reg_defaults = reg_defaults,
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3821  	rx_regmap_config.num_reg_defaults = def_count;
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3822  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3823  	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
ddfd5345281466 Christophe JAILLET      2022-04-03  3824  	if (IS_ERR(rx->regmap)) {
ddfd5345281466 Christophe JAILLET      2022-04-03  3825  		ret = PTR_ERR(rx->regmap);
ddfd5345281466 Christophe JAILLET      2022-04-03  3826  		goto err;
ddfd5345281466 Christophe JAILLET      2022-04-03  3827  	}
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3828  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3829  	dev_set_drvdata(dev, rx);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3830  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3831  	rx->dev = dev;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3832  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3833  	/* set MCLK and NPL rates */
43b647d9940454 Srinivas Kandagatla     2022-02-24  3834  	clk_set_rate(rx->mclk, MCLK_FREQ);
e7621434378c40 Srinivas Kandagatla     2023-02-09  3835  	clk_set_rate(rx->npl, MCLK_FREQ);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3836  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3837  	ret = clk_prepare_enable(rx->macro);
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3838  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3839  		goto err;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3840  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3841  	ret = clk_prepare_enable(rx->dcodec);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3842  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3843  		goto err_dcodec;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3844  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3845  	ret = clk_prepare_enable(rx->mclk);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3846  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3847  		goto err_mclk;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3848  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3849  	ret = clk_prepare_enable(rx->npl);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3850  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3851  		goto err_npl;
43b647d9940454 Srinivas Kandagatla     2022-02-24  3852  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3853  	ret = clk_prepare_enable(rx->fsgen);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3854  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3855  		goto err_fsgen;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3856  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3857  	/* reset swr block  */
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3858  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3859  			   CDC_RX_SWR_RESET_MASK,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3860  			   CDC_RX_SWR_RESET);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3861  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3862  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3863  			   CDC_RX_SWR_CLK_EN_MASK, 1);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3864  
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3865  	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3866  			   CDC_RX_SWR_RESET_MASK, 0);
ddffe3b82849ba Srinivas Kandagatla     2023-02-09  3867  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3868  	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3869  					      rx_macro_dai,
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3870  					      ARRAY_SIZE(rx_macro_dai));
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3871  	if (ret)
43b647d9940454 Srinivas Kandagatla     2022-02-24  3872  		goto err_clkout;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3873  
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3874  
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3875  	pm_runtime_set_autosuspend_delay(dev, 3000);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3876  	pm_runtime_use_autosuspend(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3877  	pm_runtime_mark_last_busy(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3878  	pm_runtime_set_active(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3879  	pm_runtime_enable(dev);
366ff79ed5392a Srinivas Kandagatla     2022-02-24  3880  
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3881  	ret = rx_macro_register_mclk_output(rx);
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3882  	if (ret)
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3883  		goto err_clkout;
1dc3459009c33e Srinivas Kandagatla     2023-02-09  3884  
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10  3885  	kfree(reg_defaults);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3886  	return 0;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3887  
43b647d9940454 Srinivas Kandagatla     2022-02-24  3888  err_clkout:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3889  	clk_disable_unprepare(rx->fsgen);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3890  err_fsgen:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3891  	clk_disable_unprepare(rx->npl);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3892  err_npl:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3893  	clk_disable_unprepare(rx->mclk);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3894  err_mclk:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3895  	clk_disable_unprepare(rx->dcodec);
43b647d9940454 Srinivas Kandagatla     2022-02-24  3896  err_dcodec:
43b647d9940454 Srinivas Kandagatla     2022-02-24  3897  	clk_disable_unprepare(rx->macro);
70a5e96bad5921 Srinivas Kandagatla     2022-02-24  3898  err:
0e15d4b2b2519d Srinivas Kandagatla     2024-05-10 @3899  	kfree(reg_defaults);
ddfd5345281466 Christophe JAILLET      2022-04-03  3900  	lpass_macro_pds_exit(rx->pds);
ddfd5345281466 Christophe JAILLET      2022-04-03  3901  
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3902  	return ret;
af3d54b99764f0 Srinivas Kandagatla     2021-02-11  3903  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

