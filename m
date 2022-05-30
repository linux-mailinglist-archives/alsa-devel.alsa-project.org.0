Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6A537BF4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDFC1B0B;
	Mon, 30 May 2022 15:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDFC1B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917330;
	bh=laup2rznz3Il/ZJtnKku7FRUlcG86YxUDSIH8CKkm2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5BgGzYCa/zV7XLd0j6GFVGr+k5mA3Ru7vImJPvK2Pq9hqnWAi4bsLdPe6xZXiFKr
	 9cZucNMDy0U2uQlUJgRBAgyEoRo0VhCSJPKDAwV7axB0Z7SRCbJz5tBRc9hjgi9WQC
	 +BjU22QKnwFy2G/y/iNi0i09L4BASfonDvsawmkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C82F804BD;
	Mon, 30 May 2022 15:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C91FCF804B4; Mon, 30 May 2022 15:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86AE8F8012F
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AE8F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rbi443Zt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF68AB80DA7;
 Mon, 30 May 2022 13:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994CEC3411C;
 Mon, 30 May 2022 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917274;
 bh=laup2rznz3Il/ZJtnKku7FRUlcG86YxUDSIH8CKkm2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rbi443Zthh3CYE6N9Tef0yFfAD889eFh8hC56Mu9ut1zowhvTWqPywso8qG5XxYxx
 BXX4k9icXgJ9Ajp+5U2Mx5AiwiajE6Zscm1n/Gmg/QElRNoqzzA6DhT+70uP8vhLPE
 t9eAtDLiaJUNrHRw/sTTbIzLUPxh9WnVqY8GxV68TdXHmqVvlNd7IjD4aQhE2PKmLA
 fbMETP8yPEYy8UU54MaScPWuQBjZeAhqIPyXjHjuFrAbIScnaMlth9wa5amJimncAa
 li2tCBItkmMZcHEouJbFv2ZcYz5gA/59plnIo0jtO36pxFFkS9ebihFtSSEMgfZWGA
 xmtIhmn40LteQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 078/159] ASoC: dapm: Don't fold register value
 changes into notifications
Date: Mon, 30 May 2022 09:23:03 -0400
Message-Id: <20220530132425.1929512-78-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
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

[ Upstream commit ad685980469b9f9b99d4d6ea05f4cb8f57cb2234 ]

DAPM tracks and reports the value presented to the user from DAPM controls
separately to the register value, these may diverge during initialisation
or when an autodisable control is in use.

When writing DAPM controls we currently report that a change has occurred
if either the DAPM value or the value stored in the register has changed,
meaning that if the two are out of sync we may appear to report a spurious
event to userspace. Since we use this folded in value for nothing other
than the value reported to userspace simply drop the folding in of the
register change.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220428161833.3690050-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-dapm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index ca917a849c42..869c76506b66 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3437,7 +3437,6 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			card->update = &update;
 		}
-		change |= reg_change;
 
 		ret = soc_dapm_mixer_update_power(card, kcontrol, connect,
 						  rconnect);
@@ -3539,7 +3538,6 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			card->update = &update;
 		}
-		change |= reg_change;
 
 		ret = soc_dapm_mux_update_power(card, kcontrol, item[0], e);
 
-- 
2.35.1

