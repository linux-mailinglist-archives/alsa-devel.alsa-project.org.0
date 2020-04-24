Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE51B7435
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 14:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D2A16D4;
	Fri, 24 Apr 2020 14:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D2A16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587731127;
	bh=oL+8TEkGErZ9ILv0k+jhUSJahhEcOSEpINEPR+DQHUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoY9+BdDp1d6z1dneHfzGO/tWnG+rRheJXJ+p9mjQCVk0MArYCB/B9pY5MCPUGYMV
	 ol8peH8zDRkEOvip9M76vAxXnty3dteM28PwSnI3vzUPYBlb8zJLiI6ATkaOTN5jUP
	 gABX9u1R4RvS1AGs1REhrFw6iAM9Zxi8knn5H47s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48310F80246;
	Fri, 24 Apr 2020 14:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDF8DF80279; Fri, 24 Apr 2020 14:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F2CF80142
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 14:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F2CF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MRtY/2Xl"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63F77215A4;
 Fri, 24 Apr 2020 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587730972;
 bh=oL+8TEkGErZ9ILv0k+jhUSJahhEcOSEpINEPR+DQHUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRtY/2XlgeDyNRCHY6GAsLAIP/+6DObSOgtfT2ngde5+KGtgZtSMVJkKH+sWLlT+4
 Nl3UWHPMBN9/RccuSg3YkkYTiO7hJKmCTHecdSPHwqaKShFmuis1w+dHLWYGyI1VoA
 hK4wGkUhHlF1cRt7zocfbCCRaYTcHmNouGPE1OYk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 13/38] ALSA: hda: Explicitly permit using
 autosuspend if runtime PM is supported
Date: Fri, 24 Apr 2020 08:22:11 -0400
Message-Id: <20200424122237.9831-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424122237.9831-1-sashal@kernel.org>
References: <20200424122237.9831-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Roy Spliet <nouveau@spliet.org>
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

From: Roy Spliet <nouveau@spliet.org>

[ Upstream commit 3ba21113bd33d49f3c300a23fc08cf114c434995 ]

This fixes runtime PM not working after a suspend-to-RAM cycle at least for
the codec-less HDA device found on NVIDIA GPUs.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
Signed-off-by: Roy Spliet <nouveau@spliet.org>
Link: https://lore.kernel.org/r/20200413082034.25166-7-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 02c6308502b1e..8519051a426e7 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2354,8 +2354,10 @@ static int azx_probe_continue(struct azx *chip)
 
 	set_default_power_save(chip);
 
-	if (azx_has_pm_runtime(chip))
+	if (azx_has_pm_runtime(chip)) {
+		pm_runtime_use_autosuspend(&pci->dev);
 		pm_runtime_put_autosuspend(&pci->dev);
+	}
 
 out_free:
 	if (err < 0) {
-- 
2.20.1

