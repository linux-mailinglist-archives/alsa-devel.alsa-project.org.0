Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC49C417F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 22:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E919B1679;
	Tue,  1 Oct 2019 22:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E919B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569960051;
	bh=OIiinHpkgPOhy9r+0EgRplU4VBvsY7sv9T2QknLBXgI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jXybxu5CU8NHoWzeDTRXN9TFtBAUdASgxEL778x2dkJekRD1K8ZegXDqXjDm+hO//
	 m4PfXJLQxXjOve4dBeYEg+CREjHhBtbTnnn4OYTwqgbiYzDCI8BQoKk97Sp2nYOjei
	 AJQKpUxnED9Fk5oyfpwepJh2HB0JPTsY/pgvDdzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38EC6F80519;
	Tue,  1 Oct 2019 21:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83DDDF80506; Tue,  1 Oct 2019 21:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92E75F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 21:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E75F80482
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 12:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="275104484"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 01 Oct 2019 12:58:54 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iFOIQ-0001mv-6t; Wed, 02 Oct 2019 03:58:54 +0800
Date: Wed, 2 Oct 2019 03:58:27 +0800
From: kbuild test robot <lkp@intel.com>
To: Frank Shi <shifu0704@thundersoft.com>
Message-ID: <201910020324.zQlF5uUA%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.5 32/32]
 sound/soc/codecs/tas2770.c:211:14: sparse: sparse: restricted
 snd_pcm_format_t degrades to integer
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5
head:   1a476abc723e644248dba975b71122fcf878703b
commit: 1a476abc723e644248dba975b71122fcf878703b [32/32] tas2770: add tas2770 smart PA kernel driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-37-gd466a02-dirty
        git checkout 1a476abc723e644248dba975b71122fcf878703b
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> sound/soc/codecs/tas2770.c:211:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/tas2770.c:218:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/tas2770.c:225:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/soc/codecs/tas2770.c:361:58: sparse: sparse: incorrect type in argument 2 (different base types) @@    expected int bitwidth @@    got restricted snd_pcm_formint bitwidth @@
>> sound/soc/codecs/tas2770.c:361:58: sparse:    expected int bitwidth
>> sound/soc/codecs/tas2770.c:361:58: sparse:    got restricted snd_pcm_format_t

