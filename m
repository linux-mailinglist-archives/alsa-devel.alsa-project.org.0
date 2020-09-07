Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7D025FFF1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 18:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541A617D7;
	Mon,  7 Sep 2020 18:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541A617D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599496915;
	bh=A1GglWH/Xqi80/BCeRtvDldnvRBNc1Oeew/+yalEkgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtxmUYMS4agSEat4HnQkeHefzCy5ArwvZAFpuS8+qmooK3NOQgahI+7kjOKwb6VHU
	 mBAOCMoEM+7scJLFpjMHf2J8JnQP9urgbfkGea1Cj7p3zc8vM/H0ab1FvNafDVmXod
	 wyXMDqIjqzybarFcDdu/b7Z9bqiI63b9nkeGbUeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A4A6F80322;
	Mon,  7 Sep 2020 18:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 730E9F80334; Mon,  7 Sep 2020 18:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 436ECF80322
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 18:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436ECF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mGej1oPH"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDAA621941;
 Mon,  7 Sep 2020 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496530;
 bh=A1GglWH/Xqi80/BCeRtvDldnvRBNc1Oeew/+yalEkgE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mGej1oPHVz+1mi1WIlI6OW0optlKBmMMRK5OHCerEcj9Nbzz/0lQIiUYCS+va0bxU
 3e+W/ZHOhkm6l9igdDsG34yWzlTfTZZAR77bVh2K4N4+ErJVFqQqxvh4b2naBVcmX4
 V6KKUMhNNs65YMfBKfmbztVk9QDZUtsoV8H8ma9o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/13] ALSA: hda: Fix 2 channel swapping for Tegra
Date: Mon,  7 Sep 2020 12:35:15 -0400
Message-Id: <20200907163524.1281734-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163524.1281734-1-sashal@kernel.org>
References: <20200907163524.1281734-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 Sameer Pujar <spujar@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
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

From: Mohan Kumar <mkumard@nvidia.com>

[ Upstream commit 216116eae43963c662eb84729507bad95214ca6b ]

The Tegra HDA codec HW implementation has an issue related to not
swapping the 2 channel Audio Sample Packet(ASP) channel mapping.
Whatever the FL and FR mapping specified the left channel always
comes out of left speaker and right channel on right speaker. So
add condition to disallow the swapping of FL,FR during the playback.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Acked-by: Sameer Pujar <spujar@nvidia.com>
Link: https://lore.kernel.org/r/20200825052415.20626-2-mkumard@nvidia.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 2def4ad579ccf..4f8dd558af48f 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3224,6 +3224,7 @@ static int tegra_hdmi_build_pcms(struct hda_codec *codec)
 
 static int patch_tegra_hdmi(struct hda_codec *codec)
 {
+	struct hdmi_spec *spec;
 	int err;
 
 	err = patch_generic_hdmi(codec);
@@ -3231,6 +3232,10 @@ static int patch_tegra_hdmi(struct hda_codec *codec)
 		return err;
 
 	codec->patch_ops.build_pcms = tegra_hdmi_build_pcms;
+	spec = codec->spec;
+	spec->chmap.ops.chmap_cea_alloc_validate_get_type =
+		nvhdmi_chmap_cea_alloc_validate_get_type;
+	spec->chmap.ops.chmap_validate = nvhdmi_chmap_validate;
 
 	return 0;
 }
-- 
2.25.1

