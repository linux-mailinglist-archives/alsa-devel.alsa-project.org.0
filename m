Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18D44F6A2C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81288170B;
	Wed,  6 Apr 2022 21:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81288170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649274161;
	bh=Ra8i3aAeLdiBy9KCCM/iALU3xF1YYN7lEOa2k15oH2k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwpVoK6ok5W7yleZvU9F/0moGYAu0f5s1EM8p62qpmKoLh9KiLc7nDoyDnHPZ871p
	 TdWbE8Tj26cZ6dGK4Qfg07KHQhVY4igWUkY/TSjCTxIdFCG8Q2td5OERtO04ctYHiW
	 c4sYL3iQRl6GwEzROs8tJ2f0Jqpqs+fyo1gNW8jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8636F8019B;
	Wed,  6 Apr 2022 21:41:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7144F80516; Wed,  6 Apr 2022 21:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E5AF800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E5AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RmFf0OVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649274066; x=1680810066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ra8i3aAeLdiBy9KCCM/iALU3xF1YYN7lEOa2k15oH2k=;
 b=RmFf0OVirMivqSUaebYSpOQkSFnDOojmyu4IqB4KxCLYYAQy5hzx0kVD
 OsNf1llWgFueOVmrhcx1pbLOrrGOYW8EQzkgTb5PgSY1lDzc9RXGMLcd3
 gqq+PqN+tytNzi6AeGzb1Qp5hGSeBk70QKjlXYoI1duP9DcG5DmwCsAbF
 mrnw0iXCGECxtOvmMBXwj7tkG9GINQsuPG4vN/qRxVprFG3DbxowjRpuO
 Fc+bqtYa8hDaXig0VlAYtAzyHtWQ2JgIQ5lEGE8HBsrwG4UaNt6xkkSpC
 OoNfn1MttUXwfvYIvavy7nKLzmPEbFgX9wYBIKs38uoht6MaM6/3Zej+8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347582614"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347582614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570713302"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:40:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: OF: Add shutdown callback for SOF OF device
Date: Wed,  6 Apr 2022 14:40:45 -0500
Message-Id: <20220406194048.289787-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
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

From: YC Hung <yc.hung@mediatek.com>

Add shutdown callback function for SOF OF device and call
snd_sof_device_shutdown in sof_of_shutdown callback for DSP
shutdown sequence.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-of-dev.c | 6 ++++++
 sound/soc/sof/sof-of-dev.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index e3718638f9ce..18c0f3cd0993 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -95,4 +95,10 @@ int sof_of_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL(sof_of_remove);
 
+void sof_of_shutdown(struct platform_device *pdev)
+{
+	snd_sof_device_shutdown(&pdev->dev);
+}
+EXPORT_SYMBOL(sof_of_shutdown);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index 4e0f6588dad9..fd950a222ba4 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -13,5 +13,6 @@ extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
 int sof_of_remove(struct platform_device *pdev);
+void sof_of_shutdown(struct platform_device *pdev);
 
 #endif
-- 
2.30.2

