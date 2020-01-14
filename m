Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DAE13AEE8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:13:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE2E17AB;
	Tue, 14 Jan 2020 17:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE2E17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018427;
	bh=qxWGtzWucbmN3gO3w4ZRVMnPjd8vu7SJtSGOy6MKJQY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=J+nlRIfVbjlti9cKCTN+ps5EYQTd+cfI6Z2TDY13ymA9YRBNVV9158oHBE0FkKsow
	 3HgKmVgc8OrUEr1JhtwdXM1qs7RJ4f3iZeqtHqeDlMh64IigH5sU9yVqkdjjs4exTh
	 YgDOAZn13xki+rXDlFtT0LbjPGVqLh0U4KsVq7/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5E8F802E1;
	Tue, 14 Jan 2020 17:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F36F802C3; Tue, 14 Jan 2020 17:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A20C8F8016F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20C8F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jYIdDtc0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GOU6b3l0J/q7CajAd4LcvR8zIEL0TEFRi/JTP/OOKXg=; b=jYIdDtc0/m+d
 RVmF5TK9eu7GLBwJ0zVRa5f/mP7lkDO1BEhc0Vye+V6QbL9MB7fmNxFWWK8qL/FtpJ/yRqIcOBZX9
 mIAQaZiT0p9v2Ss05B+UTNjOhhtd6MTvWbexpCGPSTGbOGfTaZtOuaZCMw+BsKGW6lu7bLNJct/O9
 o8XC8=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkd-0001Uz-Ja; Tue, 14 Jan 2020 16:09:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2F8C4D02C77; Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20191220164450.1395038-1-marex@denx.de>
Message-Id: <applied-20191220164450.1395038-1-marex@denx.de>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:07 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, festevam@gmail.com
Subject: [alsa-devel] Applied "regulator: core: Add regulator_is_equal()
	helper" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   regulator: core: Add regulator_is_equal() helper

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b059b7e0ec3208ff1e17cff6387d75a9fbab4e02 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Fri, 20 Dec 2019 17:44:49 +0100
Subject: [PATCH] regulator: core: Add regulator_is_equal() helper

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
Link: https://lore.kernel.org/r/20191220164450.1395038-1-marex@denx.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/helpers.c        | 14 ++++++++++++++
 include/linux/regulator/consumer.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index ca3dc3f3bb29..bb16c465426e 100644
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
index 337a46391527..2c89d886595c 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
