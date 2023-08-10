Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F7F777EDD
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 19:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5AC8826;
	Thu, 10 Aug 2023 19:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5AC8826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691687524;
	bh=j25jxb+9tucS66rGgavJsaxAu4kF2QCnsk+v3QlCfGE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RS+DqMoO6uLlugOSIKTDCLpJghTxqggfUdr4UrqZhjgzlk7EP2lm16SC3cTtikGO3
	 4Enb+xindAeAwisC1F9LzPNoiCJ58GDsHh6sZKC9w8iQ97ODdI69sTtGgCcNxktfV6
	 rYLBrA98CL2Uy24gqsnwsJG9SLyg7Me6nipXskSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC8AF80510; Thu, 10 Aug 2023 19:10:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B89C2F80552;
	Thu, 10 Aug 2023 19:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DDFF80553; Thu, 10 Aug 2023 19:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98860F80510
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 19:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98860F80510
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stPLYdwO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 647A260B5F;
	Thu, 10 Aug 2023 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C91C433C8;
	Thu, 10 Aug 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691687415;
	bh=j25jxb+9tucS66rGgavJsaxAu4kF2QCnsk+v3QlCfGE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=stPLYdwOkJLi/CPcbNhdZWg+u6MC9xVy0e2vYgG+WWMnmRuiwD7yR4oxsLGWUD8ru
	 YakGsUMfBhJNbQzzTTrNnnbgFU7eYubQSiyBcZiM7EzKXv34uvxqCtnik/IIbOXGd+
	 ZXgWlzqtLdkIhdVMAtLok8p7i1zgpaXRIMwgBu1tgHSHF60Aqfl2RM69bEW6AR75Z+
	 TLy/ppfphqt662oQxIiRn4kxkRTfEHBp262siGSHBE7hIkaqT+5it1AiH96UzALUS8
	 BV2h1utupsBNf075fiBEso2BxsEzIje0UkAVyDfI+pyrYazKnugnwNYcBMI+Lo6ZcR
	 4vsj4OEE+84pA==
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, kernel@puri.sm,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, David Heidelberg <david@ixit.cz>,
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
In-Reply-To: <cover.1691606520.git.agx@sigxcpu.org>
References: <cover.1691606520.git.agx@sigxcpu.org>
Subject: Re: (subset) [PATCH v1 0/5] Device tree and config updates for the
 Librem 5 devkit
Message-Id: <169168740844.495427.14105488780100569606.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 18:10:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: OH6LQ5GQYQCJVYDWYNP7T4NW7N7A447W
X-Message-ID-Hash: OH6LQ5GQYQCJVYDWYNP7T4NW7N7A447W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OH6LQ5GQYQCJVYDWYNP7T4NW7N7A447W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 20:50:09 +0200, Guido Günther wrote:
> The device tree updates ensure the A53 don't get powered off and fix a
> DT warning. This isn't testable with the arm64 default config unless we
> enable the rsi wifi modules too so do this as well.
> 
> While at that include two binding file updates.
> 
> This is against next-20230809 that include David's option,gtm601
> conversion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: sound: gtm601: Add description
      commit: 6870f41033d839fa72195fd2dd37f902b37ea62b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

