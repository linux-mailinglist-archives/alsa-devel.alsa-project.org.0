Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99F586F22
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CAE83D;
	Mon,  1 Aug 2022 19:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CAE83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373338;
	bh=ypySvKtCf+TxYVIV9PpSNw0p33pizvbXVZLYedbBN3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWzYd9QPTlzYYNwltqqMopWTRfIu3WsmVhE/1AdBEaJR9pDHu1iJI+yfY9XFCp94k
	 dcZWpPFZBAc1kZvu3LF+Ot/QddW+EC8+kiF+REWupaLTgD9qzaDt1y5NRycOvUEYye
	 Nb54H+aGISmHkzYXu1Rv4q07huSWH2mjTH2n+0HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA86F80152;
	Mon,  1 Aug 2022 19:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9227FF80548; Mon,  1 Aug 2022 19:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67CC3F80152
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CC3F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="A951s+rK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="KS1JFctl"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 411B8339A8;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pQRaGdAiXFFrvhmr0AhRRCAvJVzQ+qLTKFysaN889g=;
 b=A951s+rKD/A/rV7pVlHbCx3eGmQlDnu9GT/jWWVhAyAmk08zfTBalN9NMmkOkeVzJn7eTe
 p9F99SN0XhJjvfR/oC2B3kDuamKTwFwvbXRnjM0J/PFti8Kk3uDp+yzrr5DcZK6NkEnVH6
 uzp8E/ZFh3csMu41f8GTisBuQdLDfEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pQRaGdAiXFFrvhmr0AhRRCAvJVzQ+qLTKFysaN889g=;
 b=KS1JFctlQ61PbazA+7g7GimtQtpSMToR3Ay793M6SNd2a2dgXKJLD6eReZUZWcYyfrnUFd
 FWEvC0URJOfe/cAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10D7413ADF;
 Mon,  1 Aug 2022 17:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OGNSA9gG6GKJHAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:01:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/8] ASoC: Intel: catpt: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 19:01:04 +0200
Message-Id: <20220801170108.26340-5-tiwai@suse.de>
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
 sound/soc/intel/catpt/sysfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 1bdbcc04dc71..9b6d2d93a2e7 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -27,8 +27,8 @@ static ssize_t fw_version_show(struct device *dev,
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
 
-	return sprintf(buf, "%d.%d.%d.%d\n", version.type, version.major,
-		       version.minor, version.build);
+	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.type, version.major,
+			  version.minor, version.build);
 }
 static DEVICE_ATTR_RO(fw_version);
 
@@ -37,7 +37,7 @@ static ssize_t fw_info_show(struct device *dev,
 {
 	struct catpt_dev *cdev = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", cdev->ipc.config.fw_info);
+	return sysfs_emit(buf, "%s\n", cdev->ipc.config.fw_info);
 }
 static DEVICE_ATTR_RO(fw_info);
 
-- 
2.35.3

