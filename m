Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9693494600
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 04:15:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFFB2EDD;
	Thu, 20 Jan 2022 04:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFFB2EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642648541;
	bh=OtkEo254PcNpLXrgAxSqCij00Dt0bnvC1/BCA2WbKno=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K+TIRvV28MMZcboOa1NxwvTrQZKb9kIrEN5Zyg5Al4UIz8qT9VskYgx//8oua75s2
	 zPbWEEAFQkG5AzryNfK6owFqbD3mYFWTN+omoNVfinoVbBgXqsP+Ycr902CJiAXBNr
	 Ti/J2hp6BxAae4z/5yFImQP+dGn1oJ+73m0Ec2d4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC92EF80134;
	Thu, 20 Jan 2022 04:14:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 361BBF8012E; Thu, 20 Jan 2022 04:14:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FB59F8007E
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 04:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FB59F8007E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC3FA201004;
 Thu, 20 Jan 2022 04:14:26 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3DAE201001;
 Thu, 20 Jan 2022 04:14:26 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5A412183ACDD;
 Thu, 20 Jan 2022 11:14:24 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: separate max_buffer_size
 assignment
Date: Thu, 20 Jan 2022 10:44:02 +0800
Message-Id: <1642646642-15908-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

The config->pcm_hardware may be NULL when config->prealloc_buffer_size
is not zero, so it is better to move max_buffer_size assignment under
a separate condition.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index c54c8ca8d715..8659cb1794f1 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -237,13 +237,15 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 	size_t max_buffer_size;
 	unsigned int i;
 
-	if (config && config->prealloc_buffer_size) {
+	if (config && config->prealloc_buffer_size)
 		prealloc_buffer_size = config->prealloc_buffer_size;
-		max_buffer_size = config->pcm_hardware->buffer_bytes_max;
-	} else {
+	else
 		prealloc_buffer_size = prealloc_buffer_size_kbytes * 1024;
+
+	if (config && config->pcm_hardware && config->pcm_hardware->buffer_bytes_max)
+		max_buffer_size = config->pcm_hardware->buffer_bytes_max;
+	else
 		max_buffer_size = SIZE_MAX;
-	}
 
 	for_each_pcm_streams(i) {
 		struct snd_pcm_substream *substream = rtd->pcm->streams[i].substream;
-- 
2.17.1

