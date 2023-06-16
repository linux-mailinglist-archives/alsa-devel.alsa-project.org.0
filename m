Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC87335C5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 18:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F03825;
	Fri, 16 Jun 2023 18:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F03825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686932282;
	bh=PDwkv60EQCWy5qGksW1AAr9W5S2ssqF6zh+bk2dPy5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mHGq8um/6yyu2dDQpEH9zEIAi00BtDhQ0NiADOgrU9cYk8T8Ttg2mQ8nf2JZRruPs
	 6hQiyPisyZySaJOk9aZ9KZh9s5QrUHAF5QabQx0xH3gyNnUTBw7kbTzJCjS8YtZOOc
	 onYx1Ad9xPkuyirPFGqrD6I8VphRqKBxtP5mPG50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4835EF80155; Fri, 16 Jun 2023 18:17:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D95AAF80155;
	Fri, 16 Jun 2023 18:17:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF05EF80246; Fri, 16 Jun 2023 18:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C65EF80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 18:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C65EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cyt+VaHl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF04360B71;
	Fri, 16 Jun 2023 16:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B891CC433C0;
	Fri, 16 Jun 2023 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686932219;
	bh=PDwkv60EQCWy5qGksW1AAr9W5S2ssqF6zh+bk2dPy5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cyt+VaHlKG7ttwFhw9RIRYQORm7mUAFA9cJKHKJpY5xRdI2BYTVn3mCxWvmZ258nX
	 mABFXOvINxgHwTdoEpD9NeD1SlajheNfiGOb2KSYfZqfvtFFvDBrwRBWAcjT1NcnWP
	 /rylzYKTPMbAVPFvWctqYJSOXlXq0atbbltXVFrZ2W2Cx4ZRyVBA8mZNqhGggJOJvu
	 Fwuevf1F7/W8asS7AZTm/snz2oThdWEj7aFIL0d1s1RqXn1GDUptboNdbm9auknkTt
	 0hzTzNd9iYhXuN4foH+wRiGdN32bdNFX9V//hGassTYiXhYrGkQCQPipo4mgz0PHXl
	 8KOPjz8Xz3DoQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
References: <20230608081547.442763-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-Id: <168693221747.298269.8557688849359189253.b4-ty@kernel.org>
Date: Fri, 16 Jun 2023 17:16:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: TC6GU74VMEU2YNOSE2WPHMUZCPZ2UGZX
X-Message-ID-Hash: TC6GU74VMEU2YNOSE2WPHMUZCPZ2UGZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TC6GU74VMEU2YNOSE2WPHMUZCPZ2UGZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 10:15:47 +0200, Alexander Stein wrote:
> Convert the binding to DT schema format.
> Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> clocks & clock-names = "mclk" is mandatory, it has been added to required
> properties as well. '#sound-dai-cells' is added for reference from
> simple-audio-card.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT schema format
      commit: 289650d61c600ac4f631028c761f38042ba599c8

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

