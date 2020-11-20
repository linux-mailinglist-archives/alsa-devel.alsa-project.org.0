Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D82BAC17
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 15:44:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5718316D5;
	Fri, 20 Nov 2020 15:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5718316D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605883475;
	bh=PW2N7jY4D8esa1JrQ5DFXxIIS1/zyFegRhDM1DjTb3g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uWEufnq+vmFFroAphe3Qvo2nAvF+V1RjoRczCqDcyW2bRS2GoiyRElCw0XrnqJjML
	 o6z8g2wQb+TnfFN2Dz/H0hQ8ibESXlMRV06i9ivLkHJ6kkf60AArRTum8TlLX73vsl
	 odkd8jdMssIlC1EIoVuNJfjHIjNw59CE1hoacjyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD730F800C5;
	Fri, 20 Nov 2020 15:43:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC97F8016C; Fri, 20 Nov 2020 15:42:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C066F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 15:42:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C066F800C5
IronPort-SDR: 3FJp2ntf9AX4efE72nN8VN9Czg2/QXLh7uFhGZhsRWrTerWNxn44gBfaIQhtjDp0sEQqV8QBPF
 WDzbGfYk+AZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="151327821"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="151327821"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 06:42:47 -0800
IronPort-SDR: p5y1hDTC+T5PSyFOsMz4q9Zl4YZ4ZLa7sdNjhnGwRKDNLXjBNTBus1wGT6ePRM9eKedHp12QDl
 rDPs+IlxUIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="360467535"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2020 06:42:45 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: IPC: fix implicit type overflow
Date: Fri, 20 Nov 2020 16:40:25 +0200
Message-Id: <20201120144025.2166023-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Curtis Malainey <cujomalainey@chromium.org>, daniel.baluta@nxp.com
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

From: Curtis Malainey <cujomalainey@chromium.org>

Implicit values may have a length of 15bits (s16) so we need to declare
the proper size so we don't get undefined behaviour. This appears to be
arch and compiler dependent. This commit is to keep the headers aligned
between the firmware and kernel. UBSan discovered this bug in the
firmware.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/header.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 2d35997ace40..571e1dd54b89 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -31,12 +31,12 @@
 
 /* Global Message - Generic */
 #define SOF_GLB_TYPE_SHIFT			28
-#define SOF_GLB_TYPE_MASK			(0xf << SOF_GLB_TYPE_SHIFT)
+#define SOF_GLB_TYPE_MASK			(0xfL << SOF_GLB_TYPE_SHIFT)
 #define SOF_GLB_TYPE(x)				((x) << SOF_GLB_TYPE_SHIFT)
 
 /* Command Message - Generic */
 #define SOF_CMD_TYPE_SHIFT			16
-#define SOF_CMD_TYPE_MASK			(0xfff << SOF_CMD_TYPE_SHIFT)
+#define SOF_CMD_TYPE_MASK			(0xfffL << SOF_CMD_TYPE_SHIFT)
 #define SOF_CMD_TYPE(x)				((x) << SOF_CMD_TYPE_SHIFT)
 
 /* Global Message Types */
-- 
2.28.0

