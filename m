Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D453B490DAA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E44E18DC;
	Mon, 17 Jan 2022 18:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E44E18DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642439092;
	bh=S5nPjdjCzKt885qz1sQlYghV0MtZBTbsg2HgpYi5+bs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ywyb/ZbEkviMsgVm9aUVu8mvZSa+Twq0ZwWzLiH0Sp5nWRv7cKLIcjX4JeZallHib
	 vWWUAMN47Lv9gU0rUICgUG5hLqAYkwmpLwgqTy+AyXXijh2RAsYaqLDiEM8fdzppJM
	 0/HpzzeJ0ZjHZ0BQnDegRNZIf73p9IPdFxBFiMpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3341F80510;
	Mon, 17 Jan 2022 18:03:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B7DFF80249; Mon, 17 Jan 2022 18:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56540F80249
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 18:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56540F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fHRxkSzU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 574E4B81148;
 Mon, 17 Jan 2022 17:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1592DC36AEF;
 Mon, 17 Jan 2022 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439009;
 bh=S5nPjdjCzKt885qz1sQlYghV0MtZBTbsg2HgpYi5+bs=;
 h=From:To:Cc:Subject:Date:From;
 b=fHRxkSzU3k/lBqgGb0gQvFohe60WegQYvjqURXxjusqqcTkx5D7jeRA0HvVjNSAfa
 7HjdvgRryOxoAaIGus3jhf6pyhsQJavJx7V4Ofstn9/HS7LEsFyIuXy0DpCD9MsFqE
 G5FJVY1yzth+WyLTSAi1odJDs4nB4wU3SDh95LcyLCORPDqUQnoAQVAWEbUOwjwEvd
 1fXmZXx2A/LC2v/LHtCTI0fztNSolMAWU1KRIMx+yr/M1g+5xjbxQnTRoXTpgkdmwh
 Z9BrcQouBXs+G86NlhgCmb6xZ2mmjJtHPTWvTZeayq2XvzNF4D2SU5NJSWXKS7F4Gh
 1OoaGAFmkG8AA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 01/34] ALSA: usb-audio: Fix dB level of Bose
 Revolve+ SoundLink
Date: Mon, 17 Jan 2022 12:02:51 -0500
Message-Id: <20220117170326.1471712-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, andfagiani@gmail.com,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 timo.gurr@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 02eb1d098e26f34c8f047b0b1cee6f4433a34bd1 ]

Bose Revolve+ SoundLink (0a57:40fa) advertises invalid dB level for
the speaker volume.  This patch provides the correction in the mixer
map quirk table entry.

Note that this requires the prerequisite change to add min_mute flag
to the dB map table.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1192375
Link: https://lore.kernel.org/r/20211116065415.11159-4-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 8f6823df944ff..01a30968e7e1f 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -337,6 +337,13 @@ static const struct usbmix_name_map bose_companion5_map[] = {
 	{ 0 }	/* terminator */
 };
 
+/* Bose Revolve+ SoundLink, correction of dB maps */
+static const struct usbmix_dB_map bose_soundlink_dB = {-8283, -0, true};
+static const struct usbmix_name_map bose_soundlink_map[] = {
+	{ 2, NULL, .dB = &bose_soundlink_dB },
+	{ 0 }	/* terminator */
+};
+
 /* Sennheiser Communications Headset [PC 8], the dB value is reported as -6 negative maximum  */
 static const struct usbmix_dB_map sennheiser_pc8_dB = {-9500, 0};
 static const struct usbmix_name_map sennheiser_pc8_map[] = {
@@ -551,6 +558,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x05a7, 0x1020),
 		.map = bose_companion5_map,
 	},
+	{
+		/* Bose Revolve+ SoundLink */
+		.id = USB_ID(0x05a7, 0x40fa),
+		.map = bose_soundlink_map,
+	},
 	{
 		/* Corsair Virtuoso SE (wired mode) */
 		.id = USB_ID(0x1b1c, 0x0a3d),
-- 
2.34.1

