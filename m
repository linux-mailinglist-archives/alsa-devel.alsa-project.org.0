Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8AC586F25
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13F81616;
	Mon,  1 Aug 2022 19:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13F81616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373393;
	bh=GF2QP21J/sZcZbf15TuHgWOWDdLdI1V1SMJjdycHwx8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dfv57GjuAwwOkkrBXeGzGFsnYk0DXWGZIwWLIjTFWOzUy6EaSGoR6QFk3zOTp2XlF
	 mo9fBbk+DC7FvZxjfZFeTGzNab4WvtntNtDJhz6TOIN3R9S7VSAYWchI1dxAMaD7Zt
	 NzV4/5mqUbS6cb2SFKYsUu7sWj3lBWgSNGDVUAz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE0CF80539;
	Mon,  1 Aug 2022 19:01:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5FCEF8023B; Mon,  1 Aug 2022 19:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,PRX_BODY_30,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 118EEF8023B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 118EEF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="uqYATj1l"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fV4D150M"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD0F820698;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RByTkaSkFxB6Oc+eZ7noHkFk+wzRN4aritCQ7cW14V0=;
 b=uqYATj1l56300CMTqM1iZVGIT4m9VZKzY+L6Ik5SCjW76IVc4incQUKV+iLMQDiWXkdZhQ
 EjPHKRcTpsYQ3ZlHDKnKWnPQww7gv5p1IvIzVHVdATfiAHIZz0pX9cTnofX0fAQtNjPqWR
 +mx1163wAVrgDH2UIRfC4Ox5NuSM0Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RByTkaSkFxB6Oc+eZ7noHkFk+wzRN4aritCQ7cW14V0=;
 b=fV4D150MLUUAaGYVs30eFK6SwhfK00T4SGioGOf3NsNcCti5XyieehINjGEwmUzmFGnxy6
 Tq+b3mabF7tWw6DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADCC013AAE;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +JOuKdgG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 7/8] ASoC: DAPM: Replace sprintf() calls with sysfs_emit_at()
Date: Mon,  1 Aug 2022 19:01:07 +0200
Message-Id: <20220801170108.26340-8-tiwai@suse.de>
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
instead of the raw sprintf() & co.  This patch replaces the open-code
with a new helper, sysfs_emit_at(), by passing the string offset.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-dapm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b05231414c1d..73b8bd452ca7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2386,11 +2386,10 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
 
 static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
-	char *buf)
+					  char *buf, int count)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
 	struct snd_soc_dapm_widget *w;
-	int count = 0;
 	char *state = "not set";
 
 	/* card won't be set for the dummy component, as a spot fix
@@ -2423,7 +2422,7 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 		case snd_soc_dapm_pinctrl:
 		case snd_soc_dapm_clock_supply:
 			if (w->name)
-				count += sprintf(buf + count, "%s: %s\n",
+				count += sysfs_emit_at(buf, count, "%s: %s\n",
 					w->name, w->power ? "On":"Off");
 		break;
 		default:
@@ -2445,7 +2444,7 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 		state = "Off";
 		break;
 	}
-	count += sprintf(buf + count, "PM State: %s\n", state);
+	count += sysfs_emit_at(buf, count, "PM State: %s\n", state);
 
 	return count;
 }
@@ -2463,7 +2462,7 @@ static ssize_t dapm_widget_show(struct device *dev,
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_soc_component *cmpnt = codec_dai->component;
 
-		count += dapm_widget_show_component(cmpnt, buf + count);
+		count = dapm_widget_show_component(cmpnt, buf, count);
 	}
 
 	mutex_unlock(&rtd->card->dapm_mutex);
-- 
2.35.3

