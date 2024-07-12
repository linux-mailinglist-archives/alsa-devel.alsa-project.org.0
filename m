Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E41E92FC61
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 16:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F5FE65;
	Fri, 12 Jul 2024 16:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F5FE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720793963;
	bh=1tdVOay90qKoOBtZsqzjMTRYxUTqdTqLiJ2eTqVl8pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XW6SFPACqVmw9Lc2qJDq4DITex0udfLzKpp4mU00qDUGRxJk7nGlr6zejB4+Mhlvz
	 mTYUzM82PIwHQ+BfKnAdeLlYb7l2JDtR9ZSwDU/4AEpFPlRAo47iTWDf+jdgF5TmCA
	 rOsF+k/jP/ePqqZtOnCtS508PdheNF2tWqimh6xE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFB65F805D8; Fri, 12 Jul 2024 16:18:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F645F805D7;
	Fri, 12 Jul 2024 16:18:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77DC3F8020D; Fri, 12 Jul 2024 16:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D45EFF80074
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 16:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45EFF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GK3m/Myd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0A5FCE1A5F;
	Fri, 12 Jul 2024 14:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1950C32786;
	Fri, 12 Jul 2024 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720793318;
	bh=1tdVOay90qKoOBtZsqzjMTRYxUTqdTqLiJ2eTqVl8pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GK3m/MydnKsOO1mz/qpTsUU9Nr0bk06clrR4al/JiC6cqzmPsBG5Hg/HbrJB6V5p/
	 VfO1OeNQUzdM+OAukBXhVBcVRSp5SB+3n5uLIFzmDi3kBmFiZEqg9NVVvYSbC5VVoc
	 eoyXCcg3bLYTzGi26SRde1JghliDd10PABRONJVZC2NJ9XUN2ijKT90rpaFnI7/sK5
	 jtgGc+IwwfRZqgutxUkGBICwFtSEUcLruWvBq6auro1SmcJ7J3HlBcVUK+8MKfgMhb
	 /dMLabtmPad37/NGQduHsN/yIc9xDE/Cr8JDp731IT3AI/lwsZXg+aPNrmSpKGjpV1
	 36B76Ub7UWTQg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sSGww-000000006KD-1grC;
	Fri, 12 Jul 2024 16:08:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 1/3] soundwire: bus: suppress probe deferral errors
Date: Fri, 12 Jul 2024 16:07:59 +0200
Message-ID: <20240712140801.24267-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240712140801.24267-1-johan+linaro@kernel.org>
References: <20240712140801.24267-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7UNN2T65OJHXFCDBJNKDX4MIAOHLAUQE
X-Message-ID-Hash: 7UNN2T65OJHXFCDBJNKDX4MIAOHLAUQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UNN2T65OJHXFCDBJNKDX4MIAOHLAUQE/>
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
2.44.2

