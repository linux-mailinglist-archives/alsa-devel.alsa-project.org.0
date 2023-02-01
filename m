Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4286686B4A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 17:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E42482E;
	Wed,  1 Feb 2023 17:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E42482E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675267969;
	bh=1WRzhheT0far4uWXe5/27l5EWuUFvZB4LXQCLYYjMl4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ak0mf2+NrMYzb842sCAROdE+kqvmgczglH5JhlNHllUbzK2dzj9Mji4RHMIuKHEHK
	 1gVy0gUKvfjWmWaIBCKzhwxM2xb22RGMhNMdQctMlDtmpDDYxI2OcWrqUV1N4YioOL
	 kwdbZo8N/tt2Od5JmkYdhplQffD1blQcOBcHVg4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0EEF80155;
	Wed,  1 Feb 2023 17:11:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE14F80423; Wed,  1 Feb 2023 17:11:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD67AF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 17:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD67AF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RKkTWeBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675267898; x=1706803898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1WRzhheT0far4uWXe5/27l5EWuUFvZB4LXQCLYYjMl4=;
 b=RKkTWeBVRvREqosDdFtrewoqawrDbhYtU9sLfPJDzAnvSKCTw0Vo32SQ
 7MvTvtPwU5y/aSuBoe57eLqZZI99XIxgenFoQzjEqTOLUs95OA2IZa9jN
 MyzoKpm0haJvQ09nOM3Gggk+wNZVDvgk2860lQhbva5ZguKDGzCzTF2dB
 my95Skx7B8DqVrT4goz0q3jud7jbmjY2uw6YvqavuZyA/x75DwZZtYa6n
 G7cU0uhHdc27wEDGSNT76ecZEiromBVc1mfQy5MwDPGyPinvVvM8prqap
 WD7tx2XDDryxpdubNVyV86p3642GMyYWkHhiu7f0zIvRSuD6bIhFgT2Fs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392762611"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="392762611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 08:10:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="664918209"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="664918209"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 08:10:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNFgu-0005Z7-2i;
 Wed, 01 Feb 2023 16:10:32 +0000
Date: Thu, 2 Feb 2023 00:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org,
 judyhsiao@chromium.org, devicetree@vger.kernel.org,
 konrad.dybcio@linaro.org
Subject: Re: [PATCH 08/14] ASoC: q6dsp: q6apm-dai: Add open/free compress DAI
 callbacks
Message-ID: <202302012337.pC5Q3lLy-lkp@intel.com>
References: <20230201134947.1638197-9-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201134947.1638197-9-quic_mohs@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>, oe-kbuild-all@lists.linux.dev
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mohammad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230201]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Rafi-Shaik/ALSA-compress-Update-compress-set-params-for-gapless-playback/20230201-215622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230201134947.1638197-9-quic_mohs%40quicinc.com
patch subject: [PATCH 08/14] ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302012337.pC5Q3lLy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/78a6016e006a8e405679fd335940ee710416c43f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mohammad-Rafi-Shaik/ALSA-compress-Update-compress-set-params-for-gapless-playback/20230201-215622
        git checkout 78a6016e006a8e405679fd335940ee710416c43f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/qcom/qdsp6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/q6apm-dai.c:135:6: warning: no previous prototype for 'event_handler_compr' [-Wmissing-prototypes]
     135 | void event_handler_compr(uint32_t opcode, uint32_t token,
         |      ^~~~~~~~~~~~~~~~~~~


vim +/event_handler_compr +135 sound/soc/qcom/qdsp6/q6apm-dai.c

   134	
 > 135	void event_handler_compr(uint32_t opcode, uint32_t token,
   136					uint32_t *payload, void *priv)
   137	{
   138		struct q6apm_dai_rtd *prtd = priv;
   139		struct snd_compr_stream *substream = prtd->cstream;
   140		unsigned long flags;
   141		uint32_t wflags = 0;
   142		uint64_t avail;
   143		uint32_t bytes_written, bytes_to_write;
   144		bool is_last_buffer = false;
   145	
   146		switch (opcode) {
   147		case APM_CLIENT_EVENT_CMD_EOS_DONE:
   148			spin_lock_irqsave(&prtd->lock, flags);
   149			if (prtd->notify_on_drain) {
   150				snd_compr_drain_notify(prtd->cstream);
   151				prtd->notify_on_drain = false;
   152			} else {
   153				prtd->state = Q6APM_STREAM_STOPPED;
   154			}
   155			spin_unlock_irqrestore(&prtd->lock, flags);
   156			break;
   157		case APM_CLIENT_EVENT_DATA_WRITE_DONE:
   158			spin_lock_irqsave(&prtd->lock, flags);
   159			bytes_written = token >> APM_WRITE_TOKEN_LEN_SHIFT;
   160			prtd->copied_total += bytes_written;
   161			snd_compr_fragment_elapsed(substream);
   162	
   163			if (prtd->state != Q6APM_STREAM_RUNNING) {
   164				spin_unlock_irqrestore(&prtd->lock, flags);
   165				break;
   166			}
   167	
   168			avail = prtd->bytes_received - prtd->bytes_sent;
   169	
   170			if (avail > prtd->pcm_count) {
   171				bytes_to_write = prtd->pcm_count;
   172			} else {
   173				if (substream->partial_drain || prtd->notify_on_drain)
   174					is_last_buffer = true;
   175				bytes_to_write = avail;
   176			}
   177	
   178			if (bytes_to_write) {
   179				if (substream->partial_drain && is_last_buffer)
   180					wflags |= APM_LAST_BUFFER_FLAG;
   181	
   182				q6apm_write_async_compr(prtd->graph,
   183							bytes_to_write, 0, 0, wflags);
   184	
   185				prtd->bytes_sent += bytes_to_write;
   186	
   187				if (prtd->notify_on_drain && is_last_buffer)
   188					audioreach_shared_memory_send_eos(prtd->graph);
   189			}
   190	
   191			spin_unlock_irqrestore(&prtd->lock, flags);
   192			break;
   193		default:
   194			break;
   195		}
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
