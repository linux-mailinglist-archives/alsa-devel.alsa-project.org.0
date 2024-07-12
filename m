Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592692FC78
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 16:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C303E65;
	Fri, 12 Jul 2024 16:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C303E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720794354;
	bh=b+g0wkurwgHAuPLw7DhPBo/ti/dMGUAaoXVnZGKEE8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A2tSUCYALUT2NiYrVVUJpBfDeIa5u5xhbhn5T0C8UJliSyvgp7b2hchcoD99tKFmZ
	 iqgZGU2EuV9EnVR9Ck/D1g5CHzcDs6wwAnWVARCWaSjl67WrPSIW0UWUPcI566VonL
	 bEnJluhBBHA+HRZcEO+1/C6HyXdD41HZGXnOGbDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A246F805B4; Fri, 12 Jul 2024 16:25:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB481F805C2;
	Fri, 12 Jul 2024 16:25:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55BA7F80494; Fri, 12 Jul 2024 16:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDD0DF8019B
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 16:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD0DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BDHcw8kb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3A02CE1A7E;
	Fri, 12 Jul 2024 14:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1904C32782;
	Fri, 12 Jul 2024 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720793318;
	bh=b+g0wkurwgHAuPLw7DhPBo/ti/dMGUAaoXVnZGKEE8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDHcw8kbCQHMIjLRnqnjXcU7HVZ0TKlGr5Bi7s5XAO8/IOO+lLNTfrv6X3MjU9pHg
	 q3Zgj0sP590L1hPn6uo9KzHt9vE2ToiAiM/s4a+KlCF78+kx2kCw0+iM52A48JdEdI
	 VcnJkmcCg20taxvNyzfdSwoXe0J37rN9My2cR5ENAIB3LFNL12zwQslIvEulpTf7I5
	 0BuC0NupQoW9Lt9SCqqlPiGPEOyqYn4qer7U1sZmcHKs/N9+gLENLfJTkY82mw0hz2
	 ATeNoA7WtgmOPnmhj75ijOEERE9e8X34vjy1/yaCpBJxa5bt9og8EPV6jdq7/1tCS0
	 bbCOaS55eu75Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sSGww-000000006KF-244e;
	Fri, 12 Jul 2024 16:08:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 2/3] soundwire: bus: drop unused driver name field
Date: Fri, 12 Jul 2024 16:08:00 +0200
Message-ID: <20240712140801.24267-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240712140801.24267-1-johan+linaro@kernel.org>
References: <20240712140801.24267-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GTUB6UDLYDHD3AT67WLYVG7CRAY2T2Q3
X-Message-ID-Hash: GTUB6UDLYDHD3AT67WLYVG7CRAY2T2Q3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTUB6UDLYDHD3AT67WLYVG7CRAY2T2Q3/>
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
2.44.2

