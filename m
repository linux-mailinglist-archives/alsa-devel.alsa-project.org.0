Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF01751508
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9173E7;
	Thu, 13 Jul 2023 02:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9173E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207322;
	bh=0hN3ifaLqWfk87d9uYD6tnYfXRFVRLkfBktRtwEZgzA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Rc1dSL++rKHYqWZ17UOV/gESIhNNu9Z+IAkRCWfZwJpMcoIDjNQFRdrgv0J++7Bbm
	 xCsvzHWkOFFr/gydPF9n1bUKfOJ9NXg0HU6VlfCjqYHmrZxqcmSqs5hxZQOa3T5ZUX
	 xGmPeiftRJS8/GrZZePU5KC6iEdtzIfODbHLTBBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93526F80290; Thu, 13 Jul 2023 02:14:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 941CAF8024E;
	Thu, 13 Jul 2023 02:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABDE9F80290; Thu, 13 Jul 2023 02:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDB6F80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDB6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PTFJXbE8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4178C61986;
	Thu, 13 Jul 2023 00:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E53CC433C8;
	Thu, 13 Jul 2023 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207252;
	bh=0hN3ifaLqWfk87d9uYD6tnYfXRFVRLkfBktRtwEZgzA=;
	h=From:Subject:Date:To:Cc:From;
	b=PTFJXbE8YuZ68UXzZ/wUIIeAewOEhwEainLPTCfnv69Kr9IQ0bWy9/p8z9uDA7GW4
	 7WdJrgTiAz0c32ZaifJTAY3PdgDJCCXsNVNKxXbuh0M1SkXdv/Z0vE07aCyFteGeEd
	 Fp6DKDwn/sI+3x+OVn1zCI0rBv4z2w9DBqCcaZqy/Vq84cX8hSn8Ss0e8YH4oQLhNV
	 TqJEHhW81a+Bv6d4/+orHxfu+WEPEr/4P/HRR8He/EVbxOg76VjQxpyiIS4Qg7WuEM
	 DYKUJLa8iUCMV3Dj5v8zyVPPO+hEAHQAmNFvvNWSzXYixMnkJNl5PQIhkXePPNKiIe
	 n9DYx+cy0ueUQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/48] ASoC: cirrus: Use the maple tree register cache
Date: Thu, 13 Jul 2023 01:13:13 +0100
Message-Id: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlBr2QC/x3MOQqAQAxA0atIagPjuKFXEYshRg24kaAI4t0dL
 F/x/wPGKmzQJg8oX2KybxFZmgDNYZsYZYgG73zuKt9gsJ2QRPU0XMOxMA557QqiqqybEWJ3KI9
 y/8+uf98PyqYG0mMAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=5497; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0hN3ifaLqWfk87d9uYD6tnYfXRFVRLkfBktRtwEZgzA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0Gs8oC1T4puvss3Vx4APCXyfbpcpAPzsfEMS
 OFfh/RFWNuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrAAKCRAk1otyXVSH
 0DpaB/9gm3N7UwoxwTTFINxaGdssbB9a7zWA/RZndyZgsyIcIIATbkm2BX7MvlsJA/qY/qyW+Hc
 kCfckIP3+YfgD+S5ljPkQBCreUAY72yrajhnBg7t8mc1uyEhTOJ2ZDyY09/6yTEG6+idBxh/R0a
 amsTLfX8fMxRLz8SLHjn9C3WCoCpH95UHehPezGg7fSOMVng2iIgHYabHrY9mUeILMBfPYXQq0w
 e24Y9SPHCuuikuw14DGTl/UwrwJlrxY3mIoBtE6tuZWt3CaDZD1COlfH6eHEmM1KrgsKLNtFGrl
 F1Tqd/tivWhIv/3SKmpJmLjj/8EztA6bQ1of5Bm89j+s54Du
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: II2KZOAEOJBOMRYAUPQLZCIKX64QQDT5
X-Message-ID-Hash: II2KZOAEOJBOMRYAUPQLZCIKX64QQDT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/II2KZOAEOJBOMRYAUPQLZCIKX64QQDT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register register cache is now able to generate multi
register writes which was the last big feature of the rbtree cache that
it didn't support so let's update drivers to use the cache with the more
modern data structure.

