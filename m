Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012DC2E31DD
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 17:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B80173D;
	Sun, 27 Dec 2020 17:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B80173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609087376;
	bh=eYDpGCyIAMq8OdsMIAF0d3Q97v4OoPUHOLY7gXYR8JI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKCCxwT/slb5M2Fd8PsXfkYXZY4mmvp2IYtWLiaac6b6JDDabEkEZVSy3LIZGkkOC
	 t14gjCwtMT3d6E789Gq8/tCa9fyJ+wqKvF5yEJLXbMuQAEJpROOvPQrG5n1YTRq6X0
	 5L+Hz6b4RyNEJjcaBZUmDncDtepuOWGxcnLWrzg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 829F1F8022D;
	Sun, 27 Dec 2020 17:41:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4F2F8022B; Sun, 27 Dec 2020 17:41:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29FBDF80085
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 17:41:10 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3911FA0040;
 Sun, 27 Dec 2020 17:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3911FA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1609087265; bh=2A1SDiMGvKTP3xk/xVL2uY/YowIxmXQapzfHMlFSe5Y=;
 h=From:To:Cc:Subject:Date:From;
 b=jtY3ZGwOD/zcM2KCSTOYsota23uMrAS+DTVfFKhuLsdjV8JuEHJB9WB6+8oYpyUiU
 hsjmv2XC+HWpQO8vsRcmB6DFJzv2z6rt7S7UeV39pqKOtTwGDPXMEtZLeUaUC66mUW
 +w1ja2g37B0N2XvJXwVXAwwdqKZf/vB/oK4Y+tPM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 27 Dec 2020 17:40:59 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad E14
 Gen 2
Date: Sun, 27 Dec 2020 17:40:37 +0100
Message-Id: <20201227164037.269893-1-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 stable@kernel.org, Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
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

The ThinkPad E14 Gen 2 latop does not have the internal digital
microphone connected to the AMD's ACP bridge, but it's advertised
via BIOS. The internal microphone is connected to the HDA codec.

Use DMI to block the microphone PCM device for this platform.

Reported-by: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Cc: <stable@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index fa169bf09886..17ec35be73ac 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
 		}
 	},
+	{
+		/* Lenovo ThinkPad E14 Gen 2 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20T6CTO1WW"),
+		}
+	},
 	{}
 };
 
-- 
2.29.2
