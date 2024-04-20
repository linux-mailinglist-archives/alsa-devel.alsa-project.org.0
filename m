Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16B8AB82D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Apr 2024 02:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F906F55;
	Sat, 20 Apr 2024 02:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F906F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713573443;
	bh=m51NSbeRW1aR2kCl5AYiN8+JkNorVMGlZphwn7wu5zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s8I6OPBKLT+aVPIfxkQ8ptQpEAQ/ajAe9tscdx2cV3HRAfE9IRrmuXsHedbg4gawh
	 Ba10GlTjYzEGPCzvKmZ89gtJIYTed9zZfacd4cB7qv72beNAP7q+hTJSjSVWmCMNLa
	 Kxz7H/u3qOTz2Ogeid/Q2vrpZVUTNYGVNeKcPzmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CAB3F805AA; Sat, 20 Apr 2024 02:36:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAE1F805C0;
	Sat, 20 Apr 2024 02:36:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A46F8025A; Sat, 20 Apr 2024 02:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5FDDF8003A
	for <alsa-devel@alsa-project.org>; Sat, 20 Apr 2024 02:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FDDF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eiXLqSWa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713573386; x=1745109386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m51NSbeRW1aR2kCl5AYiN8+JkNorVMGlZphwn7wu5zk=;
  b=eiXLqSWalHz3svCnlBEwLopjVoxAcqKjRj7nJxkAM2zbt/doQff+hxqg
   x0B1Dq3vn4PyAZtHI/Db12DclIzlGclxyROSef0FxP980Wt71U8QL1bzN
   ayfHIUlAYECRWdhizahfiMpObXVb6zOm1wRBWhXESnJlUuVYu1zJddsYh
   GYW66Admx+NUANc9gIIz+WeRwIRS5v6FwWvXLxdvEy3pL6Dzvu2rAWDn0
   MmF4TS9usXZ6JV3Qn8vZ7gI9A29ab7VwyJEwQIYimjG8385zFvJHgxZXQ
   Zr+qfjPte94to5W4azEjlQWTDO0bel+KRDew2Fx93atQIjVRuvZX6ffHX
   w==;
X-CSE-ConnectionGUID: WIPwO/RxSDCpAIYb1vpDHw==
X-CSE-MsgGUID: U0fQOBqOTwmi7iyol+w2sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9114264"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000";
   d="scan'208";a="9114264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 17:36:18 -0700
X-CSE-ConnectionGUID: XKo1LpvoS5KRAz13pVyjZQ==
X-CSE-MsgGUID: yqADTWoNThajbc9tYTRdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000";
   d="scan'208";a="23546754"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 17:36:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxyiD-000AbO-0z;
	Sat, 20 Apr 2024 00:36:13 +0000
Date: Sat, 20 Apr 2024 08:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Message-ID: <202404200850.ZXhk0PO1-lkp@intel.com>
References: <20240419150140.92527-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419150140.92527-4-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 76NZFTAKM642ZM7WGPF7CZ7HKONG3QAT
X-Message-ID-Hash: 76NZFTAKM642ZM7WGPF7CZ7HKONG3QAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76NZFTAKM642ZM7WGPF7CZ7HKONG3QAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.9-rc4 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-qcom-q6dsp-parse-Display-port-tokens/20240419-230514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240419150140.92527-4-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 3/4] ASoC: qcom: sc8280xp: add Display port Jack
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240420/202404200850.ZXhk0PO1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200850.ZXhk0PO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200850.ZXhk0PO1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/qcom/sc8280xp.c:7:
   In file included from include/sound/soc.h:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/qcom/sc8280xp.c:7:
   In file included from include/sound/soc.h:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/qcom/sc8280xp.c:7:
   In file included from include/sound/soc.h:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/soc/qcom/sc8280xp.c:7:
   In file included from include/sound/soc.h:24:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/soc/qcom/sc8280xp.c:54:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
      54 |         default:
         |         ^
   sound/soc/qcom/sc8280xp.c:54:2: note: insert 'break;' to avoid fall-through
      54 |         default:
         |         ^
         |         break; 
   8 warnings generated.


vim +54 sound/soc/qcom/sc8280xp.c

295aeea6646ad6 Srinivas Kandagatla 2022-09-16  25  
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  26  static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  27  {
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  28  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  29  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  30  	struct snd_soc_card *card = rtd->card;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  31  	struct snd_soc_jack *hdmi_jack  = NULL;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  32  	int hdmi_pcm_id = 0;
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  33  
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  34  	switch (cpu_dai->id) {
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  35  	case WSA_CODEC_DMA_RX_0:
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  36  	case WSA_CODEC_DMA_RX_1:
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  37  		/*
c481016bb4f8a9 Johan Hovold        2024-01-22  38  		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
c481016bb4f8a9 Johan Hovold        2024-01-22  39  		 * to reduce the risk of speaker damage until we have active
c481016bb4f8a9 Johan Hovold        2024-01-22  40  		 * speaker protection in place.
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  41  		 */
c481016bb4f8a9 Johan Hovold        2024-01-22  42  		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
c481016bb4f8a9 Johan Hovold        2024-01-22  43  		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
c481016bb4f8a9 Johan Hovold        2024-01-22  44  		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
c481016bb4f8a9 Johan Hovold        2024-01-22  45  		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  46  		break;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  47  	case DISPLAY_PORT_RX_0:
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  48  		hdmi_pcm_id = 0;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  49  		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  50  		break;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  51  	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  52  		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  53  		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04 @54  	default:
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  55  		break;
716d4e5373e9d1 Srinivas Kandagatla 2023-12-04  56  	}
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  57  
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  58  	if (hdmi_jack)
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  59  		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
8dd5623cc9d92b Srinivas Kandagatla 2024-04-19  60  
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  61  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  62  }
295aeea6646ad6 Srinivas Kandagatla 2022-09-16  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
