Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58CB933A02
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5526A1F1;
	Wed, 17 Jul 2024 11:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5526A1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721209001;
	bh=A4sasep0wgFY/nol468aE8wUMXdmRa4J6+Hyubp4gQc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gAB4g+4MT2ViBu8NBuiznkAKNdmtAFgVed0ji14nUyhGwNX5L5DLU9D/ysvnVTBOA
	 hSJ6QKr103f/9qHJdkBlZFxk3BWAjQTnSVR3qS/HD82S87HHV6b+1cYMNYXdWpfAtm
	 npEbDGXNCpBi03M9Dz1EMRM+DjAtDmM+JRxBvU1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9EB4F805EF; Wed, 17 Jul 2024 11:35:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B39A7F805FA;
	Wed, 17 Jul 2024 11:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92023F8026D; Tue, 16 Jul 2024 04:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9025AF8007E
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 04:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9025AF8007E
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADX37cv4ZVm2umMAw--.46434S2;
	Tue, 16 Jul 2024 10:55:43 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.intel.com,
	sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: cs42l42: Convert comma to semicolon
Date: Tue, 16 Jul 2024 10:53:07 +0800
Message-Id: <20240716025307.400156-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADX37cv4ZVm2umMAw--.46434S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw4UZF15Wry8AF4rXF4UCFg_yoW8JF1fpa
	1q9a95Z3yfJw47Z3sYyr1DW3W8GFWjka17Ary7Ga90ywnIqF9YqF1xAFsrJF9xJFyjkFZx
	XFyaqr45Crn0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbZ2-5UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-MailFrom: nichen@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4XUM7F3A7BMAHVYLWDCYKDI7AUZVNPAQ
X-Message-ID-Hash: 4XUM7F3A7BMAHVYLWDCYKDI7AUZVNPAQ
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:35:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XUM7F3A7BMAHVYLWDCYKDI7AUZVNPAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace a comma between expression statements by a semicolon.

Fixes: 90f6a2a20bd2 ("ASoC: cs42l42: Add SoundWire support")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/cs42l42-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 94a66a325303..29891c1f6bec 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -323,15 +323,15 @@ static int cs42l42_sdw_read_prop(struct sdw_slave *peripheral)
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	/* DP1 - capture */
-	ports[0].num = CS42L42_SDW_CAPTURE_PORT,
-	ports[0].type = SDW_DPN_FULL,
-	ports[0].ch_prep_timeout = 10,
+	ports[0].num = CS42L42_SDW_CAPTURE_PORT;
+	ports[0].type = SDW_DPN_FULL;
+	ports[0].ch_prep_timeout = 10;
 	prop->src_dpn_prop = &ports[0];
 
 	/* DP2 - playback */
-	ports[1].num = CS42L42_SDW_PLAYBACK_PORT,
-	ports[1].type = SDW_DPN_FULL,
-	ports[1].ch_prep_timeout = 10,
+	ports[1].num = CS42L42_SDW_PLAYBACK_PORT;
+	ports[1].type = SDW_DPN_FULL;
+	ports[1].ch_prep_timeout = 10;
 	prop->sink_dpn_prop = &ports[1];
 
 	return 0;
-- 
2.25.1

