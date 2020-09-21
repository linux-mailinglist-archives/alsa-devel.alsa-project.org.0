Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E70272FEC
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B679A16D7;
	Mon, 21 Sep 2020 19:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B679A16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707679;
	bh=rHnCQQxmqQ4FO+8lSjKPTWiOcy5M5QzJyOTnSRJlL7U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2ld84Q1O7f9UV2zXXs5bxwGqTKb5ft550JG5rg5dvJ+HaA7lLEcV9vqcVgxM1Rz8
	 KlCZFlxvXcSDXknh7zpMpebiQVnZIeQVfePLnp6ibdFZWX3M+T+X7fPpF3Z1fZ3gX0
	 ISrORIqvbkrAEexjDA9hdLwmJgZDgWBFpBIyCNXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83311F802C3;
	Mon, 21 Sep 2020 18:58:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F4BBF8010A; Mon, 21 Sep 2020 18:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46EBFF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46EBFF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t4nuyaUX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AABA23718;
 Mon, 21 Sep 2020 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600707520;
 bh=rHnCQQxmqQ4FO+8lSjKPTWiOcy5M5QzJyOTnSRJlL7U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=t4nuyaUXO69tCa5faaWGAEK9f7HgvjIdk7qC0YHt+nFMXf6CQNFneXdogUpeni8/7
 bo0Z8IY/zHa5hr9qSEHu2ibBxwLrX0fzXNButlfMkHv7qMRSe9R024K4nVuaFmY2SG
 t4tVnDvIrYi3O1hxnJSnwvaYaKp6JEsawG35qipM=
Date: Mon, 21 Sep 2020 17:57:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Guillermo Rodríguez <guille.rodriguez@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200918134317.22574-1-guille.rodriguez@gmail.com>
References: <20200918134317.22574-1-guille.rodriguez@gmail.com>
Subject: Re: [PATCH] ASoC: cs42l51: add additional ADC volume controls
Message-Id: <160070745847.56122.16753460502091716768.b4-ty@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

On Fri, 18 Sep 2020 15:43:16 +0200, Guillermo Rodríguez wrote:
> Add volume controls for:
> - Analog programmable gain amplifier (PGA) (-3 .. +12 dB)
> - ADC attenuator (0 .. -96 dB)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: add additional ADC volume controls
      commit: 641088722244f59fed00b68f7f5aaa3d56c1d73d

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
