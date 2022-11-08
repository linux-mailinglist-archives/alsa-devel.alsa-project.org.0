Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8276204A8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 01:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153BD10E;
	Tue,  8 Nov 2022 01:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153BD10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667867085;
	bh=NvU1YLonlqU2BaeElg/dcoFppxQfFAfZx9sSQ/SY2go=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IBsOFcROdf6XAii4f3MjpmuUCV1d74loK4CT8dAlq5Yi9fLL+ljEARWKK8OZOStIu
	 rTIXSkX6Ziz8g62i2kzeYJk0ccs3MXLGe5c8y4cbqnw9RpBmeOF2t3ZTjw8BkAatAx
	 5mbw8aINC61ds+lWGAWCRKbkFlkykW35BWLiLgoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA3EF800AE;
	Tue,  8 Nov 2022 01:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57DBF8025A; Tue,  8 Nov 2022 01:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A665F800AE
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 01:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A665F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YbJ7Tw5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667867027; x=1699403027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NvU1YLonlqU2BaeElg/dcoFppxQfFAfZx9sSQ/SY2go=;
 b=YbJ7Tw5RclK4cAYh9RVKAOm1nMvGOXjs4XNV8dELyTb89Ks6X3k5vydt
 p9N1SgIpgazHk5z5fSzXhgNAQPc4PIe/NZ6ErIEIEFw+CSgKsQDfOxBlg
 tS1dKk7kwomRE3zSRYEE++wEnlqLD4dI4PzBx/xN/v3igAnQW6EfeenQp
 mMVR1/Nqmjo5XHKR8585JMQPF6/l4waqmeLxWsWV4GcHBeBwHeDHtgMeE
 Lfnt4e+ssZOVcVRbxgf/MbflNji9YkMBLhVC4UpPUwKgju0Gn8s0zvQfP
 FHi8f82jw+nerixi9B03elP7NX/CJU7oGwvy1dMlq+iS9VuG8cokxdbdS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293927263"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293927263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614070223"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="614070223"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/3] ASoC: SOF: get pipeline instance id from
 pipe_widget->instance_id
Date: Tue,  8 Nov 2022 08:29:07 +0800
Message-Id: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

Currently we set pipeline instance id = swidget->pipeline_id, but
pipeline_id is from topology and can be any number. In fact, the
number of pipelines is limited. This patch use ida to allocate pipeline
instance id and will be used for pipeline instance id in the IPC
message.

Bard Liao (3):
  ASoC: SOF: ipc4-topology: rename sof_ipc4_widget_free_comp
  ASoC: SOF: ipc4-loader: get max pipeline number
  ASoC: SOF: ipc4: get pipeline instance id from
    pipe_widget->instance_id

 sound/soc/sof/intel/hda-dai.c | 12 ++++++------
 sound/soc/sof/ipc4-loader.c   | 11 +++++++++++
 sound/soc/sof/ipc4-pcm.c      |  4 ++--
 sound/soc/sof/ipc4-priv.h     |  2 ++
 sound/soc/sof/ipc4-topology.c | 30 ++++++++++++++++++++++++------
 5 files changed, 45 insertions(+), 14 deletions(-)

-- 
2.25.1

