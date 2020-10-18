Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33762919EF
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Oct 2020 21:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373D017BF;
	Sun, 18 Oct 2020 21:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373D017BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603048922;
	bh=+18Rmy1rZb4EA8ZKVxJUrwxKrhYtc4JVUL89try4Ahc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEPUoGIgevulx0Na8kZzCs0l/8W9pvg9oMEyIRRoKix7lN0eYuM8dUpKAeAJgn9xQ
	 Un4ulmFXOwQZWUREVlrepER4/M9ipB23xYQwrKQ6OTynnKlLHF4N0tRmHC62d2ucG/
	 4miDn5ONcwR3bStguS1hXQ2LXijz5sREt9XmFbnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA66F80287;
	Sun, 18 Oct 2020 21:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 733ACF800AD; Sun, 18 Oct 2020 21:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEBAF800AD
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 21:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEBAF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p+htreMP"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46D94222B9;
 Sun, 18 Oct 2020 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603048804;
 bh=+18Rmy1rZb4EA8ZKVxJUrwxKrhYtc4JVUL89try4Ahc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p+htreMPHJZuwrnUdB6hA6SWQN8TvMVHbGu0CUzZMzYOVaxqlBIzSFFH+38XHTZq+
 YA5JCUq/cBvKAxJ2i3xyUiBYrVNwVq8XEy/FWnlECma0VwPx50bz/f8YP42yKUK9yZ
 wyg/XLyO2bsg+jb/x4fO4KtkdQcGJ5tjjWDRgaqA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 096/111] ALSA: hda/ca0132 - Add AE-7 microphone
 selection commands.
Date: Sun, 18 Oct 2020 15:17:52 -0400
Message-Id: <20201018191807.4052726-96-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 Connor McAdams <conmanx360@gmail.com>, alsa-devel@alsa-project.org
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

From: Connor McAdams <conmanx360@gmail.com>

[ Upstream commit ed93f9750c6c2ed371347d0aac3dcd31cb9cf256 ]

Add AE-7 quirk data for setting of microphone. The AE-7 has no front
panel connector, so only rear-mic/line-in have new commands.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
Link: https://lore.kernel.org/r/20200825201040.30339-19-conmanx360@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_ca0132.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index b7dbf2e7f77af..c68669911de0a 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4675,6 +4675,15 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			tmp = FLOAT_THREE;
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
+			tmp = FLOAT_THREE;
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			tmp = FLOAT_ONE;
 			break;
@@ -4720,6 +4729,14 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		case QUIRK_AE5:
 			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x00);
 			break;
+		case QUIRK_AE7:
+			ca0113_mmio_command_set(codec, 0x30, 0x28, 0x3f);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICIN2,
+					SR_96_000);
+			chipio_set_conn_rate(codec, MEM_CONNID_MICOUT2,
+					SR_96_000);
+			dspio_set_uint_param(codec, 0x80, 0x01, FLOAT_ZERO);
+			break;
 		default:
 			break;
 		}
@@ -4729,7 +4746,10 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 		if (ca0132_quirk(spec) == QUIRK_R3DI)
 			chipio_set_conn_rate(codec, 0x0F, SR_96_000);
 
-		tmp = FLOAT_ZERO;
+		if (ca0132_quirk(spec) == QUIRK_AE7)
+			tmp = FLOAT_THREE;
+		else
+			tmp = FLOAT_ZERO;
 		dspio_set_uint_param(codec, 0x80, 0x00, tmp);
 
 		switch (ca0132_quirk(spec)) {
-- 
2.25.1

