Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C2C3E32
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 19:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCBFB167D;
	Tue,  1 Oct 2019 19:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCBFB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569949792;
	bh=pSGTbGJhVUkptdUAGxzwPtIgzd8FW2GQwi2YzNj9TWs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qY0DhCw8KmVoUI++P0/e2uUVfphMxztsvixVFHOisAedc9UKtlWL8wmwzb8jw4CmJ
	 JV2KbNR0osrkc0vRkjzIn4ZVzJY2T5jkyNF4pqXFRyLhLcaNBe9jsFQY1QiYCBnXvm
	 NfILg+SkKYJJbD2yqf0jqAjso/W1ljWj1G2WXF+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 031ABF80519;
	Tue,  1 Oct 2019 19:08:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2526F80506; Tue,  1 Oct 2019 19:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C2EF800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C2EF800DE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 10:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
 d="gz'50?scan'50,208,50";a="181755024"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 01 Oct 2019 10:07:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iFLcu-0006SB-9Y; Wed, 02 Oct 2019 01:07:52 +0800
Date: Wed, 2 Oct 2019 01:07:36 +0800
From: kbuild test robot <lkp@intel.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <201910020147.XEd5PAPo%lkp@intel.com>
References: <20191001123625.19370-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="372t5gyrnzy2ethg"
Content-Disposition: inline
In-Reply-To: <20191001123625.19370-3-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org,
 broonie@kernel.org, kbuild-all@01.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v3 RESEND 3/3] ASoC: samsung: Rename
	Arndale	card driver
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


--372t5gyrnzy2ethg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sylwester,

I love your patch! Yet something to improve:

[auto build test ERROR on asoc/for-next]
[cannot apply to v5.4-rc1 next-20191001]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sylwester-Nawrocki/ASoC-samsung-arndale-Simplify-DAI-link-initialization/20191002-000244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-allmodconfig (attached as .config)
compiler: mips-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from sound/soc/samsung/arndale.c:7:0:
>> sound/soc/samsung/arndale.c:201:25: error: 'arndale_of_match' undeclared here (not in a function); did you mean 'arndale_audio_of_match'?
    MODULE_DEVICE_TABLE(of, arndale_of_match);
                            ^
   include/linux/module.h:227:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                  ^~~~
>> include/linux/module.h:227:21: error: '__mod_of__arndale_of_match_device_table' aliased to undefined symbol 'arndale_of_match'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                        ^
>> sound/soc/samsung/arndale.c:201:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, arndale_of_match);
    ^~~~~~~~~~~~~~~~~~~
--
   In file included from sound/soc//samsung/arndale.c:7:0:
   sound/soc//samsung/arndale.c:201:25: error: 'arndale_of_match' undeclared here (not in a function); did you mean 'arndale_audio_of_match'?
    MODULE_DEVICE_TABLE(of, arndale_of_match);
                            ^
   include/linux/module.h:227:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                  ^~~~
>> include/linux/module.h:227:21: error: '__mod_of__arndale_of_match_device_table' aliased to undefined symbol 'arndale_of_match'
    extern typeof(name) __mod_##type##__##name##_device_table  \
                        ^
   sound/soc//samsung/arndale.c:201:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, arndale_of_match);
    ^~~~~~~~~~~~~~~~~~~

vim +201 sound/soc/samsung/arndale.c

