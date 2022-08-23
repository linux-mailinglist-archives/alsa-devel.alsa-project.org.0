Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8559E3F1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5D085D;
	Tue, 23 Aug 2022 14:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5D085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661258705;
	bh=msqfEFG/qPmDDHa8wCYdT/4Cffz64mcnfpeNxaJpZkk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KX2MmbMjxrrNE9NsLxEM3BJjafH5hXYfzXRFNHqFITCY7+fjjN/AmnOvWAN7x8O15
	 2HB4QvP1oSf/2pi6Do8B7TaFaVpLGWNTGK7xJFrzq4z/nxXaK3Kv8fc2niCQ2Bw3NG
	 XOa1ZjuNjXoKCp8C0NNf+5N+e55GNR4ZWzwsIilE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FB5F8027B;
	Tue, 23 Aug 2022 14:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A50F8020D; Tue, 23 Aug 2022 14:44:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7504F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7504F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K8elsm3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661258638; x=1692794638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=msqfEFG/qPmDDHa8wCYdT/4Cffz64mcnfpeNxaJpZkk=;
 b=K8elsm3ZOBvHhMnD1pTdvCcdvSzepU2MAlOHnwnkpZ3V8hia16K5KVvw
 ptO4L/PNKM/t+jtuVqFVh3ETGdFfeEqomCyFHU6GlmNQ/AE0WkkeV+zJd
 yO6YiJs1kDG58YBYpDw7ItOYshCc31+W1kCUw1khgZ6QjrcKnbWW1iFCk
 3yiglc28fqbyVwaSy2ao4YM1t96y1zon0/F0p2YuaUb260Kkwb+LFyglf
 rb6pB3dMAa5X/Z8iWlGvH3hRWiaN+Qku2utcTeJDkfp8OzzoS/s7EebYx
 GglbUxATS7W6O+G7wt9lA9XxoFcPZDNT8HuWP27YZEnGDpa4SsXFrzJ6q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355406613"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="355406613"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="560147662"
Received: from mjglynn-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.28.206])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:42:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-loader: Verify ext manifest magic number
Date: Tue, 23 Aug 2022 15:42:19 +0300
Message-Id: <20220823124219.927-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
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

Firmware image must start with an extended manifest. Add a check to make
sure that the image does contain it.

The magic number (the first u32 of a firmware image if manifest is present)
for an IPC4 image must be 0x31454124 (ASCI "$AE1").

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 9fadae8fd011..8bd2132b4f41 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -40,6 +40,17 @@ static size_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev)
 
 	ext_man_hdr = (struct sof_ext_manifest4_hdr *)fw->data;
 
+	/*
+	 * At the start of the firmware image we must have an extended manifest.
+	 * Verify that the magic number is correct.
+	 */
+	if (ext_man_hdr->id != SOF_EXT_MAN4_MAGIC_NUMBER) {
+		dev_err(sdev->dev,
+			"Unexpected extended manifest magic number: %#x\n",
+			ext_man_hdr->id);
+		return -EINVAL;
+	}
+
 	fw_hdr_offset = ipc4_data->manifest_fw_hdr_offset;
 	if (!fw_hdr_offset)
 		return -EINVAL;
-- 
2.37.2

