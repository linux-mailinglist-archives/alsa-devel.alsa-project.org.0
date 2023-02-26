Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B756A2F71
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6A982C;
	Sun, 26 Feb 2023 13:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6A982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415753;
	bh=e4JVxUex+BYhnFw9i2xpgRnZTwUc4EajwCGd4m9HsGY=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n66j4qoJe33l86H3CQkdEgoxhwsSx+3irLe8/3X+KDfdeF7rapyo8f9CFaaizgPTU
	 p5UyaVW0J0Tk/05PrqCdnC7yKp8mUEcDMfi+puh3za5c6x05/rcabe1x3TWc/B2lFs
	 AqKdFlkodbQqfvtpIPY3/OuJGOH8adqQOp+BT/3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3175F8049C;
	Sun, 26 Feb 2023 13:48:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DBB8F8051B; Sun, 26 Feb 2023 13:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EE1EF800BA
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE1EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LaWZEM8e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9CC260B5B;
	Sun, 26 Feb 2023 12:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFFAC4339B;
	Sun, 26 Feb 2023 12:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415685;
	bh=e4JVxUex+BYhnFw9i2xpgRnZTwUc4EajwCGd4m9HsGY=;
	h=From:Subject:Date:To:Cc:From;
	b=LaWZEM8e9/ksPi7ppvgH/R/Iix6RrF8XvcYkh5lH4Sbp2qa2zd2LP+LcK1P+W7M35
	 X7zw1mYcNCsg/eL0dk/+Nel7PGKcRYduAyzWlfuTK5jgHJIq2pcTWJSC21JNlYL/rS
	 ssz+r128j3JWPcKsSX+hP+DS9X6TdKZqoCmw/uzC5P+W0ntq+KGwmIE//9/+52gFK/
	 6VRC9PTjV4GWWZbUoqgvGePekHdAWmsw+5ibRTT1m/AEt/OX3GdEMNURyUh4ybDFII
	 cUnLrzm5ErTD1NiaqLiLaIFXqYERI0iIi2kBVgpk4s+RUXOlmf7sGnnidXhQ1ZuQl1
	 jCLc0+Jn10Abw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: mt6358: Fixes from an initial glance at a
 kselftest run
Date: Sun, 26 Feb 2023 12:47:55 +0000
Message-Id: <20230224-asoc-mt6358-quick-fixes-v1-0-747d9186be4b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtU+2MC/x2LSQ7CMAwAv1L5jKUmKaXiK4iDE1xqVSRgs0lV/
 07KcUYzCxirsMGxWUD5LSYlV3C7BtJE+cool8rgWx9a7zskKwlvzz7sB3y8JM04ypcNDy52TH0
 cRheg3pGMMSrlNG3/p+i86bvyv6/udF7XH0P7ud2AAAAA
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=broonie@kernel.org;
 h=from:subject:message-id; bh=e4JVxUex+BYhnFw9i2xpgRnZTwUc4EajwCGd4m9HsGY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1T/vh1v1wrN30hUR9D98736dtLyOfaSdjyfmcxD
 771Ye16JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tU/wAKCRAk1otyXVSH0Oq6B/
 9ec5dg8QVTGYm56PJnS+ukYisqxSgCBT2kX0o5ALt44S9aJtB4Ca5R7wM4XucJ+Ln5qXJfwiFdY0RD
 xjgO+tdPqYTEBeebk6MZAfbgvh0RffynXiqpCptpENVQyR+nRr5W5bMXjGl3xjw2efzafBuwRDU3Ub
 yYY1nJWJu47RYcB6H5xcd6kOcWQX+jp3lT1OwNkSpIBeLwkxpViOP4NtG+kMITBpIePhGnjsHAHqID
 seNHSPISt3WlfAsml/jC1Zjxi1JEyRkATwA2Nl3s6373Xv4js12EmGW7lrDtE9N38Mz5abuZooISc8
 jYMZBHsagJxFJCsEqOQJSgIwWDuTIy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EB7NZIMGRGPDOOQ3XZ7ZHJ7G3OJUKZXF
X-Message-ID-Hash: EB7NZIMGRGPDOOQ3XZ7ZHJ7G3OJUKZXF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EB7NZIMGRGPDOOQ3XZ7ZHJ7G3OJUKZXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a collection of fixes I came up after glancing through an
initial test run with the snappily named Kukui Jacuzzi SKU16 Chromebook
on KernelCI.  There are more issues flagged, this is just what I fixed
thus far.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      ASoC: mt6358: Fix event generation for wake on voice stage 2 switch
      ASoC: mt6358: Validate Wake on Voice 2 writes
      ASoC: mt6358: Remove undefined HPx Mux enumeration values

 sound/soc/codecs/mt6358.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
---
base-commit: d2980d8d826554fa6981d621e569a453787472f8
change-id: 20230224-asoc-mt6358-quick-fixes-71b4ea6b8f13

Best regards,
-- 
Mark Brown <broonie@kernel.org>

