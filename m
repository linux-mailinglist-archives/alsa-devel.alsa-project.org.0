Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FBAC31D1
	for <lists+alsa-devel@lfdr.de>; Sun, 25 May 2025 00:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8F1601E9;
	Sun, 25 May 2025 00:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8F1601E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748126127;
	bh=hTcFEegb2qiUjAMTfEa/uPeVJKtlF81ctDhTSt/5JF0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jTppdoD2QA8/VWjmFUJNPo19gs6KcW17YshV8M3/stJ11C58C/RYzqyExv5skTyEx
	 W+WDJlrxJB4drR/9slZHb2DYniQ/H4lv381g0PreQBQrjwhsOS1rTanhtaxHm7ch9z
	 NJvJivTlkL7uZtfL71GjeHqHE/TmQiUnhEfcDzjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81C1FF805BE; Sun, 25 May 2025 00:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F9CF8028B;
	Sun, 25 May 2025 00:34:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AF66F80236; Sun, 25 May 2025 00:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B6DCF80152
	for <alsa-devel@alsa-project.org>; Sun, 25 May 2025 00:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6DCF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nc9E3IfJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 117375C59CE;
	Sat, 24 May 2025 22:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFB6C4CEE4;
	Sat, 24 May 2025 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748126082;
	bh=hTcFEegb2qiUjAMTfEa/uPeVJKtlF81ctDhTSt/5JF0=;
	h=From:To:Cc:Subject:Date:From;
	b=Nc9E3IfJ1fY17e/9hTUpkhEFhyuwh0vInbLIS4lWXZ3UbMcFFQjxGIaZx8WhJeiTw
	 XxnMvFDXtXLAeoAPNVvcU70PjNgdzNphnhaM2IC2ejJFMdXc9NR48YvWqV4kcBcm3s
	 oPIPnOsgA2Wep1epagwqubKueTVwUyl6oA6BPZ4ZZEkSlRrj1xXsydizD2DDHiwdpm
	 o+FCpuvERoUieQ2f4gronETVsSpe9nwkk4HfEqv8QogR80YR0nICZPZ6noNc7lc8Sr
	 cvpdrjEQ7u/DlpZ5N8TMyDAd1JIqudydYn9ESUt0LQTpLkHl58Jzy9AxXCv7k19XEw
	 +9T8Cr/zGlt4A==
Message-ID: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.15-rc7
Date: Sat, 24 May 2025 23:34:38 +0100
Message-ID-Hash: 47BTADZQGNJXC2TQAY3IAU4G5AVMWHIZ
X-Message-ID-Hash: 47BTADZQGNJXC2TQAY3IAU4G5AVMWHIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47BTADZQGNJXC2TQAY3IAU4G5AVMWHIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 7dd7f39fce0022b386ef1ea5ffef92ecc7dfc6af:

  ASoC: SOF: Intel: hda: Fix UAF when reloading module (2025-05-14 16:34:48 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7

for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:

  ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.15

A couple more small fixes for v6.15, both of which could also easily
wait until the merge window.

----------------------------------------------------------------
Martin Povišer (1):
      ASoC: apple: mca: Constrain channels according to TDM mask

Wentao Liang (1):
      ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()

 sound/soc/apple/mca.c   | 23 +++++++++++++++++++++++
 sound/soc/qcom/sdm845.c |  4 ++++
 2 files changed, 27 insertions(+)
