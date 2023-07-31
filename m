Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CE76936E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9684851;
	Mon, 31 Jul 2023 12:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9684851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800547;
	bh=ItT7al2kLjWBYdbBXx0GhyFJpTHNsPm5yEH1Oa3IPGA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iyWIpur9V9RU9M68D04kZjrcvzGEty95DHp/Krce42clcsTxQPdV9Aw1dSpALI5Co
	 GOWvmBrrafgLMX14cLs/Qmn9u5kuKj/2FdcNYjJfh0ucTotFbvQmwbhv9o2+PEJntq
	 +6jbtobV5EZbbzxOfati4RTzwHnBz9FXz0/4c1y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D8D0F80567; Mon, 31 Jul 2023 12:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF405F8055B;
	Mon, 31 Jul 2023 12:47:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C306F80548; Mon, 31 Jul 2023 12:47:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54E68F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E68F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k1qORWVJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 702C46100B;
	Mon, 31 Jul 2023 10:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0ECC433C7;
	Mon, 31 Jul 2023 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800429;
	bh=ItT7al2kLjWBYdbBXx0GhyFJpTHNsPm5yEH1Oa3IPGA=;
	h=From:Subject:Date:To:Cc:From;
	b=k1qORWVJ72bX6Z5XRWBae/S3rzJChNbP/1e6RpNV4KWMsqT3LJc4gvmFSBI9cPuxN
	 IwpoaO+DqWGsNEnle9kojh8J4YGlV0L0XE5F/61iBtHxU2fk/0M0mEYw9Ah+Cb3dra
	 665yWUl2pwvefNQKgrM0WywDKxNtGwsm/Rp2r991w/Sv/HHABN6bXyIPlcp2xHjCeI
	 SFgBu9kqPJZD/itEwWFSZ/IGZ/pkpgCS6qgtsQqbpcX3fVq3yzBNjYSIw+CMfDNNmr
	 UOFv6Ck1YhD/V5MDJoVKHfd+okeMNvVU+rxJNbYPMU5OUwIzA7k4P7/vKT0Kwww7rX
	 hMPYxdjIIS/tw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: wm8960: Clocking tweaks
Date: Mon, 31 Jul 2023 11:47:01 +0100
Message-Id: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWRx2QC/x3MQQ5AMBBA0as0szZJFS2uIhbUYIKSNkEi7q6xf
 Iv/HwjkmQLU4gFPJwfeXUSaCLBz5yZCHqJBSZVJk0nswm7x2spKS7TrgtqaPC2IlOpziNXhaeT
 7Pzbt+35vJYT0YQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=598; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ItT7al2kLjWBYdbBXx0GhyFJpTHNsPm5yEH1Oa3IPGA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx5EpgWXWV98NW60roVRK8eWTgIbE5ZqLI0sVf
 AkX38Rxmx2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMeRKQAKCRAk1otyXVSH
 0H7dB/4zEuAuIb7XTusuLQ2NskvHRq2v3Eh+FmYBsn2pailwlv7SCdchAwds1R1J04lXtmPEgy8
 V874V+MzK7fCcoR9MW7pfK5SdL0LLM9JMVAST7CaEtyBbPYiG8UCsJZzmM2N948Hp48Q5YZ8XvF
 wa7AZM12qtd0xSsFu3TcW5Hm4QY2Z/0mH3O7uVCuQ+IMHYXUv3A7H8hF4FH1A8EnN1pWWO4I2XP
 pQIft9ph9DruV63Lw1QDgHqlEq1bMZLRFfvZyXEpgysPFve678GRknGmh0ZXFVLSCeHnZT5807u
 ApETXMpmH/4zhetCviznbAvmtwKsKFa36aPmW1dTRF8w+mUF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 7CE6FWVIKVKDYQYJ4TXDGHYIVKKOY2EF
X-Message-ID-Hash: 7CE6FWVIKVKDYQYJ4TXDGHYIVKKOY2EF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CE6FWVIKVKDYQYJ4TXDGHYIVKKOY2EF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A couple of minor clocking improvements that make the wm8960 driver work
a bit better with generic cards.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      ASoC: wm8960: Read initial MCLK rate from clock API
      ASoC: wm8960: Make automatic the default clocking mode

 sound/soc/codecs/wm8960.c | 8 ++++++++
 sound/soc/codecs/wm8960.h | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230730-asoc-wm8960-clk-6c7415ee22b4

Best regards,
-- 
Mark Brown <broonie@kernel.org>

