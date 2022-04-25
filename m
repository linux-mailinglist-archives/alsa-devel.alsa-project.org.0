Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1050EB83
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460C918AD;
	Tue, 26 Apr 2022 00:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460C918AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924938;
	bh=vk3vjMb0EodnVTcaqOLro7BTVDf02CEpYx3Kn7PM1ok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7gdUdX5xyXw0JdIi9N/UAD4QGEqHCPDD7A3mPtNI/P6MFqRoRIz9KcPbnBOFdiQg
	 c8AQ+2Yl+CIUk7vdxV7lA6lrloCBlk8ij1gl4wcDq5MIJyys5iHXNdkEN3meh6vGec
	 vONpxbC6TX5vGotTXMlEql7HXo8ia70FixBuupvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F2DF8055A;
	Tue, 26 Apr 2022 00:12:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4936BF8054A; Tue, 26 Apr 2022 00:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABEF2F80511
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABEF2F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QILX7p3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924718; x=1682460718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vk3vjMb0EodnVTcaqOLro7BTVDf02CEpYx3Kn7PM1ok=;
 b=QILX7p3LVJvB8hWjKeNYW3ioLXFRdO8xzJAFxQo+mz+fUil/LkH8zuJa
 5DoXbHKlshUHg3dgjQsH276Lj/wLywEHl783GdNpeRyOPsKHIxBkW4e1h
 uUznD9pmiU/QvFTwwPSKljEoyBX1/x/KQN4AlG92OtmuhmbfP5+khNfWu
 DIIUCxLVQHn+Hnb20yK9XBgMkgpS++TacrAlKCC5EQWQ4t431swW3pZvY
 F2pv9RRobMwTVpktOsKWzWw0OjX5UDndcMYmhQt9fZE9LBvH26QP4IWZH
 xEQv/ib7OBD2ZoQbOBAY+CA6B+3ZridjcaldnoyKTiMciNbpzbng/JtJk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245942140"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="245942140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939918"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: SOF: ipc: Add check for fw_loader ops
Date: Mon, 25 Apr 2022 15:11:22 -0700
Message-Id: <20220425221129.124615-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add checks for the mandatory fw_loader ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 48ea58dbc998..8fbd72c40359 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -220,6 +220,12 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 		return NULL;
 	}
 
+	if (!ops->fw_loader || !ops->fw_loader->validate ||
+	    !ops->fw_loader->parse_ext_manifest) {
+		dev_err(sdev->dev, "Missing IPC firmware loading ops\n");
+		return NULL;
+	}
+
 	if (!ops->pcm) {
 		dev_err(sdev->dev, "Missing IPC PCM ops\n");
 		return NULL;
-- 
2.25.1

