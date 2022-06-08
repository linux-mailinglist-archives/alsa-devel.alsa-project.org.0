Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46245420C0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 04:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0E01AB9;
	Wed,  8 Jun 2022 04:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0E01AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654655489;
	bh=sG0AzbZENUyQtpHzBixIeP6cHtFJAq/4tpTQw7wbmn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuwGUBaLvBK8s4/T1IxK+DSWxxaxtXwzBgNYjSspMFN7/ClvawJu5cXxwsMDs88gi
	 xCGWSf6/iS1+8ZTQ6e15Db4fC4z+Lp1xX6hSNq/hhEzhCke3TC0uAUOpIj61QdT4tW
	 uCYcaVz9PSBgWkCcrEEUF8i681kzXtOMDa3MmwPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB79DF800C7;
	Wed,  8 Jun 2022 04:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE81F8024C; Wed,  8 Jun 2022 04:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9031F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 04:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9031F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CAUVE61W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654655424; x=1686191424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sG0AzbZENUyQtpHzBixIeP6cHtFJAq/4tpTQw7wbmn0=;
 b=CAUVE61Wr86nKgCgtqK2AtX8fsIbYuuAisTYKOlAoTopv2ewaRF+WPeI
 MNwRvKR606d9Tq52yKmxW4hRCXaipv+yDrrPcb9sN4y/7zoNduD0mLUj/
 Iaqa8WIJYU87fPrBgdZXwT4mjtB5QAid5QnmNVQr2HyrrErQKHkZQxzbS
 8QukLCEHvECkDsORGfwullpspWHRB1KyTdph4QgELOE7E8a886TGNxvLe
 zkfs2GVf1OSEbRAb0rHt4b2nseXH2tvXDogq8Z7xzOeu5wc63BSdTw0t1
 IKRs8IhTB6eqHhOYdmp/6a6Y8j/1Xl3Z0ZfRXt4QlOBrjiACb8/T4sdKV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="257217251"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="257217251"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 19:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="826684008"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2022 19:30:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nylSY-000EB2-2P;
 Wed, 08 Jun 2022 02:30:14 +0000
Date: Wed, 8 Jun 2022 10:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org,
 judyhsiao@chromium.org, vkoul@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: soundwire: Add software clock gating
 requirement check
Message-ID: <202206081054.vVkYPkJt-lkp@intel.com>
References: <1654605334-32030-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654605334-32030-3-git-send-email-quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[cannot apply to linus/master v5.19-rc1 next-20220607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivasa-Rao-Mandadapu/Add-software-clock-gating-requirement-check/20220607-203739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220608/202206081054.vVkYPkJt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/86aa15d36b06f7b73938f00f9ad99eff75a94a94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivasa-Rao-Mandadapu/Add-software-clock-gating-requirement-check/20220607-203739
        git checkout 86aa15d36b06f7b73938f00f9ad99eff75a94a94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soundwire/qcom.c:668:6: error: use of undeclared identifier 'data'
           if (data->sw_clk_gate_required)
               ^
   drivers/soundwire/qcom.c:1509:7: error: use of undeclared identifier 'data'
                   if (data->sw_clk_gate_required)
                       ^
   2 errors generated.


vim +/data +668 drivers/soundwire/qcom.c

   659	
   660	static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
   661	{
   662		u32 val;
   663	
   664		/* Clear Rows and Cols */
   665		val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
   666		val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
   667	
 > 668		if (data->sw_clk_gate_required)
   669			reset_control_reset(ctrl->audio_cgcr);
   670	
   671		ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
   672	
   673		/* Enable Auto enumeration */
   674		ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
   675	
   676		ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
   677		/* Mask soundwire interrupts */
   678		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
   679				SWRM_INTERRUPT_STATUS_RMSK);
   680	
   681		/* Configure No pings */
   682		ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
   683		u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
   684		ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
   685	
   686		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
   687		/* Configure number of retries of a read/write cmd */
   688		if (ctrl->version > 0x01050001) {
   689			/* Only for versions >= 1.5.1 */
   690			ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
   691					SWRM_RD_WR_CMD_RETRIES |
   692					SWRM_CONTINUE_EXEC_ON_CMD_IGNORE);
   693		} else {
   694			ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
   695					SWRM_RD_WR_CMD_RETRIES);
   696		}
   697	
   698		/* Set IRQ to PULSE */
   699		ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
   700				SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
   701				SWRM_COMP_CFG_ENABLE_MSK);
   702	
   703		/* enable CPU IRQs */
   704		if (ctrl->mmio) {
   705			ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
   706					SWRM_INTERRUPT_STATUS_RMSK);
   707		}
   708		ctrl->slave_status = 0;
   709		ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
   710		ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
   711		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
   712	
   713		return 0;
   714	}
   715	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
