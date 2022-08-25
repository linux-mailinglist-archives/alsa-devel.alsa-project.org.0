Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E175A060A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 03:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB16820;
	Thu, 25 Aug 2022 03:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB16820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661391496;
	bh=abJU8IWLJz7vzWX3u+b6BZ2hJof6TDDQKUmjDeifDTQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gB+qWpTqbZoQDItzA+SaSqlnzhQdFLh+kuPRsfsqLUoPLt8FdMamS0BLcnW2QJqf7
	 J7Mqkwxfwl54onnkeHR1jWrXU3hwwQN8teP70YVpKGpDFEgvUSgueVI9V+aQIfA4JA
	 85EIJdwXyotGW9L/M2C0ZPWsL7uMRiJOTSrkye/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A1CF80271;
	Thu, 25 Aug 2022 03:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15E84F800BD; Thu, 25 Aug 2022 03:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E887F800BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 03:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E887F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T1vA7dKW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 589C661AEC;
 Thu, 25 Aug 2022 01:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2B8C433D6;
 Thu, 25 Aug 2022 01:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391426;
 bh=abJU8IWLJz7vzWX3u+b6BZ2hJof6TDDQKUmjDeifDTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T1vA7dKWUzT2fBnMFxKrbfzr8TNt+al5G+vaJ59cW7KYNS90RhVGOuTe6PCWQEXye
 mTdvSzRJ4GOFcaQdzUfuDI50wD/L78gaJmlgYZfgHYu16eGcUlFdMk/vRaZ2EH18k8
 FIcsAmWM2rvLUfW0+hvFjM+it6Hq1lIkJFqAz2qWAO9Kl5UpG8kL0ihTc8z2TNSX0t
 dzymadjM9LdqdIJghBW81w0RNOC+WYaSMLPJdcf5HnQd/WNn6abtMCueKRY1XN2s00
 6P0QCnHn/IkoxzDx0YshfexlCPJdZKu6L43GNlGjzAbNbYIUUbxBxpRicKr0XjB18W
 +yHC6MBxWAKUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 34/38] ALSA: hda/cs8409: Support new Dolphin
 Variants
Date: Wed, 24 Aug 2022 21:33:57 -0400
Message-Id: <20220825013401.22096-34-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, trix@redhat.com, tiwai@suse.com,
 vitalyr@opensource.cirrus.com, lk@c--e.de
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit 1ff954f9ab054675b9eb02dd14add8f7aa376d71 ]

Add 4 new Dolphin Systems, same configuration as older systems.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220816151901.1398007-1-sbinding@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_cs8409-tables.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 4f4cc8215917..5b140301ca66 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -546,6 +546,10 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0BD6, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0BD7, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0BD8, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C43, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C50, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C51, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C52, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
-- 
2.35.1

