Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065736BD23B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 15:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5DA10F1;
	Thu, 16 Mar 2023 15:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5DA10F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678976397;
	bh=Ci9ItVkj5gf1I+OfearvK0vmfMCatFwAi/+AzU1GIrs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CaWSjwYwXSTUSz54X7fq7VWwGxJWu8IzkVYvziZA6SS1mjpARYJL0VhxVsPEcpqyA
	 JQXhON6v3PokeE2XrwQGpd+ACVKYq7iCMQezblE0Y29XBR9BR6g9OZSeGTEqFajAIR
	 0FyD9s1WCKzVayqDwQOIxSr1ZMTmhjaCqcAWWfHg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA9FF804B1;
	Thu, 16 Mar 2023 15:18:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63ABCF80423; Thu, 16 Mar 2023 15:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB3A3F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 15:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB3A3F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uquHCU9v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A7136B821F5;
	Thu, 16 Mar 2023 14:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F28C4339C;
	Thu, 16 Mar 2023 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678976287;
	bh=Ci9ItVkj5gf1I+OfearvK0vmfMCatFwAi/+AzU1GIrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uquHCU9vxLG7cVct5aKtyyF4TQz0jeQpavetxw3BxTL6nq5AWvFn/wexwv190xFKt
	 LVwi7vPXbb3dl95UF0V+QrLhu1nqDwqafyTbOEB1NaPHMFuwaUyY/1gbsI0t9Ol0ot
	 u8wz9ZjJFvzmu6VpX4gWcasTpnrN6ofWhnjU+LaAXzaJDd1Fsm3Zc08OyS3VWx7WKD
	 pBZsWcw0onQWVdZCytoAN2Lgj6ZvfMFFlHK+TIuH/YDXFPiGXrx31x/LMOxXbYFKo9
	 uG+XxJ9kdANmbcIWSUW7kMAGwP41bNzXiOMqZw/M3X1hTQu5l/xVEn0PENvI8u2gD+
	 vB3HFlPM2u/QQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vijaya Anand <sunrockers8@gmail.com>
In-Reply-To: <20230315231055.3067-1-sunrockers8@gmail.com>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT
 schema
Message-Id: <167897628543.92626.6326219364017588458.b4-ty@kernel.org>
Date: Thu, 16 Mar 2023 14:18:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 2UR6JDRVTEDAKYDEMIRDP44RH3UKQDBU
X-Message-ID-Hash: 2UR6JDRVTEDAKYDEMIRDP44RH3UKQDBU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UR6JDRVTEDAKYDEMIRDP44RH3UKQDBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Mar 2023 04:40:55 +0530, Vijaya Anand wrote:
> Convert the binding document for adi,adau17x1 from txt to yaml
> so one could validate dt-entries correctly and any future additions
> can go into yaml format. Add address and size cells to example to
> prevent errors regarding reg format.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
      commit: 87771c94025890246a6dfec9773eb62bd41c4c5a

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

