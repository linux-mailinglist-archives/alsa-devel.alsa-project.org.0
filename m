Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365F5961BC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 20:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E888D1637;
	Tue, 16 Aug 2022 20:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E888D1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660672883;
	bh=EiqQzJcz9XK40Byh9bSZ1rCDF/xw20fVvoYBvRdfQHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GW975wEOoqMD/jrl9GjmR+RXg7R4o/ilr4rVisg8mG3/eoxW5ebF9KqmQA5IiG8TQ
	 KRENayL9T4Df9LzQZunBxP/pj1kJcsbegLJYlQ9piP0rM1hqlEeplIXz7BIi8XE9bu
	 a08OipH70cZNr5s++HUZdJVUlv0POLnjcYO8Hqdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 526BBF80424;
	Tue, 16 Aug 2022 20:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC4AF80082; Tue, 16 Aug 2022 20:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD5D5F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 20:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD5D5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aGy+BQ/l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E453B81A96;
 Tue, 16 Aug 2022 18:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FB3C433D6;
 Tue, 16 Aug 2022 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660672812;
 bh=EiqQzJcz9XK40Byh9bSZ1rCDF/xw20fVvoYBvRdfQHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGy+BQ/lhhKsxHfuY7cu1dNRRT0w91DSUyAIy1pfTZuWiBLq2IiUu5tUhdjrevsn8
 oXa/08fr4Bk7XuhSlGvkAAKWwFFLTdMPKOCpuY/br69ZL8+YOSqEqhhnR7LQkVu+Pv
 8M5/Rs/WbMEiug7/MDbymcSADJc0gmSQTmHb9bPCPGcWyLKo0O1+TdqbMZYAl3+zlp
 3seB0UqVy8U9jkMH+ws0q9RY9e0svfkBN8PqW7RQzmydPgJZgkfeTVsjaWwkZVCbbm
 yBWSeTry5SnImvGaO5Iaiql/3+AaOUg6nhiXpIEy1RMb1IeybhkNXMtu0n9ho71UOT
 xhsCBXPShVbeA==
Date: Tue, 16 Aug 2022 11:00:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202208090909.Pg0BZGie-lkp@intel.com>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, broonie@kernel.org
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

On Tue, Aug 09, 2022 at 09:49:38AM +0800, kernel test robot wrote:
> Hi Matt,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on tiwai-sound/for-next linus/master v5.19 next-20220808]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090909.Pg0BZGie-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/7a9219a8431d7740c0958e53078820cbfef4f3f7
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
>         git checkout 7a9219a8431d7740c0958e53078820cbfef4f3f7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

