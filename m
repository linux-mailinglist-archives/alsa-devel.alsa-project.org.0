Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9583F884
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 18:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F6C83B;
	Sun, 28 Jan 2024 18:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F6C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706462598;
	bh=B5WmwXGS0N9URrRmpETD90ykLr9gtHFmbUouXkfqDD0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QlwyPgFKWapAjzR0AAzQiCdcOlgGReatLWNT7pFNwO5k/YAb+YjoQ2VApedU9adQd
	 iLti4dta1ZUR6lmlfGajtEAOiZztd8AJp70GlK4/0vb/oTG0q6GSrYUpBDkbL1j+mO
	 2OttxCZckNi0Dmw3EraDqSb6SMUZdi24/uGrAOSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4228AF80578; Sun, 28 Jan 2024 18:22:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FA8F8055B;
	Sun, 28 Jan 2024 18:22:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8DF1F80310; Sun, 28 Jan 2024 18:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB11BF8017A
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 18:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB11BF8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=ALLGWWgI
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id DC96116C0056;
	Sun, 28 Jan 2024 19:22:32 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUyIbahRNE3o; Sun, 28 Jan 2024 19:22:31 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1706462551; bh=B5WmwXGS0N9URrRmpETD90ykLr9gtHFmbUouXkfqDD0=;
	h=From:To:Cc:Subject:Date:From;
	b=ALLGWWgIktmmIygr/yLFeHHgtNsZKDutoRH4IZiya3xyk0AgGh8ybUToCn2Jzz3y3
	 XT/mWJeii2r2J0hVH3bXvwtNO2/0isOZ2FCpg7CxWUfQ6KJ2eFFNVpyBbtrZs59P85
	 O1Kqt4dqvplBAtoGUwWVStzoWwm6naPQ1bcZHuWY=
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Marian Postevca <posteuca@mutex.one>
Subject: [PATCH] ASoC: amd: acp: Fix support for a Huawei Matebook laptop
Date: Sun, 28 Jan 2024 19:22:29 +0200
Message-ID: <20240128172229.657142-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J5MUI3OUNTMEO6ART2KYLRD54E6N3YEV
X-Message-ID-Hash: J5MUI3OUNTMEO6ART2KYLRD54E6N3YEV
X-MailFrom: posteuca@mutex.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5MUI3OUNTMEO6ART2KYLRD54E6N3YEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previous commit that added support for Huawei MateBook D16 2021
with Ryzen 4600H (HVY-WXX9 M1010) was incomplete.

To activate support for this laptop, the DMI table in
acp3x-es83xx machine driver must also be updated.

Fixes: b5338b1b901e ("ASoC: amd: acp: Add support for a new Huawei Matebook laptop")
Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index f85b85ea4be9..2b0aa270a3e9 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -354,6 +354,14 @@ static const struct dmi_system_id acp3x_es83xx_dmi_table[] = {
 		},
 		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HVY-WXX9"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+		},
+		.driver_data = (void *)(ES83XX_ENABLE_DMIC),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
-- 
2.43.0

