Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07AF264A19
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 18:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A29016BE;
	Thu, 10 Sep 2020 18:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A29016BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599756290;
	bh=Uo2uwBUGjFHAlCEykLi54JoBgmKWTUONnoKvLzs2TMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nx/vg5YWswbmZILq9qhCcvv9bpUTlpKQsba9kUiQEvEzsOHOKDn1ldVF7lk/XyPA4
	 4lg/azBJZ2z+Iy0f508+AM3Qc1S9/KoZMV9goD7qdLEWrsbkMbtnKxAQfZc2kaFFii
	 VMkZ0XLi0G659jTJlrgwV8PKcOqbMhMXrDCmf9MQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12065F800E9;
	Thu, 10 Sep 2020 18:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AF8DF80277; Thu, 10 Sep 2020 18:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B707F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 18:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B707F800E9
IronPort-SDR: 23C5jYfB3vLNtlqyyKSAXkpll2RJa0OIN1pC0Rn3IaXN11Z9VMbCJru0p9a3FDgPQvfPLMetQl
 VjlmaM+BlYbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146278519"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146278519"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 09:42:48 -0700
IronPort-SDR: R+ucZD2rz3rIzfNEOirUE83CL9n36WTopLWVMQirf9O9fFezL1yeZPG+EKM5SF4XKE4r1CP7N1
 gTWXe99CLwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="304937870"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 09:42:46 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/4] ASoC: SOF: DSP core management fixes for 5.10
Date: Thu, 10 Sep 2020 19:41:21 +0300
Message-Id: <20200910164125.2033062-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
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

This series contains some improvements to how DSP core management
is done in SOF, and adds a distinction between cores managed by
the host versus cores managed by the DSP.

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: hda-loader: s/master/primary

Ranjani Sridharan (3):
  ASoC: SOF: rename cores_mask to host_managed_cores_mask
  ASoC: SOF: Intel: hda: modify core_power_up/down op
  ASoC: SOF: Intel: remove the  HDA_DSP_CORE_MASK() macro

 sound/soc/sof/intel/apl.c        |  2 +-
 sound/soc/sof/intel/bdw.c        |  2 +-
 sound/soc/sof/intel/byt.c        |  6 +++---
 sound/soc/sof/intel/cnl.c        | 15 ++++-----------
 sound/soc/sof/intel/hda-dsp.c    | 20 +++++++++++++++++---
 sound/soc/sof/intel/hda-loader.c | 11 +++++------
 sound/soc/sof/intel/hda.c        |  2 +-
 sound/soc/sof/intel/hda.h        |  3 ---
 sound/soc/sof/intel/shim.h       |  2 +-
 sound/soc/sof/intel/tgl.c        |  2 +-
 10 files changed, 34 insertions(+), 31 deletions(-)

-- 
2.27.0

