Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF604D4047
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D13D16E2;
	Thu, 10 Mar 2022 05:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D13D16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886535;
	bh=lKr0wbsPJRu+RA7flBYlV5F7OhlCB58ZaQPUkOl91+s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qc3SJEmSnWrkxflOcqicAOBrJr/Z84pwTqpWozS1RVmZiN7uRQCuQW8IXslv/0TBh
	 vqx4qFBSXHVBzuFwV8t+C68P41s/4n3vatIS83AHQJVeC9ZgnWZ1wh0/wAnaD3EqWK
	 mdgc+jAh11JvdF1DGDoDT9MRje8z0QRGB08YadCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21A6F8016C;
	Thu, 10 Mar 2022 05:27:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8976CF8012C; Thu, 10 Mar 2022 05:27:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4433F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4433F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V8B6Mg/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886461; x=1678422461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKr0wbsPJRu+RA7flBYlV5F7OhlCB58ZaQPUkOl91+s=;
 b=V8B6Mg/f5fv8qJjIv4cfIunePR30Gx5Z1/0AuW0haVNx+oP0pUN2ETzg
 6HWQAAwOSkMeIgMRelsmO1iIZo/bM0SrxWxAPK9L93SbnwbLFk2jGJPwK
 F+iRZZdwX3fdHT9C/oOmCr8D+qdKFZ8Qu7ZMSHiHDNeEjNFZvsnO2meeU
 uO04ePnlnfP8/Zz6piHvoFlSNDk97SdT6fBT4M7xxqA6CMkrUyIwAhO0O
 WxJRoAuzubMINp44UH2slhZ+b+zxe6J1HMP0jB8jh7TWTMkMnETfiAk39
 RrLl70mFoRYh7zVtqGFsMl1hVnBZeIA3sNrwarw8eF/fSGLbMhBZM9Y6S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380879"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884663"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] Make the SOF pcm_hw_params DSP op IPC agnostic
Date: Wed,  9 Mar 2022 20:27:10 -0800
Message-Id: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

In preparation for supporting the newly introduced IPC version in the SOF
firmware, this patchset adds the changes required to make the
pcm_hw_params DSP op IPC agnostic.

Peter Ujfalusi (10):
  ASoC: SOF: sof-priv: Remove stale snd_sof_ipc_stream_pcm_params()
    declaration
  ASoC: SOF: Make pcm_hw_params snd_sof_dsp_ops callback IPC neutral
  ASoC: SOF: pcm: Remove sof_pcm_dsp_params() wrapper
  ASoC: SOF: Introduce optional callback to configure stream data offset
  ASoC: SOF: Mark snd_sof_dsp_ops.ipc_pcm_params() callback optional
  ASoC: SOF: stream-ipc: Add sof_set_stream_data_offset()
  ASoC: SOF: Intel: hda-ipc: Add hda_set_stream_data_offset()
  ASoC: SOF: Intel: Convert to use the generic set_stream_data_offset
    ops
  ASoC: SOF: imx: Convert to use the generic set_stream_data_offset ops
  ASoC: SOF: Remove ipc_pcm_params() ops

 sound/soc/sof/amd/acp-pcm.c   |  8 ++++---
 sound/soc/sof/amd/acp.h       |  3 ++-
 sound/soc/sof/core.c          |  3 +--
 sound/soc/sof/imx/imx8.c      |  4 ++--
 sound/soc/sof/imx/imx8m.c     |  2 +-
 sound/soc/sof/intel/apl.c     |  2 +-
 sound/soc/sof/intel/bdw.c     |  2 +-
 sound/soc/sof/intel/byt.c     |  4 ++--
 sound/soc/sof/intel/cnl.c     |  2 +-
 sound/soc/sof/intel/hda-ipc.c |  8 +++----
 sound/soc/sof/intel/hda-pcm.c | 18 ++++----------
 sound/soc/sof/intel/hda.h     |  8 +++----
 sound/soc/sof/intel/icl.c     |  2 +-
 sound/soc/sof/intel/pci-tng.c |  2 +-
 sound/soc/sof/intel/tgl.c     |  2 +-
 sound/soc/sof/ops.h           | 21 +++++++++-------
 sound/soc/sof/pcm.c           | 45 ++++++++++++++++++++---------------
 sound/soc/sof/sof-priv.h      | 33 +++++++++++++++++--------
 sound/soc/sof/stream-ipc.c    |  9 ++++---
 19 files changed, 95 insertions(+), 83 deletions(-)

-- 
2.25.1

