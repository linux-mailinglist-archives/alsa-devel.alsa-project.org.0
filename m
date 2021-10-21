Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B543577B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 02:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6713A16BF;
	Thu, 21 Oct 2021 02:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6713A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634775950;
	bh=3eublEtbAHJH2wDIYeS2U2RNXI5uX1YDYBvhIOSPYQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i64Wga6aw1+swZXV59mQ/2HHDmU453rrxzGzj1mmLQN/3iID3YYI7FH4bkbqKMN1S
	 WCh93NbI8Og+8jkBGP9iHcGsN+2P2MNduBoy5VkajdRQWCgg+FeANbfU1dfm7JkGju
	 Q4Nj065dALik6X943RYUG05gb6Ujl8bi9rGx9K2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D26BF802A9;
	Thu, 21 Oct 2021 02:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16B72F804B2; Thu, 21 Oct 2021 02:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AEBDF80224
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 02:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AEBDF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N13BbNsP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8465B60FD8;
 Thu, 21 Oct 2021 00:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634775884;
 bh=3eublEtbAHJH2wDIYeS2U2RNXI5uX1YDYBvhIOSPYQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N13BbNsPvzm6Bzl8BxLuWZBQJeS94EE+rGRZv2GiF5UwrMV3DCg11uWRygvxXEAmd
 fd57fTbzgHKH+tXLQZ+2TvJgsXnjonvdq/zvukTzlb6QlhHfDxnlWjvAE2UOnqh6G0
 Fo08gfKgtG4J9FAU8lNAQ+Hi1JAMBw8y3MpdqDDv8KVGCf1Tm+ap2A7L4C7snYbjWC
 NQkIcSWJHmygZsunYPmE5+FRZq6Sw2pfmicwW+kj994H3M4NOa6Gq1unthKtNBIfVj
 ue3AMbJLtggKeH4dxv/ODG17vxUZyk8ZJnEynstZKhp+K30r/OKGITIfg1fMdAdr25
 rDKGEy2sfURFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 6/7] ALSA: hda: avoid write to STATESTS if
 controller is in reset
Date: Wed, 20 Oct 2021 20:24:25 -0400
Message-Id: <20211021002427.1130044-6-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021002427.1130044-1-sashal@kernel.org>
References: <20211021002427.1130044-1-sashal@kernel.org>
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
index 4727f5b80e76..4ee3458ad810 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -288,8 +288,9 @@ static int azx_reset(struct hdac_bus *bus, bool full_reset)
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

