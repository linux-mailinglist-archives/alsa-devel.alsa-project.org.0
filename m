Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC247A4DAA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6FCA4A;
	Mon, 18 Sep 2023 17:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6FCA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052623;
	bh=ndmBwtEFyfBbohOEirBUcplVi/Y/pcJBE8b0VyWaMlk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=e9/pZJE4lzc93Wk2U6GxsYkesS6g/icInLLINnDnx1kL0J/fvgF9zkYpqxM3cQ8sU
	 0i43ZQpSQWD7Rsi7s/6erPmQlCjYMRUwMYR6pegBbbIiDBRH5pQyJKHzRIsMDCy+/I
	 T0RT891B/aBjH/hASAs4JoE7019x4KSUyRf5DdvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F33F8025A; Mon, 18 Sep 2023 17:55:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D39F8025A;
	Mon, 18 Sep 2023 17:55:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12F78F80425; Fri, 15 Sep 2023 13:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42458F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42458F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yPIlY0Qj
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31ff1f3cde5so513700f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Sep 2023 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694776176; x=1695380976;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OIL8kgYAMfq0IMmuWMsYcVKfDNOQ2RMSRiPs/DxG1c=;
        b=yPIlY0QjWMspPUr3PJH7g8bqWiuYea7AdRsPz5/K6bZ6yZR8ApPubUfuYNaZ9LZ8UA
         mjYBB37II5Ds4Tqm4bWlg17C0NHYsAoT/TwUkQbQT0ooCrWeDJ2bVsvlDRsAL92Sli/Q
         rDmmPZjhtoi6lVNUWtc5Innm5+rmW/seENpmZibRO1Q0MR1rIZreP1ROdlSHAXmZD91E
         8RqBp6lOrEkwoN+VNcBOBOvpti1lko/HPWjsWaZNIghTTSx2rkOMsrJBmAhm+fGNCHpj
         IL9IF8LPhfpJcYmXFnt4TyCuMkjicwMwFc7W5qbWFjAmgNDGxDGa1M9owt7uJQ6ZugR9
         al/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694776176; x=1695380976;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OIL8kgYAMfq0IMmuWMsYcVKfDNOQ2RMSRiPs/DxG1c=;
        b=CPhqJ1xiGd0F4gRrdoztdiR3dsQxddBULsm1a5w6h8N+2ngUhwccnhaM2SiXYfogUz
         c2Z581BJ1s/LT1zz+APU5MgyaCIfwDSWDRD7yAFGCpolHqXVqGZgxTbhp33kEDaCYfkt
         BpiyzD0XNO6VthitFSMMJxZrsMB5v3x5L+vEMx8rJi34geDaVUL47S3R+nr16QtHD+u7
         mMraxPB294bueFNV7iVeQecuGMwzGGWoWY6RhfUVcvgG7lXdPlWIRAMwFtP1Rv4pST1s
         32cQQyoQOizgmCfF+Ejmaq0cNoFHLBHLIIYHFFGYAQGzK33z9mpwYjzjQyYr1SoGZWiT
         cu1g==
X-Gm-Message-State: AOJu0YwQd1Gal0JJDlC5ZJ0WHAc6PkvZ+5kU5w1aG1IAj1+mBWngJfEV
	x4dh5hTQbB6YyC6LbTj8CLOl0w==
X-Google-Smtp-Source: 
 AGHT+IFWqXSEBtAjtwZTwHrGfjiAaO3XLBvj9oZD7BkcgWwCkBqMUsXUJ6PIdIqFxspMg0Vne4EfBQ==
X-Received: by 2002:a5d:5149:0:b0:319:62e0:f2fe with SMTP id
 u9-20020a5d5149000000b0031962e0f2femr1209037wrt.36.1694776176449;
        Fri, 15 Sep 2023 04:09:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y14-20020a5d4ace000000b003176eab8868sm4221771wrs.82.2023.09.15.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 04:09:36 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:09:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
Message-ID: <6dcf84d9-aff9-406e-95b6-2ab217d3003e@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BGAABSL57FJ66WSSUZZK5Z5J5E3YKIBA
X-Message-ID-Hash: BGAABSL57FJ66WSSUZZK5Z5J5E3YKIBA
X-Mailman-Approved-At: Mon, 18 Sep 2023 15:55:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGAABSL57FJ66WSSUZZK5Z5J5E3YKIBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Kuninori,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple-card-utils-fixup-simple_util_startup-error-handling/20230915-071518
base:   linus/master
patch link:    https://lore.kernel.org/r/87zg1opcwt.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup() error handling
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309151840.au9Aa2W4-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:313 asoc_simple_startup() warn: missing error code 'ret'

vim +/ret +313 sound/soc/generic/simple-card-utils.c

f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  279  int asoc_simple_startup(struct snd_pcm_substream *substream)
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  280  {
9ae035e289379b Kuninori Morimoto 2020-07-20  281  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  282  	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  283  	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  284  	struct asoc_simple_dai *dai;
5ca2ab4598179a Robert Hancock    2022-01-20  285  	unsigned int fixed_sysclk = 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  286  	int i1, i2, i;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  287  	int ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  288  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  289  	for_each_prop_dai_cpu(props, i1, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  290  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  291  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  292  			goto cpu_err;
5ca2ab4598179a Robert Hancock    2022-01-20  293  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  294  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  295  			goto cpu_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  296  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  297  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  298  	for_each_prop_dai_codec(props, i2, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  299  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  300  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  301  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  302  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  303  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  304  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  305  	}
5ca2ab4598179a Robert Hancock    2022-01-20  306  
5ca2ab4598179a Robert Hancock    2022-01-20  307  	if (fixed_sysclk && props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  308  		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
5ca2ab4598179a Robert Hancock    2022-01-20  309  
5ca2ab4598179a Robert Hancock    2022-01-20  310  		if (fixed_sysclk % props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  311  			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
5ca2ab4598179a Robert Hancock    2022-01-20  312  				fixed_sysclk, props->mclk_fs);
2f7ac863515034 Kuninori Morimoto 2023-09-14 @313  			goto codec_err;

error code?

5ca2ab4598179a Robert Hancock    2022-01-20  314  		}
5ca2ab4598179a Robert Hancock    2022-01-20  315  		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
5ca2ab4598179a Robert Hancock    2022-01-20  316  			fixed_rate, fixed_rate);
635071f5fee315 Robert Hancock    2023-06-01  317  		if (ret < 0)
5ca2ab4598179a Robert Hancock    2022-01-20  318  			goto codec_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  319  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  320  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  321  	return 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  322  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  323  codec_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  324  	for_each_prop_dai_codec(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  325  		if (i >= i2)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  326  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  327  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  328  	}
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  329  cpu_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  330  	for_each_prop_dai_cpu(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  331  		if (i >= i1)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  332  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  333  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  334  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  335  	return ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  336  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

