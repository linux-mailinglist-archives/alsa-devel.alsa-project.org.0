Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF106C2172
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:31:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088BF828;
	Mon, 20 Mar 2023 20:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088BF828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340679;
	bh=AGShxNVJA+1dbrHP5QVgbxOuKEpbrCaUFfHwKz3RQlA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WTwUz4Xni/CiWWD4++I8qq9pflBfSYjVvn9Lc1F1vCsTiVKKuALldd4OYSJ9O/8Pm
	 SnyRAlQhI4NDNaW7/c8JbRhKFw2TrgZCw8hidDjwHED3xh6NDVjrxHMH79BjL87b+C
	 qYZ/vl3D4xOV3qDDoKB1tO7TXnEZsUd/yMhTwyDM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40733F80564;
	Mon, 20 Mar 2023 20:28:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9DAF8027B; Sun, 19 Mar 2023 05:48:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F16F80093
	for <alsa-devel@alsa-project.org>; Sun, 19 Mar 2023 05:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F16F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=on2MgYbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3Prsu
	7D2KQBP4G5c2iSTA7jTUpywbihS7wu+b9c1Iis=; b=on2MgYbtd3b9nE73RE50e
	7TCsvg8FKBAX7IKZet14VqDrlb1wCXD/+sJtjUmwEcx0DWrnjlofaNCOAL30TDb/
	xQo2vDL4Hi6qv51JLcLDjtd9wLY77ewruAdSnPrU7R6Zbb+JMZmhy9yaHeR4nQAC
	3fLB6ep3yVAZ77cG+AKqsY=
Received: from lizhe.. (unknown [120.245.132.192])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id
 _____wCHtzfnkxZkBrnyAQ--.4626S4;
	Sun, 19 Mar 2023 12:47:55 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH v1] ALSA:ac97: Remove redundant driver match function
Date: Sun, 19 Mar 2023 12:47:33 +0800
Message-Id: <20230319044733.327091-1-sensor1010@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHtzfnkxZkBrnyAQ--.4626S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1kAr4DtrykWF4rKF4rXwb_yoWkWrg_Ca
	y7ZFs7Xr17KF1fJw4fXw47AF97Ka1qvw1kKrs5t398KFyfXw4UWw4kJrsxAFn5urn2yFsx
	WryUXrWIy347XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNmhFDUUUUU==
X-Originating-IP: [120.245.132.192]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBohw3q1aEHrnIhQAAsa
X-MailFrom: sensor1010@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5X2EVZVNHVZWON4EZPUGNSUINSK2JJ6D
X-Message-ID-Hash: 5X2EVZVNHVZWON4EZPUGNSUINSK2JJ6D
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:28:32 +0000
CC: linux-kernel@vger.kernel.org, Lizhe <sensor1010@163.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5X2EVZVNHVZWON4EZPUGNSUINSK2JJ6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there is no driver match function, the driver core assumes that each
candidate pair (driver, device) matches, see driver_match_device()

Drop the bus's match function that always returned 1 and so
implements the same behaviour as when there is no match function.

Signed-off-by: Lizhe <sensor1010@163.com>
---
 sound/ac97_bus.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
index b4685c53ff11..c7aee8c42c55 100644
--- a/sound/ac97_bus.c
+++ b/sound/ac97_bus.c
@@ -75,19 +75,8 @@ int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
 }
 EXPORT_SYMBOL_GPL(snd_ac97_reset);
 
-/*
- * Let drivers decide whether they want to support given codec from their
- * probe method. Drivers have direct access to the struct snd_ac97
- * structure and may  decide based on the id field amongst other things.
- */
-static int ac97_bus_match(struct device *dev, struct device_driver *drv)
-{
-	return 1;
-}
-
 struct bus_type ac97_bus_type = {
 	.name		= "ac97",
-	.match		= ac97_bus_match,
 };
 
 static int __init ac97_bus_init(void)
-- 
2.34.1

