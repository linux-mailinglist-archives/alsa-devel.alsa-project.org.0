Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A041B8FAC91
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 09:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EDB828;
	Tue,  4 Jun 2024 09:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EDB828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717487643;
	bh=0miAYvpRkAOFP1cMzY2sUokznCRDxVUYD0uECgu4qUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lr9k+DlBTxXybHicvH/lc40HNOLdG7j3GvH3KAPFs10oGtBTrHiqP/WKqZLyzTY3Y
	 HWNoQ4wsbn3/B1QKdFLDabLTDArilEytGOUT/0+/KDVPJ77mcQ6O4vG7j67Rns6ozE
	 zuaPp2y6M540vIAkc047dhWrHgw6XpNhqBg+x3a4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0814DF8051F; Tue,  4 Jun 2024 09:53:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4219F805A0;
	Tue,  4 Jun 2024 09:53:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A9ABF804B0; Tue,  4 Jun 2024 09:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBD0FF8025A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 09:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBD0FF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KzG99Qw5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD71ECE106B;
	Tue,  4 Jun 2024 07:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21677C4AF0A;
	Tue,  4 Jun 2024 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487555;
	bh=0miAYvpRkAOFP1cMzY2sUokznCRDxVUYD0uECgu4qUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzG99Qw5ODW1xQLiR9KG29aXCAfNttYdbB7UcPyeZbQXgW5vYcm8NJ5P4THgJvH51
	 9lMrayaJzfHdKb3ToFEsMtdbCJSaZwy3zX9QsB0OdoH8ZGCtkeW7LuCgyR4hhBIAxw
	 YH6GDZstjwzBBekAPGDGIXxvqDLgTjBUIRQ40llXpFKk9VxNJTjc+xKmh1llyGpGx4
	 900dvTibDCfD0Ps9P7MC3PDkoWBmaCwNeLcJBSTHWaj502R9hAsrrTNI8Y9jufk4LQ
	 mgU8nzwf5BVJIvOpFW5BSaEkmC0j2k6yeBAmqBekTrHFA01NFoKLhRZr8zKds1+0RH
	 fsnDSM0N1kamA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sEOy9-000000005QP-3637;
	Tue, 04 Jun 2024 09:52:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/4] soundwire: bus: drop unused driver name field
Date: Tue,  4 Jun 2024 09:52:11 +0200
Message-ID: <20240604075213.20815-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240604075213.20815-1-johan+linaro@kernel.org>
References: <20240604075213.20815-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CDAZYOROAKJTP6N2WUIRS5A74DB2QYXG
X-Message-ID-Hash: CDAZYOROAKJTP6N2WUIRS5A74DB2QYXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDAZYOROAKJTP6N2WUIRS5A74DB2QYXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The soundwire driver name field is not currently used by any driver (and
even appears to never have been used) so drop it.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/bus_type.c  | 9 ++-------
 include/linux/soundwire/sdw.h | 2 --
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 85fa5970d98a..3979be0f8b65 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -198,16 +198,11 @@ static void sdw_drv_shutdown(struct device *dev)
  */
 int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 {
-	const char *name;
-
 	drv->driver.bus = &sdw_bus_type;
 
 	if (!drv->probe) {
-		name = drv->name;
-		if (!name)
-			name = drv->driver.name;
-
-		pr_err("driver %s didn't provide SDW probe routine\n", name);
+		pr_err("driver %s didn't provide SDW probe routine\n",
+				drv->driver.name);
 		return -EINVAL;
 	}
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 13e96d8b7423..5e133dfec8f2 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -704,8 +704,6 @@ struct sdw_master_device {
 	container_of(d, struct sdw_master_device, dev)
 
 struct sdw_driver {
-	const char *name;
-
 	int (*probe)(struct sdw_slave *sdw,
 			const struct sdw_device_id *id);
 	int (*remove)(struct sdw_slave *sdw);
-- 
2.44.1