---
Mark Brown (48):
      ASoC: cs35l36: Update to use maple tree register cache
      ASoC: cs35l41: Update to use maple tree register cache
      ASoC: cs35l45: Update to use maple tree register cache
      ASoC: cs35l56: Update to use maple tree register cache
      ASoC: cs42l51: Update to use maple tree register cache
      ASoC: cs4265: Update to use maple tree register cache
      ASoC: cs4270: Update to use maple tree register cache
      ASoC: cs42l52: Update to use maple tree register cache
      ASoC: cs42l56: Update to use maple tree register cache
      ASoC: cs42xx8: Update to use maple tree register cache
      ASoC: cs4349: Update to use maple tree register cache
      ASoC: wm2200: Update to use maple tree register cache
      ASoC: wm5100: Update to use maple tree register cache
      ASoC: wm9081: Update to use maple tree register cache
      ASoC: wm9090: Update to use maple tree register cache
      ASoC: wm8510: Update to use maple tree register cache
      ASoC: wm8523: Update to use maple tree register cache
      ASoC: wm8580: Update to use maple tree register cache
      ASoC: wm8711: Update to use maple tree register cache
      ASoC: wm8728: Update to use maple tree register cache
      ASoC: wm8731: Update to use maple tree register cache
      ASoC: wm8737: Update to use maple tree register cache
      ASoC: wm8741: Update to use maple tree register cache
      ASoC: wm8750: Update to use maple tree register cache
      ASoC: wm8753: Update to use maple tree register cache
      ASoC: wm8770: Update to use maple tree register cache
      ASoC: wm8776: Update to use maple tree register cache
      ASoC: wm8804: Update to use maple tree register cache
      ASoC: wm8900: Update to use maple tree register cache
      ASoC: wm8903: Update to use maple tree register cache
      ASoC: wm8904: Update to use maple tree register cache
      ASoC: wm8960: Update to use maple tree register cache
      ASoC: wm8961: Update to use maple tree register cache
      ASoC: wm8962: Update to use maple tree register cache
      ASoC: wm8991: Update to use maple tree register cache
      ASoC: wm8993: Update to use maple tree register cache
      ASoC: wm8995: Update to use maple tree register cache
      ASoC: wm8996: Update to use maple tree register cache
      ASoC: wm8940: Update to use maple tree register cache
      ASoC: wm8955: Update to use maple tree register cache
      ASoC: wm8971: Update to use maple tree register cache
      ASoC: wm8978: Update to use maple tree register cache
      ASoC: wm8983: Update to use maple tree register cache
      ASoC: wm8985: Update to use maple tree register cache
      ASoC: wm8988: Update to use maple tree register cache
      ASoC: wm9705: Update to use maple tree register cache
      ASoC: wm9712: Update to use maple tree register cache
      ASoC: wm9713: Update to use maple tree register cache

 sound/soc/codecs/cs35l36.c        | 2 +-
 sound/soc/codecs/cs35l41-lib.c    | 4 ++--
 sound/soc/codecs/cs35l45-tables.c | 4 ++--
 sound/soc/codecs/cs35l56-shared.c | 6 +++---
 sound/soc/codecs/cs4265.c         | 2 +-
 sound/soc/codecs/cs4270.c         | 2 +-
 sound/soc/codecs/cs42l51.c        | 2 +-
 sound/soc/codecs/cs42l52.c        | 2 +-
 sound/soc/codecs/cs42l56.c        | 2 +-
 sound/soc/codecs/cs42xx8.c        | 2 +-
 sound/soc/codecs/cs4349.c         | 2 +-
 sound/soc/codecs/wm2200.c         | 2 +-
 sound/soc/codecs/wm5100.c         | 2 +-
 sound/soc/codecs/wm8510.c         | 2 +-
 sound/soc/codecs/wm8523.c         | 2 +-
 sound/soc/codecs/wm8580.c         | 2 +-
 sound/soc/codecs/wm8711.c         | 2 +-
 sound/soc/codecs/wm8728.c         | 2 +-
 sound/soc/codecs/wm8731.c         | 2 +-
 sound/soc/codecs/wm8737.c         | 2 +-
 sound/soc/codecs/wm8741.c         | 2 +-
 sound/soc/codecs/wm8750.c         | 2 +-
 sound/soc/codecs/wm8753.c         | 2 +-
 sound/soc/codecs/wm8770.c         | 2 +-
 sound/soc/codecs/wm8776.c         | 2 +-
 sound/soc/codecs/wm8804.c         | 2 +-
 sound/soc/codecs/wm8900.c         | 2 +-
 sound/soc/codecs/wm8903.c         | 2 +-
 sound/soc/codecs/wm8904.c         | 2 +-
 sound/soc/codecs/wm8940.c         | 2 +-
 sound/soc/codecs/wm8955.c         | 2 +-
 sound/soc/codecs/wm8960.c         | 2 +-
 sound/soc/codecs/wm8961.c         | 2 +-
 sound/soc/codecs/wm8962.c         | 2 +-
 sound/soc/codecs/wm8971.c         | 2 +-
 sound/soc/codecs/wm8978.c         | 2 +-
 sound/soc/codecs/wm8983.c         | 2 +-
 sound/soc/codecs/wm8985.c         | 2 +-
 sound/soc/codecs/wm8988.c         | 2 +-
 sound/soc/codecs/wm8991.c         | 2 +-
 sound/soc/codecs/wm8993.c         | 2 +-
 sound/soc/codecs/wm8995.c         | 2 +-
 sound/soc/codecs/wm8996.c         | 2 +-
 sound/soc/codecs/wm9081.c         | 2 +-
 sound/soc/codecs/wm9090.c         | 2 +-
 sound/soc/codecs/wm9705.c         | 2 +-
 sound/soc/codecs/wm9712.c         | 2 +-
 sound/soc/codecs/wm9713.c         | 2 +-
 48 files changed, 52 insertions(+), 52 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230629-asoc-cirrus-maple-d3704cc6579f

Best regards,
-- 
Mark Brown <broonie@kernel.org>

