Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAC77A7FC
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 17:53:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA23B950;
	Sun, 13 Aug 2023 17:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA23B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691941991;
	bh=Cyy2rayxpDKwC7nQitE0EVGQAfNmuElMaHb15QI7kpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XFO8sV2lCsD/GnW5JRUQ7lq5L9jDYgzmvPn7u1O3glghO5rKtK9MzoqkYWol9yPy7
	 27fGcUSu9yEwIKYsL6iD7fW7toUZIJxCdb/iM1fSW4zShWrQo7rwJ3h6N5xOfI7ezR
	 Sxxqv9iH6Eq/xJVBcOtX6MmTP+Nx0Owz9RGLwsNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E440CF805B3; Sun, 13 Aug 2023 17:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EEFF805B2;
	Sun, 13 Aug 2023 17:51:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0B31F80589; Sun, 13 Aug 2023 17:51:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 24F16F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 17:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F16F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kLWNNO8T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 075D2632AA;
	Sun, 13 Aug 2023 15:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44348C433C7;
	Sun, 13 Aug 2023 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941878;
	bh=Cyy2rayxpDKwC7nQitE0EVGQAfNmuElMaHb15QI7kpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kLWNNO8TGR7U8A99OYdk2/Lf+ocpzlvAd+mOwRMKYEW6MrOvWWOe6R6NkiRg1pygW
	 hELN/rDB4QyMrYF2/PUEQ+I0dwqrv+i7uqzjzUtyvfUbCORNzR5I4pDsIMH0615OaZ
	 entpXgP8yQGz0HxFjLP1vz1Yyw05dNyzP0yK3U1SmK9mZ0BiShQR+VcwiX5CskBP3G
	 CalLd1hkJ9rTf1nQlghoaYxtaXVGi/b343YzgT9ykULYq4EY+cog+fsB4ZT+mrADHp
	 nk7lI78awPyzMmBkSySUtP7kkRKCSeiAOrXw8u8R9Pob6Pzz0R4Qa6jZry1SsarnWC
	 zfJpuaiDHiTCg==
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
Subject: [PATCH AUTOSEL 6.4 31/54] ASoC: rt711: fix for JD event handling in
 ClockStop Mode0
Date: Sun, 13 Aug 2023 11:49:10 -0400
Message-Id: <20230813154934.1067569-31-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HDZKFFAPTYTSHM7ZLKRJLRKGCBT3H4IZ
X-Message-ID-Hash: HDZKFFAPTYTSHM7ZLKRJLRKGCBT3H4IZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDZKFFAPTYTSHM7ZLKRJLRKGCBT3H4IZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

[ Upstream commit b69de265bd0e877015a00fbba453ef72af162e0f ]

When the system suspends, peripheral Imp-defined interrupt is disabled.
When system level resume is invoked, the peripheral Imp-defined interrupts
should be enabled to handle JD events.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reported-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Link: https://lore.kernel.org/r/20230721090654.128230-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdw.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 4fe68bcf2a7c2..9545b8a7eb192 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -541,8 +541,15 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 	if (!rt711->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
+	if (!slave->unattach_request) {
+		if (rt711->disable_irq == true) {
+			mutex_lock(&rt711->disable_irq_lock);
+			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+			rt711->disable_irq = false;
+			mutex_unlock(&rt711->disable_irq_lock);
+		}
 		goto regmap_sync;
+	}
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
 				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-- 
2.40.1

