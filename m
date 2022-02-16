Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17244B80CA
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 07:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50151177C;
	Wed, 16 Feb 2022 07:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50151177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644993890;
	bh=lM1SEU0VwVmIPrNwAlzATA/OOqDndWKV5hV1fkHz7+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n96/nTjdEjU44E7XFXbJtnw445b00JGFvbepOZlCivM4rXZRKRaZRh9PTRIyI82Rp
	 561n8iQvNyQoCrsv3jdVU/HUqWZDnvdGMtOGOdOc+AWsXRniSeTNsqxYoVqS3mm0yY
	 zwIYff1V6YHUcd+dLXuN9BwcERWHxpMLCmBFW/P4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D132AF800C0;
	Wed, 16 Feb 2022 07:43:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE1B3F80128; Wed, 16 Feb 2022 07:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D1AF80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 07:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D1AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F6yREI5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644993817; x=1676529817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lM1SEU0VwVmIPrNwAlzATA/OOqDndWKV5hV1fkHz7+w=;
 b=F6yREI5WQ0vfMLLR2WHfBNoMyDjRua/JF30cE8GerTcjiylHlXwuThne
 ENf7yqGcitZIoC8wOzvdY/wcq2PpbORki2SjN45DtPDIUZYWkhwHKmr9Q
 jKc8gtjfHNDKqlbvZIfYUvmPwCjOMfb9nMNAioW2U377nrEJ4QRCuSrie
 Hz4jxwOSzEh3ENXiLocDuLZJ2rJOX9o/IHPzrWWFXRCavtV3nNyQIxAAT
 9JkQsP0/WTugC8gbB3g+aM6kHBvXSV4g9iiBsmr2KhooGaqR6/g37zZnx
 ADQACPYZ1aJVGUi/IxWpT9XWBrBVt0rqrYyD1Y0K/jhGZSWl3ZZ+4Tmnk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249367976"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="249367976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="773887453"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2022 22:43:28 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKE2B-000AWi-MV; Wed, 16 Feb 2022 06:43:27 +0000
Date: Wed, 16 Feb 2022 14:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
Subject: Re: [RESEND v13 07/10] ASoC: qcom: Add support for codec dma driver
Message-ID: <202202161407.5MOObZwm-lkp@intel.com>
References: <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
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
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/Add-support-for-audio-on-SC7280-based-targets/20220214-230256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: csky-randconfig-s032-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161407.5MOObZwm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/e81c7e5d842d2b8039700a71557683e88ce0162d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/Add-support-for-audio-on-SC7280-based-targets/20220214-230256
        git checkout e81c7e5d842d2b8039700a71557683e88ce0162d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash sound/soc/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/qcom/lpass-platform.c:1218:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *dma_buf @@     got unsigned char * @@
   sound/soc/qcom/lpass-platform.c:1218:52: sparse:     expected void [noderef] __iomem *dma_buf
   sound/soc/qcom/lpass-platform.c:1218:52: sparse:     got unsigned char *

vim +1218 sound/soc/qcom/lpass-platform.c

  1209	
  1210	static int lpass_platform_copy(struct snd_soc_component *component,
  1211				       struct snd_pcm_substream *substream, int channel,
  1212				       unsigned long pos, void __user *buf, unsigned long bytes)
  1213	{
  1214		struct snd_pcm_runtime *rt = substream->runtime;
  1215		unsigned int dai_id = component->id;
  1216		int ret = 0;
  1217	
> 1218		void __iomem *dma_buf = rt->dma_area + pos +
  1219					channel * (rt->dma_bytes / rt->channels);
  1220	
  1221		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
  1222			if (is_cdc_dma_port(dai_id))
  1223				ret = copy_from_user_toio(dma_buf, buf, bytes);
  1224			else
  1225				ret = copy_from_user((void __force *)dma_buf, buf, bytes);
  1226		} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
  1227			if (is_cdc_dma_port(dai_id))
  1228				ret = copy_to_user_fromio(buf, dma_buf, bytes);
  1229			else
  1230				ret = copy_to_user(buf, (void __force *)dma_buf, bytes);
  1231		}
  1232	
  1233		return ret;
  1234	}
  1235	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
