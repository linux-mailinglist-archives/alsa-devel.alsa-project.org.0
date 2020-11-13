Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D830A2B1F2C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 16:51:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07050187B;
	Fri, 13 Nov 2020 16:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07050187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605282660;
	bh=cuHUP07uQdyOX9AcjAfzHrWGd1nqdUFQLAtQcGcxeeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCcGcdAGdEjqWrGVEEyxp22j5YGorguCPG0De7L+MiqGUOsv48hYngEqXmA/EDlmm
	 TuAQN0IKOGThu2FhNRN5h+1ahj8iORW5pKkhRHnBLJpC2I/FF5EzuiDwnWQPaO4/e0
	 T31kgb8NMqy/wbbIycgR6SQd50CCV+atAmu4cBX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA3CF8020C;
	Fri, 13 Nov 2020 16:49:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD1A9F8020C; Fri, 13 Nov 2020 16:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 802D5F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 16:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 802D5F80086
IronPort-SDR: KTzNdME0n5KllkGEJgBccWuEN1kt1JJcTRldy+6iuVvu0wwsKFc6F0YjLCK5JeamSTJKKWiBk6
 oxTN8hew5bAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="149758587"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
 d="gz'50?scan'50,208,50";a="149758587"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 07:49:07 -0800
IronPort-SDR: y7w+qZwrfyUbj3GjtuiAVsbRDF7FE8DsJYzS3zH1k9p/2wR5bgu/R/vEO/iqjeUdYPyJZ3JvB7
 qgkQxrtXs0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
 d="gz'50?scan'50,208,50";a="355569701"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 13 Nov 2020 07:49:05 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kdbJw-0000QF-OP; Fri, 13 Nov 2020 15:49:04 +0000
Date: Fri, 13 Nov 2020 23:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jamie Meacham <Jamie.Meacham@onsemi.com>,
 "lgirwood@gmail.com" <lgirwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH] ona10iv: add ona10iv smart PA kernel driver
Message-ID: <202011132353.iKXBz3Rl-lkp@intel.com>
References: <DBDC5A1C646D0E44AAF2E13C59E2BADDBC95D502@usco01ws0032.ad.onsemi.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <DBDC5A1C646D0E44AAF2E13C59E2BADDBC95D502@usco01ws0032.ad.onsemi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jamie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on v5.10-rc3 next-20201113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jamie-Meacham/ona10iv-add-ona10iv-smart-PA-kernel-driver/20201105-004426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: xtensa-randconfig-s031-20201113 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-107-gaf3512a6-dirty
        # https://github.com/0day-ci/linux/commit/f91836c114d9be24432bbe5e0a968ebd8156a1c1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jamie-Meacham/ona10iv-add-ona10iv-smart-PA-kernel-driver/20201105-004426
        git checkout f91836c114d9be24432bbe5e0a968ebd8156a1c1
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=xtensa 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> sound/soc/codecs/ona10iv.c:256:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/ona10iv.c:260:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/ona10iv.c:264:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/ona10iv.c:265:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/soc/codecs/ona10iv.c:355:58: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int format @@     got restricted snd_pcm_format_t @@
>> sound/soc/codecs/ona10iv.c:355:58: sparse:     expected int format
>> sound/soc/codecs/ona10iv.c:355:58: sparse:     got restricted snd_pcm_format_t
>> sound/soc/codecs/ona10iv.c:358:46: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int param_val @@     got restricted snd_pcm_format_t @@
>> sound/soc/codecs/ona10iv.c:358:46: sparse:     expected int param_val
   sound/soc/codecs/ona10iv.c:358:46: sparse:     got restricted snd_pcm_format_t

