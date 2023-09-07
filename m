Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5B797962
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BEC846;
	Thu,  7 Sep 2023 19:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BEC846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106729;
	bh=qbGf9dTskivmBZH5bu+AEo0oFeT7I13FlT9OFQJZyls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NJ269Mjb0ed/ckac0/Cf8Px818ItnxTwjkY24skXUn53eaTzmZ/EUW3F/M/4cBdZM
	 AEAxo6loQu0BjytXjn6041+XGuKoVVHizk+lfOfPD9VSYEKtcgBRa+HI72YktqOdFc
	 VpnFNh+iygSCpEdl5uvWx8Nu69vj7998Vk/7opWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD9D3F80568; Thu,  7 Sep 2023 19:10:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA3DF80558;
	Thu,  7 Sep 2023 19:10:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF40F804F3; Thu,  7 Sep 2023 19:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 161F5F8047D
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 161F5F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=LQRBunHi
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA96166072BA;
	Thu,  7 Sep 2023 18:10:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106618;
	bh=qbGf9dTskivmBZH5bu+AEo0oFeT7I13FlT9OFQJZyls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQRBunHiDczrq43E+clWbn9RMyk+/WWLK3X5J7sAsRcgFttDr3Ng4pVKVpuS7U9Lg
	 cERBQmBbo339i5OHr0Te8p6KuQCQb4MyFC8ApnCmoCJgwJ70F97SYkJ7rFKuRxINAP
	 YzBqEn96OpxRqKUkMjdCboFagVqs8swhC+BMzdEpjixlGPZwGhHvB7XPHeesThRRMI
	 I0xa1j8ddKYC+WAhm55RuQH9ZJKlRPWFE6I3043dWJA/aBb7wG95rg5g1QVsxoaG2k
	 lRDVuqkeskvbQsMSvtzIUdXmYUCyWNwnfhvTWyCXV5+6+AR+VyLfXrqH82dSDRUG0L
	 W4gsFq7wS8/nQ==
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
Subject: [PATCH v2 01/11] ASoC: cs35l41: Handle mdsync_down reg write errors
Date: Thu,  7 Sep 2023 20:10:00 +0300
Message-ID: <20230907171010.1447274-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LBJZ5NUC5GPHGXTRWB53EEQYEMRSTDNA
X-Message-ID-Hash: LBJZ5NUC5GPHGXTRWB53EEQYEMRSTDNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBJZ5NUC5GPHGXTRWB53EEQYEMRSTDNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The return code of regmap_multi_reg_write() call related to "MDSYNC
down" sequence is shadowed by the subsequent
wait_for_completion_timeout() invocation, which is expected to time
timeout in case the write operation failed.

Let cs35l41_global_enable() return the correct error code instead of
-ETIMEDOUT.

Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 4ec306cd2f47..a018f1d98428 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1243,7 +1243,7 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
 		cs35l41_mdsync_down_seq[2].def = pwr_ctrl1;
 		ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_down_seq,
 					     ARRAY_SIZE(cs35l41_mdsync_down_seq));
-		if (!enable)
+		if (ret || !enable)
 			break;
 
 		if (!pll_lock)
-- 
2.41.0

