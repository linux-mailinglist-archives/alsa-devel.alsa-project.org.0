Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043B222F96
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91FF615E5;
	Fri, 17 Jul 2020 02:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91FF615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944068;
	bh=/io6uUiej5SmWDClcTYfJyK1we59aJu74pwpy6NeqIM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gninpurr6F00d3RTp5YGjT6CIZi9ZXMFxbGQ7D5zsmazA9vAiUHjDLuRTsXhX941h
	 BJJXHWg5IW6lnhFGFBJz5bTe4zZlVLPfbmL/KzyXnwu5MdIH2Gim9mk5DQtuRvKLMb
	 HHGhUpSMF5BAl47c7VRQX43lMpPjtSfnYK3qsgXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52ACBF802DF;
	Fri, 17 Jul 2020 01:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50125F802BE; Fri, 17 Jul 2020 01:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294E4F8027B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294E4F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yeW0YcJE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DC03207E8;
 Thu, 16 Jul 2020 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943837;
 bh=/io6uUiej5SmWDClcTYfJyK1we59aJu74pwpy6NeqIM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yeW0YcJEBhCJPMSw+BgqcOZAqp7OjJ/7DeeVL5rlxxVSGjHyKCOUaiXX6V5r11JFh
 4hPXsalTzpq/Msuo7QMbKlVsEZzHrhUnMAX4e7Lg5A+GDZ3Q0KIyWMx/U/HnZA96zE
 0Sigxni2ZMA+GRLxbI3DdcXs5GSNJbmJw379ir7Q=
Date: Fri, 17 Jul 2020 00:57:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <87o8osxlow.wl-kuninori.morimoto.gx@renesas.com>
References: <87o8osxlow.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [resend] ASoC: dt-bindings: renesas,
 fsi: use patternProperties for FSI-A/B
Message-Id: <159494380522.42174.164889717047302735.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 07 Jul 2020 08:34:40 +0900, Kuninori Morimoto wrote:
> FSI has FSI-A and FSI-B, and has fsia-xxx/fsib-xxx properties.
> This patch uses patternProperties, and reduce verbose settings.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas, fsi: use patternProperties for FSI-A/B
      commit: d235b282369813c53fdd512d61402b6a7cda1603

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
