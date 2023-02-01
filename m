Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6846869EE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 16:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC7D1EA;
	Wed,  1 Feb 2023 16:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC7D1EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675264784;
	bh=Bya2bwfL249v1sNpczAShDDQseCz+uJqoT8yJ25i2ko=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jb5+oE3zMK2I9JlEaLc8luAdkNJ1wEDHwsAbFT4fl2wb5K+uFS/XssGmNdZRq0/j8
	 pKd2conDaU4Bz4oUBkz/GzjY8kpZtEP5762l4MC2kaZ+oGQtchPn8sA+MX4BoXJGcK
	 Zdo39Eo3LZVp7j52Q1e//om5385OPxWkApVtMUXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB78F8045D;
	Wed,  1 Feb 2023 16:18:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20AFCF8045D; Wed,  1 Feb 2023 16:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75ABDF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 16:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75ABDF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B22RSUzV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675264719; x=1706800719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bya2bwfL249v1sNpczAShDDQseCz+uJqoT8yJ25i2ko=;
 b=B22RSUzVEwVIWl1ENrFKud/jEeKjIj9or1jll0pWTixkpuuxixcc7y1x
 nhU829AQyO+d2RFWSXuDuzL1Ii2CGywETHlZxy75f2f3KHiesCEAIQicT
 at1oaGftCkDnGzpU8KwpqB7m17oDPklW3vTTZgbxxR0hLNoENszNsswhq
 6EMwbpEaEFU5ig/fDfdeBtI42NVOAUJeqoFDpdRKpIMgh1RgFsoHAvDJ1
 pwd2Hfr8Ze5cQO5VxYRHCmgPiGkSyQQxHEvKiUgoLGk7kKdI4EEK2HJB7
 GiYj9Q6Lg97NasUlgkcMQbQpsxobz7TrzSky7LoxFZfIGKTSE1oK6RUSp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355502935"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="355502935"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 07:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="642457124"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="642457124"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 01 Feb 2023 07:18:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNEsY-0005Wv-1m;
 Wed, 01 Feb 2023 15:18:30 +0000
Date: Wed, 1 Feb 2023 23:18:22 +0800
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
Subject: Re: [PATCH 04/14] ASoC: q6dsp: audioreach: Add support for compress
 offload commands
Message-ID: <202302012309.BtyJn8FN-lkp@intel.com>
References: <20230201134947.1638197-5-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201134947.1638197-5-quic_mohs@quicinc.com>
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
patch link:    https://lore.kernel.org/r/20230201134947.1638197-5-quic_mohs%40quicinc.com
patch subject: [PATCH 04/14] ASoC: q6dsp: audioreach: Add support for compress offload commands
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302012309.BtyJn8FN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6a2982489303bcf32b927da80e4baffae58437e0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mohammad-Rafi-Shaik/ALSA-compress-Update-compress-set-params-for-gapless-playback/20230201-215622
        git checkout 6a2982489303bcf32b927da80e4baffae58437e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/qcom/qdsp6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/audioreach.c:1262:5: warning: no previous prototype for 'audioreach_send_u32_param' [-Wmissing-prototypes]
    1262 | int audioreach_send_u32_param(struct q6apm *apm, struct audioreach_module *module,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/audioreach_send_u32_param +1262 sound/soc/qcom/qdsp6/audioreach.c

  1261	
> 1262	int audioreach_send_u32_param(struct q6apm *apm, struct audioreach_module *module,
  1263				      uint32_t param_id, uint32_t param_val)
  1264	{
  1265		struct apm_module_param_data *param_data;
  1266		struct gpr_pkt *pkt;
  1267		uint32_t *param;
  1268		int rc, payload_size;
  1269		void *p;
  1270	
  1271		payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
  1272		p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
  1273		if (IS_ERR(p))
  1274			return -ENOMEM;
  1275	
  1276		pkt = p;
  1277		p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
  1278	
  1279		param_data = p;
  1280		param_data->module_instance_id = module->instance_id;
  1281		param_data->error_code = 0;
  1282		param_data->param_id = param_id;
  1283		param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
  1284	
  1285		p = p + APM_MODULE_PARAM_DATA_SIZE;
  1286		param = p;
  1287		*param = param_val;
  1288		rc = q6apm_send_cmd_sync(apm, pkt, 0);
  1289	
  1290		kfree(pkt);
  1291	
  1292		return rc;
  1293	}
  1294	EXPORT_SYMBOL_GPL(audioreach_send_u32_param);
  1295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
