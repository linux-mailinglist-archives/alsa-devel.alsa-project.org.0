Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB12F95BF
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 23:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CC7177A;
	Sun, 17 Jan 2021 23:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CC7177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610921277;
	bh=LwuQrz774FkhzJuQVSNXSK86uwSZJcFdrTZPPaO/qcE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=olgb2zER7Mu6ggbewy1Bza254ijGnhB3ThQm0KW4viU2YyKgXMXFOcspzq4tYsKLz
	 Xzosm5yowK1lOdg/cXc81e3eUrdfXKzDVVZSmhbAxVxqcl9Wl5Sux7PL+LsyRPxMGV
	 hoTl2A8gZf0OrDqx20AwH6jbI7vd6++D59UcUdi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C465F80255;
	Sun, 17 Jan 2021 23:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00138F80257; Sun, 17 Jan 2021 23:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D742F800C0
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 23:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D742F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BEcTSurd"
Received: by mail-lj1-x22d.google.com with SMTP id m10so16279250lji.1
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 14:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sk03eSAe1i1kiZvLpOKZi/f9KCnWeoSdMZIHeuRne8o=;
 b=BEcTSurdW1C9IcPJmU/H4Yyd8N0FyjZsyy++4GyY6yl9Qdmqc9fD0XuYgtdcCPZZ+k
 106b++bz6AV+mzCIKhFfER6CUpYTh+7FuZQgIWvaEhnZlXZiXHftlu6iyK5Zj4+650ci
 FuWFpKd4Skn/E0lK+4wQjuWK/dJNgoXG5mq9mDKGM7kIueJeDYhuAV70Wx5s8vGx+Yru
 v17WYvGYi8HHjNV1bN21dMBX+SE+l5SD5ka546kbMsIWA9t3d272jYwxcKGeUoJ3IP1J
 TrlWQC4UNWWD8fXVygqbfBlgb/Z3cfrovX+l9F7/lmx3Oiz0wYi5yUeSswaNR0I7IkOc
 +CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sk03eSAe1i1kiZvLpOKZi/f9KCnWeoSdMZIHeuRne8o=;
 b=pW+BxxE6eZNDTtB/fLCHJl/5FSJieZ/ts5xHXD514zIwoEgRtblvuJwGjkGggcU7qf
 +9d8fMWWDKCSzRJka1ETuMlI7Ow012Hyh3clHYEADX4HKlvJbZ2ScTQ+4V99HlTyobFA
 jfK2JCwT4zOxBIKFee04kU4KpOM5y4fJG37IT5uFYV4/jZfO4c5lzQwcH4d8kyQUE/+6
 JhY4+pjVKVLRQgLYH2VBvlUv8xta+kU1X9xREURlkWupdCbADcCvUQoZcqp6c7d8lr/o
 aHgnH47F5nYv2UTIffSWAwnNJpV+xQhu1yZKLOhjk1yY5ky+0EGSRGuSAcKAHvXmtzU0
 sCsQ==
X-Gm-Message-State: AOAM530HENwpNHd3ztGA3LCaUtIpyjLAzW/kYbcENX5FApQ6oXUendZX
 oF8mPKjKocMhGo6u9MxwBhM=
X-Google-Smtp-Source: ABdhPJxolJh0Z5JiF5XnwRcEQtK7maKetm1vKt92O8mYmYp6DZA/emjaKA/NuUfE4qUgLFTX7n0gKQ==
X-Received: by 2002:a2e:9ad3:: with SMTP id p19mr9246210ljj.286.1610921176342; 
 Sun, 17 Jan 2021 14:06:16 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id b141sm1684647lfd.148.2021.01.17.14.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 14:06:15 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] soundwire: sysfs: Constiyf static struct attribute_group
Date: Sun, 17 Jan 2021 23:06:11 +0100
Message-Id: <20210117220611.30921-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org,
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

The only place sdw_slave_dev_attr_group is used is when its address is
passed to devm_device_add_group() which takes a pointer to const struct
attribute_group. Make it const to allow the compiler to put it in
read-only memory. This makes all attribute_group structs in the file
const. Done with the help of Coccinelle.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/soundwire/sysfs_slave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index b48b6617a396..3210359cd944 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -130,7 +130,7 @@ static struct attribute *slave_dev_attrs[] = {
  * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
  * for device-level properties
  */
-static struct attribute_group sdw_slave_dev_attr_group = {
+static const struct attribute_group sdw_slave_dev_attr_group = {
 	.attrs	= slave_dev_attrs,
 	.name = "dev-properties",
 };
-- 
2.30.0

