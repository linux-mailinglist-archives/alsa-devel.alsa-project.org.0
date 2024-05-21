Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A88CAC73
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 12:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16AD826;
	Tue, 21 May 2024 12:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16AD826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716288431;
	bh=bDGTQIbNuU6qDiiUTtPdQm0ymaZxO0OTHbB+zw8NqVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUI9t6xd7WryJ9eDXVHpfBCfnIQzMGw/k9c6Vcl9BWUm864TE8Xj1xoSsy2+GZTMS
	 26+NVvAdoLgEpG3+RwHPZ8dwFyHi+H3h0hFavC14DD6AyRPL5AShsn77FI+MBMthdT
	 76WK4xMgRlVjst5aSJKBdVAf9vZQn98ZEXYSBpio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B823F80589; Tue, 21 May 2024 12:46:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59ADCF805A1;
	Tue, 21 May 2024 12:46:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A206F8020D; Tue, 21 May 2024 12:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17C06F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 12:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17C06F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Mmr6ryfw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716288384; x=1747824384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDGTQIbNuU6qDiiUTtPdQm0ymaZxO0OTHbB+zw8NqVs=;
  b=Mmr6ryfw7nB9l9xozi6G2Q6Np9C0UKG79yCOBtiZ2pd7CBR9rhkQRrAs
   4szm9x7Jbz7X2SiOx8J/b0Eo7Ezgjl3BpMOsI+5QHP45FLDaW/I5hGc08
   kXAdwUR+PVqPqoQnw9qVpX0dp7WHufPDSnnyFzl/VJplS4C5XzFXX4uSq
   y/me0TV2vcT181j4h8j+spC972bGSQEkcFsa8mE/f7vHpSyQbVv7tdU3u
   n5YiTd8le2+YrBWOWbNTjc1HAjhR1zMgFDP/l47KHPKz99yFBUh6tHViF
   BMV7mq6fgEmSNVqz7kw2ffY/cMgvW2IolEApfkFto7jlcjFwoggrE/bet
   A==;
X-CSE-ConnectionGUID: z/T1B6ToQMGzKDAgU7BlMw==
X-CSE-MsgGUID: g5DwhDjbRnaaEtWlSZQIOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11629503"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000";
   d="scan'208";a="11629503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:46:21 -0700
X-CSE-ConnectionGUID: Ec61e1E7SDOnvg/9Ah+dqA==
X-CSE-MsgGUID: mj2BKImBTxWfm+JEvhDBOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000";
   d="scan'208";a="32991818"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2024 03:46:18 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9N0Z-0006I4-2d;
	Tue, 21 May 2024 10:46:15 +0000
Date: Tue, 21 May 2024 18:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com, mkumard@nvidia.com,
	spujar@nvidia.com
Subject: Re: [PATCH 2/2] ASoC: tegra: I2S client convert formats handling
Message-ID: <202405211805.UMAdiH0d-lkp@intel.com>
References: <20240520114902.1663695-3-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520114902.1663695-3-spujar@nvidia.com>
Message-ID-Hash: 7XAMP3CE5OKPB72UETF66ATS6F2WRBSV
X-Message-ID-Hash: 7XAMP3CE5OKPB72UETF66ATS6F2WRBSV
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XAMP3CE5OKPB72UETF66ATS6F2WRBSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Sameer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tegra/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.9 next-20240521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sameer-Pujar/ASoC-simple-card-utils-Split-simple_fixup_sample_fmt-func/20240520-195311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240520114902.1663695-3-spujar%40nvidia.com
patch subject: [PATCH 2/2] ASoC: tegra: I2S client convert formats handling
config: arm-randconfig-r122-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211805.UMAdiH0d-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240521/202405211805.UMAdiH0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211805.UMAdiH0d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/tegra/tegra210_i2s.c:640:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int sample_format @@     got restricted snd_pcm_format_t @@
   sound/soc/tegra/tegra210_i2s.c:640:23: sparse:     expected unsigned int sample_format
   sound/soc/tegra/tegra210_i2s.c:640:23: sparse:     got restricted snd_pcm_format_t
