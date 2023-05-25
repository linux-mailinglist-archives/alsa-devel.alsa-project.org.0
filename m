Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E515710D70
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 15:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCFB6C0;
	Thu, 25 May 2023 15:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCFB6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685022054;
	bh=XrDSsKETkXsaZk2xyLl+99HQObsgdMAuhCh7kJ+acFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kFpIjidzRGKH4QC0CCL8eD1of2sSEdUPfdpAjCXwoGPOubwFfsenjHu0rw1iVzKgt
	 DriGBaH1OiefPaxW/LD0QvlhB64aGae+GPT/psnBRpxMFs6QafYQ7XWd+YgxK/nXBP
	 JPj0pEMCiFxszJRnz0lSOa9unzuBKgAKIt4OsCLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CF4FF80570; Thu, 25 May 2023 15:39:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96807F8024E;
	Thu, 25 May 2023 15:39:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B25FF80568; Thu, 25 May 2023 15:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EC8CF8016A
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 15:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC8CF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lSI8NUoR
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3095557dd99so2078690f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685021931; x=1687613931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYY0GKMhXttuAw6paI9M2TLIWSmFkEjM7aIwjpOH6i4=;
        b=lSI8NUoRqt6sKOtFjbYKQ1EpPdFGZy/OFcz/WK8bRYRwVMgzWirE6Opr2uEfXhx144
         tqynAAgPY3KXxJglbouzD+2ETgPUOolPGFy7rYQVgXsAX3g4IoMNW7kCrUvpoKDenmQn
         QNH/1oQlrMFBLSBbyZU9xc/+P3tYQ7ZwO3aIQFJxThanQdjePsdrNAA8iXIJ36IW8038
         BTquGyNO+19LB46JVbRVD6ZMAJOvZ8bIb4pYs+93nDqvKXOJybmuAB+0oGIHwUS989Th
         OeYicGaffL5atnDCrex6ZH21zZbXd/NtwfoJBsd0U6S8ay21wXlgOLhZKNJWMLV10B25
         sqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021931; x=1687613931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYY0GKMhXttuAw6paI9M2TLIWSmFkEjM7aIwjpOH6i4=;
        b=hPVaCMAfmoJ5prYaZszh3TkVORzXXc3NKPo8uJ30vJH/oqLmJdKeqe6ZKYjWaM+wNw
         KqYyOyGs0lrxVhldFi22fTbR7TfbU92ZYJidaYp/MUuMbI2gDgLCwzN7SduJYTWzaCEX
         X8F4xLu/WQ08lR5PH/F8aB1T/gabXkuHTexYwGw3rMa2zqPYw4E7eJiIKwEs4iBPR942
         DmDD/tmp0Akt/m9rGEZhc9Y3iyNOiSWGTE1RXA6wzcrp+2yBmLdJQihkk0vLXxc3P33H
         ZFbVk7/J3M3DZCOb/D6FHBJveO79NkEVyQbabOtJwyt8xhpJvMkhpKSGt3xgaxDhN550
         3qJw==
X-Gm-Message-State: AC+VfDwBYU/8fxBbf8v0FS6B4Y9XjcjLD+g/Moeepqx8zXkXsHoi42ay
	7oa3rhcawfsmB+2A95k2YJ0I7w==
X-Google-Smtp-Source: 
 ACHHUZ4M6wuEjcnPvpWnV0GLbaB0cZOJUD9jaRh4/36ksFHmdC2KlwnVtAWh764uCxd278x2mXEmZQ==
X-Received: by 2002:a5d:574d:0:b0:309:54b6:33b0 with SMTP id
 q13-20020a5d574d000000b0030954b633b0mr2621683wrw.44.1685021931808;
        Thu, 25 May 2023 06:38:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b00301a351a8d6sm1803641wrv.84.2023.05.25.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:38:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Cc: andersson@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] soundwire: qcom: set clk stop need reset flag at
 runtime
Date: Thu, 25 May 2023 14:38:12 +0100
Message-Id: <20230525133812.30841-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JU2KZXV7UPP3ORK6THJI4IBBEHUZWOWR
X-Message-ID-Hash: JU2KZXV7UPP3ORK6THJI4IBBEHUZWOWR
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU2KZXV7UPP3ORK6THJI4IBBEHUZWOWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WSA Soundwire controller needs an full reset if clock stop support
is not available in slave devices. WSA881x does not support clock stop
however WSA883x supports clock stop.

Make setting this flag at runtime to address above issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 1d2a105cb77f..b6c3fadc9090 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -617,10 +617,14 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 		found = false;
+		ctrl->clock_stop_not_supported = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
 				qcom_swrm_set_slave_dev_num(bus, slave, i);
+				if (slave->prop.clk_stop_mode1)
+					ctrl->clock_stop_not_supported = true;
+
 				found = true;
 				break;
 			}
@@ -1623,15 +1627,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	/* Clk stop is not supported on WSA Soundwire masters */
-	if (ctrl->version <= SWRM_VERSION_1_3_0) {
-		ctrl->clock_stop_not_supported = true;
-	} else {
-		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
-		if (val == MASTER_ID_WSA)
-			ctrl->clock_stop_not_supported = true;
-	}
-
 #ifdef CONFIG_DEBUG_FS
 	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
 	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
-- 
2.21.0

