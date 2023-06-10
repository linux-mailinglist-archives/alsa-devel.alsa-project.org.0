Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9972AC48
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B36839;
	Sat, 10 Jun 2023 16:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B36839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407311;
	bh=0B1EcMd8ly1eEIrYEk3c0aKwpaZD9aVleEESZDdgREk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d4nfqVsPCajxAp4/E5JnPR7FtbRFYGDWXb/5od9wXuoGYJU5bBh9mZS3dhkZncVaI
	 ACKBAINnY9mdDGYWlAgz03CPF6ybtHrCge4DsWodcHle9x3JemAlu4whnFmbUK54BJ
	 s60hHO94HJJZNRDuTu/QKUGUacEnQzo79V8Pm2oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35303F80549; Sat, 10 Jun 2023 16:27:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8183AF8016C;
	Sat, 10 Jun 2023 16:27:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A93DF80254; Sat, 10 Jun 2023 16:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6276AF80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6276AF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HOMKoZEg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D84E160B7A;
	Sat, 10 Jun 2023 14:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C608C433D2;
	Sat, 10 Jun 2023 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407249;
	bh=0B1EcMd8ly1eEIrYEk3c0aKwpaZD9aVleEESZDdgREk=;
	h=From:Subject:Date:To:Cc:From;
	b=HOMKoZEgd6rggAo2In3rRiGG/wdfKSXwLTGTXOJECv7bbWhLCf1mG3k0jL1PmCiIK
	 U4yg3XTtXR0272+iqM2y1qeJWPRKqhg5T6o8B8/MaKslt5ZJqL+LkwMc7YpYmG9Ow/
	 OHU3xPaGyYEPGNW41t4wUPMxvdCI5dlV9HkqO49X3sP90at7EqCeBhQJQ0E8OuYmtf
	 8ELqwEZwBAP3Hde2XI3L0kzjrJqyf7XDRBBl5midqHMmQEu4bbYK16GLdFdXZoFHtD
	 FADhz2RPk8hkVCNLnu7JsPbPo6xFk/cCwdjK+KhynJh9lFLBV9uTm2FJ5CqBqcre3p
	 z8A7icCabdJXQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/8] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
Date: Sat, 10 Jun 2023 15:27:11 +0100
Message-Id: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+IhGQC/x2NywqDQAwAf0VyNrCrYh+/Ih7iGmtouyuJ1IL47
 117nIFhdjBWYYN7sYPyR0xSzODLAsJM8cEoY2aoXFW71t2QLAXUFW3c8E3Li3Gi9uIbCk3tr5C
 7gYxxUIphPsst6fPUi/Ik3/+q64/jB9Kvkpl6AAAA
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0B1EcMd8ly1eEIrYEk3c0aKwpaZD9aVleEESZDdgREk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhJziT6gD6dyQo7nR4ow8ZjJez3WX9KMh6XkBBW
 JGhVdaSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISISQAKCRAk1otyXVSH0EAOCA
 CDylgMfn/Y6WpMqn0mZoTpz+0IBBt4SmFNyNdCp7Az2C1pZ7baQ8xSmWSryCpIgPavEuUxoZi4Ce6l
 qkSiB8NDjx68OEfYW3Y0PTXRNtYYpfSwof3m3DqvGD7mQ5KeHXy8ruyrRjY7B9bTllMzckiQO+qcNq
 HG/IriYzGLPa0jc+RvMcMdth71mesXPubnYAVahFiHeh/AKo9GNDJ3YF43oBEqqaJe3Ebc8/tNncwT
 OYCaVaeGlksLsHuQQ96+IeK3QJW18Rk9WJS/AT59m0YVQCQASjNneHRQgIpDYhS6yN6NMMtI0CnX9n
 pI/v2QmLCPCtCtO07mjqGYgc0XDQtk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: KXIUW3KWVWWBTRMKROUPFJMGDLWLXTOM
X-Message-ID-Hash: KXIUW3KWVWWBTRMKROUPFJMGDLWLXTOM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXIUW3KWVWWBTRMKROUPFJMGDLWLXTOM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RealTek SoundWire CODECs don't support bulk register operations so
they gain no advantage from using the rbtree cache, convert them to use
the maple tree cache instead - it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (8):
      ASoC: rt700: Use maple tree register cache
      ASoC: rt711: Use maple tree register cache
      ASoC: rt712: Use maple tree register cache
      ASoC: rt715: Use maple tree register cache
      ASoC: rt722: Use maple tree register cache
      ASoC: rt1308: Use maple tree register cache
      ASoC: rt1316: Use maple tree register cache
      ASoC: rt1318: Use maple tree register cache

 sound/soc/codecs/rt1308-sdw.c      | 2 +-
 sound/soc/codecs/rt1316-sdw.c      | 2 +-
 sound/soc/codecs/rt1318-sdw.c      | 2 +-
 sound/soc/codecs/rt700-sdw.c       | 2 +-
 sound/soc/codecs/rt711-sdca-sdw.c  | 4 ++--
 sound/soc/codecs/rt711-sdw.c       | 2 +-
 sound/soc/codecs/rt712-sdca-dmic.c | 4 ++--
 sound/soc/codecs/rt712-sdca-sdw.c  | 4 ++--
 sound/soc/codecs/rt715-sdca-sdw.c  | 4 ++--
 sound/soc/codecs/rt722-sdca-sdw.c  | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 08e6c4bb17087584261c4aff555d32fc1c620b81
change-id: 20230609-asoc-rt-sdw-maple-fa6714ac4318

Best regards,
-- 
Mark Brown <broonie@kernel.org>

