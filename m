Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9E4B389A
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Feb 2022 00:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A63173C;
	Sun, 13 Feb 2022 00:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A63173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644708357;
	bh=lQp3ufLwimneT4WugYp2XgpX6NjnaubtrZ0Hin9414M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DOz/YxF50iPl0Dajohm5zIR2fIVsiHQbczQ3uODxWg/UoAiBFmb61sjoF9k2LlMJD
	 7wlNea/SaZI2H3Z5kGNlPr4KbND9GaI7/io4B6Y8AW43X/Aba9nOiH+YGJFLP51G3r
	 qs0zgaOc6uULMD+My8Lt8kqGKRG6Edyszd1WML7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1A4AF80089;
	Sun, 13 Feb 2022 00:24:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC58F8014E; Sun, 13 Feb 2022 00:24:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC6E1F800BF
 for <alsa-devel@alsa-project.org>; Sun, 13 Feb 2022 00:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC6E1F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hn91lcvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644708283; x=1676244283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lQp3ufLwimneT4WugYp2XgpX6NjnaubtrZ0Hin9414M=;
 b=Hn91lcvWGgN2lJoZ3xrAMZ8MbFTSNoEC//ielQrJq7giOQmLhfmMFoxr
 OGrq3bB3x27O432/BHDGTNjAuv2TzlR12Umq8SYhobEovSRxZwMyEv4o7
 mpmvWwH0fwRr2YONxid0g5MLv61qEknW47hIRWGwkTZDUf+1kEfCT4/qQ
 zDs+6gjqqbtAn24Q2PsayGXTycUIpLL1G/WFOaibdfxLWo9aBGPNQwxzN
 PBmb1aiWy/0NMkJiH1XOS3hBExP06F7SxYdBkUifg8EnqtZlD5De0Khn9
 W9GbQhtO8MHGMYBgHiQTEvZL7IyYaNDuTjIjbwmP7E9EfU46rzqiFFHQn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="249656661"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="249656661"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 15:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; d="scan'208";a="679829752"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2022 15:24:32 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nJ1km-0006kd-9m; Sat, 12 Feb 2022 23:24:32 +0000
Date: Sun, 13 Feb 2022 07:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
Subject: Re: [PATCH v11 07/10] ASoC: qcom: Add support for codec dma driver
Message-ID: <202202130736.eUu0rQGL-lkp@intel.com>
References: <1644665093-4695-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644665093-4695-8-git-send-email-quic_srivasam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>, kbuild-all@lists.01.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Hi Srinivasa,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/Add-support-for-audio-on-SC7280-based-targets/20220212-192806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: nios2-randconfig-s031-20220213 (https://download.01.org/0day-ci/archive/20220213/202202130736.eUu0rQGL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/81d86e5446d7b811a902e4834e65730b0fb393f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/Add-support-for-audio-on-SC7280-based-targets/20220212-192806
        git checkout 81d86e5446d7b811a902e4834e65730b0fb393f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash sound/soc/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/qcom/lpass-platform.c:1223:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void * @@
   sound/soc/qcom/lpass-platform.c:1223:52: sparse:     expected void volatile [noderef] __iomem *dst
   sound/soc/qcom/lpass-platform.c:1223:52: sparse:     got void *
>> sound/soc/qcom/lpass-platform.c:1228:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got unsigned char *dma_buf @@
   sound/soc/qcom/lpass-platform.c:1228:56: sparse:     expected void const volatile [noderef] __iomem *src
   sound/soc/qcom/lpass-platform.c:1228:56: sparse:     got unsigned char *dma_buf

vim +1223 sound/soc/qcom/lpass-platform.c

  1209	
  1210	static int lpass_platform_copy(struct snd_soc_component *component,
  1211				       struct snd_pcm_substream *substream, int channel,
  1212				       unsigned long pos, void __user *buf, unsigned long bytes)
  1213	{
  1214		struct snd_pcm_runtime *rt = substream->runtime;
  1215		unsigned int dai_id = component->id;
  1216		int ret = 0;
  1217	
  1218		unsigned char *dma_buf = rt->dma_area + pos +
  1219					channel * (rt->dma_bytes / rt->channels);
  1220	
  1221		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
  1222			if (is_cdc_dma_port(dai_id))
> 1223				ret = copy_from_user_toio((void __force *)dma_buf, buf, bytes);
  1224			else
  1225				ret = copy_from_user((void __force *)dma_buf, buf, bytes);
  1226		} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
  1227			if (is_cdc_dma_port(dai_id))
> 1228				ret = copy_to_user_fromio(buf, dma_buf, bytes);
  1229			else
  1230				ret = copy_to_user(buf, dma_buf, bytes);
  1231		}
  1232	
  1233		return ret;
  1234	}
  1235	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
