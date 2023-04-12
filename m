Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FA6DFBB1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:47:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7971087;
	Wed, 12 Apr 2023 18:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7971087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681318028;
	bh=Tohg6s7+JjvB3RiYG35J6zVdNVihgjXUMfV960KM7zY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JgSpyYtZBZ2jdsbEZkt7OMeoUJPABDLTzO6yfvyGXlzH91bXENnBTIOINXTCHtXZw
	 IcDD9L7MGdOSSPLfm4t6O2AOGyHZ8/Ebe2+vqkxrhez+GV/Moihd4yXGUK0Bh00sf5
	 Fls1rzAWAo2snd8m83/4trBSlJvfCfZzHwz2ej3I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D61F800E5;
	Wed, 12 Apr 2023 18:46:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F52F80448; Wed, 12 Apr 2023 18:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01032F80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01032F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RoxFdwwy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5A21634A3;
	Wed, 12 Apr 2023 16:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3332FC433EF;
	Wed, 12 Apr 2023 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681317964;
	bh=Tohg6s7+JjvB3RiYG35J6zVdNVihgjXUMfV960KM7zY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RoxFdwwymHwpM5F/yy8FcECFTt38OY35+nCUKEkic6RVp4F/8dvwH8RVR5q7bNrbz
	 Zn7y45cJp3bMx3XKB/Of7m0BU/YxfPslsgJZngg/gJaMjBV7Lzsmun3tc7uIaNbPye
	 jDmvYbPTdqjL//GkagcIptAXWe0iBURxin4R+rNruCTKRM1ztL1FX2t0il6/RnpYa1
	 z8aGGCmLg8/wCLJZ8vhVXtu461twbp9DmZ1aQJ8rmzphqZS2oX1SGs7nhQQoUxNIAc
	 lrszc0T0lhr93eCVgxvTUK26ext8O7leHDQvKHsMlRCKlw69o5EVZYXTn0YMp7offi
	 AtNXzKs87kuIw==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
In-Reply-To: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
References: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: ep93xx: Add I2S description
Message-Id: <168131796075.93781.2447305389436776199.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 17:46:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: YRS2PGNOHIWPHE4SQ3IXWSVTHBOLM63S
X-Message-ID-Hash: YRS2PGNOHIWPHE4SQ3IXWSVTHBOLM63S
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRS2PGNOHIWPHE4SQ3IXWSVTHBOLM63S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Apr 2023 00:29:57 +0200, Alexander Sverdlin wrote:
> Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
> controller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: sound: ep93xx: Add I2S description
      (no commit info)
[2/2] ASoC: ep93xx: Add OF support
      commit: b599a4d7d905a8e8cf5c36ccae0b3dd97c956075

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

