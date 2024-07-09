Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00292BFD8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77A3162B;
	Tue,  9 Jul 2024 18:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77A3162B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542422;
	bh=Xq+0vUYsrT6HOH4JXBAguaoIJtc1QaSdaisDPx+OCuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DpPedhPKM0ngyzL7CBSsQJiQLdODLx6XRgQyoD9DKbU5rjps69fFsWUPsXoC5vuPS
	 krgh3R7DwYFp5AfRSAX4s7+tFtEJlMz59DfU7KWCqENNEtJmS4/Z70XRdYStN9Drb4
	 Rg2H0g01CTJM+vnREA29eg9XDdfBit7gGFOb+e1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 396B5F8061E; Tue,  9 Jul 2024 18:25:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2873F80619;
	Tue,  9 Jul 2024 18:25:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E2C6F8020D; Tue,  9 Jul 2024 18:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4532F80494
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4532F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qr/LVt3w
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 693FB614C5;
	Tue,  9 Jul 2024 16:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9937C4AF0E;
	Tue,  9 Jul 2024 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542049;
	bh=Xq+0vUYsrT6HOH4JXBAguaoIJtc1QaSdaisDPx+OCuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qr/LVt3wX/oG1qyzBVS/QcZ5FlChjPVO86t9CV08vlKEIrMZ4qVhrlhCBtIBWfscT
	 yMNqByk1SM4PKvnP90cYm11XagoWBkT3MZY65k3rlp6zcvwOApHLm4sSP7g8ZxSug/
	 cc0TnSwVRc5DIN8KM8M6X8dzWVmbHLVFHxCvv0j0D3URBTsMAMnLLqGYouOGSDIwHk
	 ltgfPsRzTg9LMm1oPDfpC14/vu6LHL32qXb/b6Rw0aGHVdZou86g5RbV5xJTRXubDE
	 fsU8FvtOPCxvpP/8wjYpMtfRPSEHlEQW0aXjeWHkJX5tUStYmHHfONcJm41z4nKz4b
	 +nPhGej69fSmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	david.rhodes@cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 18/40] ASoC: cs35l56: Disconnect ASP1 TX sources
 when ASP1 DAI is hooked up
Date: Tue,  9 Jul 2024 12:18:58 -0400
Message-ID: <20240709162007.30160-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2CQMEDPMKUHMKIZ5DOZNPVY6JTVLCVLL
X-Message-ID-Hash: 2CQMEDPMKUHMKIZ5DOZNPVY6JTVLCVLL
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CQMEDPMKUHMKIZ5DOZNPVY6JTVLCVLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit 8af49868e51ed1ba117b74728af12abe1eda82e5 ]

If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
sources should be initialized to disconnected. There aren't currently
any available products using the ASP so this doesn't affect any
existing systems.

The cs35l56 does not have any fixed default for the mixer source
registers. When the cs35l56 boots, its firmware patches these registers
to setup a system-specific routing; this is so that Windows can use
generic SDCA drivers instead of needing knowledge of chip-specific
registers. The setup varies between end-products, which each have
customized firmware, and so the default register state varies between
end-products. It can also change if the firmware on an end-product is
upgraded - for example if a change was needed to the routing for Windows
use-cases. It must be emphasized that the settings applied by the
firmware are not internal magic tuning; they are statically implementing
use-case setup that on Linux would be done via ALSA controls.

The driver is currently syncing the mixer controls with whatever
initial state the firmware wrote to the registers, so that they report
the actual audio routing. But if the ASP DAI is hooked up this can create
a powered-up DAPM graph without anything intentionally setting up a path.
This can lead to parts of the audio system powering up unexpectedly.

For example when cs35l56 is connected to cs42l43 using a codec-codec link,
this can create a complete DAPM graph which then powers-up cs42l43. But
the cs42l43 can only be clocked from its SoundWire bus so this causes a
bunch of errors in the kernel log where cs42l43 is unexpectedly powered-up
without a clock.

If the host is taking ownership of the ASP (either directly or as a
codec-to-codec link) there is no need to keep the mixer settings that the
firmware wrote. The driver has ALSA controls for setting these using
standard Linux mechanisms. So if the machine driver hooks up the ASP the
ASP mixers are initialized to "None" (no input). This prevents unintended
DAPM-graph power-ups, and means the initial state of the mixers is
always going to be None.

Since the initial state of the mixers can vary from system to system and
potentially between firmware upgrades, no use-case manager can currently
assume that cs35l56 has a known initial state. The firmware could just as
easily default them to "None" as to any input source. So defaulting them
to "None" in the driver is not increasing the entropy of the system.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20240613132527.46537-1-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index fd02b621da52c..d29878af2a80d 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -214,6 +214,10 @@ static const struct reg_sequence cs35l56_asp1_defaults[] = {
 	REG_SEQ0(CS35L56_ASP1_FRAME_CONTROL5,	0x00020100),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL1,	0x00000018),
 	REG_SEQ0(CS35L56_ASP1_DATA_CONTROL5,	0x00000018),
+	REG_SEQ0(CS35L56_ASP1TX1_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX2_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX3_INPUT,		0x00000000),
+	REG_SEQ0(CS35L56_ASP1TX4_INPUT,		0x00000000),
 };
 
 /*
-- 
2.43.0

