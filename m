Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0177A8EF
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1F0A4E;
	Sun, 13 Aug 2023 18:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1F0A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942931;
	bh=KJw2WBWNQmtNJS47EW35FOkj7/9Y0ZprXuGDAXOPhnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=chLRDIz/bKgAs+mx6LWzl+Tm5lRJnmbfCykYNLg1fwb+9+qDS3pMKQyG0PjPRFx0H
	 FGT+skNlUd/G+yG8rY6q+tbiZory7iezeyZh/1USFIToMqR6+BO06n/8xLnS24vstD
	 5zwfPhTQhY4TFQTe1sm2BEa+XAeu2wq/ADZqoTB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34363F8056F; Sun, 13 Aug 2023 18:07:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BDDDF80254;
	Sun, 13 Aug 2023 18:07:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17396F80272; Sun, 13 Aug 2023 18:07:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D29CF8025F
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D29CF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M0yAjVc/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D963A622AB;
	Sun, 13 Aug 2023 16:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A523BC433C8;
	Sun, 13 Aug 2023 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942871;
	bh=KJw2WBWNQmtNJS47EW35FOkj7/9Y0ZprXuGDAXOPhnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0yAjVc/Cpe5KOCV8h92FSaoEap4yLM0OYvNTlUibyO68dSn+zZRoKD5JLaWiRDpO
	 PRVTLyxySNCxLF9KWkLOXKB3bwClFpJVSyawM6Ql4spljjbEAX1ItfcqAI43uLhELo
	 Ojsxdt7yVbA8qQfa4SoODihVm84ejsuawdOJJRVTBUsZIGdhQ+d+TaTmW3L1Y6roA8
	 tRUm0+A6tGVetORJXC4TY2oSSBIZM5EH0fwLedtAITpVRTl3zM3sSJ0pxtoq8X46UF
	 VJQgxF0zr5EOhFC4AtQJ2//Nyd6ZLyhhC0PSdDC3CKuAgsSb5paMJ1lvsM4mS0dM85
	 /vhXe42eWJ/PQ==
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
Subject: [PATCH AUTOSEL 5.15 16/31] ASoC: rt5682-sdw: fix for JD event
 handling in ClockStop Mode0
Date: Sun, 13 Aug 2023 12:05:49 -0400
Message-Id: <20230813160605.1080385-16-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160605.1080385-1-sashal@kernel.org>
References: <20230813160605.1080385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.126
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DY6Q7ETY5KF573IRZ7643DR45QS7MXXI
X-Message-ID-Hash: DY6Q7ETY5KF573IRZ7643DR45QS7MXXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DY6Q7ETY5KF573IRZ7643DR45QS7MXXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit 02fb23d72720df2b6be3f29fc5787ca018eb92c3 ]

When the system suspends, peripheral Imp-defined interrupt is disabled.
When system level resume is invoked, the peripheral Imp-defined interrupts
should be enabled to handle JD events.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reported-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20230721090643.128213-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682-sdw.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index f04e18c32489d..9fdd9afe00da4 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -786,8 +786,15 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 	if (!rt5682->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
+	if (!slave->unattach_request) {
+		if (rt5682->disable_irq == true) {
+			mutex_lock(&rt5682->disable_irq_lock);
+			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+			rt5682->disable_irq = false;
+			mutex_unlock(&rt5682->disable_irq_lock);
+		}
 		goto regmap_sync;
+	}
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-- 
2.40.1

