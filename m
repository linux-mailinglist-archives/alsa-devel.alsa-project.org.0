Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7C38E9CF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FFB4169B;
	Mon, 24 May 2021 16:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FFB4169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867793;
	bh=w6PHIeP+6wvAl57XhxGtKV/10eR+mrKICHgDdT2CgXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koUVcxBuecIhY8kYQ2Oqof/Wv0ThRpwKp/+BuOY8v/QHxTSvxrlb8b6Lu3igJvoqC
	 E7LEHgxb2+mv5201IPK2KV1rAxuPbp13QLzgb2cBydutKrnMrY+0zV7n8ewY3GNcsF
	 1S+mgXYJle9/hIP8ST901JGk6rksGihW6bMROEQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE8EF804AE;
	Mon, 24 May 2021 16:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07C8CF804AB; Mon, 24 May 2021 16:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CD1F8049C
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CD1F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mgQAbjWY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6525613CC;
 Mon, 24 May 2021 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867621;
 bh=w6PHIeP+6wvAl57XhxGtKV/10eR+mrKICHgDdT2CgXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mgQAbjWYPlL1i1YObImOBY9ERf2wHlhAUhcwHmMWgTa2Gf6KJIxFwbySMYIr5T49o
 xSN3VAO0IhKBbRVimJum05/AaAKUf6Ptja+PAW9YPJEvGo76ljj2f/q7wTJNQWMtk6
 Ccgnz0OTvBwGS7Daw1f1D16OMGF1Fv02Pm2Xso6qVPG/qz4WqmasoijlnXB1TxYo2N
 CkS8mhu7gcicFZkwT/BYQF5+78pcuzc2CiwnmlTeo4XlW7b0BVTUy1FwxUsRxKdVrW
 0Jew7Wr4NvTavmCDquQ7fIEwi0f6cLqlbfFPb6P0pKkdjYaTljHTi8Fj+vD1XXFHW0
 BWHtlnLLtYb3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 31/63] Revert "ASoC: cs43130: fix a NULL pointer
 dereference"
Date: Mon, 24 May 2021 10:45:48 -0400
Message-Id: <20210524144620.2497249-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144620.2497249-1-sashal@kernel.org>
References: <20210524144620.2497249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit fdda0dd2686ecd1f2e616c9e0366ea71b40c485d ]

This reverts commit a2be42f18d409213bb7e7a736e3ef6ba005115bb.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to be incorrect for the reasons
below, so it must be reverted.  It will be fixed up "correctly" in a
later kernel change.

The original patch here is not correct, sysfs files that were created
are not unwound.

Cc: Kangjie Lu <kjlu@umn.edu>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20210503115736.2104747-57-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 80bc7c10ed75..c2b6f0ae6d57 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2319,8 +2319,6 @@ static int cs43130_probe(struct snd_soc_component *component)
 			return ret;
 
 		cs43130->wq = create_singlethread_workqueue("cs43130_hp");
-		if (!cs43130->wq)
-			return -ENOMEM;
 		INIT_WORK(&cs43130->work, cs43130_imp_meas);
 	}
 
-- 
2.30.2

