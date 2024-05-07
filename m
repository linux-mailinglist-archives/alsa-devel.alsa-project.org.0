Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC408BF0B4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 01:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D0E74C;
	Wed,  8 May 2024 01:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D0E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715123400;
	bh=pPFNJgP3ExZbYzaB6+JINPbSJcoMbjgUMEOefaHD+I4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AuR5z7IMWZqpo7uqtyXpMvWxS7Y01j8D9+Tgp6pavcWJ5+FFrS0gNekvoOZoO9ABB
	 GlegjsaiWeXoW6wosmbvdyzt1nq/g540d/bi/1pRnxMJoAbUtYPPYHiIK/va0HMLpy
	 07JqiXZAxcGrSKZDQEELdsCCZ5EoiK836JziElmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B34CF80579; Wed,  8 May 2024 01:09:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF0EF805AC;
	Wed,  8 May 2024 01:09:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87EDF80580; Wed,  8 May 2024 01:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 421D7F80579
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 01:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421D7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bWT34EwK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2E9F619FF;
	Tue,  7 May 2024 23:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E47C4AF67;
	Tue,  7 May 2024 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123341;
	bh=pPFNJgP3ExZbYzaB6+JINPbSJcoMbjgUMEOefaHD+I4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWT34EwKl5Byc5O8ZWi4tiAeMrq/FpFMfinQpQlgBPUkZymd7NgDOU/4kNFO0jgNS
	 aODF2YXynBnhn4Tl14FhQZX+AOS0FIIEEv87oxU95ktCm3oZ59OVvfZUj6lGxwnGBb
	 YeHgQXLBd9aSni8ridvUtoKzsIXwaf4JKLmJmysEEjsAa4rHTpm9X7lEjxVBGDVQ6X
	 KEqKzsmGORkzv3N3E6Z0B7tpoXj+DK7wfUktma/ggTUraqwVooVBEtRfiikBOHPh7Q
	 BLMAHuLheYRGdGkl3AbTFnAwj+0+IYsIhnXT8K3ugrV2FY2rRGxgqods3j1uOssAKX
	 JmLAGUa+N037Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 32/52] ASoC: cs35l56: fix usages of
 device_get_named_child_node()
Date: Tue,  7 May 2024 19:06:58 -0400
Message-ID: <20240507230800.392128-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NSGILKA3BUY2E5CICGMZVOQYHTE4FCU7
X-Message-ID-Hash: NSGILKA3BUY2E5CICGMZVOQYHTE4FCU7
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSGILKA3BUY2E5CICGMZVOQYHTE4FCU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit fbd741f0993203d07b2b6562d68d1e5e4745b59b ]

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid leaked references.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240426152939.38471-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 6dd0319bc843c..ea72afe3f906f 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1297,6 +1297,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 				    "spk-id-gpios", ACPI_TYPE_PACKAGE, &obj);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "Could not get spk-id-gpios package: %d\n", ret);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1304,6 +1305,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	if (obj->package.count != 4) {
 		dev_warn(cs35l56->base.dev, "Unexpected spk-id element count %d\n",
 			 obj->package.count);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1318,6 +1320,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		 */
 		ret = acpi_dev_add_driver_gpios(adev, cs35l56_af01_spkid_gpios_mapping);
 		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return dev_err_probe(cs35l56->base.dev, ret,
 					     "Failed to add gpio mapping to AF01\n");
 		}
@@ -1325,14 +1328,17 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		ret = devm_add_action_or_reset(cs35l56->base.dev,
 					       cs35l56_acpi_dev_release_driver_gpios,
 					       adev);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return ret;
+		}
 
 		dev_dbg(cs35l56->base.dev, "Added spk-id-gpios mapping to AF01\n");
 	}
 
 	desc = fwnode_gpiod_get_index(af01_fwnode, "spk-id", 0, GPIOD_IN, NULL);
 	if (IS_ERR(desc)) {
+		fwnode_handle_put(af01_fwnode);
 		ret = PTR_ERR(desc);
 		return dev_err_probe(cs35l56->base.dev, ret, "Get GPIO from AF01 failed\n");
 	}
@@ -1341,9 +1347,12 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	gpiod_put(desc);
 
 	if (ret < 0) {
+		fwnode_handle_put(af01_fwnode);
 		dev_err_probe(cs35l56->base.dev, ret, "Error reading spk-id GPIO\n");
 		return ret;
-		}
+	}
+
+	fwnode_handle_put(af01_fwnode);
 
 	dev_info(cs35l56->base.dev, "Got spk-id from AF01\n");
 
-- 
2.43.0

