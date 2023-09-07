Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95679796D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B544E72;
	Thu,  7 Sep 2023 19:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B544E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106846;
	bh=xCnO4kZnTTfiLFarcj0DdPXYKo5Wq4aT17BKxrFFaDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LcECSlX+YDxoysN6pTInXoe8pen1ubJRSMugvv+YklpOgIaLnZBkBIcIb0iEJFIpR
	 2YsUeqWqcaj02ssLCBQVt2ug3mCHZYqEAhR+4j8e+Yy/vxy6yJcI5PoAJ91IOxKCKq
	 quN/frG1SuiabzB9ol+XRg8oY3OBTZCaip079GoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6593BF805F7; Thu,  7 Sep 2023 19:10:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B40F4F805EE;
	Thu,  7 Sep 2023 19:10:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19C60F805D4; Thu,  7 Sep 2023 19:10:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AEB36F805D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB36F805D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HJgEtVCA
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 762F566072F4;
	Thu,  7 Sep 2023 18:10:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106641;
	bh=xCnO4kZnTTfiLFarcj0DdPXYKo5Wq4aT17BKxrFFaDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJgEtVCA+qN+J+SkwLyHkSm4H5oAXVS/ekNU9wN1B9xceWrjWmou6Pvolar4HkXIx
	 h0wqrPE689J78gw5/D4a5TCujAKYqrPRZ52bOt+WwU4wb7xrwPGB7qVJMAEcF1wuKw
	 kD0qvHC8W/EVxv/q/2VQ5bKXIdzbC/qQRq/FkbJF1n4zTt/iPv0JOiJpotAHizMIBx
	 q89D/uSpSRY8JSrDQDHPVfKdivzOpYrKuuQ4JzaRizqBBUcCigQuOCQhr29JrWtTD+
	 HD54bZ75JJb8NBgkLutoO8q0kq2ACU/e56+Ne70k0UNK5J1vv0grFP0g5y+m/BsLtC
	 9TKrUCS8BRCHg==
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
Subject: [PATCH v2 09/11] ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
Date: Thu,  7 Sep 2023 20:10:08 +0300
Message-ID: <20230907171010.1447274-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IEMEKK2EWXNQVO3LZSMPCPV4RN6MXLHJ
X-Message-ID-Hash: IEMEKK2EWXNQVO3LZSMPCPV4RN6MXLHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEMEKK2EWXNQVO3LZSMPCPV4RN6MXLHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If component_add() fails, probe() returns without calling
pm_runtime_put(), which leaves the runtime PM usage counter incremented.

Fix the issue by jumping to err_pm label and drop the now unnecessary
pm_runtime_disable() call.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/pci/hda/cs35l41_hda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 09a9c135d9b6..6fd827093c92 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1625,8 +1625,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
 	if (ret) {
 		dev_err(cs35l41->dev, "Register component failed: %d\n", ret);
-		pm_runtime_disable(cs35l41->dev);
-		goto err;
+		goto err_pm;
 	}
 
 	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
-- 
2.41.0

