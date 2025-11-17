Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94902C75781
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:50:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ACFC6020C;
	Thu, 20 Nov 2025 17:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ACFC6020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657444;
	bh=8jKSmHS95dTjMHcoA/Eb57z/ZXmfWP4rEHKQBz7NL/4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SmZTUX9VUt//btPzc94m/JdxZyqXMXcfY9v+8A3XiiXbH5IAFA44+BAdJ+ayleOJS
	 lLcGZZgJ56dBy5Oj5KMLDe1gMuGS8CyifUWMooVrHqG6QmFRTM7BGp+WFTe/1mMKWV
	 plYoZwr4KSx8EkDCnbr8J3wx0BnmhwjA9ZyET/M4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22735F805BF; Thu, 20 Nov 2025 17:50:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C26CCF805C2;
	Thu, 20 Nov 2025 17:50:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D331AF80551; Mon, 17 Nov 2025 13:13:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru
 [93.188.205.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F178BF8012B;
	Mon, 17 Nov 2025 13:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F178BF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=astralinux.ru header.i=@astralinux.ru
 header.a=rsa-sha256 header.s=mail header.b=qfaA63eN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1763381597;
	bh=8jKSmHS95dTjMHcoA/Eb57z/ZXmfWP4rEHKQBz7NL/4=;
	h=From:To:Cc:Subject:Date:From;
	b=qfaA63eNAJYYM9xQs3iOT6xtmtSWOvaSsWL/+GqRlXj3eUhRJZ1hVtjSiIYJm/sAQ
	 EDaviV/fLJ3bXVjUFpXAtxiqVOm5GWrfAktw3xDImb6Re420uPOyET3ntPWx361Onj
	 TfcgiFDi0xCV6q+5mlEpwlClL4zJSfYKM5Hm4wTgBlVjOMbOMH8APhTCXvjBcz/a/9
	 eAPqb8q8Rzk9tMkfNao/PCFa08hLuR9W6pHPoxsI3bMgHZfOXg4YNFGJo0zUnj3S+s
	 TflmoxGOesK4aU24Nkdv1VWnNWmcwV311kKs7PAyUfI7QPRafVMoXY7qTzj2+foHxe
	 JLmYgqfjkCiuA==
Received: from gca-msk-a-srv-ksmg01 (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id D9C3C1FA5B;
	Mon, 17 Nov 2025 15:13:17 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Mon, 17 Nov 2025 15:13:13 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru.astracloud.ru
 (rbta-msk-lt-302690.astralinux.ru [10.198.51.247])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4d967q3y9JzSgqV;
	Mon, 17 Nov 2025 15:12:38 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaska Uimonen <jaska.uimonen@intel.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5.10] ASoC: SOF: Intel: hda: Fix potential buffer overflow by
 snprintf()
Date: Mon, 17 Nov 2025 15:12:03 +0300
Message-Id: <20251117121203.9811-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/11/17 11:46:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: adiupina@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 76 0.3.76
 6aad6e32ec76b30ee13ccddeafeaa4d1732eef15, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to},
 new-mail.astralinux.ru:7.1.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1,
 FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 198143 [Nov 17 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2025/11/17 08:57:00 #27937168
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/11/17 11:47:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-MailFrom: adiupina@astralinux.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T2IVXPBWU732ATA3E52AOPBACQLZ263E
X-Message-ID-Hash: T2IVXPBWU732ATA3E52AOPBACQLZ263E
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:50:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2IVXPBWU732ATA3E52AOPBACQLZ263E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

commit 94c1ceb043c1a002de9649bb630c8e8347645982 upstream.

snprintf() returns the would-be-filled size when the string overflows
the given buffer size, hence using this value may result in the buffer
overflow (although it's unrealistic).

This patch replaces with a safer version, scnprintf() for papering
over such a potential issue.

Fixes: 29c8e4398f02 ("ASoC: SOF: Intel: hda: add extended rom status dump to error log")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20220801165420.25978-4-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
Backport fix for CVE-2022-50050
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b4cc72483137..1d879c2b81e1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -437,7 +437,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev)
 
 	for (i = 0; i < HDA_EXT_ROM_STATUS_SIZE; i++) {
 		value = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_STATUS + i * 0x4);
-		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
+		len += scnprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
 	sof_dev_dbg_or_err(sdev->dev, hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS,
-- 
2.30.2

