Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F00204D52E7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 21:10:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4C8171B;
	Thu, 10 Mar 2022 21:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4C8171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646943030;
	bh=v9lNYtuwxkdR8tqrCwcQj+z9gu5NaiWZsRYeVNcIarY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssbdzR4E7mRjNcgawmBCgMtjeWxOGd78S9XiQN5jwNa/95h0bq+z+kxRLoiTnjj63
	 8gx+RCxW5hiPkQx6/O2esPTA8cNHb7AB/PM64CvvCSJPZ3zRzudLy/lNOQOh0lfGOc
	 Ux+IiilurAiRPZLNEtupB+vAScBD4ep/MJHKTo1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F80F8013C;
	Thu, 10 Mar 2022 21:09:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13850F80137; Thu, 10 Mar 2022 21:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A087F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 21:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A087F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aH3StkmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646942954; x=1678478954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v9lNYtuwxkdR8tqrCwcQj+z9gu5NaiWZsRYeVNcIarY=;
 b=aH3StkmOeJAWktDFQpSvzElKbOnemWKO9uaW+jZRD4+giPLhZ4cqCXrp
 HQq/5FLEwi0KRz0KsbHb4vOm6RN6G7uJ+tKy4n0qqz8q/sDBMiUC0AMd/
 z17JBEgk3tnzoqF28h9TcTxu4z8VYQ09Tn9cO/76n3ZEvLHIQFp71Brv9
 j23dbBPy+EJdFneiHjZy+LsRLWErBwNuNMzU+JSFCCUSQ2A0muQZD7bpH
 geykU040EzZ5qnjD/bRkqYF2jK6TaTqs7yW5GoQzKUDTdjjfUO14bp+YZ
 duqOy1drV/sXSpEqKZ8FH0hef1xIHPbPJPZe22qszqNIZsJba62CgWwO3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316088380"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="316088380"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 12:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="611878880"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2022 12:09:01 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSP5o-0005L5-KO; Thu, 10 Mar 2022 20:09:00 +0000
Date: Fri, 11 Mar 2022 04:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Subject: Re: [v2 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <202203110306.b3pR7jQH-lkp@intel.com>
References: <20220310153707.29722-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310153707.29722-3-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, kbuild-all@lists.01.org,
 alsa-devel@alsa-project.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Hi Jiaxin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20220310]
[cannot apply to broonie-spi/for-next robh/for-next v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiaxin-Yu/ASoC-mediatek-mt8192-support-rt1015p_rt5682s/20220310-233935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220311/202203110306.b3pR7jQH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0342dabf16890d0fa839ccbedcb3fee8936cd749
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiaxin-Yu/ASoC-mediatek-mt8192-support-rt1015p_rt5682s/20220310-233935
        git checkout 0342dabf16890d0fa839ccbedcb3fee8936cd749
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/mediatek/mt8192/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c: In function 'mt8192_mt6359_dev_probe':
>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:1169:56: warning: too many arguments for format [-Wformat-extra-args]
    1169 |                         dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:1176:56: warning: too many arguments for format [-Wformat-extra-args]
    1176 |                         dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1169 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c

  1115	
  1116	static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
  1117	{
  1118		struct snd_soc_card *card;
  1119		struct device_node *platform_node, *hdmi_codec, *headset_codec, *speaker_codec;
  1120		int ret, i;
  1121		struct snd_soc_dai_link *dai_link;
  1122		struct mt8192_mt6359_priv *priv;
  1123		struct device *dev;
  1124	
  1125		card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
  1126		if (!card)
  1127			return -EINVAL;
  1128		card->dev = &pdev->dev;
  1129		dev = &pdev->dev;
  1130	
  1131		if (of_device_is_compatible(dev->of_node, RT1015P_RT5682_OF_NAME))
  1132			card->name = RT1015P_RT5682_CARD_NAME;
  1133		else if (of_device_is_compatible(dev->of_node, RT1015P_RT5682S_OF_NAME))
  1134			card->name = RT1015P_RT5682S_CARD_NAME;
  1135		else
  1136			dev_dbg(dev, "No need to set card name\n");
  1137	
  1138		platform_node = of_parse_phandle(dev->of_node, "mediatek,platform", 0);
  1139		if (!platform_node) {
  1140			ret = -EINVAL;
  1141			dev_err_probe(dev, ret, "Property 'platform' missing or invalid\n");
  1142			goto err_platform_node;
  1143		}
  1144	
  1145		hdmi_codec = of_parse_phandle(dev->of_node, "mediatek,hdmi-codec", 0);
  1146		if (!hdmi_codec) {
  1147			ret = -EINVAL;
  1148			dev_err_probe(dev, ret, "Property 'hdmi-codec' missing or invalid\n");
  1149			goto err_hdmi_codec;
  1150		}
  1151	
  1152		speaker_codec = of_get_child_by_name(dev->of_node, "mediatek,speaker-codec");
  1153		if (!speaker_codec) {
  1154			ret = -EINVAL;
  1155			dev_err_probe(dev, ret, "Property 'speaker_codec' missing or invalid\n");
  1156			goto err_speaker_codec;
  1157		}
  1158	
  1159		headset_codec = of_get_child_by_name(dev->of_node, "mediatek,headset-codec");
  1160		if (!headset_codec) {
  1161			ret = -EINVAL;
  1162			dev_err_probe(dev, ret, "Property 'headset_codec' missing or invalid\n");
  1163			goto err_headset_codec;
  1164		}
  1165	
  1166		for_each_card_prelinks(card, i, dai_link) {
  1167			ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
  1168			if (ret) {
> 1169				dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
  1170					      __func__, dai_link->name);
  1171				goto err_probe;
  1172			}
  1173	
  1174			ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
  1175			if (ret) {
  1176				dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
  1177					      __func__, dai_link->name);
  1178				goto err_probe;
  1179			}
  1180	
  1181			ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
  1182			if (ret) {
  1183				dev_err_probe(&pdev->dev, ret, "%s set %s headset_codec fail\n",
  1184					      __func__, dai_link->name);
  1185				goto err_probe;
  1186			}
  1187	
  1188			if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
  1189				dai_link->codecs->of_node = hdmi_codec;
  1190				dai_link->ignore = 0;
  1191			}
  1192	
  1193			if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
  1194				dai_link->ops = &mt8192_rt1015_i2s_ops;
  1195	
  1196			if (!dai_link->platforms->name)
  1197				dai_link->platforms->of_node = platform_node;
  1198		}
  1199	
  1200		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
  1201		if (!priv) {
  1202			ret = -ENOMEM;
  1203			goto err_probe;
  1204		}
  1205		snd_soc_card_set_drvdata(card, priv);
  1206	
  1207		ret = mt8192_afe_gpio_init(&pdev->dev);
  1208		if (ret) {
  1209			dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
  1210			goto err_probe;
  1211		}
  1212	
  1213		ret = devm_snd_soc_register_card(&pdev->dev, card);
  1214		if (ret)
  1215			dev_err_probe(&pdev->dev, ret,
  1216				      "%s snd_soc_register_card fail\n", __func__);
  1217	
  1218	err_probe:
  1219		of_node_put(headset_codec);
  1220	err_headset_codec:
  1221		of_node_put(speaker_codec);
  1222	err_speaker_codec:
  1223		of_node_put(hdmi_codec);
  1224	err_hdmi_codec:
  1225		of_node_put(platform_node);
  1226	err_platform_node:
  1227	
  1228		return ret;
  1229	}
  1230	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
