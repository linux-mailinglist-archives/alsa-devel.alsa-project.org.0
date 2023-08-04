Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3425676FFC6
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 13:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E805A20C;
	Fri,  4 Aug 2023 13:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E805A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691149995;
	bh=4KuMm+ZaNVggzZBGm/oK8Nwinudn6fiYshdIcaU9soU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U4cJk5rXoFn0+T2DTjdeWoQxhhI5mW76qc34mFSLmb4nlRj4LbfkG2siYhp/QMnUl
	 C64PFwq6E4KKBd5cHEDQYByBOhIL8FjcXRCxgePfDmbBcuXFkzGa66B9RC7mHxEdBA
	 Tx0/S4iTUL1M+E+0vI8SocoS8bdhD8Et+PkajJuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64520F8015B; Fri,  4 Aug 2023 13:52:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8CAF801D5;
	Fri,  4 Aug 2023 13:52:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA97F8025A; Fri,  4 Aug 2023 13:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 948F3F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 948F3F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a2CokwOg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A11661F99;
	Fri,  4 Aug 2023 11:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0988AC433C7;
	Fri,  4 Aug 2023 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691149934;
	bh=4KuMm+ZaNVggzZBGm/oK8Nwinudn6fiYshdIcaU9soU=;
	h=From:To:Cc:Subject:Date:From;
	b=a2CokwOgd9PnMVad0HXjhgr7kDSkGBdWRfA7jb7kOqS5C5HlPBGkyyrgDqcge6+ou
	 FmgqK8YitlrcercKqV194bLnaOvsdji6HRauglvF2ECjVEJ8QmG2di9HxrTX4JmOnf
	 sgNIv4xZ6QOnaC5oQx88MgwdZ7/VCoBCIbKVsupK49hjPBxKHZz4Ac/AJf1V9+0q0V
	 Js9rNZOQOZv8LDWIMA3JvE3gjRxERZL9NTj6SWNLWcn/sVPQnNncmKnrJUyvUHiZIX
	 U6D21ETD8CDuslisX/WGuitFT77+vbqkyv1Yio/FilPR097nnVODBUsBHfQDtjXQ2y
	 RuqyNsjWUqegw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.5-rc4
Date: Fri, 04 Aug 2023 12:52:03 +0100
Message-Id: <20230804115214.0988AC433C7@smtp.kernel.org>
Message-ID-Hash: TVBGBK4JXLDKMSBENAUYMHMUVKQGZVWT
X-Message-ID-Hash: TVBGBK4JXLDKMSBENAUYMHMUVKQGZVWT
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVBGBK4JXLDKMSBENAUYMHMUVKQGZVWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.5-rc4

for you to fetch changes up to f803ec63686dec863a33cad87218d7d99c4b5e92:

  ASoC: fsl: micfil: Use dual license micfil code (2023-08-03 14:54:06 +0100)

----------------------------------------------------------------
ASoC: Fix for v6.5

Not really a fix, but rather a licensing update for the fsl_micfil
driver.

----------------------------------------------------------------
Daniel Baluta (1):
      ASoC: fsl: micfil: Use dual license micfil code

 sound/soc/fsl/fsl_micfil.c | 4 ++--
 sound/soc/fsl/fsl_micfil.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
