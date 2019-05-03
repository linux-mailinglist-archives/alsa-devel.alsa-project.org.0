Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8341356A
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1427C187A;
	Sat,  4 May 2019 00:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1427C187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556922064;
	bh=rYfibrFaYbcQJT78lcSslz1eFeWNb41iF3xH3T7BS4E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZjrBnR2a+dAP3QLJ4oJp+F3Kee920UYGmNKip7pS4Gi4miEZHBOggZneVpL86ok8
	 D+0T5C1FEUzwmuXkQFnKLUAd++kKfJQsjDYzMpSfrblqEK/CJhkhCS3pQ9U+y/3pDf
	 ab2sTf5VDzG1PhJlftxZK7GaTJ5QMQZQac9ETFEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63FC1F897B3;
	Sat,  4 May 2019 00:04:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3476DF89762; Sat,  4 May 2019 00:03:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F5F9F8973C
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5F9F8973C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JDf99JEQ"
Received: by mail-pl1-x641.google.com with SMTP id e92so3316242plb.6
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqldmXxauyhkjN+cmd6rsXcdSJy2DQw8nApvvLnMwiY=;
 b=JDf99JEQRfx0Cx33Wp9McW5W66XB/ORRYg1ryMaOk8WYyCkfpEFT6m+p6p/iuoVz3A
 nRoVB6X5NNxqouyMIutQjcjLirSPQst8jP5ek8GqYt+dEmrnVHPjDsjbhUPzaq5I5RSb
 JmyISC2jg/MdruxzFCTJwulITIteXEpHW3FbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqldmXxauyhkjN+cmd6rsXcdSJy2DQw8nApvvLnMwiY=;
 b=LsJqt11+baFKagVejjaDTLK05InP6qL9zEA1Yk12sqfdcw9+2CjX63G2uYEx1stTc/
 yy2PtmcjOBEkSxXo6cuQkc+jsAfab/l7rvETnGJWDWxvKVwvfWjmriIRXlVJpf2gu+tL
 32ElHOYyYC1nIFGmDJQfCk2k9a5kX9RsePtkpyBreEIDDV3z1Q9K7O1ZE4fRXtgA+lcT
 eC6dDrejz2lWp5G/gbAUu23QDsNDPFL/zJjGIE3s1c+RUtRLVm7DRFFhc40VtyoSxmsk
 h0Yw7YUCrdUk512m8SchpXdF2gNadFNWLUO5RS+8X2c4IO3crDs/MSzeMjctrgarN/ih
 WLtw==
X-Gm-Message-State: APjAAAXVb0T1BWS5VE54fPFnSssI+xRoN8hVBm6dVsYIdKCRTc+IbXOW
 bO/yDdfhMQ1Zn+7gXzJOENceCQ==
X-Google-Smtp-Source: APXvYqw7tV0azTVEBxn5kH4OCN7wzuXYAelyzUoomae87dAK3qQRrv4nBkkR8IfYh/pfjlrFS2NthA==
X-Received: by 2002:a17:902:b210:: with SMTP id
 t16mr13867898plr.84.1556921007113; 
 Fri, 03 May 2019 15:03:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id u5sm4540867pfa.169.2019.05.03.15.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:26 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:30 -0700
Message-Id: <20190503220233.64546-28-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 27/30] mfd: cros_ec: Add API for rwsig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add command to retrieve signature of image stored in the RW memory
slot(s).

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 4a9ac3861bdd..3d3a37b11002 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -5043,6 +5043,32 @@ struct ec_response_pd_chip_info_v1 {
 	};
 } __ec_align2;
 
+/* Run RW signature verification and get status */
+#define EC_CMD_RWSIG_CHECK_STATUS	0x011C
+
+struct ec_response_rwsig_check_status {
+	uint32_t status;
+} __ec_align4;
+
+/* For controlling RWSIG task */
+#define EC_CMD_RWSIG_ACTION	0x011D
+
+enum rwsig_action {
+	RWSIG_ACTION_ABORT = 0,		/* Abort RWSIG and prevent jumping */
+	RWSIG_ACTION_CONTINUE = 1,	/* Jump to RW immediately */
+};
+
+struct ec_params_rwsig_action {
+	uint32_t action;
+} __ec_align4;
+
+/* Run verification on a slot */
+#define EC_CMD_EFS_VERIFY	0x011E
+
+struct ec_params_efs_verify {
+	uint8_t region;		/* enum ec_flash_region */
+} __ec_align1;
+
 /*****************************************************************************/
 /* Fingerprint MCU commands: range 0x0400-0x040x */
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
