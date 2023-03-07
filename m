Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37BF6ADDF3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:49:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA321437;
	Tue,  7 Mar 2023 12:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA321437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189797;
	bh=J0E/P+VexmhoudK0cGH9kbsEoNQtgfJu4eesJ115M0Y=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Io4WkGJyIjau5R6LjtlmSo9Bq413VRiorKFXsEwtMp1+fxKPnr7/E/sAtTl3KtsTk
	 y/0jYSMA5evtoXg/4xTTdfuYF7hbehTx8Cy2ASzo9tDG1DdK7Abb8fXDFWaq3FTDQ4
	 X6rWj9bYylKcodBf0oYbBJQDwpH6vme5XE+BPYCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB60FF80236;
	Tue,  7 Mar 2023 12:49:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFBBBF8042F; Tue,  7 Mar 2023 12:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52BC1F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BC1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QyxoJ5bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189741; x=1709725741;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J0E/P+VexmhoudK0cGH9kbsEoNQtgfJu4eesJ115M0Y=;
  b=QyxoJ5bcP1x8jWcuS6OQ/GLZK6xsrkWB1143gUyqmIC5HKMMCnMaK3Ej
   7VSpR/WKZOxqiPzwfDNQMuWiZreoPQfwRNm2NOWj7r7tN37M3YfazKxPA
   JpZ+vBQSbKH8Boi4IyupmAUvDj5oii4O+tsCU1a3632ET85qx/Km4JvPH
   nWXHwS34VnuxeelLDPEgCXK9GADuqOcN+7SUb/SPRMNEUik6qrhtvlg7m
   G4dwBlBkkJRIqF5I0amVmPnAMJyAyTIRtMuTf39+ay0PYjZJTc/OzQF5S
   WItbJ2bzFEQP6W/vWwIA1SKFsOQ/41peqg3cnmftNylok+/kP6wQlY8K0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338154577"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338154577"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653950185"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="653950185"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:48:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc3: Check for upper size limit for the received
 message
Date: Tue,  7 Mar 2023 13:49:17 +0200
Message-Id: <20230307114917.5124-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YR7PN5TN4KHLGPWJCOJMHQ36CWVBILTI
X-Message-ID-Hash: YR7PN5TN4KHLGPWJCOJMHQ36CWVBILTI
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 cujomalainey@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR7PN5TN4KHLGPWJCOJMHQ36CWVBILTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sof_ipc3_rx_msg() checks for minimum size of a new rx message but it is
missing the check for upper limit.
Corrupted or compromised firmware might be able to take advantage of this
to cause out of bounds reads outside of the message area.

Reported-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 3de64ea2dc9a..4493bbd7faf1 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -970,8 +970,9 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	if (hdr.size < sizeof(hdr)) {
-		dev_err(sdev->dev, "The received message size is invalid\n");
+	if (hdr.size < sizeof(hdr) || hdr.size > SOF_IPC_MSG_MAX_SIZE) {
+		dev_err(sdev->dev, "The received message size is invalid: %u\n",
+			hdr.size);
 		return;
 	}
 
-- 
2.39.2

