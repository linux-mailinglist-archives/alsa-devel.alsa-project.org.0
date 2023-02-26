Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DE6A2F73
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04B00843;
	Sun, 26 Feb 2023 13:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04B00843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415804;
	bh=myDYJsmBOb8gHjAvQqUQgdCx6N4vYiHnypwvnwHY+4s=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dAJqn7bXwJS0LeWFHSnS2jzz9sAU5wLvej2gpVeN+CuA9RUPDKFS1Uuub5gitTATU
	 2uEiVHtB+YJiIyfspCuq15ZZ3BVA1J90uIwf/ePYPSPIKNuGJKmUqWijUTUB9Ho6nA
	 mtKg7FaSZB6/DgPXseuEp7yZNiya4dBNGdZGBRxw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FAEF80520;
	Sun, 26 Feb 2023 13:48:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D44A6F804FE; Sun, 26 Feb 2023 13:48:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DEDDF802BE
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DEDDF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lXmQqneI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FA5060B5B;
	Sun, 26 Feb 2023 12:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFB8C433EF;
	Sun, 26 Feb 2023 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415689;
	bh=myDYJsmBOb8gHjAvQqUQgdCx6N4vYiHnypwvnwHY+4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lXmQqneI92pqzTJvMvB92/dlWf95v1nIBdHn/LaUO094h0a8mRdisPqgqEqm98WFM
	 KLjfKh9sOc9uhjeU8Y4qDwqjY3VO5PYjcRyr5w7+cKicnOtLY6T+/iZWD6nNF8CFV5
	 GsoyfKM/TAmBltf1epICe1zB284JIJemwndJbTSzN77X/Hn2bCSSoHN/Tiqy41U2zt
	 82lnheACCp7HNXM+Qnp7lmbB7h3AOvdQrIfT1W+XTGPDCH15rFbIfr0Ie7fUDZiL4P
	 1vV5YXxPtW0KEsAyEdJC6J+njbroNlnqNIJuIlRGGrLTvbp/ytqffC4GryXLYhyQX+
	 V1LVYVBc+Lh2w==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:47:57 +0000
Subject: [PATCH 2/3] ASoC: mt6358: Validate Wake on Voice 2 writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-2-747d9186be4b@kernel.org>
References: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
In-Reply-To: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=846; i=broonie@kernel.org;
 h=from:subject:message-id; bh=myDYJsmBOb8gHjAvQqUQgdCx6N4vYiHnypwvnwHY+4s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1UBQXRJd3he2b0fKcFSDBDJVxJc19sEfIgpXRZ8
 wWf3w4GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVAQAKCRAk1otyXVSH0Oo3B/
 910h+pTiRCco9oKRj3PMiCimp3XauEGVJdrJyivL73hfrDgnNCcp4VtngLqPCxfodWykqLQbjrq6V7
 ISlOAsJzjrZiWw6pTrWqTwEtXde+o1g0dZoSM/TYOC0eTgPqev1TpFK2d9HhHfGbAryLLpiMQAYTBB
 LkSGqJsPR7rv2hXT8BSDJKkBG+PEgQDnBbN8rAul89S2+j16NX3W7AHZF7ulY0zGFRteJ+n3Cxp1LW
 lYeUXRp7WkeK8FStLNF0LV9OFy9PkD4cctzPEm+rRoz0X3DcyEee+okX4ziVA+xX3N1mTCDO1Ybtc6
 GpZnr11PmWZ9CRpaA6O/qYqLlU7TpT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: UABI75XCRM3HFIXO3QLHDJU6IPD7EXGZ
X-Message-ID-Hash: UABI75XCRM3HFIXO3QLHDJU6IPD7EXGZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UABI75XCRM3HFIXO3QLHDJU6IPD7EXGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the Wake on Voice 2 control accepts and stores any value written
but it reports that only 0 and 1 are valid values. Reject any out of range
values written by userspace.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/mt6358.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 9004377461f7..89d0dcb2635b 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -560,6 +560,9 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 	int enabled = ucontrol->value.integer.value[0];
 
+	if (enabled < 0 || enabled > 1)
+		return -EINVAL;
+
 	if (priv->wov_enabled != enabled) {
 		if (enabled)
 			mt6358_enable_wov_phase2(priv);

-- 
2.30.2

