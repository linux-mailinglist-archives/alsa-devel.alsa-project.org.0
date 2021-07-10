Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409B3C3004
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C791765;
	Sat, 10 Jul 2021 04:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C791765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884937;
	bh=Wc+8IUEWEbx56kg+jURITthTR5thKLxkWh0FSVlJrVk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDnz3JFIfGr9ByIAsG+DemSyA/vzEN+yLxokbHos0lD++uWFtNthIhldDqAOqd4oS
	 UNYInj8gUevLMJx20RhNyxF1a9NDohmwjfEqShkTTZ7cfOAnJrScvbI9uPwfuefLj/
	 vt9Tf6v5/0f43qQZzj4ri7d2myQNFFKaxXW0b3A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65770F804E2;
	Sat, 10 Jul 2021 04:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0060F80613; Sat, 10 Jul 2021 04:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C238DF80610
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C238DF80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="npI42d2t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CEF6613F0;
 Sat, 10 Jul 2021 02:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884014;
 bh=Wc+8IUEWEbx56kg+jURITthTR5thKLxkWh0FSVlJrVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=npI42d2tWdQ8PuIEKVQrxgnwUMeeePP9RpI5scXVPBIAtaUWjPzVHvDxQDFPt6jR0
 FB6tTZ+fzS9OyymL6Ifbw+BAXfQS+fS14Lc9n8+GPvuULZio7OORYdwxCtrDlzD6sK
 5oYYs+mP8aWN0CiVpWDvSRqf/rrptm/aVWShFuTeAIeoduwB2Q6BJrwl7ykyasjioR
 VDZjpmKiEcgUa8hbc8S/2LomMOQQrtM5Yz+aYhZ6CtwiL8w3M8hrzxZopU6OtIgFMx
 fOvypUnuSab1ZCHEuz2D9SG0e2Px4Ykyf0fhkuKAuyFutvZGoFe1FzhPutWxd8eN9c
 7PXlwt6/DMxtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 85/93] ALSA: firewire-motu: fix detection for
 S/PDIF source on optical interface in v2 protocol
Date: Fri,  9 Jul 2021 22:24:19 -0400
Message-Id: <20210710022428.3169839-85-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit fa4db23233eb912234bdfb0b26a38be079c6b5ea ]

The devices in protocol version 2 has a register with flag for IEC 60958
signal detection as source of sampling clock without discrimination
between coaxial and optical interfaces. On the other hand, current
implementation of driver manage to interpret type of signal on optical
interface instead.

This commit fixes the detection of optical/coaxial interface for S/PDIF
signal.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20210623075941.72562-2-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/motu/motu-protocol-v2.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index e59e69ab1538..f0d478c5edc8 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -86,24 +86,23 @@ static int detect_clock_source_optical_model(struct snd_motu *motu, u32 data,
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 		break;
 	case 1:
+		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
+		break;
+	case 2:
 	{
 		__be32 reg;
 
 		// To check the configuration of optical interface.
-		int err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET,
-						    &reg, sizeof(reg));
+		int err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET, &reg, sizeof(reg));
 		if (err < 0)
 			return err;
 
-		if (be32_to_cpu(reg) & 0x00000200)
+		if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) == V2_OPT_IFACE_MODE_SPDIF)
 			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
 		else
-			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
+			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		break;
 	}
-	case 2:
-		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
-		break;
 	case 3:
 		*src = SND_MOTU_CLOCK_SOURCE_SPH;
 		break;
-- 
2.30.2