It doesn't look like these warnings were addressed before the change was
applied to -next as commit 4e6bedd3c396 ("ASoC: codecs: add support for
the TI SRC4392 codec"). I now see them in next-20220816.

> >> sound/soc/codecs/src4xxx.c:277:3: warning: variable 'd' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:294:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>                                                                            ^
>    sound/soc/codecs/src4xxx.c:221:20: note: initialize the variable 'd' to silence this warning
>            int val, pj, jd, d;
>                              ^
>                               = 0
> >> sound/soc/codecs/src4xxx.c:277:3: warning: variable 'jd' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:289:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>                                                                            ^~
>    sound/soc/codecs/src4xxx.c:221:17: note: initialize the variable 'jd' to silence this warning
>            int val, pj, jd, d;
>                           ^
>                            = 0
> >> sound/soc/codecs/src4xxx.c:277:3: warning: variable 'pj' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>                    default:
>                    ^~~~~~~
>    sound/soc/codecs/src4xxx.c:284:59: note: uninitialized use occurs here
>                    ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>                                                                            ^~
>    sound/soc/codecs/src4xxx.c:221:13: note: initialize the variable 'pj' to silence this warning
>            int val, pj, jd, d;
>                       ^
>                        = 0
>    3 warnings generated.
> --
> >> sound/soc/codecs/src4xxx-i2c.c:35:34: warning: unused variable 'src4xxx_of_match' [-Wunused-const-variable]
>    static const struct of_device_id src4xxx_of_match[] = {
>                                     ^
>    1 warning generated.
> 
> 
> vim +/d +277 sound/soc/codecs/src4xxx.c
> 
>    213	
>    214	static int src4xxx_hw_params(struct snd_pcm_substream *substream,
>    215				struct snd_pcm_hw_params *params,
>    216				struct snd_soc_dai *dai)
>    217	{
>    218		struct snd_soc_component *component = dai->component;
>    219		struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
>    220		unsigned int mclk_div;
>    221		int val, pj, jd, d;
>    222		int reg;
>    223		int ret;
>    224	
>    225		switch (dai->id) {
>    226		case SRC4XXX_PORTB:
>    227			reg = SRC4XXX_PORTB_CTL_06;
>    228			break;
>    229		default:
>    230			reg = SRC4XXX_PORTA_CTL_04;
>    231		}
>    232	
>    233		if (src4xxx->master[dai->id]) {
>    234			mclk_div = src4xxx->mclk_hz/params_rate(params);
>    235			if (src4xxx->mclk_hz != mclk_div*params_rate(params)) {
>    236				dev_err(component->dev,
>    237					"mclk %d / rate %d has a remainder.\n",
>    238					src4xxx->mclk_hz, params_rate(params));
>    239				return -EINVAL;
>    240			}
>    241	
>    242			val = ((int)mclk_div - 128) / 128;
>    243			if ((val < 0) | (val > 3)) {
>    244				dev_err(component->dev,
>    245					"div register setting %d is out of range\n",
>    246					val);
>    247				dev_err(component->dev,
>    248					"unsupported sample rate %d Hz for the master clock of %d Hz\n",
>    249					params_rate(params), src4xxx->mclk_hz);
>    250				return -EINVAL;
>    251			}
>    252	
>    253			/* set the TX DIV */
>    254			ret = regmap_update_bits(src4xxx->regmap,
>    255				SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
>    256				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
>    257			if (ret) {
>    258				dev_err(component->dev,
>    259					"Couldn't set the TX's div register to %d << %d = 0x%x\n",
>    260					val, SRC4XXX_TX_MCLK_DIV_SHIFT,
>    261					val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
>    262				return ret;
>    263			}
>    264	
>    265			/* set the PLL for the digital receiver */
>    266			switch (src4xxx->mclk_hz) {
>    267			case 24576000:
>    268				pj = 0x22;
>    269				jd = 0x00;
>    270				d = 0x00;
>    271				break;
>    272			case 22579200:
>    273				pj = 0x22;
>    274				jd = 0x1b;
>    275				d = 0xa3;
>    276				break;
>  > 277			default:
>    278				/* don't error out here,
>    279				 * other parts of the chip are still functional
>    280				 */
>    281				dev_info(component->dev,
>    282					"Couldn't set the RCV PLL as this master clock rate is unknown\n");

In the final commit, there is a 'break' here. Should it be a 'return 0'
instead? Or should there be a different fix for these warnings?

>    283			}
>    284			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>    285			if (ret < 0)
>    286				dev_err(component->dev,
>    287					"Failed to update PLL register 0x%x\n",
>    288					SRC4XXX_RCV_PLL_0F);
>  > 289			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>    290			if (ret < 0)
>    291				dev_err(component->dev,
>    292					"Failed to update PLL register 0x%x\n",
>    293					SRC4XXX_RCV_PLL_10);
>  > 294			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>    295			if (ret < 0)
>    296				dev_err(component->dev,
>    297					"Failed to update PLL register 0x%x\n",
>    298					SRC4XXX_RCV_PLL_11);
>    299	
>    300			ret = regmap_update_bits(src4xxx->regmap,
>    301				SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
>    302				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
>    303			if (ret < 0) {
>    304				dev_err(component->dev,
>    305					"Couldn't set the TX's div register to %d << %d = 0x%x\n",
>    306					val, SRC4XXX_TX_MCLK_DIV_SHIFT,
>    307					val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
>    308				return ret;
>    309			}
>    310	
>    311			return regmap_update_bits(src4xxx->regmap, reg,
>    312						SRC4XXX_MCLK_DIV_MASK, val);
>    313		} else
>    314			dev_info(dai->dev, "not setting up MCLK as not master\n");
>    315	
>    316		return 0;
>    317	};
>    318	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 

Cheers,
Nathan
