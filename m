Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36859FC7E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 16:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEF2204;
	Wed, 24 Aug 2022 16:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEF2204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661349665;
	bh=24DO39uVA59fhWMiW4WyrPflQTYFQ4KqBhlx29/uJp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kf9HTCsDX1pXRLd/2isXCes2C4aC0mBKWO6FOB3AyqQmuohcCbHuvneN05YkdgY1/
	 0KllESsgujdTivLe94BJt0cx1ykQpaXApv+ZiaKbeK2559enlfNBrTDlxh2BGC2ob8
	 1cw8noQ5C6y2IF1N84Ip8AGXHD45c3z1uRrqR9Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D1CEF804CC;
	Wed, 24 Aug 2022 16:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1605FF800A7; Wed, 24 Aug 2022 16:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 378D3F800A7
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 15:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 378D3F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="2T2JmI0z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61BE8617C9;
 Wed, 24 Aug 2022 13:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F440C433D6;
 Wed, 24 Aug 2022 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661349595;
 bh=24DO39uVA59fhWMiW4WyrPflQTYFQ4KqBhlx29/uJp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2T2JmI0z0fv+ODoHwI1oQFEI2OwvNRKK8g84LuADy3UKW8QWNDP7WNQUVIOPFBpJh
 FtFoGrrFpKt+Dv6L/+AJwpbeW7hqgigdS7mBNVMZAxDtEJC7tcr3lqiyFIxUlTU9ri
 9z5YgUP8y1NmXSHYebJVExKR5RQqXBwrRnV86zd8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/6] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Date: Wed, 24 Aug 2022 15:59:47 +0200
Message-Id: <20220824135951.3604059-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=24DO39uVA59fhWMiW4WyrPflQTYFQ4KqBhlx29/uJp4=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMlsetfCHyy783/1utsBHi5e17/fSjMsZ/ngMPWIZsvcc+zd
 D0IcOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi2/YyLJi+b9UNS7471xatk7y6IN
 pSb7/Q0v8M84wO3aj+8Ha6SY2no5uHQ23KBtXnuQA=
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

The sysfs logic already creates a list of groups for the device, so add
the sdw_slave_dev_attr_group group to that list instead of having to do
a two-step process of adding a group list and then an individual group.

This is a step on the way to moving all of the sysfs attribute handling
into the default driver core attribute group logic so that the soundwire
core does not have to do any of it manually.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebased on 6.0-rc1

 drivers/soundwire/sysfs_slave.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 3210359cd944..83e3f6cc3250 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -105,7 +105,10 @@ static struct attribute *slave_attrs[] = {
 	&dev_attr_modalias.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(slave);
+
+static const struct attribute_group slave_attr_group = {
+	.attrs = slave_attrs,
+};
 
 static struct attribute *slave_dev_attrs[] = {
 	&dev_attr_mipi_revision.attr,
@@ -190,6 +193,12 @@ static const struct attribute_group dp0_group = {
 	.name = "dp0",
 };
 
+static const struct attribute_group *slave_groups[] = {
+	&slave_attr_group,
+	&sdw_slave_dev_attr_group,
+	NULL,
+};
+
 int sdw_slave_sysfs_init(struct sdw_slave *slave)
 {
 	int ret;
@@ -198,10 +207,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
-	ret = devm_device_add_group(&slave->dev, &sdw_slave_dev_attr_group);
-	if (ret < 0)
-		return ret;
-
 	if (slave->prop.dp0_prop) {
 		ret = devm_device_add_group(&slave->dev, &dp0_group);
 		if (ret < 0)
-- 
2.37.2

