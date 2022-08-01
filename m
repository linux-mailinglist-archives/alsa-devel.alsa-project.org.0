Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C75586F28
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07981657;
	Mon,  1 Aug 2022 19:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07981657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373440;
	bh=XN/lm9YZWkaCNSA/mf1JejcISdkUWTuxUSUE2AFdHDo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wkm8ejjytG19nRRg52ZfNtgPwt5yzl+NT9ZKoTkPk73xHg887fcKwOoIIuM4Ad1Ai
	 CgQhEXFsDvHC5LJFn8HpCGSFOWnF/c2bjFwIKAlErYfBimfcXadECNpnt+cUB7iKBW
	 YOuO+HUTMn0DNCNUvr8cRTNu1J1VX9yPI95wQbfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45780F8056F;
	Mon,  1 Aug 2022 19:01:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0362EF8014B; Mon,  1 Aug 2022 19:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD089F8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD089F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1+D4iby2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="nEuX7x41"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B50420539;
 Mon,  1 Aug 2022 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0jiXwCV7NxumJXtba9YynsD3POSNwpn5An/jRQzfdA=;
 b=1+D4iby2l6H5wnREutuAI2FvLAQ5dTV9EIYaS+I58OiylGrv3MTdEZBKBcxzscLxBkKSOu
 HUQPF3YXANeYafMEttDxUhb6cI0xyj2qe5MeAEGGE+WI8vnV4EuqCvTvremQcbODbguImo
 RZK2IEJcSYhnAvCLmnIN8H+SCEm69xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0jiXwCV7NxumJXtba9YynsD3POSNwpn5An/jRQzfdA=;
 b=nEuX7x41ACtywk2/QXK604BXKJxJ1YbDgA5mGe9swzPFkh9qW3acjR27riIrTxdeMBqam5
 PofY9itnNXS3RBDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D6BE13ADF;
 Mon,  1 Aug 2022 17:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EH/8GdcG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/8] ASoC: cs43130: Replace scnprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 19:01:01 +0200
Message-Id: <20220801170108.26340-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801170108.26340-1-tiwai@suse.de>
References: <20220801170108.26340-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

sysfs_emit() is a new helper to simplify the sysfs string output.
Replace the open-code straightforwardly with this new helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs43130.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index ca4d47cc9c91..06c6ad3ca2b7 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1666,10 +1666,9 @@ static int cs43130_show_dc(struct device *dev, char *buf, u8 ch)
 	struct cs43130_private *cs43130 = i2c_get_clientdata(client);
 
 	if (!cs43130->hpload_done)
-		return scnprintf(buf, PAGE_SIZE, "NO_HPLOAD\n");
+		return sysfs_emit(buf, "NO_HPLOAD\n");
 	else
-		return scnprintf(buf, PAGE_SIZE, "%u\n",
-				 cs43130->hpload_dc[ch]);
+		return sysfs_emit(buf, "%u\n", cs43130->hpload_dc[ch]);
 }
 
 static ssize_t hpload_dc_l_show(struct device *dev,
@@ -1705,8 +1704,8 @@ static int cs43130_show_ac(struct device *dev, char *buf, u8 ch)
 
 	if (cs43130->hpload_done && cs43130->ac_meas) {
 		for (i = 0; i < ARRAY_SIZE(cs43130_ac_freq); i++) {
-			tmp = scnprintf(buf + j, PAGE_SIZE - j, "%u\n",
-					cs43130->hpload_ac[i][ch]);
+			tmp = sysfs_emit_at(buf, j, "%u\n",
+					    cs43130->hpload_ac[i][ch]);
 			if (!tmp)
 				break;
 
@@ -1715,7 +1714,7 @@ static int cs43130_show_ac(struct device *dev, char *buf, u8 ch)
 
 		return j;
 	} else {
-		return scnprintf(buf, PAGE_SIZE, "NO_HPLOAD\n");
+		return sysfs_emit(buf, "NO_HPLOAD\n");
 	}
 }
 
-- 
2.35.3

