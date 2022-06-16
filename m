Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AF54ECF5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401231B0C;
	Thu, 16 Jun 2022 23:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401231B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416718;
	bh=qZt4b5gljydc4Ir5+JB96immHEwvqtPwBpsTZgV15h0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWGQ33tng3eYE41vDeM3fkvRbAuyIAM+KM20FrI2WDCpexd+qSjM/t2hqOBmiXKom
	 jp1l8gcNz2sxKJHHajAa740HGSSHgBKq4EhTWIbsdQQmysszYIWseX3VFr0dUccyzr
	 7DCquYOQZjSh+xnBWNe3Z7GB05my3exW8QNm+KnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E367F8055C;
	Thu, 16 Jun 2022 23:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73EB3F80542; Thu, 16 Jun 2022 23:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF3F7F80533
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF3F7F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FFz67Sgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416487; x=1686952487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZt4b5gljydc4Ir5+JB96immHEwvqtPwBpsTZgV15h0=;
 b=FFz67SgvQi5kKP9Ll8988/5qBbGrRZbGEMCZIa7wybqEZFp1BwnpFMNg
 YytsgrSKOhnF5lLnjRsOEQapj2MmTpKdjMYgkXVaA2EIeyo/Ep3jBQa1F
 qYTF0RymtlI5Uls5vx/ULsVsD6nF2yBcGhWE4+WFFSqXl0l3cyIVp+YEl
 o0dFEH89yGp85WlYQepOdRNJjs7NwQAQ+AlTJo0j3lQ47ZRIS4tpv5I1u
 kViF8C5a/CtVu+T6R1LePu9NaP8v0MpKx6zoXTBR88xhaWag0R0RKHSB8
 uJ2LEFFp4X7tHRV4cFYEZPOK5IKzYaXN8cV+6jsFu4UOhIPj4d8DpvHyT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047832"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212691"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/13] ASoC: SOF: sof-client: remove use of __func__ in dev_dbg
Date: Thu, 16 Jun 2022 16:53:48 -0500
Message-Id: <20220616215351.135643-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 16cca666bb852..125aa21371954 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -383,8 +383,8 @@ void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf)
 
 		msg_type = SOF_IPC4_NOTIFICATION_TYPE_GET(msg->primary);
 	} else {
-		dev_dbg_once(sdev->dev, "%s: Not supported IPC version: %d\n",
-			     __func__, sdev->pdata->ipc_type);
+		dev_dbg_once(sdev->dev, "Not supported IPC version: %d\n",
+			     sdev->pdata->ipc_type);
 		return;
 	}
 
-- 
2.34.1