>> sound/soc/tegra/tegra210_i2s.c:649:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/tegra/tegra210_i2s.c:654:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/tegra/tegra210_i2s.c:659:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer

vim +640 sound/soc/tegra/tegra210_i2s.c

   599	
   600	static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
   601					  struct snd_pcm_hw_params *params,
   602					  struct snd_soc_dai *dai)
   603	{
   604		struct device *dev = dai->dev;
   605		struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
   606		unsigned int sample_size, channels, srate, val, reg, path;
   607		struct tegra_cif_conf cif_conf;
   608		unsigned int sample_format;
   609	
   610		memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
   611	
   612		channels = params_channels(params);
   613		if (channels < 1) {
   614			dev_err(dev, "invalid I2S %d channel configuration\n",
   615				channels);
   616			return -EINVAL;
   617		}
   618	
   619		cif_conf.audio_ch = channels;
   620		cif_conf.client_ch = channels;
   621		if (i2s->client_channels)
   622			cif_conf.client_ch = i2s->client_channels;
   623	
   624		/* AHUB CIF Audio bits configs */
   625		switch (params_format(params)) {
   626		case SNDRV_PCM_FORMAT_S8:
   627			cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
   628			break;
   629		case SNDRV_PCM_FORMAT_S16_LE:
   630			cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
   631			break;
   632		case SNDRV_PCM_FORMAT_S32_LE:
   633			cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
   634			break;
   635		default:
   636			dev_err(dev, "unsupported params audio bit format!\n");
   637			return -EOPNOTSUPP;
   638		}
   639	
 > 640		sample_format = params_format(params);
   641		if (i2s->client_sample_format >= 0)
   642			sample_format = i2s->client_sample_format;
   643	
   644		/*
   645		 * Format of the I2S for sending/receiving the audio
   646		 * to/from external device.
   647		 */
   648		switch (sample_format) {
 > 649		case SNDRV_PCM_FORMAT_S8:
   650			val = I2S_BITS_8;
   651			sample_size = 8;
   652			cif_conf.client_bits = TEGRA_ACIF_BITS_8;
   653			break;
   654		case SNDRV_PCM_FORMAT_S16_LE:
   655			val = I2S_BITS_16;
   656			sample_size = 16;
   657			cif_conf.client_bits = TEGRA_ACIF_BITS_16;
   658			break;
   659		case SNDRV_PCM_FORMAT_S32_LE:
   660			val = I2S_BITS_32;
   661			sample_size = 32;
   662			cif_conf.client_bits = TEGRA_ACIF_BITS_32;
   663			break;
   664		default:
   665			dev_err(dev, "unsupported client bit format!\n");
   666			return -EOPNOTSUPP;
   667		}
   668	
   669		/* Program sample size */
   670		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
   671				   I2S_CTRL_BIT_SIZE_MASK, val);
   672	
   673		srate = params_rate(params);
   674	
   675		/* For playback I2S RX-CIF and for capture TX-CIF is used */
   676		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
   677			path = I2S_RX_PATH;
   678		else
   679			path = I2S_TX_PATH;
   680	
   681		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
   682			unsigned int max_th;
   683	
   684			/* FIFO threshold in terms of frames */
   685			max_th = (I2S_RX_FIFO_DEPTH / cif_conf.audio_ch) - 1;
   686	
   687			if (i2s->rx_fifo_th > max_th)
   688				i2s->rx_fifo_th = max_th;
   689	
   690			cif_conf.threshold = i2s->rx_fifo_th;
   691	
   692			reg = TEGRA210_I2S_RX_CIF_CTRL;
   693		} else {
   694			reg = TEGRA210_I2S_TX_CIF_CTRL;
   695		}
   696	
   697		cif_conf.mono_conv = i2s->mono_to_stereo[path];
   698		cif_conf.stereo_conv = i2s->stereo_to_mono[path];
   699	
   700		tegra_set_cif(i2s->regmap, reg, &cif_conf);
   701	
   702		return tegra210_i2s_set_timing_params(dev, sample_size, srate,
   703						      cif_conf.client_ch);
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
