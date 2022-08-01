Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B5586F27
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2361621;
	Mon,  1 Aug 2022 19:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2361621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373432;
	bh=62kRVi47VP39fc4UM0vDJdSlVJ6prrw2pwQ+5HKlYFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGhqr+7DCx7fzyQZHTcO9xd6qVUmpIl0b3HTmFwz0qfhgoc+6KN4iPpmwon7nHsGK
	 buVXqo53H2DqLOMTXijt8C63+euxA+fQF6HH16L9kTuZGeSYKwojSyjtuUGpmvCHYA
	 JK6caPcmwJtZB3N5O8ezcdLiVWC9/DKQLksQoLpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6067F8055B;
	Mon,  1 Aug 2022 19:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E8AAF804FF; Mon,  1 Aug 2022 19:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F31F802DB
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F31F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="urGT69B6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZfU366yC"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C285344D3;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ea4zw7Zh6YgY3V1kPtjXOZ+zT5Gg/ukKFYk9CWFVyNs=;
 b=urGT69B6qz4Ov3jgHQzbgOpg15gyOyvsI4QHFOVqq7KM6+Vkfy5GvwuPJ0lyrV7+YQDaHW
 nkc4lFexJgf1azAsp27DZn5LJ3se0UspRoBztN+0opfNXyZoOirCi3Q+hLlehPNpXewBv+
 IRNEctr+QTcSCAMUGAn3bsWkdxyeCww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ea4zw7Zh6YgY3V1kPtjXOZ+zT5Gg/ukKFYk9CWFVyNs=;
 b=ZfU366yC1Qdhcx/Qh5LpPZPz/97dlmA8yUT3zu6HpzIzoEt/Coqc8ErFHzkJMqkxp5QP4/
 ARFXYLxvp0CMxECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4266613AAE;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yNdGD9gG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/8] ASoC: Intel: skylake: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 19:01:05 +0200
Message-Id: <20220801170108.26340-6-tiwai@suse.de>
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
instead of the raw sprintf() & co.  This patch replaces those usages
straightforwardly with a new helper, sysfs_emit().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl-nhlt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index deb7b820325e..e617b4c335a4 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -61,7 +61,7 @@ static ssize_t platform_id_show(struct device *dev,
 			nhlt->header.oem_revision);
 
 	skl_nhlt_trim_space(platform_id);
-	return sprintf(buf, "%s\n", platform_id);
+	return sysfs_emit(buf, "%s\n", platform_id);
 }
 
 static DEVICE_ATTR_RO(platform_id);
-- 
2.35.3

