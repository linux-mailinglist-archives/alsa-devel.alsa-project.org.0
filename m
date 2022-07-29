Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA86585125
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE7B1654;
	Fri, 29 Jul 2022 15:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE7B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659102760;
	bh=yojOPZoTKheFf2ni0ppawlxqu2ggwKuIvE5XhUcUJCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1ENe/xS1+5cGDU1YQzuIs/BH5m8crI4lxCgmGAYSQkHW1ne4uxE2oAqvSdUSl5Q6
	 f1+tXwB6dFhnOEgfyKLzOaYJA3Wc/8JzXIcUBMHg8gh6hlmyFzNStt+kacfVP6IfCY
	 X8Je3xzEBJstcOIvS7epi5nTjfxVQwYt9ABe3Ax4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC030F80548;
	Fri, 29 Jul 2022 15:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D0F9F80544; Fri, 29 Jul 2022 15:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74A5F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74A5F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="SuXfI5tQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 088B4B827C6;
 Fri, 29 Jul 2022 13:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED0AC433D6;
 Fri, 29 Jul 2022 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659102656;
 bh=yojOPZoTKheFf2ni0ppawlxqu2ggwKuIvE5XhUcUJCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SuXfI5tQZr6jJk4WuwayrgknirEpIxWPl6mSb/HJqNoG3O2mNY4zB0ld4bN4z80xZ
 KXkrik80gNUdRZ6bXhqx+a2UBE/N2SPAP7sShONnrh66sWnaZ/HOOkqxkrSfCE9YvR
 pc76atEvOYZ2n5cpFSlPnfDR/nlStYEGbwPWdHEk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] soundwire: sysfs: remove sdw_slave_sysfs_init()
Date: Fri, 29 Jul 2022 15:50:40 +0200
Message-Id: <20220729135041.2285908-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=yojOPZoTKheFf2ni0ppawlxqu2ggwKuIvE5XhUcUJCM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDEmPn25gnOgcea7Qsy25ufD431Wn5t/h79Lerhe6U1z/tGhL
 Yf2DjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIaiaG+dk7FLV+xx2Ik6xkk7wr25
 vPsyjmN8OCszXLS949EGc9zha9I5WVe35rL1sVAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

Now that sdw_slave_sysfs_init() only calls sdw_slave_sysfs_dpn_init(),
just do that instead and remove sdw_slave_sysfs_init() to get it out of
the way to save a bit of logic and code size.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soundwire/bus_type.c        |  4 ++--
 drivers/soundwire/sysfs_local.h     |  1 -
 drivers/soundwire/sysfs_slave.c     | 13 -------------
 drivers/soundwire/sysfs_slave_dpn.c |  3 +++
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 81c77e6ddbad..4e4e62d1e475 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -121,8 +121,8 @@ static int sdw_drv_probe(struct device *dev)
 	if (slave->ops && slave->ops->read_prop)
 		slave->ops->read_prop(slave);
 
-	/* init the sysfs as we have properties now */
-	ret = sdw_slave_sysfs_init(slave);
+	/* init the dynamic sysfs attributes we need */
+	ret = sdw_slave_sysfs_dpn_init(slave);
 	if (ret < 0)
 		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
 
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
index 3ab8658a7782..fa048e112629 100644
--- a/drivers/soundwire/sysfs_local.h
+++ b/drivers/soundwire/sysfs_local.h
@@ -15,7 +15,6 @@ extern const struct attribute_group *sdw_slave_status_attr_groups[];
 extern const struct attribute_group *sdw_attr_groups[];
 
 /* additional device-managed properties reported after driver probe */
-int sdw_slave_sysfs_init(struct sdw_slave *slave);
 int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
 
 #endif /* __SDW_SYSFS_LOCAL_H */
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 4c716c167493..070e0d84be94 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -211,19 +211,6 @@ const struct attribute_group *sdw_attr_groups[] = {
 	NULL,
 };
 
-int sdw_slave_sysfs_init(struct sdw_slave *slave)
-{
-	int ret;
-
-	if (slave->prop.source_ports || slave->prop.sink_ports) {
-		ret = sdw_slave_sysfs_dpn_init(slave);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 /*
  * the status is shown in capital letters for UNATTACHED and RESERVED
  * on purpose, to highligh users to the fact that these status values
diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
index c4b6543c09fd..a3fb380ee519 100644
--- a/drivers/soundwire/sysfs_slave_dpn.c
+++ b/drivers/soundwire/sysfs_slave_dpn.c
@@ -283,6 +283,9 @@ int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
 	int ret;
 	int i;
 
+	if (!slave->prop.source_ports && !slave->prop.sink_ports)
+		return 0;
+
 	mask = slave->prop.source_ports;
 	for_each_set_bit(i, &mask, 32) {
 		ret = add_all_attributes(&slave->dev, i, 1);
-- 
2.37.1

