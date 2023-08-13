Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EE77A89F
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E31E851;
	Sun, 13 Aug 2023 18:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E31E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942669;
	bh=7gHIhUi3A1X4j3J7BRUc//uxoUWWq9QfadutvqP0d3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cwNQtnGjvzxi5tH8xR/my1QVPJmh0Wj5n/EByV0NH7KEIl78j7JlMWa4Th4BtcwJR
	 KYC/EHhNwwRMide2fajoYwzhGUwNaNZJOkcJ1tA4HlH1iZEvNYRj4xRlGFw3heCh76
	 GsatefLbVPjFBeAzLeQsZIRY5k5tUDdBwgK615yU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717FEF805AA; Sun, 13 Aug 2023 18:02:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E546FF80589;
	Sun, 13 Aug 2023 18:02:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27679F8055B; Sun, 13 Aug 2023 18:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4608F80551
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4608F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WPN2a5i6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B38D66358C;
	Sun, 13 Aug 2023 16:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC0EC433C8;
	Sun, 13 Aug 2023 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942569;
	bh=7gHIhUi3A1X4j3J7BRUc//uxoUWWq9QfadutvqP0d3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPN2a5i64sNChmSB/gSNPJi5tfqo4jY7NbWys4YI8XpZDnxju/GzamaaVt8+hPP3S
	 wG6cbiUMiUP5+9ecgJdhZjgIMTyxkqhDUvlckPrBBb6TuF5mmglHGj9Y5yYNN59vCE
	 qvMGWV7Vdu+Dp5HsNiRd5FOkea1NtzL5HV2pkC0+WA4QK4an8SIP2o7RbkLbRxOb9X
	 d93/eiwIz8E3bMmIZJceKUIkam3nwhIqKjdIkwLEgdtME/zA1HLc4wwaj1S8MfyXm6
	 WUl+nHPJuf0fypkYIFQbvU5MvckuNUt042ueZVGVo57fGCvWyXXvI6yhz0YFU7iK4x
	 fd3lgOCRUlE/g==
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
Subject: [PATCH AUTOSEL 6.1 27/47] ASoC: rt711-sdca: fix for JD event handling
 in ClockStop Mode0
Date: Sun, 13 Aug 2023 11:59:22 -0400
Message-Id: <20230813160006.1073695-27-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TKGEPZGZBOYMKNMDVS7MTWUH7RSMXLUR
X-Message-ID-Hash: TKGEPZGZBOYMKNMDVS7MTWUH7RSMXLUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKGEPZGZBOYMKNMDVS7MTWUH7RSMXLUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit 23adeb7056acd4fd866969f4afb91441776cc4f5 ]

When the system suspends, peripheral SDCA interrupts are disabled.
When system level resume is invoked, the peripheral SDCA interrupts
should be enabled to handle JD events.
Enable SDCA interrupts in resume sequence when ClockStop Mode0 is applied.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reported-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20230721090711.128247-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index e23cec4c457de..487d3010ddc19 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -442,8 +442,16 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 	if (!rt711->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
+	if (!slave->unattach_request) {
+		if (rt711->disable_irq == true) {
+			mutex_lock(&rt711->disable_irq_lock);
+			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
+			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
+			rt711->disable_irq = false;
+			mutex_unlock(&rt711->disable_irq_lock);
+		}
 		goto regmap_sync;
+	}
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-- 
2.40.1

