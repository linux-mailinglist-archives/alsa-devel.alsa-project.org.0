Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468154E9C6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 21:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7997B1AE8;
	Thu, 16 Jun 2022 21:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7997B1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655406331;
	bh=05ZQtWGf38sMkIDGBxN5ear0JqXBorAqDG9HH+7P078=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQ2M7tkRZLr+JeSKMSDt7VLwlkj9MhkhAoM0quxjS9DdiiupQqIHnwFye83WadcpD
	 ZJfy1RBhuNTdKvqxk5fb9krmPVJv4X/KfzIH0MbKN5gXyD80fZed9+rv2O7shYEt4X
	 RP+ijI44CB7T7bRwsVJVu59cf9m/f49B9u2brXLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE64EF80423;
	Thu, 16 Jun 2022 21:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8568FF801D8; Thu, 16 Jun 2022 21:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B17F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 21:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B17F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D6/Wwocb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655406264; x=1686942264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=05ZQtWGf38sMkIDGBxN5ear0JqXBorAqDG9HH+7P078=;
 b=D6/WwocbGzf/EXvilM7j46FyaKGhSEfvmPq3jfntn+cPzQ2fb5Vpm4i/
 U8vBssIrJSJz7gQtoDC0p7KAK0uv/gxwUABi1hud/gldcrDqFAqwI+cu4
 t+GsMEnZqRHoiRYZni6Yv5hg1OyrWuGrfvuXBQnFnw39U3liZCnUaZEyx
 cBPF1l8OL3zyHo/SsniJd1dWrvwjEIRM7FA9VnYzGIOSUCbE7jW7EDekP
 XFzLi10O4JiOWs8VG4/2bVycfMGgHm5WiOX7suG6KG73JZo8obIWNJdfs
 dydvo3rfxsWJhbWapTW5nkZdDWbofDv0NWeqUQbrEzmFowIqo2VneV51i w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262348685"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262348685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728022535"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2022 12:04:12 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o1ump-000Ogz-O9;
 Thu, 16 Jun 2022 19:04:11 +0000
Date: Fri, 17 Jun 2022 03:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Judy Hsiao <judyhsiao@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <202206170216.M52eiJwN-lkp@intel.com>
References: <20220616155836.3401420-2-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616155836.3401420-2-judyhsiao@chromium.org>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Judy Hsiao <judyhsiao@chromium.org>,
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

Hi Judy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on broonie-sound/for-next robh/for-next linus/master v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Judy-Hsiao/ASoC-rockchip-i2s-switch-BCLK-to-GPIO/20220617-000041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arc-randconfig-r043-20220616 (https://download.01.org/0day-ci/archive/20220617/202206170216.M52eiJwN-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/322064314e50b113217aa4c7412e2431defea08f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Judy-Hsiao/ASoC-rockchip-i2s-switch-BCLK-to-GPIO/20220617-000041
        git checkout 322064314e50b113217aa4c7412e2431defea08f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash sound/soc/rockchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/rockchip/rockchip_i2s.c: In function 'rockchip_snd_rxctrl':
   sound/soc/rockchip/rockchip_i2s.c:247:16: error: 'return' with a value, in function returning void [-Werror=return-type]
     247 |         return ret;
         |                ^~~
   sound/soc/rockchip/rockchip_i2s.c:188:13: note: declared here
     188 | static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
         |             ^~~~~~~~~~~~~~~~~~~
   sound/soc/rockchip/rockchip_i2s.c: In function 'rockchip_i2s_trigger':
>> sound/soc/rockchip/rockchip_i2s.c:485:29: error: void value not ignored as it ought to be
     485 |                         ret = rockchip_snd_rxctrl(i2s, 1);
         |                             ^
   sound/soc/rockchip/rockchip_i2s.c:498:29: error: void value not ignored as it ought to be
     498 |                         ret = rockchip_snd_rxctrl(i2s, 0);
         |                             ^
   cc1: some warnings being treated as errors


vim +485 sound/soc/rockchip/rockchip_i2s.c

   473	
   474	static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
   475					int cmd, struct snd_soc_dai *dai)
   476	{
   477		struct rk_i2s_dev *i2s = to_info(dai);
   478		int ret = 0;
   479	
   480		switch (cmd) {
   481		case SNDRV_PCM_TRIGGER_START:
   482		case SNDRV_PCM_TRIGGER_RESUME:
   483		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
   484			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 > 485				ret = rockchip_snd_rxctrl(i2s, 1);
   486			else
   487				ret = rockchip_snd_txctrl(i2s, 1);
   488			if (ret < 0)
   489				return ret;
   490			i2s_pinctrl_select_bclk_on(i2s);
   491			break;
   492		case SNDRV_PCM_TRIGGER_SUSPEND:
   493		case SNDRV_PCM_TRIGGER_STOP:
   494		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
   495			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
   496				if (!i2s->tx_start)
   497					i2s_pinctrl_select_bclk_off(i2s);
   498				ret = rockchip_snd_rxctrl(i2s, 0);
   499			} else {
   500				if (!i2s->rx_start)
   501					i2s_pinctrl_select_bclk_off(i2s);
   502				ret = rockchip_snd_txctrl(i2s, 0);
   503			}
   504			break;
   505		default:
   506			ret = -EINVAL;
   507			break;
   508		}
   509	
   510		return ret;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
