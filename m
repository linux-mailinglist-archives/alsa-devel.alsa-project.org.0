Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4886977B305
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 09:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC707F1;
	Mon, 14 Aug 2023 09:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC707F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691999572;
	bh=nKgrnCU7kI3wR/FQzbZP+F8vXg3oOXU0D3MYKHvXP28=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RsM/19dUdjDwGLhmFJuqNV7E7ChWUsr1Oyn0QkPg08iNoHfnrNuRIfuS7aLLrfyT4
	 fA2CLuPMrU8ijx33u+8NceykE0CVscR0O4Z3p/GdZ/fkLuZEi9iak7C/uQVE3TODra
	 8cwakIxDad9txGy/8Tic2nh5nF0ooQlndoyYZTwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BD14F80290; Mon, 14 Aug 2023 09:52:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 660A9F80254;
	Mon, 14 Aug 2023 09:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6DB8F8025F; Mon, 14 Aug 2023 09:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1436F801EB;
	Mon, 14 Aug 2023 09:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1436F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PZF5xdDQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D019661164;
	Mon, 14 Aug 2023 07:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E69C433C9;
	Mon, 14 Aug 2023 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691999238;
	bh=nKgrnCU7kI3wR/FQzbZP+F8vXg3oOXU0D3MYKHvXP28=;
	h=From:To:Cc:Subject:Date:From;
	b=PZF5xdDQSRmwEHZUVYWUZife4sXMwTWHGmoIsKx/KaSf1a06Fp+ipg2agrQLdIA5u
	 BIZ9jnB+KwuIBkyNnT4NtCCoBsOXguWokAkjvC5hHu+5AciTuUXpghg961en0sZFqQ
	 AUTvmyZIJ6XBCkxK4GXj2I9CqcjvENfPdhLoCUA2XiAg4Ay9HngHwvCE+R0U5Bv1na
	 zDjoTiF9SHPAIpP8jWPkuf13GB80NZO55aTRZs3WAeZ3xlQvyBWzHXRjjvy82k5Sc3
	 PucmcS+80lVumd9/fFkIrnQmMZTd7PgtVEXA9qYITI6UkLvp4NfWWz01G7zjPmFCJ8
	 z1ipfXhOuVmxA==
From: Arnd Bergmann <arnd@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rander Wang <rander.wang@intel.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: Intel: fix hda_sdw_check_wakeen_irq()
Date: Mon, 14 Aug 2023 09:46:29 +0200
Message-Id: <20230814074711.1068093-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7ZRUEJTM5PQBNVPX44BGYUL22J7UAFU
X-Message-ID-Hash: C7ZRUEJTM5PQBNVPX44BGYUL22J7UAFU
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7ZRUEJTM5PQBNVPX44BGYUL22J7UAFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

This function cannot work, as the 'chip' variable is never initialized:

sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
        if (chip && chip->check_sdw_wakeen_irq)
            ^~~~

Set it the same way that other functions in this file do.

Fixes: 9362ab78f175d ("ASoC: SOF: Intel: add abstraction for SoundWire wake-ups")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
There hasn't been a new linux-next in a few days, so there is a good chance
someone else already fixed this in the meantime. Sending out my fix in case
that hasn't happened yet.
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 04c748a72b137..6c9c7b390cf53 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -415,7 +415,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
-	const struct sof_intel_dsp_desc *chip;
+	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 
 	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		return false;
-- 
2.39.2

