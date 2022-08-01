Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E61586F0F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D553E1631;
	Mon,  1 Aug 2022 18:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D553E1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659372988;
	bh=2jHYyStPBaM6ExUAuQxqnLHAgKPJvwUE/RNRYABTsfI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzSfZa1F5/d586nutEaZNs6nDr4tC3daXPd6oYlo4EHOyGzZ6TJjCIdRSwz3ktWod
	 hJ107rLpnuqO/0LECLrBjtKwbNbJ8PGxgFY4iBEDukLiwraCkVT1GSU/UkXChWAJrf
	 e1l0JA81kuj4+XJLewOsynN7uBz3442Jngth8n8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BC12F8054A;
	Mon,  1 Aug 2022 18:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36EBFF8023B; Mon,  1 Aug 2022 18:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73869F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73869F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="d0GgLurg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="a9APOek0"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3376C38185;
 Mon,  1 Aug 2022 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659372864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUlsJL+/qpK5RNgkAKYwPa5yYkTanfcriOJKB+1B0sw=;
 b=d0GgLurgv8/5GxiU1Dm7ciQs8qD14lpCnbanyG0adrdtNENn67Rd990PWHkJjClm/980Dl
 I0G//2QQJjjfMcaXKdX+nf/wgrKapH2c/TKt5mz1kKqObCPVbBLT/RIrTSqHBM0PMZtfvI
 H8K09ZN9wl7kU0mIbU7ROP6KMmfLGMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659372864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUlsJL+/qpK5RNgkAKYwPa5yYkTanfcriOJKB+1B0sw=;
 b=a9APOek09YwwmotlGcBrc0R07Xq7nW/7B+47YEoViHmvWPbj55r0oJmE2GGCp6PydpGKD9
 HFDtGhTdLdpztYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1AC913AAE;
 Mon,  1 Aug 2022 16:54:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ULwxOj8F6GL9GQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:54:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: SOF: debug: Fix potential buffer overflow by
 snprintf()
Date: Mon,  1 Aug 2022 18:54:19 +0200
Message-Id: <20220801165420.25978-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165420.25978-1-tiwai@suse.de>
References: <20220801165420.25978-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

snprintf() returns the would-be-filled size when the string overflows
the given buffer size, hence using this value may result in the buffer
overflow (although it's unrealistic).

This patch replaces with a safer version, scnprintf() for papering
over such a potential issue.

Fixes: 5b10b6298921 ("ASoC: SOF: Add `memory_info` file to debugfs")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index c5d797e97c02..d9a3ce7b69e1 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -252,9 +252,9 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
 	}
 
 	for (i = 0, len = 0; i < reply->num_elems; i++) {
-		ret = snprintf(buf + len, buff_size - len, "zone %d.%d used %#8x free %#8x\n",
-			       reply->elems[i].zone, reply->elems[i].id,
-			       reply->elems[i].used, reply->elems[i].free);
+		ret = scnprintf(buf + len, buff_size - len, "zone %d.%d used %#8x free %#8x\n",
+				reply->elems[i].zone, reply->elems[i].id,
+				reply->elems[i].used, reply->elems[i].free);
 		if (ret < 0)
 			goto error;
 		len += ret;
-- 
2.35.3

