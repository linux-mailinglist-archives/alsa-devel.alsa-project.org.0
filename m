Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C024F1280DB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 17:46:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468F615F8;
	Fri, 20 Dec 2019 17:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468F615F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576860416;
	bh=paG4N6I6wBr8eUfjfBRyfWnAWHow0cGOGcTLaAJ5Bzk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c+KLq1ftAWU4efmnBOf1ttDySIez4SvPyax3rsu2xNPU1FDil/M/p8axsYqxjkTxT
	 0fnXc8c+xa8mriGfXBpkbUwziGEItVKYfR7PkjcBGHkLdPIFbyk0ATlcWyOly202K9
	 FHJluECdldKL4EE6y7vj7p3AyrzpsZVf03sFUsHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4E6F8015A;
	Fri, 20 Dec 2019 17:45:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25E45F8022C; Fri, 20 Dec 2019 17:45:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B7BF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 17:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B7BF80059
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47fZNf3xstz1rVvp;
 Fri, 20 Dec 2019 17:45:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47fZNf2QZVz1rYZQ;
 Fri, 20 Dec 2019 17:45:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id IY1d3Ov3zoLi; Fri, 20 Dec 2019 17:45:05 +0100 (CET)
X-Auth-Info: 0/v/4MPZBO2U4DCrbIThOIMIlBhSDOZyqKExvIB1K60=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 20 Dec 2019 17:45:05 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 17:44:49 +0100
Message-Id: <20191220164450.1395038-1-marex@denx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, festevam@gmail.com
Subject: [alsa-devel] [PATCH V2 1/2] regulator: core: Add
	regulator_is_equal() helper
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

Add regulator_is_equal() helper to compare whether two regulators are
the same. This is useful for checking whether two separate regulators
in a driver are actually the same supply.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---
V2: New patch
---
 drivers/regulator/helpers.c        | 14 ++++++++++++++
 include/linux/regulator/consumer.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index ca3dc3f3bb292..bb16c465426ef 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/driver.h>
 #include <linux/module.h>
 
+#include "internal.h"
+
 /**
  * regulator_is_enabled_regmap - standard is_enabled() for regmap users
  *
@@ -881,3 +883,15 @@ void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
 		consumers[i].supply = supply_names[i];
 }
 EXPORT_SYMBOL_GPL(regulator_bulk_set_supply_names);
+
+/**
+ * regulator_is_equal - test whether two regulators are the same
+ *
+ * @reg1: first regulator to operate on
+ * @reg2: second regulator to operate on
+ */
+bool regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
+{
+	return reg1->rdev == reg2->rdev;
+}
+EXPORT_SYMBOL_GPL(regulator_is_equal);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 337a463915278..2c89d886595cb 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -287,6 +287,8 @@ void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
 				     const char *const *supply_names,
 				     unsigned int num_supplies);
 
+bool regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
+
 #else
 
 /*
@@ -593,6 +595,11 @@ regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
 {
 }
 
+static inline bool
+regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
+{
+	return false;
+}
 #endif
 
 static inline int regulator_set_voltage_triplet(struct regulator *regulator,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
