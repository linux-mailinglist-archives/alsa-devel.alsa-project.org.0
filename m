Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417C746504
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 23:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7907420C;
	Mon,  3 Jul 2023 23:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7907420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688420674;
	bh=8y+SNWLYMoVyVwgZLAuF57aq+7opUlqb5b7Z/N4orm4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R+TEDIlgQ5zrthwaTz3I0iF49+MC9sW8jfjCfeoZmdP6AjycyD28AuFCFCqnET3Du
	 GsZ4EwdeZd1xOfKm0d/DXQ1pnbBm4ssK6zt0BNaRIqr2VeCQ6D9fTNr2IvCZsCLZD5
	 qzjSUP7De3f4Ha/+IzxwtG3Em/gtaLphFUJjHKP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9781FF8025F; Mon,  3 Jul 2023 23:43:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED237F80104;
	Mon,  3 Jul 2023 23:43:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF88CF80125; Mon,  3 Jul 2023 23:43:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 25B0FF80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 23:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B0FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mv4YJlvg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACF2F61055;
	Mon,  3 Jul 2023 21:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7351EC433C7;
	Mon,  3 Jul 2023 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688420607;
	bh=8y+SNWLYMoVyVwgZLAuF57aq+7opUlqb5b7Z/N4orm4=;
	h=From:Date:Subject:To:Cc:From;
	b=mv4YJlvgm1SlSpznYjAjbgujdIS68To7CwD54A+VEkghowgSxY5pIfHtnnb+/v+Qr
	 k0wSiXwS14wHksnqd4+QeesoNWWrPg26NasnP2ue8J3dZpMbVlDLn7Fjzd3PCaXOGn
	 dRNZ+p01IFUD6ObE38eaPcPaUj3Mo321P2bJPffqsjdxkEfMSxn1iRtF6DN3AvnA1n
	 xaAvRiRn7I34dPlO6uIXf2VZQLtgjq8LK+lL9ygURwe2+ctYYPn1AZfG22B2216+As
	 YiNQbUhax30rKh6Hnc41R5H0bA0aqu+GY/xOuiXnie7RjrCNVMwhkjib6Vq23EEUf0
	 wnE06F84lQblA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 03 Jul 2023 14:43:15 -0700
Subject: [PATCH] ASoC: cs35l45: Select REGMAP_IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-cs35l45-select-regmap_irq-v1-1-37d7e838b614@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPJAo2QC/x3MTQqDQAxA4atI1g2MxlH0KqUUmYk2YP1JShFk7
 u7g8lu8d4KxChv0xQnKfzFZl4zyUUD4DMvEKDEbKleRax1hMPJz7dF45vBD5ek7bG/RHd0Yu9h
 Q2TYUIPeb8ijH/X6+UroAUgS0gGsAAAA=
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkarpovi@opensource.cirrus.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Marcus Seyfarth <m.seyfarth@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8y+SNWLYMoVyVwgZLAuF57aq+7opUlqb5b7Z/N4orm4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCmLHf7xP/pwQPDv7kvHVpdEXpn22+3jXY95geWR1mmmK
 mK7rt9f2lHKwiDGwSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmEq/B8FeKt3XClNzZi6dk
 tF/+zbnK5ruU+Tctk8tHToizTUz1mWXKyPCD9/ubhO18J1r6RC/cUTr1zfdo0vnZzstda74s15F
 bHcwEAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: QSAT63LS5EHLVECK3YMALSRQC2Q6N2KK
X-Message-ID-Hash: QSAT63LS5EHLVECK3YMALSRQC2Q6N2KK
X-MailFrom: nathan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSAT63LS5EHLVECK3YMALSRQC2Q6N2KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After commit 6085f9e6dc19 ("ASoC: cs35l45: IRQ support"), without any
other configuration that selects CONFIG_REGMAP_IRQ, modpost errors out
with:

  ERROR: modpost: "regmap_irq_get_virq" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
  ERROR: modpost: "devm_regmap_add_irq_chip" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!

Add the Kconfig selection to ensure these functions get built and
included, which resolves the build failure.

Cc: stable@vger.kernel.org
Fixes: 6085f9e6dc19 ("ASoC: cs35l45: IRQ support")
Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
Closes: https://github.com/ClangBuiltLinux/linux/issues/1882
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 0cd107fa112f..76ddd3ffc496 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -715,6 +715,7 @@ config SND_SOC_CS35L41_I2C
 
 config SND_SOC_CS35L45
 	tristate
+	select REGMAP_IRQ
 
 config SND_SOC_CS35L45_SPI
 	tristate "Cirrus Logic CS35L45 CODEC (SPI)"

---
base-commit: 6f49256897083848ce9a59651f6b53fc80462397
change-id: 20230703-cs35l45-select-regmap_irq-0fd9d631763c

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

