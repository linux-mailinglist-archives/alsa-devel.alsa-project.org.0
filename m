Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992D6A1D3B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 15:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F63203;
	Fri, 24 Feb 2023 15:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F63203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677247720;
	bh=6WgQseSSE1/0RjYTZmTF8phVwKCFajro+gk7cetd7fg=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F8Jjm0OBH2NmNdIKGNZ1dsYeikypA3K5dycWhhY+iNRf6t/euYl5/VcsoeT9CGUsL
	 eMnkK/auHVz/VEeqZAQn4OvZ25F0Z89EQ91Omj7yIDL2ma30RDbUpo27bWlJ7sjJL/
	 8ud/xRi9LUxiI5AxI6Wi4GwNDW2lN8rc0xxrzvIo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DC0F8014C;
	Fri, 24 Feb 2023 15:07:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07095F80125; Fri, 24 Feb 2023 15:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3473FF800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 15:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3473FF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e3icBfRR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A82661843;
	Fri, 24 Feb 2023 14:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58EC433EF;
	Fri, 24 Feb 2023 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247654;
	bh=6WgQseSSE1/0RjYTZmTF8phVwKCFajro+gk7cetd7fg=;
	h=From:Subject:Date:To:Cc:From;
	b=e3icBfRRHSaWBxoU7LXlhkkJ0dYzqRGcFoeLU+fspHDzlaA9zBC8GeNEr0XoWqRYb
	 XrWCoGjjVBIjqcs7d4Fn0XnOqYQPZ66sLSLH85VvoqWnwlZbCSUYTqBzMqkbk9Gol+
	 qJyNPR1dH8GkTHU/eTurusY2fu4NeKRdFDjG5Ci98wc7ru8+xQso8CEw4jFzJd9hlb
	 aZABOvgqo7J2hWYjnyLse4bS0PkJM5HA1SkEOKbThYc9T6S5x7xLhJ60RS0EJu/apn
	 lhCFM1kQJZGHnb3Qjo7eTeasTkDA7K/1drnv3JHFpNrmyqdmpU7BU6FNYQU88xQxys
	 CN+qvpn2mCfkw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at kselftest
 run
Date: Fri, 24 Feb 2023 14:03:54 +0000
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMrD+GMC/x2L0QrCMAwAf2Xk2UCbwqz+iviQdZkLsm42U4Sxf
 7fz8Y67DUyKisG12aDIR03nXMGfGkgj54eg9pWBHAVHFJBtTjit0V8IX29NTxz0K4ZxCOLYxzN
 RC/Xu2AS7wjmNx79Oy2GXIv+8qtt9338NhGfcfwAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6WgQseSSE1/0RjYTZmTF8phVwKCFajro+gk7cetd7fg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSgptemsOYFwoH0fc5cIPy9dkZo6raLVN9t/bwB
 +1VF2laJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEoAAKCRAk1otyXVSH0F4CB/
 wO8wM26BECdCimtw2TUtGGjddmXPhsckwQto7lBLJnqtFnOxrYE4eHSGXjRkRyvFN1BjKnEObQY6Cb
 ZrzIw5s7kYMxAd0ik6y/+TOM5X+a2h7PJvwkfFlQEnTNUXz06e+Wr7+2th0RPw28ovpvrv9suUyjMf
 PrlaTSKbcvL/ThYL94y2bKP8bqL9segFhHf8NwSpneSBlVAsg3lHNb2tUKoVxZP4OeTMNSgMTlyYxd
 GfYjWV1qZgwIKdzteb1WDVZQn20VkgeGqSy4G+XqdAsor1IPfo26xdcE0snqTs7tID86Yvi9yBN9ss
 MfryzIZcD7L/hWfFve8dZ9/dvrj84m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 6KSSPL3GQVLMXJUWZIZ7QYJXPZRVH7VA
X-Message-ID-Hash: 6KSSPL3GQVLMXJUWZIZ7QYJXPZRVH7VA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a collection of fixes I came up after glancing through an
initial test run with the Spherion Chromebook on KernelCI.  There are
more issues flagged, this is just what I fixed thus far - the volume
controls on the MT6359 have issues for example, and a lot of controls
aren't marked as Switches like they should be.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (4):
      ASoC: mt8192: Remove spammy log messages
      ASoC: mt8192: Fix event generation for controls
      ASoC: mt8192: Report an error if when an invalid sidetone gain is written
      ASoC: mt8192: Fix range for sidetone positive gain

 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 58 ++++++++++-------------------
 1 file changed, 19 insertions(+), 39 deletions(-)
---
base-commit: b361d5d2464a88184f6e17a6462719ba79180b1a
change-id: 20230223-asoc-mt8192-quick-fixes-8f3e0a187226

Best regards,
-- 
Mark Brown <broonie@kernel.org>

