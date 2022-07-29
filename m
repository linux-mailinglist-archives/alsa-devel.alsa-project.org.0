Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774F585129
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C198C166C;
	Fri, 29 Jul 2022 15:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C198C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659102796;
	bh=IwvVpuGzmpujh0W6rRT+/Kr7v0ZN242P+UO+ZSURpDM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2T8PACvyF5ocaNQxPkLyErJ5kHAZKS+AaaF3RW1oJe/z7TIYU7NU/bQ2F8l5hxvr
	 WZp8qAzO1hD5P1NKkbZlEyDIjTyso9QWKBISW682pj9Fyep5Jb2ugtv3pjWyz3YNRy
	 y1P2veE7k6I9g3h2+4/UXKfG24RMKX+Qr2orA28o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A03F80563;
	Fri, 29 Jul 2022 15:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF431F8055C; Fri, 29 Jul 2022 15:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F9CF80544
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F9CF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="wZVJ8wgr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7671561F51;
 Fri, 29 Jul 2022 13:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8F1C433D6;
 Fri, 29 Jul 2022 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659102659;
 bh=IwvVpuGzmpujh0W6rRT+/Kr7v0ZN242P+UO+ZSURpDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wZVJ8wgrmjx65QWipukHfWz4wpWTgVbMSFRi/iJJjcjOAZC56O+r+YhCSeEitNMGA
 318yfjRTzoo+Q7uF9fyGNxfDc+OElI1H/MqSc24jl5o/7dBpm8ovH0TZxZODGbfx4q
 6xFtzyfmRvUqh/NMhpaK/astWrKDINqFjc3PdS5g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] soundwire: sysfs: remove unneeded ATTRIBUTE_GROUPS()
 comments
Date: Fri, 29 Jul 2022 15:50:41 +0200
Message-Id: <20220729135041.2285908-5-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=IwvVpuGzmpujh0W6rRT+/Kr7v0ZN242P+UO+ZSURpDM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDEmPn25QXj3nyzudMMbWJ8GyYqkvAhI3ak9oOpfhuF3BXalT
 KdGzI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbyZhrDgkkTV0/Y6bNmtnpxwvvV4s
 qcBizFuxgWdJa9T3LOq2N+U9x192PHotTtV56oAwA=
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

Now that we manually created our own attribute group list, the outdated
ATTRIBUTE_GROUPS() comments can be removed as they are not needed at
all.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/soundwire/sysfs_slave.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index 070e0d84be94..5b7666d27722 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -129,10 +129,6 @@ static struct attribute *slave_dev_attrs[] = {
 	NULL,
 };
 
-/*
- * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
- * for device-level properties
- */
 static const struct attribute_group sdw_slave_dev_attr_group = {
 	.attrs	= slave_dev_attrs,
 	.name = "dev-properties",
@@ -194,10 +190,6 @@ static struct attribute *dp0_attrs[] = {
 	NULL,
 };
 
-/*
- * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
- * for dp0-level properties
- */
 static const struct attribute_group dp0_group = {
 	.attrs = dp0_attrs,
 	.is_visible = dp0_is_visible,
-- 
2.37.1

