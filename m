Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F86797972
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B3DE75;
	Thu,  7 Sep 2023 19:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B3DE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106868;
	bh=ebjTOlKhI8W4zt2KLb9pyA5zxGnqWLuX8KAbomolyu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0s/s+EG/i25CK2I2jQY/jk4OG896yVNKvTujPYOLRi3ifzQyp7O4lmBpvg0Z/6Wc
	 JbLDQrB1iy98lGZZVCy8At0iwklz7Pd7bupM3UDW7VB2QlGj6Dn/cwCwBch1MKMOUK
	 L8ct4us2tYl7JkyKOOTjkziS9MzaTsV4w3ABt6xw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 220F1F805F8; Thu,  7 Sep 2023 19:10:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3575BF805F6;
	Thu,  7 Sep 2023 19:10:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C41DF805E1; Thu,  7 Sep 2023 19:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77D53F805E0
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D53F805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=eIsHJoKe
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6468366072F6;
	Thu,  7 Sep 2023 18:10:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106644;
	bh=ebjTOlKhI8W4zt2KLb9pyA5zxGnqWLuX8KAbomolyu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIsHJoKe89p6AZNI2jcZHGhVv4MPQa5q9p46uvQ8sFgCFwlpdPsRcHkX3dCMgh9wJ
	 O6o+jDDv5FDaOZ25kDeRI3K82Y8F6BaU9WcLJYB/HZ+mSkTLUgMe7RSKbOg9Uj2ReY
	 tT2czfmwjqhPAdUjzSGldkGo0b70PrObV/XmUVlAUKeSq7XQmnWgCsL13C4r5NmEvn
	 b7ROTdmf+wzyOLhjrGvtnbWGgtY43YEHeyxzApWRfiIIoclw2ZRTyKr1y8cNa7fwWJ
	 GKNJV1yv3Rlw9rTZroGp0pOAfv/mbDYaBmwzmaur+aEgC9i2wa+U/QMvyRQJQwy7e/
	 f/9nHk4Ct8A6g==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 10/11] ALSA: hda: cs35l41: Undo runtime PM changes at
 driver exit time
Date: Thu,  7 Sep 2023 20:10:09 +0300
Message-ID: <20230907171010.1447274-11-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QSC6SBV43AZS7ZBZJA7INJ6254AKQ4JU
X-Message-ID-Hash: QSC6SBV43AZS7ZBZJA7INJ6254AKQ4JU
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSC6SBV43AZS7ZBZJA7INJ6254AKQ4JU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to the documentation, drivers are responsible for undoing at
removal time all runtime PM changes done during probing.

Hence, add the missing calls to pm_runtime_dont_use_autosuspend(), which
are necessary for undoing pm_runtime_use_autosuspend().

Fixes: 1873ebd30cc8 ("ALSA: hda: cs35l41: Support Hibernation during Suspend")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/pci/hda/cs35l41_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 6fd827093c92..565f7b897436 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1633,6 +1633,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	return 0;
 
 err_pm:
+	pm_runtime_dont_use_autosuspend(cs35l41->dev);
 	pm_runtime_disable(cs35l41->dev);
 	pm_runtime_put_noidle(cs35l41->dev);
 
@@ -1651,6 +1652,7 @@ void cs35l41_hda_remove(struct device *dev)
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	pm_runtime_get_sync(cs35l41->dev);
+	pm_runtime_dont_use_autosuspend(cs35l41->dev);
 	pm_runtime_disable(cs35l41->dev);
 
 	if (cs35l41->halo_initialized)
-- 
2.41.0

