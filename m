Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BD59D09D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9582B168B;
	Tue, 23 Aug 2022 07:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9582B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233130;
	bh=lIDXQ+rdDpYoI61ktv6nw6pBfN8AbK7G9dl/OtiKCjo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhRINP8fOGWXo+JKy4YoYDV0spGByGrYGOTUVCJjIalLbhHp/Tq9lsMIgK/a9zuGi
	 G3Swyr6UHBuQ1OVTsrWPB0Zm8pp5g3r3qPLhayoqFmCf5Ui8qomx7KfJX0eDGnEjZp
	 Y13DvDbTqQFSc7F3FfUJo0s4rmB0odleUTloJ2cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6EEF80579;
	Tue, 23 Aug 2022 07:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D83F80568; Tue, 23 Aug 2022 07:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A58FBF804E6
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A58FBF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T0tEY39E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232933; x=1692768933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lIDXQ+rdDpYoI61ktv6nw6pBfN8AbK7G9dl/OtiKCjo=;
 b=T0tEY39EUUHA1NJ3Vyz6Q3So9gFqf0AJhQhDoLaasXoQn5Xe9rdG0QJJ
 pctIHtWy6V0/pQXvMy7GprkrYZmnf7dKIC0f0lcLjS0SUY7l//iQyKQM2
 DPPRDzZTxAFz5TXfIPA29zCnn0HhSSwJGuh5bcwSB9krXICYKuY9L/HCv
 uj0vTbD877ac2hNwJ0a5tPGHrXciYLEMPgcweksiTRLa9+X+31+lRTAU3
 Zi32lWAnB+kQzZqJTBjyRFRrSU7QiDoy2qy74cs0vvF24YffWtKLYyhNi
 orUQwd1LobYq01JlXEHSS9/qM6M7yJRa9wfaBMZYfJzDrdiQwJnGAgdxo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349280"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349280"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558361"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 11/11] soundwire: intel: cleanup WakeEnable and WakeStatus
Date: Tue, 23 Aug 2022 13:38:46 +0800
Message-Id: <20220823053846.2684635-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
References: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

Regroup offset and bitfield definitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 3a56fd5a6331..2e9fd91572d4 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -76,9 +76,16 @@
 #define SDW_SHIM_IOCTL_CIBD		BIT(8)
 #define SDW_SHIM_IOCTL_DIBD		BIT(9)
 
+/* Wake Enable*/
 #define SDW_SHIM_WAKEEN			0x190
+
+#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
+
+/* Wake Status */
 #define SDW_SHIM_WAKESTS		0x192
 
+#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
+
 /* AC Timing control */
 #define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
 
@@ -86,9 +93,6 @@
 #define SDW_SHIM_CTMCTL_DODS		BIT(1)
 #define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
 
-#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
-#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
-
 /* Intel ALH Register definitions */
 #define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
 #define SDW_ALH_NUM_STREAMS		64
-- 
2.25.1

