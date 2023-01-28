Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0567F75F
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 11:50:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2507CED6;
	Sat, 28 Jan 2023 11:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2507CED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674903013;
	bh=X9g24zwHYHzuWSbHrdtBTwJcaKn7C4eDSMB8zCgqzYM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g3Lgh2rtrQOeizdfKlP9RhhjtS5cDBJWIxMou9lTH/wTwVxGg0LDtwGEBss3gUm32
	 2CpWjlvozQ6fbo4yFx1t2CJnh40wFWt3E+FoTPQXZr3BL0cs6expqpJKO5kD38GspL
	 9rodxbbDQ8C3TIcTI13WLnRMxhb0KbEJPg3x+Gew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB5E6F80551;
	Sat, 28 Jan 2023 11:49:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02992F80549; Sat, 28 Jan 2023 11:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 577C2F802DF
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 11:48:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 577C2F802DF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cInG9ZbX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F084B8016A;
 Sat, 28 Jan 2023 10:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6586C4339B;
 Sat, 28 Jan 2023 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902888;
 bh=X9g24zwHYHzuWSbHrdtBTwJcaKn7C4eDSMB8zCgqzYM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cInG9ZbXv3rWjk3KrXGYMnTes/ngAQ77H7cyCUrvd6emb68vGG5wTcZ7JOEYH4CqH
 IjMHAaagJMdhPY6JkQzzkwH7nFpMgghkKpn0rONHJvoVXFTeQeZJFlXLoHNHzWkYmL
 sfkzNZWMq1B0VMiGyOU2nVRvlIto/j2USJFYOUSk7e6rdG1DEeZH+gydhzcv3SlrdI
 Kc4JmEFIVmf+NP/Jvt3lTJo9xJ9w2oJ+sG3zFfwZ1u8BjVmIroTWJxsCPEOJkrXBUa
 BmaPUxjUpgDAL2CT4JdtkbJ4kQ7nbcKy0l1E+qWl1ooPVElnj3+WerZl/h7HLfZOGH
 JUwqpuptPWjjw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Astrid Rost <astrid.rost@axis.com>
In-Reply-To: <20230123135913.2720991-1-astrid.rost@axis.com>
References: <20230123135913.2720991-1-astrid.rost@axis.com>
Subject: Re: [PATCH v3 0/3] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Message-Id: <167490288646.2145828.6069622969761502857.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:48:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 14:59:10 +0100, Astrid Rost wrote:
> Add a generic way to create jack inputs for auxiliary jack detection
> drivers (e.g. via i2c, spi), which are not part of any real codec.
> The simple-card can be used as combining card driver to add the jacks,
> no new one is required.
> 
> Create a jack (for input-events) for jack devices in the auxiliary
> device list (aux_devs). A device which returns a valid value on
> get_jack_type counts as jack device; set_jack is required
> to add the jack to the device.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-component: add get_jack_type
      commit: df55122ba0955951a85ef3ffb19f0dcb0ad3ffbb
[2/3] ASoC: simple-card-utils: create jack inputs for aux_devs
      commit: 9b271207ac83db362fac757d367923bde57dce86
[3/3] ASoC: ts3a227e: add set_jack and get_jack_type
      commit: 087b9dda8658052a33031ef82a8d8ef77a7c94ea

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