vim +256 sound/soc/codecs/ona10iv.c

   245	
   246	static int ona10iv_set_bitwidth(struct ona10iv_priv *ona10iv, int format)
   247	{
   248		struct snd_soc_component *component = ona10iv->component;
   249		int slot_width, sample_width;
   250		int ret = 0;
   251	
   252		dev_dbg(component->dev,
   253				"ONA10IV-->set bitwidth for format: %d\n", format);
   254	
   255		switch (format) {
 > 256		case SNDRV_PCM_FORMAT_S16_LE:
   257			sample_width = ONA10IV_SAMPW_16;
   258			slot_width = ONA10IV_SLOTW_16;
   259			break;
   260		case SNDRV_PCM_FORMAT_S24_3LE:
   261			sample_width = ONA10IV_SAMPW_24;
   262			slot_width = ONA10IV_SLOTW_24;
   263			break;
   264		case SNDRV_PCM_FORMAT_S24_LE:
   265		case SNDRV_PCM_FORMAT_S32_LE:
   266			sample_width = ONA10IV_SAMPW_32;
   267			slot_width = ONA10IV_SLOTW_32;
   268			break;
   269		default:
   270			ret = -EINVAL;
   271		}
   272		param_errcheck(ret, component->dev,
   273					"error no case match for format", format);
   274	
   275		if (ret < 0)
   276			return ret;
   277	
   278		ret = snd_soc_component_update_bits(component,
   279					ONA10IV_REG_DAI_CTRL2, ONA10IV_SAMPW_MASK,
   280					sample_width);
   281		param_errcheck(ret, component->dev,
   282					"error writing sample width", sample_width);
   283		if (ret < 0)
   284			return ret;
   285	
   286		ret = snd_soc_component_update_bits(component,
   287					ONA10IV_REG_DAI_CTRL2, ONA10IV_SLOTW_MASK,
   288					slot_width);
   289		param_errcheck(ret, component->dev,
   290					"error writing slot width", slot_width);
   291		if (ret < 0)
   292			return ret;
   293	
   294		return 0;
   295	}
   296	
   297	static int ona10iv_set_samplerate(struct ona10iv_priv *ona10iv,
   298						int samplerate)
   299	{
   300		struct snd_soc_component *component = ona10iv->component;
   301		int rate_val;
   302		int ret = 0;
   303	
   304		dev_dbg(component->dev, "ONA10IV-->samplerate: %d\n", samplerate);
   305	
   306		switch (samplerate) {
   307		case 16000:
   308			rate_val = ONA10IV_FS_16KHZ;
   309			break;
   310		case 22050:
   311			rate_val = ONA10IV_FS_22KHZ;
   312			break;
   313		case 32000:
   314			rate_val = ONA10IV_FS_32KHZ;
   315			break;
   316		case 44100:
   317			rate_val = ONA10IV_FS_44KHZ;
   318			break;
   319		case 48000:
   320			rate_val = ONA10IV_FS_48KHZ;
   321			break;
   322		case 96000:
   323			rate_val = ONA10IV_FS_96KHZ;
   324			break;
   325		default:
   326			ret = -EINVAL;
   327		}
   328		param_errcheck(ret, component->dev,
   329					"error no case match for rate", samplerate);
   330		if (ret < 0)
   331			return ret;
   332	
   333		ret = snd_soc_component_update_bits(component,
   334					ONA10IV_REG_DAI_CTRL1, ONA10IV_FS_MASK,
   335					rate_val);
   336		param_errcheck(ret, component->dev,
   337					"error writing rate", rate_val);
   338		if (ret < 0)
   339			return ret;
   340	
   341		return 0;
   342	}
   343	
   344	static int ona10iv_hw_params(struct snd_pcm_substream *substream,
   345					 struct snd_pcm_hw_params *params,
   346					 struct snd_soc_dai *dai)
   347	{
   348		struct snd_soc_component *component = dai->component;
   349		struct ona10iv_priv *ona10iv =
   350					snd_soc_component_get_drvdata(component);
   351		int ret;
   352	
   353		dev_dbg(component->dev, "ONA10IV-->setting hw params\n");
   354	
 > 355		ret = ona10iv_set_bitwidth(ona10iv, params_format(params));
   356		param_errcheck(ret, component->dev,
   357					"error setting bitwidth for format",
 > 358					params_format(params));
   359		if (ret)
   360			return ret;
   361	
   362		ret = ona10iv_set_samplerate(ona10iv, params_rate(params));
   363		param_errcheck(ret, component->dev,
   364					"error setting rate", params_rate(params));
   365		if (ret)
   366			return ret;
   367	
   368		return 0;
   369	}
   370	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--9jxsPFA5p3P2qPhR
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
3OBK46pCBg5yv0nlvvhfLRcdK7orAgA=

--9jxsPFA5p3P2qPhR--
