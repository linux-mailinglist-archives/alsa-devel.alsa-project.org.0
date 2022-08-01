Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6836586F31
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D881635;
	Mon,  1 Aug 2022 19:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D881635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373482;
	bh=8dhR7VJYR4XTYpOSUZKCQmcXstgpWkPl+twIh26P7jM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwYQkPWEemfj/v61Rl7p3TUTlR/NF3XOQbW8BtUT7xjQ0AAahgpP89pFaH51dYKoK
	 S/318oDXTAJiYAl5ZpZ4MuOfNZv6u+ipV7/bLoNwClHdDf6nSg2y7QUVGdjuTRiR6X
	 Uml06Tq4QgvErfPL+3w6DjRR+lEmFICrK1O/Nnck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A48CEF8058C;
	Mon,  1 Aug 2022 19:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F66F80589; Mon,  1 Aug 2022 19:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB94F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB94F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="E1ZDdyC/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VVJAl8Gs"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AABDF20684;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flm3EAid1FyYWaoC5b48xbvqyVtFEOLFTTsVO4ZK0tM=;
 b=E1ZDdyC/SxzGUbL3x7PVM4IJv1BVUw0w+QECRf1lAWM284/pdZSvADY0B22JwnS2Xe50pK
 xuIvv73I4jPZfGu3idzNSY3TnK3MedOzp/rRX+6M+W4YwaX15QKszeqMUnow2KdXx4HfAI
 KMU34qKFZKm4HFnWfMwY3jILIiX4F0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flm3EAid1FyYWaoC5b48xbvqyVtFEOLFTTsVO4ZK0tM=;
 b=VVJAl8Gs07h7CS9SDCcHRP1LaCP5/gqDkDyDSMbjCzI6MS1mVE5aqibYMk7C0yyoc+Nf+9
 jsjmZk9eX4z/pvAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73B3813ADF;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oEKOG9gG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/8] ASoC: core: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 19:01:06 +0200
Message-Id: <20220801170108.26340-7-tiwai@suse.de>
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
instead of the raw sprintf() & co.  This patch replaces the sprintf()
usage straightforwardly with a new helper, sysfs_emit().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e824ff1a9fc0..e020ab49cfb1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -72,7 +72,7 @@ static ssize_t pmdown_time_show(struct device *dev,
 {
 	struct snd_soc_pcm_runtime *rtd = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%ld\n", rtd->pmdown_time);
+	return sysfs_emit(buf, "%ld\n", rtd->pmdown_time);
 }
 
 static ssize_t pmdown_time_store(struct device *dev,
-- 
2.35.3

