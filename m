Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315E72ABEA
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 15:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE247204;
	Sat, 10 Jun 2023 15:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE247204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405461;
	bh=UG2rKCfC964beAu9TOf+OSf0dqOcmIpUi4KlU4n7tzY=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jpp8EFd2yY2JSfPRtn+pBKN58NEvHsPTUjbZQJMSDuW7FkXDjXuz2FBXSuatg80Yy
	 2xlreQQMDJ7bJbf3ser8JnaN1S2OaiZMpnO90b2yDBRGkClAGb0qjSn+Jz2Y7mwmOb
	 1COd2lHAH0OcCqVbkdIqTWHPdCtTlj1yqG1euxxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F98F80544; Sat, 10 Jun 2023 15:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A24F80290;
	Sat, 10 Jun 2023 15:56:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E22F80494; Sat, 10 Jun 2023 15:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD28CF80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD28CF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dBc0gG0T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC9F560C66;
	Sat, 10 Jun 2023 13:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530DDC433D2;
	Sat, 10 Jun 2023 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405394;
	bh=UG2rKCfC964beAu9TOf+OSf0dqOcmIpUi4KlU4n7tzY=;
	h=From:Subject:Date:To:Cc:From;
	b=dBc0gG0T+QkRi+Wgiji4l2/NCAcXLc3pphFLE8TrCDL6Oe4SZldnmjxggqL2mLS0f
	 L2VnFCrle+ZpyHqqzh3tZiHPyFqgpiLqC52A6y8yYPVWm9fG2XS+KtOX4YHd8fQIat
	 tZf2v19b5iD4I5mtK3pEMiZmO/zMaWgQUHIJbxY5srLVk1xcizK0gROIzYc2wwzF36
	 2Ca1PsQr13vTZInVU7Hzrjb0RxPppdhKWznAh2QyCjzvkdexf9EV2vFBxoTNpD+TaH
	 ZS+lWAU7h7n920h8BpbHXxXPtpeEpT7ja70N8hpMwmnS4fcPvfmOTUdLM/scj2WGf/
	 gRjHtaS0wpcJQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/10] ASoC: Use maple tree for Cirrus Logic devices
Date: Sat, 10 Jun 2023 14:56:20 +0100
Message-Id: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASBhGQC/x2NQQrCQAwAv1JyNrBbUapfEQ/ZNLVB3S0JVaH07
 916nIFhFnAxFYdrs4DJR11LrhAPDfBI+SGofWVoQ3sM53BB8sLIajY7vml6CQZKFIcTxy51ULt
 ELpiMMo97+S323PVkMujvv7rd13UD1AvgPHoAAAA=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UG2rKCfC964beAu9TOf+OSf0dqOcmIpUi4KlU4n7tzY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEHj+4TLG2yyEP0M+n95zP3xIPy51GYkdlR7IMN
 hy+3EvuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBBwAKCRAk1otyXVSH0CQRB/
 44S+F1oNn8EmEUbQidbURM8bsPqkGj/vOykt4uQlq0+Ey1P8IMqwF8YTQQD9Hq/nzqOWmVFskHkeZl
 6rqWXZ+NWNh4/xCfasCf/2PKl9zoIsoGV1tnULxLJ4m5HeIIlLyTZTIuLv4ya2YNuIbJw4hAEdIFNn
 XHgljEBIzAOwoe6lzPaXbtM5Em7AlCfwCL/nxsX1doj1iLrVfG492H3lvotrebyFCEpwozBThs9UcK
 viH3mVbfcJ1p7YfrKbvu3ipiNIZZo/c/NYzWpEsPviTmSQuGgeYYph3clLt6d4PBXZkLY0GPBy2Cpv
 R4fIBsvBsEP8qUopOvGM1h63/FS5z8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: FV56Z6EXWMA5WXKILQCRDJNLDNJUBW7K
X-Message-ID-Hash: FV56Z6EXWMA5WXKILQCRDJNLDNJUBW7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FV56Z6EXWMA5WXKILQCRDJNLDNJUBW7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A lot of the Cirrus Logic devices only support single register
read/write operations so they get no benefit from using the rbtree cache
over the more modern maple tree cache, convert them to use maple tree.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (10):
      ASoC: cs35l32: Use maple tree register cache
      ASoC: cs35l33: Use maple tree register cache
      ASoC: cs35l34: Use maple tree register cache
      ASoC: cs35l35: Use maple tree register cache
      ASoC: cs4234: Use maple tree register cache
      ASoC: cs42l42: Use maple tree register cache
      ASoC: cs42l73: Use maple tree register cache
      ASoC: cs42l83: Use maple tree register cache
      ASoC: cs43130: Use maple tree register cache
      ASoC: cs35l30: Use maple tree register cache

 sound/soc/codecs/cs35l32.c     | 2 +-
 sound/soc/codecs/cs35l33.c     | 2 +-
 sound/soc/codecs/cs35l34.c     | 2 +-
 sound/soc/codecs/cs35l35.c     | 2 +-
 sound/soc/codecs/cs4234.c      | 2 +-
 sound/soc/codecs/cs42l42.c     | 2 +-
 sound/soc/codecs/cs42l73.c     | 2 +-
 sound/soc/codecs/cs42l83-i2c.c | 2 +-
 sound/soc/codecs/cs43130.c     | 2 +-
 sound/soc/codecs/cs53l30.c     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
change-id: 20230609-asoc-cirrus-maple-0aba1f5c18b8

Best regards,
-- 
Mark Brown <broonie@kernel.org>

