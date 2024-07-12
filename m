Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636A92FC77
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 16:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35217DF9;
	Fri, 12 Jul 2024 16:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35217DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720794323;
	bh=d6yyoRJi3R7yLXIYWh6FukyOXX8Ng8iIFRGZyBMCrXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bA5X/s82F47G46VrvkZLGget0nIasXqwjJdNCzoPph5XU254b2lEaUqb0W+JEJpn2
	 yJGJwEdYjueoVOeCSHChyMX/wxK4tvidplKiiRH7z2MJh8A13gVt1Bt2J04GP+SEiJ
	 8pqV9Y3c0C6zCbsZyoh2uQL4g8fOueuXX6153AEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D3A1F805AA; Fri, 12 Jul 2024 16:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B152AF80508;
	Fri, 12 Jul 2024 16:24:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68844F80074; Fri, 12 Jul 2024 16:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E112EF801F5
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 16:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E112EF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HnDTtrTV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 408B7CE1AF0;
	Fri, 12 Jul 2024 14:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F70C4AF0C;
	Fri, 12 Jul 2024 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720793318;
	bh=d6yyoRJi3R7yLXIYWh6FukyOXX8Ng8iIFRGZyBMCrXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HnDTtrTVCPk95Zr6JsIUWD3Cm2jUSrQTDVV7VSJSR+G6Y0J8PExnHlOhBGExpz+TP
	 acrxF8PmDPQ52yA50xcbEEKzYOtvaTtPuxPQM7d2f/4F19BoFpyUD4L8LWdNNJIYIH
	 0lIzNGb3PWHO8cVAm3isOou6Wo+1lvYkXgruQD/KWyM1u3Ei+aRLpix5yFv67564Ox
	 4913kyPvgObMRIriJfAML5rGzl+Vsjw5FJK7dLWi4olahVkKd6/rh8ZVRydVO3XbWz
	 BOfg1yvGjaXlmfxlx7SOzSkhoZflX0kKXyIhkQ1tLBDfF9eGps/QPB0hTtK34JjXa+
	 BnnkmwjwvBJeA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sSGww-000000006KH-2R4B;
	Fri, 12 Jul 2024 16:08:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 3/3] soundwire: bus: clean up probe warnings
Date: Fri, 12 Jul 2024 16:08:01 +0200
Message-ID: <20240712140801.24267-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240712140801.24267-1-johan+linaro@kernel.org>
References: <20240712140801.24267-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HEWTDHZT4OSZQJXLVUYEMSBITRA74A6P
X-Message-ID-Hash: HEWTDHZT4OSZQJXLVUYEMSBITRA74A6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEWTDHZT4OSZQJXLVUYEMSBITRA74A6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clean up the probe warning messages by using a common succinct and
greppable format (e.g. without __func__ and with a space after ':').

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soundwire/bus_type.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 3979be0f8b65..3930b245008d 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
 	/* init the dynamic sysfs attributes we need */
 	ret = sdw_slave_sysfs_dpn_init(slave);
 	if (ret < 0)
-		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
+		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
 
 	/*
 	 * Check for valid clk_stop_timeout, use DisCo worst case value of
@@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
 	if (drv->ops && drv->ops->update_status) {
 		ret = drv->ops->update_status(slave, slave->status);
 		if (ret < 0)
-			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
+			dev_warn(dev, "failed to update status at probe: %d\n", ret);
 	}
 
 	mutex_unlock(&slave->sdw_dev_lock);
-- 
2.44.2

