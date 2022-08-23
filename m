Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC69959D09F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A571686;
	Tue, 23 Aug 2022 07:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A571686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233161;
	bh=1O4ps/JcDGEt0+y9AM/kthsuna2tQ743pxsTQ1DC6mY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xxtf1bocM+yNca7RDxLCgkBhjetWYpPfiUfWEhlmAugzJWbjeDzrCM7zS2ho9EReG
	 XzuwJSc0SA8CL/wyVL1uJCpp2I58ziASsexwBNLpjz3Nf2bGFcp5INJFwvTIQDNnKc
	 V/DQrk84zxhqLGDvggfMOaVoXyd84nU+LXeMwvR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67805F80580;
	Tue, 23 Aug 2022 07:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD621F80588; Tue, 23 Aug 2022 07:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1626F804E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1626F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HR7hdASg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232929; x=1692768929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1O4ps/JcDGEt0+y9AM/kthsuna2tQ743pxsTQ1DC6mY=;
 b=HR7hdASgiIqUJqzg6LCLsoxbsRJ6q9UXKDyxwmikpvq9NqrpncoXrjLS
 inSODeGZthNJnpdA86nfkmwxh7Q2vNCaGUSgRNg4aK/gGEkjdGjxT7BeF
 AqX+GS6uN+hg2di0oWfodLShgOHSswbMpXi3sN5UAWKWKCAm0e//zr5PV
 imDT5bA7lQmgbEjO1IXxUtWbqAvR4aNOnKNNnNOSqWFVmYEJgxSsoNyiP
 7LB1tKFx0svsLt1WqPFwei2JPEEFyYnbEFvCcL+gJWV1H9KJbWJP16bYv
 ZIqtVjmA9fYaDU51+dbk/tfRDI4qikMQdvRN6PSHz/+0xu+sHjK0MC2Yn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349248"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349248"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558287"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 05/11] soundwire: intel: remove unused PDM capabilities
Date: Tue, 23 Aug 2022 13:38:40 +0800
Message-Id: <20220823053846.2684635-6-yung-chuan.liao@linux.intel.com>
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

We removed PDM support a long time ago but kept the definitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 3 +--
 include/linux/soundwire/sdw_intel.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c37121356e06..104baa29bf2c 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -170,9 +170,8 @@ static int intel_reg_show(struct seq_file *s_file, void *data)
 			ret += intel_sprintf(s, false, buf, ret,
 					SDW_SHIM_PCMSYCHC(i, j));
 		}
-		ret += scnprintf(buf + ret, RD_BUF - ret, "\n PDMSCAP, IOCTL, CTMCTL\n");
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\n IOCTL, CTMCTL\n");
 
-		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PDMSCAP(i));
 		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_IOCTL(i));
 		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTMCTL(i));
 	}
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 66503cf29f48..34af5bc010b3 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -47,7 +47,6 @@
 
 #define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
 #define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 * (y)))
-#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
 #define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
 #define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
 
@@ -63,11 +62,6 @@
 #define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
 #define SDW_SHIM_PCMSYCM_DIR		BIT(15)
 
-#define SDW_SHIM_PDMSCAP_ISS		GENMASK(3, 0)
-#define SDW_SHIM_PDMSCAP_OSS		GENMASK(7, 4)
-#define SDW_SHIM_PDMSCAP_BSS		GENMASK(12, 8)
-#define SDW_SHIM_PDMSCAP_CPSS		GENMASK(15, 13)
-
 #define SDW_SHIM_IOCTL_MIF		BIT(0)
 #define SDW_SHIM_IOCTL_CO		BIT(1)
 #define SDW_SHIM_IOCTL_COE		BIT(2)
-- 
2.25.1

