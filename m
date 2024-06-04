Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009148FAC96
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 09:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639AE852;
	Tue,  4 Jun 2024 09:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639AE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717487664;
	bh=4dNTR4z2BJ3pfaXEO6tM9yIxe4LDIns4WgIcbTF2vYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eESG4UfIdmbqr5ZfjJT9LiDWpN/hNlS+cjQXwxsgTGY5fgP9zX7Wt47n4Zf+wuxxO
	 9NYc9KaMxPzi6t4By2+It8fFSxsBedLMIQs99NDcWApi/e6dOH92PDdsKSCUS3l6JB
	 vbC/QcuU+BjjCb18KS1i+tdKYYuRZQEVLNCql39I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 540B0F805CB; Tue,  4 Jun 2024 09:53:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B6D2F805C7;
	Tue,  4 Jun 2024 09:53:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B63F804B0; Tue,  4 Jun 2024 09:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B113EF80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B113EF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d6kfXcCM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4D72CE0F7B;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19789C32782;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487555;
	bh=4dNTR4z2BJ3pfaXEO6tM9yIxe4LDIns4WgIcbTF2vYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6kfXcCMGKpSuvA2cir2lb03te8T5XAKFF4r3vqHWbHIEqBpJxf5BSJ470hKfvJhe
	 YVcZWSYHuMGm2EjrDlZSTp+sXliB8A3/yOWOiIkTNO93DTMPiZrEQJ99e3tayCENrQ
	 UIbshji7em3n8Dt1ioeo6Vu3gIKIJFd5EfvG8TyTc/XXk4x8AJpyFrgTDP4oftZ5My
	 NuFrKIfD1sf6YV/Alor0ci1o1OjAMElPOw12S8KhdtkDJR2YZmBelK4V/LHzw0oios
	 Rhptz7oVD8CMi3aRBVWCJqcTIkAkgpU7Kl1qkOHyCgPc2BCn7iHJV9teokjCBEASx2
	 nF1PUuyHAiT4A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sEOy9-000000005QN-2ixN;
	Tue, 04 Jun 2024 09:52:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 1/4] soundwire: bus: suppress probe deferral errors
Date: Tue,  4 Jun 2024 09:52:10 +0200
Message-ID: <20240604075213.20815-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240604075213.20815-1-johan+linaro@kernel.org>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4CY6MRMSAG3KP77UMIUPEGQZNWJPKKCI
X-Message-ID-Hash: 4CY6MRMSAG3KP77UMIUPEGQZNWJPKKCI
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CY6MRMSAG3KP77UMIUPEGQZNWJPKKCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Soundwire driver probe errors are currently being logged both by the bus
code and driver core:

	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -12
	wsa884x-codec sdw:4:0:0217:0204:00:0: probe with driver wsa884x-codec failed with error -12

Drop the redundant bus error message, which is also incorrectly being
logged on probe deferral:

	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517

Note that no soundwire driver uses the driver struct name field, which
will be removed by a follow-on change.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/bus_type.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index c32faace618f..85fa5970d98a 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -83,7 +83,6 @@ static int sdw_drv_probe(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 	const struct sdw_device_id *id;
-	const char *name;
 	int ret;
 
 	/*
@@ -108,11 +107,6 @@ static int sdw_drv_probe(struct device *dev)
 
 	ret = drv->probe(slave, id);
 	if (ret) {
-		name = drv->name;
-		if (!name)
-			name = drv->driver.name;
-
-		dev_err(dev, "Probe of %s failed: %d\n", name, ret);
 		dev_pm_domain_detach(dev, false);
 		return ret;
 	}
-- 
2.44.1

