Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA02586F29
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F319E1658;
	Mon,  1 Aug 2022 19:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F319E1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373466;
	bh=EsuAK2Py9IEdekhK8r4IurU8YmKVytrd94RzVmRqM+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQqg8BMrAtcSkrOdOE+CWDjs8dOqiVtz/cY8UubB/bQLq/Veoj6CFgT2XVfRMVAOY
	 1e4J7o5H0uGUWmsxYFCTrvn/IBaJBGTI+qxHBUd5qSlabyDfNrWRxBP2n1vNtt5Pk+
	 jBV2HO2AHmcU6bm46LqlGtEParGtTtBF10hCzCSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 308BAF8057B;
	Mon,  1 Aug 2022 19:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99C4AF804FF; Mon,  1 Aug 2022 19:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59627F804FA
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59627F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ByE01QfT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6+W6s/y8"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D918206D7;
 Mon,  1 Aug 2022 17:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHdO/a3WKOwt9nY5QGWELProlniXPv17HHwPIiMxhpM=;
 b=ByE01QfT06SLGCa81rS6Fdvc9j5LzS4tkhSz/t0MF8yn9q/p+47Rn4dZvMLLgXSd6pmxQu
 LPJLfNoGaFLJzRh99fGXD3GcaVA64vx9AD/ihRcgOlqTN2z3NTH7ET5DjsOYiLl26udwZ2
 f9udZ/dUtwJ3HAzFojiCjQD1syy2SRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHdO/a3WKOwt9nY5QGWELProlniXPv17HHwPIiMxhpM=;
 b=6+W6s/y8dLPjmT2ximuLw1Dzm9RgigdILN0IHC7/GIM4+8rD8D/gUXXvipcFm/faCHjxoJ
 i29tOpqu6E1WI2DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E09E913ADF;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id METTNdgG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 8/8] ASoC: omap: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 19:01:08 +0200
Message-Id: <20220801170108.26340-9-tiwai@suse.de>
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

For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
instead of the raw sprintf() & co.  This patch replaces the open code
with new helpers, sysfs_emit() and sysfs_emit_at(), with the proper
string offset.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/ti/omap-mcbsp-st.c | 6 +++---
 sound/soc/ti/omap-mcbsp.c    | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 7e8179cae92e..8163f453bf36 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -244,10 +244,10 @@ static ssize_t st_taps_show(struct device *dev,
 
 	spin_lock_irq(&mcbsp->lock);
 	for (i = 0; i < st_data->nr_taps; i++)
-		status += sprintf(&buf[status], (i ? ", %d" : "%d"),
-				  st_data->taps[i]);
+		status += sysfs_emit_at(buf, status, (i ? ", %d" : "%d"),
+					st_data->taps[i]);
 	if (i)
-		status += sprintf(&buf[status], "\n");
+		status += sysfs_emit_at(buf, status, "\n");
 	spin_unlock_irq(&mcbsp->lock);
 
 	return status;
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index c4ac1f30b9fe..0b377bb7737f 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -517,7 +517,7 @@ static ssize_t prop##_show(struct device *dev,				\
 {									\
 	struct omap_mcbsp *mcbsp = dev_get_drvdata(dev);		\
 									\
-	return sprintf(buf, "%u\n", mcbsp->prop);			\
+	return sysfs_emit(buf, "%u\n", mcbsp->prop);			\
 }									\
 									\
 static ssize_t prop##_store(struct device *dev,				\
@@ -560,11 +560,11 @@ static ssize_t dma_op_mode_show(struct device *dev,
 
 	for (s = &dma_op_modes[i]; i < ARRAY_SIZE(dma_op_modes); s++, i++) {
 		if (dma_op_mode == i)
-			len += sprintf(buf + len, "[%s] ", *s);
+			len += sysfs_emit_at(buf, len, "[%s] ", *s);
 		else
-			len += sprintf(buf + len, "%s ", *s);
+			len += sysfs_emit_at(buf, len, "%s ", *s);
 	}
-	len += sprintf(buf + len, "\n");
+	len += sysfs_emit_at(buf, len, "\n");
 
 	return len;
 }
-- 
2.35.3

