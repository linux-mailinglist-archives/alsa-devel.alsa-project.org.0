Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923126BD239
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 15:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA8F10E5;
	Thu, 16 Mar 2023 15:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA8F10E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678976346;
	bh=98zjYF4qPdU7E5+W0pjvEly3t4PzMPxRXgQA3FyuV20=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jWzy+kPmVF1vkfoKS4d1pRs0Y0WCu4OcRWAGKRcPF3wgAdxNnfzpVj55KOcBZsyOh
	 xMUxIEmdK97LcjEZSUIEP++/uvsiFuLrZJ6DqUD2wibHrqIutPScC+wIaaNwQbuSv7
	 +9CUTZlWQyxyOo0/Ld3L1qeUB4ZWv7dcbvhnSHsY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CE6F8032D;
	Thu, 16 Mar 2023 15:18:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 368E6F80423; Thu, 16 Mar 2023 15:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA2D9F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 15:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA2D9F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cq/2eBWe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C69F162051;
	Thu, 16 Mar 2023 14:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237B8C433D2;
	Thu, 16 Mar 2023 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678976285;
	bh=98zjYF4qPdU7E5+W0pjvEly3t4PzMPxRXgQA3FyuV20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cq/2eBWekY/DtQUoH8V4SMuY0JDOu4a+mwkNWpkfSz1iSs6nkKlKp/jjBKUAgv7DV
	 3guczbA6rCGiawhfcmoISmuPe7qLSBOAa8trRfGz6w/QYJaZM6hh8Q+ly0dAX5AVbZ
	 30tnqvFiW0PwrZhD1csFw8f6QQeR/FbSdA3PfjOtm9J0yer1u1/KbSbRJvPYfL0BUC
	 kSrk5uSoUbeMCgf6blqakPnS9vQn3jjzyOSr9DamN0U4WClDIXUIFBORU6Fqqapic2
	 mdgp+wcUQgq0ADDpvP2qK2oZHt4mrq/yQPvcYjIUaHlGDBH5189pZBJ6So/JVEIQju
	 ECugjNRdqjiyw==
From: Mark Brown <broonie@kernel.org>
To: Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
In-Reply-To: <20230315173404.7215-1-otabeknazrullaev1998@gmail.com>
References: <20230315173404.7215-1-otabeknazrullaev1998@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max9759: Convert to DT
 schema.
Message-Id: <167897628282.92626.2266406042057860602.b4-ty@kernel.org>
Date: Thu, 16 Mar 2023 14:18:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: SNJKIJCI6PD7O5JVIJ6YATVNHFTMMV3P
X-Message-ID-Hash: SNJKIJCI6PD7O5JVIJ6YATVNHFTMMV3P
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNJKIJCI6PD7O5JVIJ6YATVNHFTMMV3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Mar 2023 02:33:30 +0900, Otabek Nazrullaev wrote:
> Convert Maxim MAX9759 Speaker Amplifier bindings to DT schema.
> Add missing gpio header file into examples section
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: maxim,max9759: Convert to DT schema.
      commit: 1d8777d21fbb36c4a0e103eb128ca86f9761e61c

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

