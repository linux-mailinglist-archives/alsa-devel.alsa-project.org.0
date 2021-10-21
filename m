Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A3435744
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 02:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C437016BF;
	Thu, 21 Oct 2021 02:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C437016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634775871;
	bh=fGHkWFFjgamQ7uIYfc3mv+dcwTe2RZfno3L6rMpP+Jo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWlZvcXYJUORY5MnRGPb2IWrMRu1VGJvNk1+A3pSW1Mq8iMw5XQWsdHc1T+NhhttI
	 2+1JdPU4bg9NkLnpnDQTu8XqUwQyiIG9McEXFhQeYukNiQAJhqOC15MXtIwXkIxQbT
	 HGw1WUBcTJQG6IiOkz8owVzgV4ptXAYGtzzzB/+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EBBF802A9;
	Thu, 21 Oct 2021 02:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F317F804B2; Thu, 21 Oct 2021 02:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 250F7F80253
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 02:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250F7F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rt6PRDKs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE99860FD8;
 Thu, 21 Oct 2021 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634775807;
 bh=fGHkWFFjgamQ7uIYfc3mv+dcwTe2RZfno3L6rMpP+Jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rt6PRDKs3TC1aS8lxFiBNLjyP8xRLI3zT4u8p7H1pPIAcP1j9ViGijrZyff940O8u
 8eNJjmZgsnRPb9t5gGY9/uj88Q6yaMbOFOI/BsOfp2rfsgIcSetiZyGIqAl/pNLjZJ
 7YUW5TAZe6dlbSWkj+C6pbQgwO3cTzxJ4YrSfMtaRJGBlg9vxXw8NlUBJPAKZhPHcv
 M6cQW04kfLrSR6gJSW+ROIPRIrNY8Kbbq6nBdcVHpD8BP9PO+B0UQ8ekr1jEZ6ouzi
 cws4OB3B2OCDjTaK/zaW6F12Ndc9NYzz3BnyCW4s//AZf1uK4SLNkjvELmWtJIi2GX
 y4/j3562z5qOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/10] ALSA: hda: avoid write to STATESTS if
 controller is in reset
Date: Wed, 20 Oct 2021 20:23:04 -0400
Message-Id: <20211021002305.1129633-9-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021002305.1129633-1-sashal@kernel.org>
References: <20211021002305.1129633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 ranjani.sridharan@linux.intel.com, tiwai@suse.com, broonie@kernel.org
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit b37a15188eae9d4c49c5bb035e0c8d4058e4d9b3 ]

The snd_hdac_bus_reset_link() contains logic to clear STATESTS register
before performing controller reset. This code dates back to an old
bugfix in commit e8a7f136f5ed ("[ALSA] hda-intel - Improve HD-audio
codec probing robustness"). Originally the code was added to
azx_reset().

The code was moved around in commit a41d122449be ("ALSA: hda - Embed bus
into controller object") and ended up to snd_hdac_bus_reset_link() and
called primarily via snd_hdac_bus_init_chip().

The logic to clear STATESTS is correct when snd_hdac_bus_init_chip() is
called when controller is not in reset. In this case, STATESTS can be
cleared. This can be useful e.g. when forcing a controller reset to retry
codec probe. A normal non-power-on reset will not clear the bits.

However, this old logic is problematic when controller is already in
reset. The HDA specification states that controller must be taken out of
reset before writing to registers other than GCTL.CRST (1.0a spec,
3.3.7). The write to STATESTS in snd_hdac_bus_reset_link() will be lost
if the controller is already in reset per the HDA specification mentioned.

This has been harmless on older hardware. On newer generation of Intel
PCIe based HDA controllers, if configured to report issues, this write
will emit an unsupported request error. If ACPI Platform Error Interface
(APEI) is enabled in kernel, this will end up to kernel log.

Fix the code in snd_hdac_bus_reset_link() to only clear the STATESTS if
the function is called when controller is not in reset. Otherwise
clearing the bits is not possible and should be skipped.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20211012142935.3731820-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/hdac_controller.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 74244d8e2909..a65e8c0c630d 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -390,8 +390,9 @@ int snd_hdac_bus_reset_link(struct hdac_bus *bus, bool full_reset)
 	if (!full_reset)
 		goto skip_reset;
 
-	/* clear STATESTS */
-	snd_hdac_chip_writew(bus, STATESTS, STATESTS_INT_MASK);
+	/* clear STATESTS if not in reset */
+	if (snd_hdac_chip_readb(bus, GCTL) & AZX_GCTL_RESET)
+		snd_hdac_chip_writew(bus, STATESTS, STATESTS_INT_MASK);
 
 	/* reset controller */
 	snd_hdac_bus_enter_link_reset(bus);
-- 
2.33.0

