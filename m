Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3468B74FC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF3CDF6;
	Tue, 30 Apr 2024 13:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF3CDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478157;
	bh=1ukMYFxzPfY1qsmq+J1Ewq78TfiLOMOqhtd5od5EB0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rj7VXwHiFKBaQh24IySiIux4ANRc/bCPmLKFvXHlx+B8WlcXocvx558cmhdD848xO
	 OMninyPfO2yP2GVqd+NA+MLuBbxHsJkunVblAchgOCS/+ZTC5hVppbd5iM5NSrd8X9
	 Fcc2lYEwx9Z83/16/IPRtcxWSFCQLXQkhI5IcibA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F4FF805F4; Tue, 30 Apr 2024 13:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20538F805F2;
	Tue, 30 Apr 2024 13:55:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E1DF8028D; Tue, 30 Apr 2024 13:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D5C3F8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5C3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=jOZ2ihVM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zwiSUDPpKEKl2A0JVQtlH+c9e9Co8VShhAKYP5+ABCA=; b=jOZ2ih
	VMtj+LpEO83K4WUH05bZJkKW2aIENuvPgJj6kMqSJkUJwVNzWGkBeQHzdS6Cwbtb
	LblUrnd60FpBxtCcNegap7qS86svKc+82Q4tGgaxOVbn6i9EXWK3psAGrvSv9aA2
	gwePwEmqHPskdH3WSR6bwODgDdCOHPCn6+f4QFR3wSb98qJVPtQ/aZnZ7T1bw+SJ
	hcR2MswKtdaJOwTYlMf3iywl6kzN+nz30CNAkYPP+KEtvT6XKdaduFDELqKS7OSc
	xnT3A6EUSYGvqHIssmN0A8x120NvmnsX0xgfbV5KihL3uBn+lcUZ6W/Q8cVzf0ht
	5SB0ql11qSVI3zeQ==
Received: (qmail 2621497 invoked from network); 30 Apr 2024 13:54:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 13:54:39 +0200
X-UD-Smtp-Session: l3s3148p1@ds3jCE8XMqtehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: wm8962: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 13:54:34 +0200
Message-ID: <20240430115438.29134-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WXK65YC7DBFSOA4ZEDU4OGHNLX5BQNQE
X-Message-ID-Hash: WXK65YC7DBFSOA4ZEDU4OGHNLX5BQNQE
X-MailFrom: wsa+renesas@sang-engineering.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXK65YC7DBFSOA4ZEDU4OGHNLX5BQNQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/wm8962.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 7c6ed2983128..3856e7a8eeff 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2886,7 +2886,7 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct _fll_div fll_div;
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 	int fll1 = 0;
 
@@ -2974,14 +2974,14 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 	 * higher if we'll error out
 	 */
 	if (wm8962->irq)
-		timeout = msecs_to_jiffies(5);
+		time_left = msecs_to_jiffies(5);
 	else
-		timeout = msecs_to_jiffies(1);
+		time_left = msecs_to_jiffies(1);
 
-	timeout = wait_for_completion_timeout(&wm8962->fll_lock,
-					      timeout);
+	time_left = wait_for_completion_timeout(&wm8962->fll_lock,
+						time_left);
 
-	if (timeout == 0 && wm8962->irq) {
+	if (time_left == 0 && wm8962->irq) {
 		dev_err(component->dev, "FLL lock timed out");
 		snd_soc_component_update_bits(component, WM8962_FLL_CONTROL_1,
 				    WM8962_FLL_ENA, 0);
-- 
2.43.0

