Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19C194AD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFCE1AC5;
	Thu,  9 May 2019 23:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFCE1AC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437668;
	bh=4MA1cgqhF1ziEte0N1fjSZtgNu091n7XFx+1VIfdvzo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dvb/au4rqajNITTAAE3oY3AMDCCGqVlhDhmXOwx63dSnSvFQzjxEbT1mxGZ1Uom4a
	 4wZvAfn9UgZCgm20xWSM3cEzMWXWCLvGDk/Zb/VpMvUFhA6IuPL8QEtMnOYgohLQ+m
	 UDu6n50mJ5HsNGirsPkGQvMYLOlLGM42kxmIZesQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 892FCF897CC;
	Thu,  9 May 2019 23:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5339FF89792; Thu,  9 May 2019 23:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD83EF89789
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD83EF89789
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="d76qSptb"
Received: by mail-pf1-x443.google.com with SMTP id z26so1955843pfg.6
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QabCw1HIkztYdYez4gT+jeQCWJg/9Fy/MseoqvwA5w=;
 b=d76qSptbPyEpZ/SiDgxkYt/Z8s1G7N6Lifv3aHzOa89rU7G42rsPv77OqJJ9CPNpDH
 5vJDmJ130eppYZ68kdDVURNskJ9p/ySNEHCiwNFdTJbUdAIpkFyezS9EejW7RdmVcUbv
 APyJ+V3DaqTZwYMWaglFs6t3jjFhpajfoXebw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QabCw1HIkztYdYez4gT+jeQCWJg/9Fy/MseoqvwA5w=;
 b=UovorSzyY1HZxMNP/0njRAjHfJQbV3ue9h4D4OEtC5fdKbwBioSygLXMqnuuEDMg0x
 I/QIo2xJAowulz0XbdSKK+jAkQo9FZ/5pQHnT2cnBrIUqqZG4RdeXKtcS0E9YV6AEWea
 lpX0uhDAcqWp9DS3vIeml39+nJaM1dRKQkXAU6sGzY04u4iiiXhdYRVQQw67puHuO0Hs
 teL1eML8Pce1QEI3lSkROx5EZ/xESKHWPUXd9F4kz3kgi1ZVM6LxDoEUdgRlvVT9NVYz
 WpjErx07+vHXXBZbHJ0ewDEmkwfDp+JnK6Nfrv88pvdeWwsgAplmLEjG315tdBeqaBI/
 01mQ==
X-Gm-Message-State: APjAAAVB2iPb6PuFDyOA+3CBhxjRp7YZHZmKN400r1dD2KqV85X1JtJ6
 Pyu80d172zQMhdKJjSzWgUoD2w==
X-Google-Smtp-Source: APXvYqzZtLGUzqv0mQx+N5pyoUMEaNksuYUR3NfF4xLggGy8/ThtNc9Tu/K5gunI7JBCe3pbA389vQ==
X-Received: by 2002:a63:682:: with SMTP id 124mr8810308pgg.243.1557436484408; 
 Thu, 09 May 2019 14:14:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id j35sm3461511pgj.60.2019.05.09.14.14.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:43 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:50 -0700
Message-Id: <20190509211353.213194-28-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 27/30] mfd: cros_ec: Add API for rwsig
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
Acked-by: Benson Leung <bleung@chromium.org>
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
