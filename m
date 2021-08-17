Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67723EE16B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 02:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC35829;
	Tue, 17 Aug 2021 02:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC35829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629160830;
	bh=rjqnYV+POj9OvYKZoXpqHeAKVBzGhPfa+r0LODo5UqA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u1jGyS6hybrlRAHivJ2fSwnV77Vw0xWVDo/yxZUUxO/PxrO/t9LQd7xf6twbssga7
	 enxkWyM/kDQSlMychSnFio8TJQ2tWFARnaOaJlg/xKlE92WS/DFjOySJfUc4dvwf/G
	 +KDUq9tMvPt+N51wykM3oqtovsv2t/XA3acIC2PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC1D9F8051B;
	Tue, 17 Aug 2021 02:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5C8F8051E; Tue, 17 Aug 2021 02:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B6C2F80516
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 02:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6C2F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cwdm4F37"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6E006103A;
 Tue, 17 Aug 2021 00:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160587;
 bh=rjqnYV+POj9OvYKZoXpqHeAKVBzGhPfa+r0LODo5UqA=;
 h=From:To:Cc:Subject:Date:From;
 b=Cwdm4F37E8xkvvPHuK2m4h7+iN0zJQNLPRf5asuUWuZlGyV5ev1AOSV05svcddlsA
 jbk5NC1Ktl9Q/sD09+kqFFKfaW2OA2EM1Lz1iIwv15W1e0+i2ga69ESqhdqXufYx9Z
 Ni6MVokhm/iRFyrFmQ+SEs96d/qKxxxcz3fHmN5jc2pEJGEs6L1DRpVK5sfaVR8wjK
 dfCAXaysNM+2mxxElhf7f+TLR3UP5KRCVQ9g3riK7OsHNIWOcm/Tdxusl47WqGc15c
 tMzvCXPp5glpa+Fuj01axN3tweN6nDGN9i7aFZZZ1r9835K+1+lzOGOLZ1C+KIN3gB
 lwCykmh4eFRaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/2] ASoC: wm_adsp: Let
 soc_cleanup_component_debugfs remove debugfs
Date: Mon, 16 Aug 2021 20:36:24 -0400
Message-Id: <20210817003625.83589-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit acbf58e530416e167c3b323111f4013d9f2b0a7d ]

soc_cleanup_component_debugfs will debugfs_remove_recursive
the component->debugfs_root, so adsp doesn't need to also
remove the same entry.
By doing that adsp also creates a race with core component,
which causes a NULL pointer dereference

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210728104416.636591-1-tanureal@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 00dd37f10daf..1347131e8b94 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -585,7 +585,6 @@ static void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
 static void wm_adsp2_cleanup_debugfs(struct wm_adsp *dsp)
 {
 	wm_adsp_debugfs_clear(dsp);
-	debugfs_remove_recursive(dsp->debugfs_root);
 }
 #else
 static inline void wm_adsp2_init_debugfs(struct wm_adsp *dsp,
-- 
2.30.2

