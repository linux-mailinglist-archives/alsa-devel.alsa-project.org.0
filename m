Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B31F84B1C4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 10:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA21832;
	Tue,  6 Feb 2024 10:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA21832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213596;
	bh=76vNyh8F4XZ0a480DjHSCr5Iu/Fp4x+9DNu9tsjd75E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sfskGh7K/xEC4/S0yitNJFMEVRiBUe5R/4zLFGKju0xYNAQrWZ55d0qiWcNg+DAsS
	 xNGNu1xfUPfzWUy091lSoHfuPlr8/mpyArk959oehkVH3+7XHlxt/CCrMnJ3rFn1oX
	 YFoZNy9PzJxU/uG4WcosSAQC/mIq9C1knAIbXCX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23895F80616; Tue,  6 Feb 2024 10:58:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68856F8060B;
	Tue,  6 Feb 2024 10:58:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B3CF80571; Tue, 30 Jan 2024 10:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15300F8055C
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 10:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15300F8055C
Received: by air.basealt.ru (Postfix, from userid 490)
	id 889142F2024C; Tue, 30 Jan 2024 09:47:21 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id BF8882F20242;
	Tue, 30 Jan 2024 09:47:14 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	u.kleine-koenig@pengutronix.de,
	a.firago@yadro.com,
	sashal@kernel.org,
	zhuning0077@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	kovalev@altlinux.org
Subject: [PATCH 6.1.y 1/7] ASoC: codecs: es8326: Convert to i2c's .probe_new()
Date: Tue, 30 Jan 2024 12:47:02 +0300
Message-Id: <20240130094708.290485-2-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20240130094708.290485-1-kovalev@altlinux.org>
References: <20240130094708.290485-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FSPELSG5F3KVBZD6EWRV7SSE6MA4IPVH
X-Message-ID-Hash: FSPELSG5F3KVBZD6EWRV7SSE6MA4IPVH
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:58:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSPELSG5F3KVBZD6EWRV7SSE6MA4IPVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Commit 784252bac835c831e10c48be633cd1ff0d697326 upstream.

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Link: https://lore.kernel.org/r/20221118224540.619276-602-uwe@kleine-koenig.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 sound/soc/codecs/es8326.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 555125efd9ad3f..28a0565c2a955b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -816,8 +816,7 @@ static const struct snd_soc_component_driver soc_component_dev_es8326 = {
 	.endianness		= 1,
 };
 
-static int es8326_i2c_probe(struct i2c_client *i2c,
-			    const struct i2c_device_id *id)
+static int es8326_i2c_probe(struct i2c_client *i2c)
 {
 	struct es8326_priv *es8326;
 	int ret;
@@ -897,7 +896,7 @@ static struct i2c_driver es8326_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(es8326_acpi_match),
 		.of_match_table = of_match_ptr(es8326_of_match),
 	},
-	.probe = es8326_i2c_probe,
+	.probe_new = es8326_i2c_probe,
 	.id_table = es8326_i2c_id,
 };
 module_i2c_driver(es8326_i2c_driver);
-- 
2.33.8