d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26    6  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   @7  #include <linux/module.h>
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20    8  #include <linux/of_device.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26    9  #include <linux/platform_device.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   10  #include <linux/clk.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   11  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   12  #include <sound/soc.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   13  #include <sound/soc-dapm.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   14  #include <sound/pcm.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   15  #include <sound/pcm_params.h>
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   16  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   17  #include "../codecs/wm8994.h"
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   18  #include "i2s.h"
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   19  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   20  static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   21  				    struct snd_pcm_hw_params *params)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   22  {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   23  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   24  	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   25  	struct snd_soc_dai *codec_dai = rtd->codec_dai;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   26  	int rfs, ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   27  	unsigned long rclk;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   28  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   29  	rfs = 256;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   30  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   31  	rclk = params_rate(params) * rfs;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   32  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   33  	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   34  					0, SND_SOC_CLOCK_OUT);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   35  	if (ret < 0)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   36  		return ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   37  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   38  	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_RCLKSRC_0,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   39  					0, SND_SOC_CLOCK_OUT);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   40  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   41  	if (ret < 0)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   42  		return ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   43  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   44  	ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk, SND_SOC_CLOCK_OUT);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   45  	if (ret < 0)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   46  		return ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   47  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   48  	return 0;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   49  }
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   50  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   51  static struct snd_soc_ops arndale_rt5631_ops = {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   52  	.hw_params = arndale_rt5631_hw_params,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   53  };
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   54  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   55  static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   56  				    struct snd_pcm_hw_params *params)
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   57  {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   58  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   59  	struct snd_soc_dai *codec_dai = rtd->codec_dai;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   60  	unsigned int rfs, rclk;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   61  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   62  	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   63  	if (params_width(params) == 24)
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   64  		rfs = 384;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   65  	else if (params_rate(params) == 8000 || params_rate(params) == 11025)
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   66  		rfs = 512;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   67  	else
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   68  		rfs = 256;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   69  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   70  	rclk = params_rate(params) * rfs;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   71  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   72  	/*
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   73  	 * We add 1 to the frequency value to ensure proper EPLL setting
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   74  	 * for each audio sampling rate (see epll_24mhz_tbl in drivers/clk/
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   75  	 * samsung/clk-exynos5250.c for list of available EPLL rates).
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   76  	 * The CODEC uses clk API and the value will be rounded hence the MCLK1
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   77  	 * clock's frequency will still be exact multiple of the sample rate.
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   78  	 */
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   79  	return snd_soc_dai_set_sysclk(codec_dai, WM8994_SYSCLK_MCLK1,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   80  					rclk + 1, SND_SOC_CLOCK_IN);
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   81  }
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   82  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   83  static struct snd_soc_ops arndale_wm1811_ops = {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   84  	.hw_params = arndale_wm1811_hw_params,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   85  };
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   86  
930f74a171f5f3 sound/soc/samsung/arndale_rt5631.c Kuninori Morimoto  2019-06-06   87  SND_SOC_DAILINK_DEFS(rt5631_hifi,
930f74a171f5f3 sound/soc/samsung/arndale_rt5631.c Kuninori Morimoto  2019-06-06   88  	DAILINK_COMP_ARRAY(COMP_EMPTY()),
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   89  	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-aif1")),
a0e95c4d376d30 sound/soc/samsung/arndale_rt5631.c Kuninori Morimoto  2019-06-28   90  	DAILINK_COMP_ARRAY(COMP_EMPTY()));
930f74a171f5f3 sound/soc/samsung/arndale_rt5631.c Kuninori Morimoto  2019-06-06   91  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   92  static struct snd_soc_dai_link arndale_rt5631_dai[] = {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   93  	{
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   94  		.name = "RT5631 HiFi",
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   95  		.stream_name = "Primary",
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   96  		.dai_fmt = SND_SOC_DAIFMT_I2S
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   97  			| SND_SOC_DAIFMT_NB_NF
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26   98  			| SND_SOC_DAIFMT_CBS_CFS,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01   99  		.ops = &arndale_rt5631_ops,
930f74a171f5f3 sound/soc/samsung/arndale_rt5631.c Kuninori Morimoto  2019-06-06  100  		SND_SOC_DAILINK_REG(rt5631_hifi),
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  101  	},
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  102  };
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  103  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  104  SND_SOC_DAILINK_DEFS(wm1811_hifi,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  105  	DAILINK_COMP_ARRAY(COMP_EMPTY()),
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  106  	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  107  	DAILINK_COMP_ARRAY(COMP_EMPTY()));
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  108  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  109  static struct snd_soc_dai_link arndale_wm1811_dai[] = {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  110  	{
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  111  		.name = "WM1811 HiFi",
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  112  		.stream_name = "Primary",
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  113  		.dai_fmt = SND_SOC_DAIFMT_I2S
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  114  			| SND_SOC_DAIFMT_NB_NF
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  115  			| SND_SOC_DAIFMT_CBM_CFM,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  116  		.ops = &arndale_wm1811_ops,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  117  		SND_SOC_DAILINK_REG(wm1811_hifi),
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  118  	},
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  119  };
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  120  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  121  static struct snd_soc_card arndale_rt5631 = {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  122  	.name = "Arndale RT5631",
54d8697fa5036d sound/soc/samsung/arndale_rt5631.c Axel Lin           2015-08-21  123  	.owner = THIS_MODULE,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  124  	.dai_link = arndale_rt5631_dai,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  125  	.num_links = ARRAY_SIZE(arndale_rt5631_dai),
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  126  };
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  127  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  128  static struct snd_soc_card arndale_wm1811 = {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  129  	.name = "Arndale WM1811",
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  130  	.owner = THIS_MODULE,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  131  	.dai_link = arndale_wm1811_dai,
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  132  	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  133  };
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  134  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  135  static void arndale_put_of_nodes(struct snd_soc_card *card)
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  136  {
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  137  	struct snd_soc_dai_link *dai_link;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  138  	int i;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  139  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  140  	for_each_card_prelinks(card, i, dai_link) {
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  141  		of_node_put(dai_link->cpus->of_node);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  142  		of_node_put(dai_link->codecs->of_node);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  143  	}
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  144  }
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  145  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  146  static int arndale_audio_probe(struct platform_device *pdev)
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  147  {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  148  	struct device_node *np = pdev->dev.of_node;
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  149  	struct snd_soc_card *card;
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  150  	struct snd_soc_dai_link *dai_link;
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  151  	int ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  152  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  153  	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  154  	card->dev = &pdev->dev;
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  155  	dai_link = card->dai_link;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  156  
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  157  	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  158  	if (!dai_link->cpus->of_node) {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  159  		dev_err(&pdev->dev,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  160  			"Property 'samsung,audio-cpu' missing or invalid\n");
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  161  		return -EINVAL;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  162  	}
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  163  
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  164  	if (!dai_link->platforms->name)
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  165  		dai_link->platforms->of_node = dai_link->cpus->of_node;
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  166  
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  167  	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
bd728e26684606 sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  168  	if (!dai_link->codecs->of_node) {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  169  		dev_err(&pdev->dev,
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  170  			"Property 'samsung,audio-codec' missing or invalid\n");
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  171  		ret = -EINVAL;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  172  		goto err_put_of_nodes;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  173  	}
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  174  
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  175  	ret = devm_snd_soc_register_card(card->dev, card);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  176  	if (ret) {
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  177  		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  178  		goto err_put_of_nodes;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  179  	}
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  180  	return 0;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  181  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  182  err_put_of_nodes:
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  183  	arndale_put_of_nodes(card);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  184  	return ret;
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  185  }
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  186  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  187  static int arndale_audio_remove(struct platform_device *pdev)
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  188  {
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  189  	struct snd_soc_card *card = platform_get_drvdata(pdev);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  190  
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  191  	arndale_put_of_nodes(card);
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  192  	return 0;
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  193  }
fb629fa2587d0c sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-09-20  194  
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  195  static const struct of_device_id arndale_audio_of_match[] = {
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  196  	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  197  	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01  198  	{ .compatible = "samsung,arndale-wm1811",  .data = &arndale_wm1811 },
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  199  	{},
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  200  };
613da35b4aeddb sound/soc/samsung/arndale_rt5631.c Sylwester Nawrocki 2019-10-01 @201  MODULE_DEVICE_TABLE(of, arndale_of_match);
d683d0b690c134 sound/soc/samsung/arndale_rt5631.c Krishna Mohan Dani 2014-11-26  202  

:::::: The code at line 201 was first introduced by commit
:::::: 613da35b4aeddbee0c0a329e6911a7be4c7df854 ASoC: samsung: arndale: Add support for WM1811 CODEC

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--372t5gyrnzy2ethg
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
9C+g0pwNHOUDAA==

--372t5gyrnzy2ethg
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--372t5gyrnzy2ethg--
