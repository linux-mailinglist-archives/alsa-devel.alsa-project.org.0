Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0863AF9E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:43:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58D7A170A;
	Mon, 28 Nov 2022 18:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58D7A170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669657435;
	bh=kodpPhPiGEHVncs7lHlgeyBV0cizVTBtEmqJi9UoSh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpqiOvQgbPUpxBLJQHds0ZZvjm7lonlfuIxA02NxZaevKAuLMJ5D+Xva7+QCHuIOX
	 U6i+P08mm0v+NDzAfoBZ+ndSqodDSOBOWs0P1d4ZzXgzMQ9oR66ztNWmH2aUMTgfbl
	 jR8SAJMqJi6XQjLmtloOc6D/PyHx9SIUrQueGKfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36CE0F8055C;
	Mon, 28 Nov 2022 18:42:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 070DEF8055B; Mon, 28 Nov 2022 18:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06E75F8053D
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E75F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TNt4nvx2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D924A612E9;
 Mon, 28 Nov 2022 17:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8A0C433D6;
 Mon, 28 Nov 2022 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657346;
 bh=kodpPhPiGEHVncs7lHlgeyBV0cizVTBtEmqJi9UoSh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TNt4nvx2GI4uw/M7r4ahCIA/eEz8RmlBGLKPk24XJDs28rG4qrg3xVNPGbVCloI/3
 3vM14af2VjIAVhgba1HZY9clnEiWELPQ57WeJsLBy8Lq0uvP8VBoUpN50tctENKm34
 NdKWfO4ixSlLdBlmz5vHE0/Pj+Dd44lYlqkcCyHnPacQ66V1VPGp+pzkKcqM65p6Q6
 8Sa23uYMkRWDf+vOy+nJO+Cv5C2YUX+rUTt59xuBSXioF3t6PdoGNOGwpkZ/d6iwV/
 pYRm7R60n0yapPIgfREa/bd6mvL+SKEbdSzKs+ug+04/YL1DGT3WpnJUCQElFKb/ps
 VRFv/Z46/Jlwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/16] ASoC: soc-pcm: Add NULL check in BE
 reparenting
Date: Mon, 28 Nov 2022 12:41:55 -0500
Message-Id: <20221128174201.1442499-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128174201.1442499-1-sashal@kernel.org>
References: <20221128174201.1442499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

[ Upstream commit db8f91d424fe0ea6db337aca8bc05908bbce1498 ]

Add NULL check in dpcm_be_reparent API, to handle
kernel NULL pointer dereference error.
The issue occurred in fuzzing test.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Link: https://lore.kernel.org/r/1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1196167364d4..2f1ab70a68fc 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1201,6 +1201,8 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 		return;
 
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
+	if (!be_substream)
+		return;
 
 	for_each_dpcm_fe(be, stream, dpcm) {
 		if (dpcm->fe == fe)
-- 
2.35.1

