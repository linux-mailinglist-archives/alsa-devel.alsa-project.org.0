Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A991D54A4B7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505041860;
	Tue, 14 Jun 2022 04:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505041860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172683;
	bh=+PYrvTFnip/gg9TheCSfPkipohp84RZ+kbpGq3MpCVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVolfEKzSHjcb2DinIJSsS0R4Kn8ROJc0jt5peYmD+dVQp9MyqoZFxhL39gePa5Ps
	 9NHM2Ln8jg7j+AG98br2aBNHq89kjU4liHyj/92E4f6ZnzH7eI4EPlRyfeCpacGKNz
	 vaUYpLJTaw1LXvWnOAaOArC4ufSrMPBaO02EuYgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D35F805C3;
	Tue, 14 Jun 2022 04:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A7FBF805BF; Tue, 14 Jun 2022 04:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC5D4F805AF
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC5D4F805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aeQ3bjcA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83EE560DB6;
 Tue, 14 Jun 2022 02:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE022C34114;
 Tue, 14 Jun 2022 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172378;
 bh=+PYrvTFnip/gg9TheCSfPkipohp84RZ+kbpGq3MpCVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aeQ3bjcA6cahHz0v/uI8FsV+0D+I4LPxRhOt8aJVNw6m6mnxD63HJhKuzplXVRj7U
 jdl6UrvBg3XbdOWjCeUssDEJs/VguLUd0GkNnUxD7wTgOGtmh+7nBfBuvpqUP4RDUt
 +tk1mVbLnAnWV6ipEfEPOaxX5/D30aNxTXqhVlUssx30NkocRlFe29A+l6qhYGI2jD
 VM9XNGt+98Wzst3rxOOYFvfLJuTTCfkzwEliOJgeutVx/T3GBt9lt1lQGoDT0WnHSH
 h6j8FsJB8QB/1pvM/hVTI3o5WKoPVDSgR0LTqOwswtJQwCESu5B2h4lu+fVG4X6URq
 CcMIgYdpl+29g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 10/43] ASoC: cs42l52: Correct TLV for Bypass
 Volume
Date: Mon, 13 Jun 2022 22:05:29 -0400
Message-Id: <20220614020602.1098943-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020602.1098943-1-sashal@kernel.org>
References: <20220614020602.1098943-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, brian.austin@cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Paul.Handrigan@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 91e90c712fade0b69cdff7cc6512f6099bd18ae5 ]

The Bypass Volume is accidentally using a -6dB minimum TLV rather than
the correct -60dB minimum. Add a new TLV to correct this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220602162119.3393857-5-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l52.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 785caba3f653..c19ad3c24702 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -137,6 +137,8 @@ static DECLARE_TLV_DB_SCALE(mic_tlv, 1600, 100, 0);
 
 static DECLARE_TLV_DB_SCALE(pga_tlv, -600, 50, 0);
 
+static DECLARE_TLV_DB_SCALE(pass_tlv, -6000, 50, 0);
+
 static DECLARE_TLV_DB_SCALE(mix_tlv, -5150, 50, 0);
 
 static DECLARE_TLV_DB_SCALE(beep_tlv, -56, 200, 0);
@@ -351,7 +353,7 @@ static const struct snd_kcontrol_new cs42l52_snd_controls[] = {
 			      CS42L52_SPKB_VOL, 0, 0x40, 0xC0, hl_tlv),
 
 	SOC_DOUBLE_R_SX_TLV("Bypass Volume", CS42L52_PASSTHRUA_VOL,
-			      CS42L52_PASSTHRUB_VOL, 0, 0x88, 0x90, pga_tlv),
+			      CS42L52_PASSTHRUB_VOL, 0, 0x88, 0x90, pass_tlv),
 
 	SOC_DOUBLE("Bypass Mute", CS42L52_MISC_CTL, 4, 5, 1, 0),
 
-- 
2.35.1

