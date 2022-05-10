Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0E521F98
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768A9193C;
	Tue, 10 May 2022 17:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768A9193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197685;
	bh=+m4xr2VstQvfmpmlbh/Hzx8ERJ0r2on0tJLdU5O4+6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJWCvdtX8mSFJCworwGtDLzmZaSd89ybqnS9gprWAe3kcuhgvJ2hOjrgmM4CEAsoT
	 dJ9GboqjeFV+S6ya2M/8Pn0BokDUEoF1Q/Y0dbFlULvnOU4HLZDXEr9cH7EM4Lb8yO
	 +aGVaW+S3/vRSmwAogxsd0u131zz0O9O3GRI1aHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1228AF80240;
	Tue, 10 May 2022 17:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 453D3F80240; Tue, 10 May 2022 17:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD5CCF804BB
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD5CCF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C+AYDTtG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5952561329;
 Tue, 10 May 2022 15:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA43C385C2;
 Tue, 10 May 2022 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197517;
 bh=+m4xr2VstQvfmpmlbh/Hzx8ERJ0r2on0tJLdU5O4+6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+AYDTtGfc6NI6/rRcZetALBPs3cQsacGkCe8eQOFc3nNjzE3K1u1sR6Wf2r1eMSQ
 DOKiy51xa6N8fB6GnIGfpdepRuY6MNcQXeqhhhrCNGYHnJzVGjXIGUsAmYmoIAn24C
 hO9adxcLXRxL86B8cRV3Pbm9DEromxKJd+vdGvtUmyEELAed2Pu4CSGlpl0qVEfbmt
 LkFrBAKgccQwRwA9Sl8eYNlIPeWtEHv1joqXwkHk2X1dH+uXZ/yGcGqg/Rk2juSh8B
 id97JSjchfuAFQRAphq/bxFleM48YP+7Z689ufYAQ6BslRdHaKLChnx7eSVoW8tC6n
 48plY8Yb5RKwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/9] ASoC: max98090: Reject invalid values in
 custom control put()
Date: Tue, 10 May 2022 11:45:05 -0400
Message-Id: <20220510154512.153945-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154512.153945-1-sashal@kernel.org>
References: <20220510154512.153945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 2fbe467bcbfc760a08f08475eea6bbd4c2874319 ]

The max98090 driver has a custom put function for some controls which can
only be updated in certain circumstances which makes no effort to validate
that input is suitable for the control, allowing out of spec values to be
written to the hardware and presented to userspace. Fix this by returning
an error when invalid values are written.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220420193454.2647908-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98090.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 945a79e4f3eb..779845e3a9e3 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -413,6 +413,9 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 
 	val = (val >> mc->shift) & mask;
 
+	if (sel < 0 || sel > mc->max)
+		return -EINVAL;
+
 	*select = sel;
 
 	/* Setting a volume is only valid if it is already On */
-- 
2.35.1

