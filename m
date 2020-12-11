Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5AD2D73EC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4E6170B;
	Fri, 11 Dec 2020 11:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4E6170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607682443;
	bh=Io6QDBTYrxU/pakn8qlitDwVmXCxlg4/MYhI8/trE3s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ij3YQqQpK0E5TvejM2FXb9WnSjIPetu5An5Bm09VprZSawjEJJ/D9YUmu+KdcZiNI
	 shNan7WvrST4TkqIonjQ4nhZgfC8MoPfmDPrDLT74j1fBdFRrcbTDbe29Nl8U4ovaB
	 toTTsW55hC4Z+6mCrZWN0d8liBHA5XP05sQ/5BDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B50F801D8;
	Fri, 11 Dec 2020 11:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C9AF8020D; Fri, 11 Dec 2020 11:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73FB2F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:25:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73FB2F8014E
IronPort-SDR: bfAEXWwktw2tk4EGcIJsr3DV71FXyfYJRO1EWiBPA7jKe/HjObdoxW+NAKXiFIjzUSEPQVTxce
 oKSq2iQzDF8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174524451"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174524451"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:25:33 -0800
IronPort-SDR: xMOhaQJB2+TbUkUPjyIg9znzXZ1hxi3fzXRyg/mBB5cdZiZ8cV7x2HiorXfuRyUA04oHHV1dbr
 ququ8M1+e8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="333992083"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2020 02:25:31 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: imx: update kernel-doc description
Date: Fri, 11 Dec 2020 12:22:55 +0200
Message-Id: <20201211102255.3189589-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add missing parameters to avoid W=1 error

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 5fee637834c2..8826ef94f04a 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -47,6 +47,8 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 /**
  * imx8_dump() - This function is called when a panic message is
  * received from the firmware.
+ * @sdev: SOF device
+ * @flags: parameter not used but required by ops prototype
  */
 void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 {
-- 
2.29.2

