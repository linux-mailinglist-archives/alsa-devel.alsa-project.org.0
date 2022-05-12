Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B38524B68
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAAE1AAD;
	Thu, 12 May 2022 13:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAAE1AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354384;
	bh=jv8G1agcRVwhrz1O1q4Ch+Z472ENfIeo/WXmazNLAX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/XfSm2OlMacjcMhcx/zuhcWNT9a812CcouzqeqP81KE+Tx3/7o9XIpiXUl16K7MK
	 Spp5BQi4Hs2vjHQEFzxNo8kk0jT6A3BfWgAQ+rdFCwxmvSslPH41sfhhgOhzazT65e
	 Lt+Y5bNdocz2F1QkTk8ljC/ruZ0cEQ9zEAZ6GMhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D38F8010B;
	Thu, 12 May 2022 13:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B042BF804FE; Thu, 12 May 2022 13:18:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05A89F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A89F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vPMZ0qLt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="xf4mG0lp"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F90F5C01B4;
 Thu, 12 May 2022 07:18:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 12 May 2022 07:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1652354284; x=
 1652440684; bh=U41sdkndxEPcUW2HyhBS60wraWtLaKd+4y+3d1M8lDk=; b=v
 PMZ0qLtnKry/pGu8zc6NK4KjTrML9LTCDdfMOzRCCApM47NFSSLxD3WZsm7jacPS
 /zjGRXjhZ4xSuV+FXJGb5DFU26n3PdDLzmq+nrlaWbJw8ItIoc4LHM9Gt2eoZZ3Y
 HkjiGLh4EI86KdANWP4AYdpbuWdbuFX9Ohj+L356eFNlrC+dcJQ+lE9JEHNYTIhj
 FtP3sFs1SgUZ10iuE+RGUHSspM3rkWotEK+105YOUOdSMPINugZ4/oMq+RgPotvb
 9DvDq2bfc+cb8kJPhNUgeF/EALzw3phrQJioR0RbBvDhksVuZ3R9tv/R2LB4Yoki
 /Xg/YO28RauXNGlZxPsHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652354284; x=1652440684; bh=U41sdkndxEPcUW2HyhBS60wraWtLaKd+4y+
 3d1M8lDk=; b=xf4mG0lpw+MGNUABxgT/09xcAl9EvWDFQ3YJaImlcUTQop8tvC6
 MM1hgOtvR9HmjXpgtBAKI9cWR5w2z49j6WJwMvJkKpamFwuFcGwCt5RbGFdFRHTY
 CUv7dtcGp8ulSmY4fBoIDGvjyl65lQ8TUeRUHXS5HRfwD99FKcN14zNleCa6Kf7Y
 rM6F2gs34mhq02VPmh+HTBUSf7Yv25Q88ASOnoM0TrveAmsrnYVtDsk+60KJ0ALC
 lmJG4FJHm5kqh46soxRvuOzRXA5h8mshFDxFAp5EDKSD3dxlktZM7cpvGdq8qoKz
 H8d7X5LRoPWJa/r6UUtSJ2Q7EwWB/aQf90g==
X-ME-Sender: <xms:6-x8YmEw2v5QQM_MX92cBfvKI2I9pC011fEm3bDzLguR_BGca7leug>
 <xme:6-x8YnXbv4kYH0HB1a0SFCeciGEs6-HqPZltl9FsqNncGDFd32-AC99r_zGbC7TFS
 TcRclut3FjDrlPUDmQ>
X-ME-Received: <xmr:6-x8YgLnF8M_fZDfuSN18VztiINZO1NKKW6tVsa7jJtXj_moPKP9lz5gkCI5nFVqqIyTLBClGmNL6-rHg54HT7Im1Pkpd4qFkURWw9ma-HiPYnxheQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeei
 gfevueetffeivdffkedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:6-x8YgGUdIGNPID7Gk43TjNVcWMACgN8qBTXBO1rYonDXgH6prr9YA>
 <xmx:6-x8YsWuy2aecL5fdYsXWiqLZ0hFZTYDc4F8jFvJ5UjBD69c5m4zag>
 <xmx:6-x8YjMEQTjng_4G8eYAW631F31Bv-d1wkXz5iMngfT4a4u2AzS3Dw>
 <xmx:7Ox8YqxGt5OhzIzdCEqPlDRXJkNdvx3ifnDiDn2H8mrQ5tAb6dwISg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 07:18:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH 1/3] firewire: convert sysfs sprintf/snprintf family to
 sysfs_emit
Date: Thu, 12 May 2022 20:17:54 +0900
Message-Id: <20220512111756.103008-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
References: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Abaci Robot <abaci@linux.alibaba.com>
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

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Fix the following coccicheck warning:

./drivers/firewire/core-device.c:375:8-16: WARNING: use scnprintf or
sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-device.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index 90ed8fdaba75..adddd8c45d0c 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -372,8 +372,7 @@ static ssize_t rom_index_show(struct device *dev,
 	struct fw_device *device = fw_device(dev->parent);
 	struct fw_unit *unit = fw_unit(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			(int)(unit->directory - device->config_rom));
+	return sysfs_emit(buf, "%td\n", unit->directory - device->config_rom);
 }
 
 static struct device_attribute fw_unit_attributes[] = {
@@ -403,8 +402,7 @@ static ssize_t guid_show(struct device *dev,
 	int ret;
 
 	down_read(&fw_device_rwsem);
-	ret = snprintf(buf, PAGE_SIZE, "0x%08x%08x\n",
-		       device->config_rom[3], device->config_rom[4]);
+	ret = sysfs_emit(buf, "0x%08x%08x\n", device->config_rom[3], device->config_rom[4]);
 	up_read(&fw_device_rwsem);
 
 	return ret;
-- 
2.34.1

