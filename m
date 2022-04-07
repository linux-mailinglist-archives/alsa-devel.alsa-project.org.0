Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90A4F701C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 03:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10C91753;
	Thu,  7 Apr 2022 03:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10C91753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649294207;
	bh=cgsJW/lQPZmV/rD41uAn4aKxYHvrVPnYbrDnAmwpIEY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KyKGgMuI6OPLmI+4gK8Ehp3u7RVkljW1KFjm6BGGf+ba3lFTrO1hgMh8lfEmPHSkS
	 aYdsfDsorcx4zfL3KpebmpZVu69G0ven1zuNFxwt6H5dR3LVQlzth5Y1HY1/OFFJ6w
	 fZxQxXZdg2anBgXzmwBmyvG+75E7/XY6lbtjexFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88419F8020C;
	Thu,  7 Apr 2022 03:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CFA3F8019B; Thu,  7 Apr 2022 03:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58F82F800D1
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 03:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58F82F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m64ieoaH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5259261DCF;
 Thu,  7 Apr 2022 01:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B17C385A1;
 Thu,  7 Apr 2022 01:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649294146;
 bh=cgsJW/lQPZmV/rD41uAn4aKxYHvrVPnYbrDnAmwpIEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m64ieoaHyxpBVVZq0O1VOrFS9maaPDnKn9mjNv4XDxKDZy3y0W8L+XHmoY5pe4O1E
 DXMtl6kpeDoXFbU0TkGdIwpi+9Q3hppzO8aTSKteiYwsc3R926Gkbaj8k1tLlN4NOG
 bz8t9sYN979YC3MdWRF5ytZCys+5zcA11bb8YBCd1hzVCT1tJS+BnvhbnLomfNBw0R
 5Z+i0isf6Re/CG4HafpmraBQeUONf1zYHTAQRlyk+Yu31OjkmrC4pA0rIXvdnYAdfr
 matVd/ZclebBVMFehrHKKxgDt/OLgLatOn4qQBxFIgSrkJaAssuGWV3MUtLREHtLbA
 3oKni8AyaFl7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 09/17] ALSA: hda/realtek: Enable headset mic on
 Lenovo P360
Date: Wed,  6 Apr 2022 21:15:13 -0400
Message-Id: <20220407011521.115014-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011521.115014-1-sashal@kernel.org>
References: <20220407011521.115014-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kailang@realtek.com, tanureal@opensource.cirrus.com, jeremy.szu@canonical.com,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, wse@tuxedocomputers.com,
 hui.wang@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 sami@loone.fi, cam@neo-zeon.de
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit 5a8738571747c1e275a40b69a608657603867b7e ]

Lenovo P360 is another platform equipped with ALC897, and it needs
ALC897_FIXUP_HEADSET_MIC_PIN quirk to make its headset mic work.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Link: https://lore.kernel.org/r/20220325160501.705221-1-kai.heng.feng@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d201043d661c..4bcf833781bd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10221,6 +10221,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc051, "Samsung R720", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
+	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32ca, "Lenovo ThinkCentre M80", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
-- 
2.35.1

