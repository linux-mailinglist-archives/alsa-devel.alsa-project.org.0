Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E4823693
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 21:30:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF32AE85;
	Wed,  3 Jan 2024 21:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF32AE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704313827;
	bh=zMWNbsdJ3dIGOwpITpJOJ+0QtfiW1ST3K5dh/VdP9j0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xl6NY1/b8rw7cpCrHkMeLHyNs/mc7Ukzf28ZJ0Hz4ZcAvd3VN0HBmh5K3n0IDNk1Y
	 nN1fn9bpY1B49br6Se5BnF9e1VpxL3203JuXr1WBOarcJoOReb06Kdrj0HzCJf5NYw
	 tQm1vMdFYQ0iE0rkS3RxVvwOgIos0UXiw6cjCOkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84CC0F805A1; Wed,  3 Jan 2024 21:30:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E256F8057F;
	Wed,  3 Jan 2024 21:30:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84714F80537; Wed,  3 Jan 2024 21:30:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02FA6F80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 21:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02FA6F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RVgEqyjq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9E265B81604;
	Wed,  3 Jan 2024 20:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C240DC433C7;
	Wed,  3 Jan 2024 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704313794;
	bh=zMWNbsdJ3dIGOwpITpJOJ+0QtfiW1ST3K5dh/VdP9j0=;
	h=From:To:Cc:Subject:Date:From;
	b=RVgEqyjq2cs9wCaG8yYrQGAo9iW7vpSPJLHWQC5p1LNXQrvzL4BqEl49hdp+hCTdu
	 gYHyyv/Tg1SeTmrocspng473bXahNrjQcmtPHp4Iz2i1DZikQJ6uuy2y1s30FNcrDt
	 Ma43jSxiLJVbMjAryci7UnZPv9EaezE8m2UDjvTRSWeS9PirrPqMN98zS4h8UZakpb
	 g1pv1uC4rdCLn4ZBTcQAWzGyqQDfJcjpb225OGj6WPAHHYQjH9nY+JHsfYoHxm0s6G
	 qkgE9ysWTYelntMfjmgIv/bZSNRrMxdMX+8us4t4p+CYOz9w30tF8DpE8DcumQQfZD
	 UQiWiEVvJyq8Q==
Message-ID: <1f43da7b8c6e4c8cdc04b7e67838f258.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.7-rc8
Date: Wed, 03 Jan 2024 20:29:50 +0000
Message-ID-Hash: RXZNFHHVHS2SZR662IX7DPZRQBPI7UJP
X-Message-ID-Hash: RXZNFHHVHS2SZR662IX7DPZRQBPI7UJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXZNFHHVHS2SZR662IX7DPZRQBPI7UJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 8f0f01647550daf9cd8752c1656dcb0136d79ce1:

  ASoC: fsl_sai: Fix channel swap issue on i.MX8MP (2023-12-19 13:23:39 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-rc8

for you to fetch changes up to b036d8ef3120b996751495ce25994eea58032a98:

  ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux (2024-01-03 18:37:02 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.7

I recently got a LibreTech Sapphire board for my CI and while
integrating it found and fixed some issues, including crashes for the
enum validation.  There's also a couple of patches adding quirks for
another x86 laptop from Hans and an error handling fix for the Freescale
rpmsg driver.

----------------------------------------------------------------
Chancel Liu (1):
      ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable

Eugen Hristev (1):
      ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and offset

Mark Brown (4):
      ASoC: meson: g12a-toacodec: Validate written enum values
      ASoC: meson: g12a-tohdmitx: Validate written enum values
      ASoC: meson: g12a-toacodec: Fix event generation
      ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux

 sound/soc/fsl/fsl_rpmsg.c                   | 10 ++++++++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c |  2 +-
 sound/soc/meson/g12a-toacodec.c             |  5 ++++-
 sound/soc/meson/g12a-tohdmitx.c             |  8 +++++++-
 4 files changed, 20 insertions(+), 5 deletions(-)
