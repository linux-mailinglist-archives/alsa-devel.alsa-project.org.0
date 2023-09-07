Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFB797973
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E47E0D;
	Thu,  7 Sep 2023 19:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E47E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106881;
	bh=rIB839KbtT4M8CYKZ1SHwXmr9eGS1OcT+UowfodUupQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MVcRKiYlXdRG1LCtQ9IBlnrNQv0bEKjj36RwiYRdt299ogMlk+ZCoGpgIHmmJBmz+
	 NhFuWhaUPzjgQqjrPFC+aZGY1wot5nJoOm/676/2emS92J5Pb6dl7hIEisDZC1NOfk
	 LnnY7ic3W2Sz2CghhyGn24CySFPIQr8OITJi6mqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D92F80606; Thu,  7 Sep 2023 19:10:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99455F805FF;
	Thu,  7 Sep 2023 19:10:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6564DF805EF; Thu,  7 Sep 2023 19:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53D6DF805E0
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D6DF805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=YipAyS+s
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A88C166072F7;
	Thu,  7 Sep 2023 18:10:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106647;
	bh=rIB839KbtT4M8CYKZ1SHwXmr9eGS1OcT+UowfodUupQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YipAyS+s+34w+o5S1L4JGFAzu5i0XzX7Mm1+LeSjGSXnMAFaoUoQ1R7GKS+ZFf0Kh
	 67E41SgZlirlEk5cElfhVylwcu1tZlXJ/v9aoCTCFS5Z7d4NbKeFmJVBhLePQvKVgm
	 gA/zkun9e+nM+pt8yxV69r6KgWbiakFkmtZYiqKhFBBwlXo60Ci91duDxUU9hSF0ny
	 zcnggy+6OTxCaKO/gVNoFqvjGuGFQlHirPsLNsGwngFPMerC5UwONMjZZ9o0eg4AZL
	 G1qA1LUqB97//C6rWkxVRUbL8uxCviOscdPOvBf9kzjO/6ukokLf6eOA7mZqd9uS0v
	 d91xxPzjrtAaQ==
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
Subject: [PATCH v2 11/11] ALSA: hda: cs35l41: Consistently use dev_err_probe()
Date: Thu,  7 Sep 2023 20:10:10 +0300
Message-ID: <20230907171010.1447274-12-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QL7KLN44U2VYJX46ISLE3TD2JL3PV7YD
X-Message-ID-Hash: QL7KLN44U2VYJX46ISLE3TD2JL3PV7YD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL7KLN44U2VYJX46ISLE3TD2JL3PV7YD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace the remaining dev_err() calls in probe() with dev_err_probe(),
to improve consistency.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/pci/hda/cs35l41_hda.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 565f7b897436..c74faa2ff46c 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1550,27 +1550,27 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4, int_status,
 				       int_status & CS35L41_OTP_BOOT_DONE, 1000, 100000);
 	if (ret) {
-		dev_err(cs35l41->dev, "Failed waiting for OTP_BOOT_DONE: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Failed waiting for OTP_BOOT_DONE\n");
 		goto err;
 	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_sts);
 	if (ret || (int_sts & CS35L41_OTP_BOOT_ERR)) {
-		dev_err(cs35l41->dev, "OTP Boot status %x error: %d\n",
-			int_sts & CS35L41_OTP_BOOT_ERR, ret);
+		dev_err_probe(cs35l41->dev, ret, "OTP Boot status %x error\n",
+			      int_sts & CS35L41_OTP_BOOT_ERR);
 		ret = -EIO;
 		goto err;
 	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
 	if (ret) {
-		dev_err(cs35l41->dev, "Get Device ID failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Get Device ID failed\n");
 		goto err;
 	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
 	if (ret) {
-		dev_err(cs35l41->dev, "Get Revision ID failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Get Revision ID failed\n");
 		goto err;
 	}
 
@@ -1593,7 +1593,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
 	if (ret) {
-		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "OTP Unpack failed\n");
 		goto err;
 	}
 
@@ -1624,7 +1624,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
 	if (ret) {
-		dev_err(cs35l41->dev, "Register component failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Register component failed\n");
 		goto err_pm;
 	}
 
-- 
2.41.0

