Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307A742CDD
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 21:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA917F8;
	Thu, 29 Jun 2023 21:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA917F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688065439;
	bh=13f/HRpmv2My9g/tfBPFpPeoyAwq/ztDRUY5fqnxFVQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lWozg6KvmdqriiHLG1zlr86tD2HO64QQKOqx4HAAkAXqJKfCn9aqywT2YEvj2oS37
	 nVbAups1dODYOSAJsX1d4QnYbrJKBU/4+GlhNSTlgKl9pilsoZuPRUuW+FLuJNFMZw
	 RK9D68Uk2yEVWsGWWqLdMvnYFOZayjdnL9RAOVUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35396F8057F; Thu, 29 Jun 2023 21:02:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06909F8051E;
	Thu, 29 Jun 2023 21:02:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E89F80580; Thu, 29 Jun 2023 21:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DA15F80564
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 21:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA15F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=caJ2cpQA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1E5361614;
	Thu, 29 Jun 2023 19:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6AEC433C9;
	Thu, 29 Jun 2023 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065340;
	bh=13f/HRpmv2My9g/tfBPFpPeoyAwq/ztDRUY5fqnxFVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=caJ2cpQA1311or7AWYVIfNdtzoJ6PjQV3VDZBtnm/PJem/EwS4ndldx1Vsp0W+psC
	 gppu9r7KOJIrGa004yZZzoPo1t2RuLPzRSs3KXIFX8vJOwFK0RA/Y0DsRWSFXOLey0
	 5Jct8RG6VA1b77wL3OwpQqu7fcq/2zep3VFPYspe1S8OSPaVvaN+Mem3twHuuiisss
	 GUTz3wAE/0imaw6gSrj1eJMU/MO2MbLSSvdwwVl8uOwVUdJMx6yKrG1/4x77+HwZI7
	 p95WTz3EmpHBHxTcH/sirHwHrHXKqsMoZftqQBOF6Mwo1T8ZisJ8ClLw1pEQ6o2gTo
	 1OvLSeEm2WkpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 1/5] ASoC: ops: Check bounds for second channel
 in snd_soc_put_volsw_sx()
Date: Thu, 29 Jun 2023 15:02:15 -0400
Message-Id: <20230629190219.908379-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.287
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKI2F23AIRC22RVZISNX6HDAXCLRNXWP
X-Message-ID-Hash: KKI2F23AIRC22RVZISNX6HDAXCLRNXWP
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKI2F23AIRC22RVZISNX6HDAXCLRNXWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
index 453b61b42dd9e..00e6a6e46fe52 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -460,6 +460,12 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
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
2.39.2