vim +211 sound/soc/codecs/tas2770.c

   204	
   205	static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
   206	{
   207		int ret;
   208		struct snd_soc_component *component = tas2770->component;
   209	
   210		switch (bitwidth) {
 > 211		case SNDRV_PCM_FORMAT_S16_LE:
   212			ret = snd_soc_component_update_bits(component,
   213				TAS2770_TDM_CFG_REG2,
   214				TAS2770_TDM_CFG_REG2_RXW_MASK,
   215				TAS2770_TDM_CFG_REG2_RXW_16BITS);
   216			tas2770->v_sense_slot = tas2770->i_sense_slot + 2;
   217			break;
   218		case SNDRV_PCM_FORMAT_S24_LE:
   219			ret = snd_soc_component_update_bits(component,
   220				TAS2770_TDM_CFG_REG2,
   221				TAS2770_TDM_CFG_REG2_RXW_MASK,
   222				TAS2770_TDM_CFG_REG2_RXW_24BITS);
   223			tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
   224			break;
   225		case SNDRV_PCM_FORMAT_S32_LE:
   226			ret = snd_soc_component_update_bits(component,
   227				TAS2770_TDM_CFG_REG2,
   228				TAS2770_TDM_CFG_REG2_RXW_MASK,
   229				TAS2770_TDM_CFG_REG2_RXW_32BITS);
   230			tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
   231			break;
   232	
   233		default:
   234			return -EINVAL;
   235		}
   236	
   237		tas2770->channel_size = bitwidth;
   238	
   239		ret = snd_soc_component_update_bits(component,
   240			TAS2770_TDM_CFG_REG5,
   241			TAS2770_TDM_CFG_REG5_VSNS_MASK |
   242			TAS2770_TDM_CFG_REG5_50_MASK,
   243			TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
   244			tas2770->v_sense_slot);
   245		if (ret)
   246			goto end;
   247		ret = snd_soc_component_update_bits(component,
   248			TAS2770_TDM_CFG_REG6,
   249			TAS2770_TDM_CFG_REG6_ISNS_MASK |
   250			TAS2770_TDM_CFG_REG6_50_MASK,
   251			TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
   252			tas2770->i_sense_slot);
   253	
   254	end:
   255		return ret;
   256	}
   257	
   258	static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
   259	{
   260		int ret;
   261		struct snd_soc_component *component = tas2770->component;
   262	
   263		switch (samplerate) {
   264		case 48000:
   265			ret = snd_soc_component_update_bits(component,
   266				TAS2770_TDM_CFG_REG0,
   267				TAS2770_TDM_CFG_REG0_SMP_MASK,
   268				TAS2770_TDM_CFG_REG0_SMP_48KHZ);
   269			if (ret)
   270				goto end;
   271			ret = snd_soc_component_update_bits(component,
   272				TAS2770_TDM_CFG_REG0,
   273				TAS2770_TDM_CFG_REG0_31_MASK,
   274				TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
   275			if (ret)
   276				goto end;
   277			break;
   278		case 44100:
   279			ret = snd_soc_component_update_bits(component,
   280				TAS2770_TDM_CFG_REG0,
   281				TAS2770_TDM_CFG_REG0_SMP_MASK,
   282				TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
   283			if (ret)
   284				goto end;
   285			ret = snd_soc_component_update_bits(component,
   286				TAS2770_TDM_CFG_REG0,
   287				TAS2770_TDM_CFG_REG0_31_MASK,
   288				TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
   289			if (ret)
   290				goto end;
   291			break;
   292		case 96000:
   293			ret = snd_soc_component_update_bits(component,
   294				TAS2770_TDM_CFG_REG0,
   295				TAS2770_TDM_CFG_REG0_SMP_MASK,
   296				TAS2770_TDM_CFG_REG0_SMP_48KHZ);
   297			if (ret)
   298				goto end;
   299			ret = snd_soc_component_update_bits(component,
   300				TAS2770_TDM_CFG_REG0,
   301				TAS2770_TDM_CFG_REG0_31_MASK,
   302				TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
   303			break;
   304		case 88200:
   305			ret = snd_soc_component_update_bits(component,
   306				TAS2770_TDM_CFG_REG0,
   307				TAS2770_TDM_CFG_REG0_SMP_MASK,
   308				TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
   309			if (ret)
   310				goto end;
   311			ret = snd_soc_component_update_bits(component,
   312				TAS2770_TDM_CFG_REG0,
   313				TAS2770_TDM_CFG_REG0_31_MASK,
   314				TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
   315			break;
   316		case 19200:
   317			ret = snd_soc_component_update_bits(component,
   318				TAS2770_TDM_CFG_REG0,
   319				TAS2770_TDM_CFG_REG0_SMP_MASK,
   320				TAS2770_TDM_CFG_REG0_SMP_48KHZ);
   321			if (ret)
   322				goto end;
   323			ret = snd_soc_component_update_bits(component,
   324				TAS2770_TDM_CFG_REG0,
   325				TAS2770_TDM_CFG_REG0_31_MASK,
   326				TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
   327			if (ret)
   328				goto end;
   329			break;
   330		case 17640:
   331			ret = snd_soc_component_update_bits(component,
   332				TAS2770_TDM_CFG_REG0,
   333				TAS2770_TDM_CFG_REG0_SMP_MASK,
   334				TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
   335			if (ret)
   336				goto end;
   337			ret = snd_soc_component_update_bits(component,
   338				TAS2770_TDM_CFG_REG0,
   339				TAS2770_TDM_CFG_REG0_31_MASK,
   340				TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
   341			break;
   342		default:
   343			ret = -EINVAL;
   344		}
   345	
   346	end:
   347		if (!ret)
   348			tas2770->sampling_rate = samplerate;
   349		return ret;
   350	}
   351	
   352	static int tas2770_hw_params(struct snd_pcm_substream *substream,
   353				     struct snd_pcm_hw_params *params,
   354				     struct snd_soc_dai *dai)
   355	{
   356		struct snd_soc_component *component = dai->component;
   357		struct tas2770_priv *tas2770 =
   358				snd_soc_component_get_drvdata(component);
   359		int ret;
   360	
 > 361		ret = tas2770_set_bitwidth(tas2770, params_format(params));
   362		if (ret < 0)
   363			goto end;
   364	
   365	
   366		ret = tas2770_set_samplerate(tas2770, params_rate(params));
   367	
   368	end:
   369		return ret;
   370	}
   371	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
