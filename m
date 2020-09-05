Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153A25EE64
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 16:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31891825;
	Sun,  6 Sep 2020 16:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31891825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404328;
	bh=MZ7OvjM2jwO2ZHxawypfTK89AHKp5wvRrFbnrLiysh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PsGeflEW6r7sYcaEtOcr+dogUsx6+/5pQ9JF8ASvKTGP9OSrbKTkPFo/eTT25GNy9
	 OiiphOQZSwI/ehoETYp73KSb3sStxklrCeC0liQNtAID1G3aJkKlYcB3MbkNP9Zo9J
	 656GA2ruJq/FOYpguSePJ+PhHKPFnZx48molrOnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC30AF802D2;
	Sun,  6 Sep 2020 16:56:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E2FDF8020D; Sat,  5 Sep 2020 19:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EF7F800F0
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 19:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EF7F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com
 header.i=@marek-ca.20150623.gappssmtp.com header.b="jAX0shsQ"
Received: by mail-qt1-x844.google.com with SMTP id 92so7170535qtb.6
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCuchGSyeN1SA4c28kpGChZYxpEctYzHgQAHlgn61ZY=;
 b=jAX0shsQRBi8WwQiwWenimkMPM+JLgv8FYxLya1CKoQSuwc6jUwz9RwHz+pEnoIL2q
 9kGXSYgaDZrH0Wkkx+Ufc79W0ByqnBlqByqTcz+KZARiExXjzW4FhNK6Zvm/EvjZLf6+
 l2bti/wH7Uu64/ak9oJ288mcso3jkdCGH3b2IMyTPUj70J0LHTctw85xs82V0eiJRcKb
 E87tkV6eDeM/aTQOvzZ7+7SRkqIFqPX54w7qcAWsd44l+XyywcK48wgQh85prip1qOl0
 1K4ztZFzkJEXPRPHwpGzLUi2LMS2z8O3nh+gaG+uO1YmkxYvnHC4CZAnLNd5kCxuEsYo
 I4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gCuchGSyeN1SA4c28kpGChZYxpEctYzHgQAHlgn61ZY=;
 b=ob0U6PrEyNQiEZ030psJNtRlm+RJC1AfuxE4uZNIFKTjRfqkJadYE8/Bgdl+Oz53Tp
 RqazceAFpLt+MWOc253EhQw6VKWvVt3VO5e+7nmoObngT8j1faIBQraQ1ITfR4yDNj9Z
 ZXgjDg25QmBXrOM6+7YqoU4ghUgyrX2fWg0HA97px5XgRbniwdb7QsOwtw2nrJzlasa5
 BKVokcZXNFbPGkd1nDnQTvXKnNiVLnvqx++ernJnFOO/D4oVvXt/jMZuQO2fOoSGIFXm
 Uhp2DQwMR8YGs+NroKTJPTpBcbXs6IIFPsPfRSRb3dF8/jUtv7Eq2ZV2Uf3TQaAPlH7p
 fSbA==
X-Gm-Message-State: AOAM5315Qi1lOUMjl+LUXdhkfYPbD7wiy/hxygZ4DeLK/w6p1SAkA/bD
 QnV/h7sD5XZfLOOfxRGyyfM19MOwrtS14WAzCwY=
X-Google-Smtp-Source: ABdhPJwuhACwry7xvRE2wBQ9naoMrPAAX6O0+ahqxxrxKUd9wiHRK3QwKSBHcf43LGWu25mqzk01FA==
X-Received: by 2002:ac8:4906:: with SMTP id e6mr7514712qtq.360.1599327607134; 
 Sat, 05 Sep 2020 10:40:07 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:40:06 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/4] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
Date: Sat,  5 Sep 2020 13:39:03 -0400
Message-Id: <20200905173905.16541-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
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

The driver may be used without slimbus, so don't depend on slimbus.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/Kconfig | 2 +-
 drivers/soundwire/qcom.c  | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index fa2b4ab92ed9..f83d02c9c60a 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -33,7 +33,7 @@ config SOUNDWIRE_INTEL
 
 config SOUNDWIRE_QCOM
 	tristate "Qualcomm SoundWire Master driver"
-	depends on SLIMBUS
+	imply SLIMBUS
 	depends on SND_SOC
 	help
 	  SoundWire Qualcomm Master driver.
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d1e33ef1afac..6401ad451eee 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -753,7 +753,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+#if IS_ENABLED(CONFIG_SLIBMUS)
 	if (dev->parent->bus == &slimbus_bus) {
+#else
+	if (false) {
+#endif
 		ctrl->reg_read = qcom_swrm_ahb_reg_read;
 		ctrl->reg_write = qcom_swrm_ahb_reg_write;
 		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
-- 
2.26.1

