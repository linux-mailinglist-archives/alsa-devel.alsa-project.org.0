Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FCF6440A0
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 10:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59ACE18AA;
	Tue,  6 Dec 2022 10:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59ACE18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670320385;
	bh=Pap3IXlxYGjtoVqTTttxLkOIKQGEOJpAlGo/M5eslcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d7okA8s/2fuDIEkP92W3P12IdjbSClMD/VNThZZG1PtnW67KCTkXkPdWCA2OM+bRk
	 U02QFwY88Msm/ZmvW90ioylHI3MU/xeDGECQP2FJzKrVaXZ/C3k/0qH8f2H4t7ZJmo
	 zOi5iaQm+PLBw0j0nGItfnm4pRCnZ+QNUYHDYffo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E95CF80564;
	Tue,  6 Dec 2022 10:50:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F189FF805A0; Tue,  6 Dec 2022 10:50:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98377F8059F
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 10:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98377F8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QsC7OHVu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64D3961620;
 Tue,  6 Dec 2022 09:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EDEC433B5;
 Tue,  6 Dec 2022 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670320236;
 bh=Pap3IXlxYGjtoVqTTttxLkOIKQGEOJpAlGo/M5eslcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsC7OHVuEofxnx4tt9748b0XPDG5agAqOdpvzElmY9miEDu+WvgN1MAqn+ig3Ol2Y
 yoHrF4wL7R3jHranNH5RIT/rU1JN9qes9iXh3Y3+I4WoDqcGEa0ISEw+lO0AsMecbx
 L7QPQoftCxXJh+8brE/Dih5luiGWvBPsgK4XXZbUwxFrTdtu8ITHxe3QZSlvdduipr
 0Ne9x/TfM9ROr1wm9Ue5KHq9peroEuNGs8RKt8W0VlwqC1LxjWr9Cft0vNQv4sUvF2
 w1t/GnfjDwTMruXOBHmq8u/XCtQsmK3qnIfo+r6UclCVQ4ZfVpWBZY0rAi2YjWkOVg
 68FCfSZuro18A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/10] ASoC: ops: Check bounds for second channel
 in snd_soc_put_volsw_sx()
Date: Tue,  6 Dec 2022 04:50:20 -0500
Message-Id: <20221206095027.987587-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221206095027.987587-1-sashal@kernel.org>
References: <20221206095027.987587-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 97eea946b93961fffd29448dcda7398d0d51c4b2 ]

The bounds checks in snd_soc_put_volsw_sx() are only being applied to the
first channel, meaning it is possible to write out of bounds values to the
second channel in stereo controls. Add appropriate checks.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220511134137.169575-2-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0f26d6c31ce5..49d22233d391 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -447,6 +447,12 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	if (snd_soc_volsw_is_stereo(mc)) {
 		val_mask = mask << rshift;
 		val2 = (ucontrol->value.integer.value[1] + min) & mask;
+
+		if (mc->platform_max && val2 > mc->platform_max)
+			return -EINVAL;
+		if (val2 > max)
+			return -EINVAL;
+
 		val2 = val2 << rshift;
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
-- 
2.35.1

