Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0357F37410F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A501713;
	Wed,  5 May 2021 18:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A501713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233024;
	bh=vczX39UgrVCACZmIWAjKsPnQfDqMwyvWLIynZTj+wmw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvvUh0hbQygMi0jbLpzx+o1ch9nDum2VzEJ3wk8u0unuv9khCKDxszBxkEh5yxlFN
	 kAfmkRDDBIKuDidLLw7c2fvnnKUzpf4LZqE/yTk4RJVk0f76W/7ebRs5GaOr8c+VoF
	 GsAw106pQKMhMJQCJn4tW9PnZTCqZrk5x2N14GKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3D8F80551;
	Wed,  5 May 2021 18:36:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8E2F80552; Wed,  5 May 2021 18:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79003F80475
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79003F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="os/zVvif"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB4E6192B;
 Wed,  5 May 2021 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232557;
 bh=vczX39UgrVCACZmIWAjKsPnQfDqMwyvWLIynZTj+wmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=os/zVvif/m4bXlrzmNI0FvskenF8nXF7grjLv1DNWqEJEsVsD/0xRxEYWY23llrpZ
 BgSnsUjo9QZSCS1ukWJg7FPhhiGLEjPGuRS7MXfJ+DgmTlnjVaOF3DViZLto2I/Rgc
 RlbA3dTyZZO6WNVSKLqXfQK4UsTSRVWreeLJPCm5xnOqKf4OeLW7TFGN6+9CCLFyse
 iWfUcJNlHWAfnkogAmmMpwzPkXGakWgAt20r/AfqTI9FOXCY9M8TxzsnDUr8wWWDnv
 SLAMzaVqJCym4avNYhkh/7TE7oKCPUVppW3fdTj97dVhxsmyAGj+Nz1NSHhZ0LNK+Q
 W5QZZp5hduyUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 071/104] ALSA: hda/realtek: Add quirk for Lenovo
 Ideapad S740
Date: Wed,  5 May 2021 12:33:40 -0400
Message-Id: <20210505163413.3461611-71-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Ryan Prescott <ryan@cousinscomputers.net>
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

[ Upstream commit 26928ca1f06aab4361eb5adbe7ef3b5c82f13cf2 ]

Lenovo Ideapad S740 requires quite a few COEF setups to make its
speakers working.  The verb table was provided from Ryan Prescott as
the result of investigation via qemu:
  https://github.com/ryanprescott/realtek-verb-tools/wiki/How-to-sniff-verbs-from-a-Windows-sound-driver

BugLink: https://github.com/thesofproject/linux/issues/2748
Tested-by: Ryan Prescott <ryan@cousinscomputers.net>
Link: https://lore.kernel.org/r/20210416081211.20059-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/ideapad_s740_helper.c | 492 ++++++++++++++++++++++++++++
 sound/pci/hda/patch_realtek.c       |  11 +
 2 files changed, 503 insertions(+)
 create mode 100644 sound/pci/hda/ideapad_s740_helper.c

diff --git a/sound/pci/hda/ideapad_s740_helper.c b/sound/pci/hda/ideapad_s740_helper.c
new file mode 100644
index 000000000000..564b9086e52d
--- /dev/null
+++ b/sound/pci/hda/ideapad_s740_helper.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Fixes for Lenovo Ideapad S740, to be included from codec driver */
+
+static const struct hda_verb alc285_ideapad_s740_coefs[] = {
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x10 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0320 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0041 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0041 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x007f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x007f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x003c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0011 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x003c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0011 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0042 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0042 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0009 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0009 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001d },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004e },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001d },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004e },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001b },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001b },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0019 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0025 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0019 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0025 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0018 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0037 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0018 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0037 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0016 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0076 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0016 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0076 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0017 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0017 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0007 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0086 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0007 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0086 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0042 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0042 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x007f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x007f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x003c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0011 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x003c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0011 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x002a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x002a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0046 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x000f },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0046 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0044 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0044 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0009 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0003 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0009 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x004c },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001b },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001b },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0019 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0025 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0019 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0025 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0018 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0037 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0018 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0037 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x001a },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0040 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0016 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0076 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0016 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0076 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0017 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0017 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0010 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0015 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0007 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0086 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0007 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0086 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0001 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x29 },
+{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0002 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0x0000 },
+{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+{}
+};
+
+static void alc285_fixup_ideapad_s740_coef(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_add_verbs(codec, alc285_ideapad_s740_coefs);
+		break;
+	}
+}
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a7544b77d3f7..68201bd05ee5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6232,6 +6232,9 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
+/* for alc285_fixup_ideapad_s740_coef() */
+#include "ideapad_s740_helper.c"
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -6427,6 +6430,7 @@ enum {
 	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 	ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
 	ALC256_FIXUP_ACER_HEADSET_MIC,
+	ALC285_FIXUP_IDEAPAD_S740_COEF,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7901,6 +7905,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC285_FIXUP_IDEAPAD_S740_COEF] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_ideapad_s740_coef,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8244,6 +8254,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
+	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.30.2

