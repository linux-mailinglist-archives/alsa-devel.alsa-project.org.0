Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F006E4F0B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:18:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93EF9E71;
	Mon, 17 Apr 2023 19:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93EF9E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681751879;
	bh=THEBJp10W2qpm6iYvWk8seFmU4NYrWoGvHDNxm01FDY=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=k99O788c5dG3jHoX8FtTDZlsB8HgspzG8Ykay0kxWeUBC1auDcKhzFUl/WnLw3FHB
	 HdhRQBIE0kusRNIWIZgnfKPOx3aDEaH8sPxT9OZGdxUVFlRBhs7eUO87qn6EJQQ5gG
	 g7P3Aba1vsbFQABfssO5rXxUHM6pBVBewo1Ue0bg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2222BF80534;
	Mon, 17 Apr 2023 19:16:25 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 2/7] mfd: core: Ensure disabled devices are skiped without
 aborting
Date: Mon, 17 Apr 2023 19:15:56 +0200
In-Reply-To: <20230417171601.74656-1-herve.codina@bootlin.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6AQV4YXKNS6JSKOZPJVVI76WYLBFL3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168175178434.26.279057837959556495@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F64DF8052E; Mon, 17 Apr 2023 19:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F93AF8025D
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F93AF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b64kLCm8
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 3F0ADC0003;
	Mon, 17 Apr 2023 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681751771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4awDvhGdDQISuFdVnpKwFbC3AMKibp9qWmNCuZN7E0=;
	b=b64kLCm8zEislkGM3IzKY9wiXlTjEGtTiMm/34Tmm8y1JbYb4pmjj5XT17B2InBu+R8pl0
	KvM+mXw+wI9IQfkW16Iy6vxHKx1ooNMac/M3P8y8H+pSW8S0POs/AVd46QjpjiuxTMI1cZ
	0+QbudEauGFqofi6aAiGgdBth2g7qkUcFcxLRDZI7AnUSnRZ0W0Hlow5ExXn55e9mfC6xa
	4Me6W5yYUFZMQR8FhmKUoAsBam0mQsl6z5sLnmvBSXetXZ7TABUQ6wyG8KM2SRcE29X1JY
	thiZW+jg28kwSkiWxQNnguKJHiwnMd4fepyJVjsCyY6wnCeVV3ZnPjZoTPbmrg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 2/7] mfd: core: Ensure disabled devices are skiped without
 aborting
Date: Mon, 17 Apr 2023 19:15:56 +0200
Message-Id: <20230417171601.74656-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417171601.74656-1-herve.codina@bootlin.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N6AQV4YXKNS6JSKOZPJVVI76WYLBFL3B
X-Message-ID-Hash: N6AQV4YXKNS6JSKOZPJVVI76WYLBFL3B
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6AQV4YXKNS6JSKOZPJVVI76WYLBFL3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The loop searching for a matching device based on its compatible
string is aborted when a matching disabled device is found.
This abort avoid to add devices as soon as one disabled device
is found.

Continue searching for an other device instead of aborting on the
first disabled one fixes the issue.

Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/mfd/mfd-core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 16d1861e9682..7c47b50b358d 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -176,6 +176,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct platform_device *pdev;
 	struct device_node *np = NULL;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	bool not_available;
 	int ret = -ENOMEM;
 	int platform_id;
 	int r;
@@ -211,13 +212,13 @@ static int mfd_add_device(struct device *parent, int id,
 		goto fail_res;
 
 	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
+		not_available = false;
 		for_each_child_of_node(parent->of_node, np) {
 			if (of_device_is_compatible(np, cell->of_compatible)) {
-				/* Ignore 'disabled' devices error free */
+				/* Skip 'disabled' devices */
 				if (!of_device_is_available(np)) {
-					of_node_put(np);
-					ret = 0;
-					goto fail_alias;
+					not_available = true;
+					continue;
 				}
 
 				ret = mfd_match_of_node_to_dev(pdev, np, cell);
@@ -227,10 +228,17 @@ static int mfd_add_device(struct device *parent, int id,
 				if (ret)
 					goto fail_alias;
 
-				break;
+				goto match;
 			}
 		}
 
+		if (not_available) {
+			/* Ignore 'disabled' devices error free */
+			ret = 0;
+			goto fail_alias;
+		}
+
+match:
 		if (!pdev->dev.of_node)
 			pr_warn("%s: Failed to locate of_node [id: %d]\n",
 				cell->name, platform_id);
-- 
2.39.2

