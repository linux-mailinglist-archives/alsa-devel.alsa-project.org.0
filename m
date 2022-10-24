Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5F60B2F4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 061236F1B;
	Mon, 24 Oct 2022 18:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 061236F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630541;
	bh=MQZTlENAKPP+PBkA3QOdnCxSOuMdyaXOWq/rPVENw6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5wBldQEk5i3vpnuS+qNrQijCzAs+0NLXs26YUunUl277mtmMf5it+vuWmyZY5Iwr
	 PX5mAkqVqt9aUeOQsUFA2ROES+d0r1v4pIbbpxJmoHRQ+9OMOwjUA0M29MW6XlSyL2
	 gEa430cXjuAiQjPjRvA9FkiftMbKuLtGeMdosQJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0C6F80431;
	Mon, 24 Oct 2022 18:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FCFF80563; Mon, 24 Oct 2022 18:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7A19F80240
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A19F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="evwzA/vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630410; x=1698166410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQZTlENAKPP+PBkA3QOdnCxSOuMdyaXOWq/rPVENw6M=;
 b=evwzA/vgpYCyo2d+u6RGGC7qW18JRAk9JeCt6KY5RhrGpqMSbhb97DS6
 FqEYuPe20MDYQMewQQGO+4082x+YOeRovtobqdPw83TbzSCBJ1HkpAGoy
 BbJAHQ4hZu7z0jpujFblfmE/2sRlgSVUvdXC0/51oxx95X2cfuStJjzWa
 s0go5QiPYjAJ/lsKTDVDwCfIjYCK15eJx2r7lascJXY5kwUm8YmcwUl9d
 /oJuF2eOcJ5eNIJdpk0CP70JL0WbkrXI3DtKQQ8/fD9CaO/+5aRiMHbFl
 2cTbVETCQr0LXYoKMPwzIJsDArT77uV6I2BVanoYjvRVEKSDGTUPMWrLr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868624"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868624"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263053"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263053"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/16] ASoC: SOF: ops: add snd_sof_dsp_updateb() helper
Date: Mon, 24 Oct 2022 11:52:58 -0500
Message-Id: <20221024165310.246183-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add missing helper in SOF toolbox.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ops.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 511c798eb1ebb..8cb93e7c0c670 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -356,6 +356,17 @@ static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
 		return readq(sdev->bar[bar] + offset);
 }
 
+static inline void snd_sof_dsp_updateb(struct snd_sof_dev *sdev, u32 bar,
+				       u32 offset, u8 value, u8 mask)
+{
+	u8 reg;
+
+	reg = snd_sof_dsp_readb(sdev, bar, offset);
+	reg &= ~mask;
+	reg |= value;
+	snd_sof_dsp_writeb(sdev, bar, offset, reg);
+}
+
 /* block IO */
 static inline int snd_sof_dsp_block_read(struct snd_sof_dev *sdev,
 					 enum snd_sof_fw_blk_type blk_type,
-- 
2.34.1

