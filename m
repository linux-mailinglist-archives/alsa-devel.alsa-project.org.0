Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEE59FC89
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 16:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70EAF1FC;
	Wed, 24 Aug 2022 16:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70EAF1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661349712;
	bh=dUTwXXFu5PCz/IzkEcwjndg31DOpffH9A3ry/4de9h8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUnfSoMZAuZObKqzGsr1kY5k7IYW8dusn3TPYMlkFnHXoer45ym7ZxlcTvDgdxpaF
	 Rd0TSVmj/01a8UhG/lf1wF+2A/5hRkvKIGaPj+yTBzfjl4i7HUH0rXpBpziJEulNi4
	 /MIcVSzDC76/1dSEfDT2mp3ZW+G2fgkPRtUSjfWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11ECDF80533;
	Wed, 24 Aug 2022 16:00:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D46EF80533; Wed, 24 Aug 2022 16:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5F0AF804BD
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 16:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5F0AF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="wW9jIJcI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9CD0B823B5;
 Wed, 24 Aug 2022 14:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01517C433C1;
 Wed, 24 Aug 2022 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661349603;
 bh=dUTwXXFu5PCz/IzkEcwjndg31DOpffH9A3ry/4de9h8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wW9jIJcIUdQlKMtLr5BuYINEhp9PaZ1EQFI3HuwI5xviVxoM9YPCjYmlb8AxWeQar
 VEFCI1SrVjZPW/1jCuhMc5dvmVoYT7sulJIqZ+cdWvEmeOeRFNc+dO7wzeFZhXIFcl
 ejij0boP1PLor8nBHb2/4WlfvOEN1qKNiCbzPY50=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/6] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Date: Wed, 24 Aug 2022 15:59:48 +0200
Message-Id: <20220824135951.3604059-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
References: <20220824135951.3604059-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=dUTwXXFu5PCz/IzkEcwjndg31DOpffH9A3ry/4de9h8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMlseteef/mh/zH/b9e7visGKimyzaIfutadlrgbIrRVbulC
 yY1NHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRt6YMC9ZHOc5U8ObLOvxx/sRp+0
 +L5HhkLGKYn9Yf7dNVz5my54TV3Y0iD+1YL3WrAwA=
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

There's no need to special-case the dp0 sysfs attributes, the
is_visible() callback in the attribute group can handle that for us, so
add that and add it to the attribute group list making the logic simpler
overall.

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

 drivers/soundwire/sysfs_slave.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 83e3f6cc3250..3723333a5c2b 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(words);
 
+static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
+			      int n)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
+
+	if (slave->prop.dp0_prop)
+		return attr->mode;
+	return 0;
+}
+
 static struct attribute *dp0_attrs[] = {
 	&dev_attr_max_word.attr,
 	&dev_attr_min_word.attr,
@@ -190,12 +200,14 @@ static struct attribute *dp0_attrs[] = {
  */
 static const struct attribute_group dp0_group = {
 	.attrs = dp0_attrs,
+	.is_visible = dp0_is_visible,
 	.name = "dp0",
 };
 
 static const struct attribute_group *slave_groups[] = {
 	&slave_attr_group,
 	&sdw_slave_dev_attr_group,
+	&dp0_group,
 	NULL,
 };
 
@@ -207,12 +219,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
-	if (slave->prop.dp0_prop) {
-		ret = devm_device_add_group(&slave->dev, &dp0_group);
-		if (ret < 0)
-			return ret;
-	}
-
 	if (slave->prop.source_ports || slave->prop.sink_ports) {
 		ret = sdw_slave_sysfs_dpn_init(slave);
 		if (ret < 0)
-- 
2.37.2

