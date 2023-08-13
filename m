Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E877A8A0
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CA00832;
	Sun, 13 Aug 2023 18:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CA00832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942675;
	bh=2ca/c+vfvCh+oaYWSmgs+beqlSFb7je0VnGMlI/mQgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eeomgMET1vi9YiRHYQuudzUGIZ9caU1PSWsK7om5d459jQQTMplJrRO+Fvn3DdFfk
	 ZI6Cnhl7Kqe/d3L6S3+44o55A3MdVwVyY4ezFk5Xm9KWr7ZwHhW02fovqmo+fn9T+1
	 2RS/6qP1VvaIP25awFzweOOelUguW+g0TjP+2ZNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A5E2F805AF; Sun, 13 Aug 2023 18:03:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C50F80589;
	Sun, 13 Aug 2023 18:03:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E5E3F8059F; Sun, 13 Aug 2023 18:02:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 251DAF80589
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 251DAF80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rWTBVMmt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 156D5635CE;
	Sun, 13 Aug 2023 16:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EC6C433C7;
	Sun, 13 Aug 2023 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942573;
	bh=2ca/c+vfvCh+oaYWSmgs+beqlSFb7je0VnGMlI/mQgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rWTBVMmtXgiqPhJfCiyar2yZYUEjVwhMVSD/AxJ+bOns1EyotOgc4+GY489DC7qDl
	 fAFDUY5RUgu82FoIPS7c+V+EAQFtyL1EtrVjZP7F4dOUO/lIQoLEqII0G1IdxLnkTn
	 mofZBVAT9q1gMnOREtOl7zBMBF2yCFvmMzh+JXKn2x0roU8uo2rWv51oOaL8i20BTQ
	 yVhKKfU2Jf8FtUUJ0lPxDSUiahNkxb4sJ7N4HCnjADka4JvfnwUvxF+e5SeBAlWtuP
	 43kKFYeUHLMy2c9ZTIIaGYsEp8vxi+oJnjDDo3VrvlBvnBDZWeqHVuT7L0ABJNerqn
	 Etu39K9NKvbMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guiting Shen <aarongt.shen@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	claudiu.beznea@tuxon.dev,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 28/47] ASoC: atmel: Fix the 8K sample parameter in
 I2SC master
Date: Sun, 13 Aug 2023 11:59:23 -0400
Message-Id: <20230813160006.1073695-28-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCZXWJCPXRR7UYHVZ2G5NDEAP7QKMRO6
X-Message-ID-Hash: GCZXWJCPXRR7UYHVZ2G5NDEAP7QKMRO6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCZXWJCPXRR7UYHVZ2G5NDEAP7QKMRO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Guiting Shen <aarongt.shen@gmail.com>

[ Upstream commit f85739c0b2b0d98a32f5ca4fcc5501d2b76df4f6 ]

The 8K sample parameter of 12.288Mhz main system bus clock doesn't work
because the I2SC_MR.IMCKDIV must not be 0 according to the sama5d2
series datasheet(I2SC Mode Register of Register Summary).

So use the 6.144Mhz instead of 12.288Mhz to support 8K sample.

Signed-off-by: Guiting Shen <aarongt.shen@gmail.com>
Link: https://lore.kernel.org/r/20230715030620.62328-1-aarongt.shen@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/atmel/atmel-i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 425d66edbf867..5e43ff0b537a3 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -163,11 +163,14 @@ struct atmel_i2s_gck_param {
 
 #define I2S_MCK_12M288		12288000UL
 #define I2S_MCK_11M2896		11289600UL
+#define I2S_MCK_6M144		6144000UL
 
 /* mck = (32 * (imckfs+1) / (imckdiv+1)) * fs */
 static const struct atmel_i2s_gck_param gck_params[] = {
+	/* mck = 6.144Mhz */
+	{  8000, I2S_MCK_6M144,  1, 47},	/* mck =  768 fs */
+
 	/* mck = 12.288MHz */
-	{  8000, I2S_MCK_12M288, 0, 47},	/* mck = 1536 fs */
 	{ 16000, I2S_MCK_12M288, 1, 47},	/* mck =  768 fs */
 	{ 24000, I2S_MCK_12M288, 3, 63},	/* mck =  512 fs */
 	{ 32000, I2S_MCK_12M288, 3, 47},	/* mck =  384 fs */
-- 
2.40.1

