Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F677A7F0
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 17:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA3486E;
	Sun, 13 Aug 2023 17:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA3486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691941972;
	bh=OrCh9CASnzShMNQneeBc1ovotGkaWkVPI1rJeBGqJLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cPFA2/8wy1kxtsPCQl7InxAK96FI/AnyEEh0FwdREwBA4T/hiDEV7eOjXa3CVz4h6
	 PvxPOMlCSYiYKqqBzhFj7qr+dpnJHSYliDJVSvroJtSZqqk3B2/GcEPfGwDMgXed2k
	 mSYu+LpXvohjGPAALdsvxv98KHA67+WJDY3ZT+hI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458ABF805AC; Sun, 13 Aug 2023 17:51:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7413DF8059F;
	Sun, 13 Aug 2023 17:51:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5105BF8057F; Sun, 13 Aug 2023 17:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E468F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 17:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E468F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I4Hf4GkZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF50163277;
	Sun, 13 Aug 2023 15:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B20AC433C8;
	Sun, 13 Aug 2023 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941876;
	bh=OrCh9CASnzShMNQneeBc1ovotGkaWkVPI1rJeBGqJLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4Hf4GkZ7pX53nqRXJT4A9fUB5EZUghot4EZ4blKiV/J2ejWdUNFI9Cww6hjt502D
	 RAROaB/fouukJdh5kd4JK5zDRq3NpBUDfqqt+9/rkq0H02JF5A1noF/n0HLh2YaUCq
	 Jy/XlGgM5ohDaMmdr4PVhLOlM5JSr6uPQRDt8kheusThrNsZ7kF/Ca1b92GTjZYKww
	 U+XF7T0ZhSplybOJjlShgwoPTWocClseSS6dlSKhCHmLPEdOxgtpET5VD46S7pdwz2
	 2tp2vPxlyrlQ0zNf3eLEctkjB5hhaomA3XMt/j/TiC9X0GhMmkSWgOPxXybWQBt8Ty
	 bAjQpY9EOT9Nw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 30/54] ASoC: rt712-sdca: fix for JD event handling
 in ClockStop Mode0
Date: Sun, 13 Aug 2023 11:49:09 -0400
Message-Id: <20230813154934.1067569-30-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A7Z54YTHYI4EJYZIODN4SB3BIPC7W4AG
X-Message-ID-Hash: A7Z54YTHYI4EJYZIODN4SB3BIPC7W4AG
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7Z54YTHYI4EJYZIODN4SB3BIPC7W4AG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit 7a8735c1551e489351172d0da96128f6f8b52b2d ]

When the system suspends, peripheral SDCA interrupts are disabled.
When system level resume is invoked, the peripheral SDCA interrupts
should be enabled to handle JD events.
Enable SDCA interrupts in resume sequence when ClockStop Mode0 is applied.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reported-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20230721090721.128264-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 3f319459dfec3..1c9e10fea3ddd 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -441,8 +441,16 @@ static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
 	if (!rt712->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
+	if (!slave->unattach_request) {
+		if (rt712->disable_irq == true) {
+			mutex_lock(&rt712->disable_irq_lock);
+			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
+			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
+			rt712->disable_irq = false;
+			mutex_unlock(&rt712->disable_irq_lock);
+		}
 		goto regmap_sync;
+	}
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-- 
2.40.1

