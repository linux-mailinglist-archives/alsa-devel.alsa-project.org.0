Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FD77A88B
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6838CA4E;
	Sun, 13 Aug 2023 18:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6838CA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942626;
	bh=EMqGJx5pHddWrDSuGZKtEvkH0TNvXukf5vwbehXXIqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6lxlWi54r+MnpAV9916HDB8a1O9nY7Zxwwt66gD0hSnCYdjgmCpB7zcqf2hEedYA
	 i9VWhsnUPG5ub+Oi+JCAd+K7j/sHT9AL9ewUXIgkE+3N0xcB6w+/IKltCfVScSRUtY
	 88ackx8gkGw/nv8SgF1oCmPyC22oW6Dw+jjs0Tyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB3E2F80567; Sun, 13 Aug 2023 18:02:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 757C0F8055A;
	Sun, 13 Aug 2023 18:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABE8DF80567; Sun, 13 Aug 2023 18:02:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 65388F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65388F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=knoLw/Rn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F091A634F0;
	Sun, 13 Aug 2023 16:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96F4C433C8;
	Sun, 13 Aug 2023 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942564;
	bh=EMqGJx5pHddWrDSuGZKtEvkH0TNvXukf5vwbehXXIqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=knoLw/RnxWq/i/NTwgjzDcSDNSVsLme/HYElGSDpjqjtamOrPa/h8dOTCC483yPMA
	 2Ff6wsXS+AayEIFIHCKvuKnlpwYwl5idjfpUt84muuHhSDAohFo4TSFZEL+dbM5Wjb
	 qOh4u44g29PcoOJPO5itTbv2v9d/hFYFEZ6RdESilOkPVBB455KEhKhJ1MOfTxnjXg
	 1zaIo2Bwcy9+g71wD4FR9XU0x8ob5nbI7mvPkTdysgn/Zor8grheRWuTvE5VH0xMlk
	 y21L9XmZCWlWFMGAQCI65/pv388qU6Mhbq/yM3/EmTBPnPXViUQc0fRf9G1wgyoDFq
	 P7RhpPV+acghQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edgar <ljijcj@163.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	yung-chuan.liao@linux.intel.com,
	zhuning0077@gmail.com,
	hdegoede@redhat.com,
	pierre-louis.bossart@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 25/47] ASoc: codecs: ES8316: Fix DMIC config
Date: Sun, 13 Aug 2023 11:59:20 -0400
Message-Id: <20230813160006.1073695-25-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YDK5IHDOBADDWXH2SVKQANXQ6CMFULK
X-Message-ID-Hash: 7YDK5IHDOBADDWXH2SVKQANXQ6CMFULK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YDK5IHDOBADDWXH2SVKQANXQ6CMFULK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Edgar <ljijcj@163.com>

[ Upstream commit d20d35d1ad62c6cca36368c1e8f29335a068659e ]

According to the datasheet, the DMIC config should
be changed to { 0, 2 ,3 }

Signed-off-by: Edgar <ljijcj@163.com>
Link: https://lore.kernel.org/r/20230719054722.401954-1-ljijcj@163.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 87775378362e7..c4e4ab93fdb6d 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -153,7 +153,7 @@ static const char * const es8316_dmic_txt[] = {
 		"dmic data at high level",
 		"dmic data at low level",
 };
-static const unsigned int es8316_dmic_values[] = { 0, 1, 2 };
+static const unsigned int es8316_dmic_values[] = { 0, 2, 3 };
 static const struct soc_enum es8316_dmic_src_enum =
 	SOC_VALUE_ENUM_SINGLE(ES8316_ADC_DMIC, 0, 3,
 			      ARRAY_SIZE(es8316_dmic_txt),
-- 
2.40.1

