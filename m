Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82BA45FA6
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 13:46:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2B8602E6;
	Wed, 26 Feb 2025 13:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2B8602E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740573958;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nEXA89hGBKEY9qrVmh3ftA+yspSwyaxipSjczwHIy0ZuEz9ITDXLjWkmenF+sc60a
	 hPd9xTu0QD18OXUREUGekbFZ9Gxbb1EqzY+9CEJ2w+M98E4JMYlfzMtXc2v6WRtMQI
	 sEqQeuitEXuvzt+4ZDakGPoQsRF1zP3m6DWgVQz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F19F805C0; Wed, 26 Feb 2025 13:45:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF977F805B3;
	Wed, 26 Feb 2025 13:45:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86C3DF8016E; Wed, 26 Feb 2025 13:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95EF8F800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 13:45:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95EF8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PYei3yz2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C46B61155;
	Wed, 26 Feb 2025 12:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D85C4CED6;
	Wed, 26 Feb 2025 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740573911;
	bh=Yyy18qKjq6WWcNNrHiZjhxMlZg0K62qDA8PvIO8C9tE=;
	h=From:To:Cc:Subject:Date:From;
	b=PYei3yz2DGSgUdD1SKv6jWcG5NlnujPEQP2s2bXyuuipQpsvTDejMa7/pxlKTIoPH
	 wM10AXJkfn4HEsi2m4+fM3j65QCLJOfy3HUnngFTC0NC8+dJqXCf4kHRb90rAz6UhK
	 sBn3GDpzRABY6onNDigibzUbDgr5aPzDSHqPVGEqq7iIcKBo8X7I22jNmabXv76IlE
	 qEaGykuDthqLbuXlQ58YgmpUXme3virpkzfWAcl+GlgxJ0CKwcT/Fr2L0e42bUWf/x
	 eooJE7yHAaF3aQV1W+Jl4pbk6EXg9SSQ5PJExrs915cXaumUMOpw1kdgDMtyz2o0X6
	 sx6DJCfXeRG3A==
Message-ID: <493624e8678463b8204354f06fd00e02.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc3
Date: Wed, 26 Feb 2025 12:45:06 +0000
Message-ID-Hash: SGO2GBCJMRSPU7262LKFLCOCEHR5DMXW
X-Message-ID-Hash: SGO2GBCJMRSPU7262LKFLCOCEHR5DMXW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGO2GBCJMRSPU7262LKFLCOCEHR5DMXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc3

for you to fetch changes up to f5468beeab1b1adfc63c2717b1f29ef3f49a5fab:

  ASoC: tas2764: Set the SDOUT polarity correctly (2025-02-18 20:08:43 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

A few fixes I and James Calligero picked out of the Asahi tree.

----------------------------------------------------------------
Hector Martin (3):
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Set the SDOUT polarity correctly

 sound/soc/codecs/tas2764.c | 10 +++++++++-
 sound/soc/codecs/tas2764.h |  8 +++++++-
 sound/soc/codecs/tas2770.c |  2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)
