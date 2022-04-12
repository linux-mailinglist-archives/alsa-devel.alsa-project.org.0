Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89024FE762
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF3718F1;
	Tue, 12 Apr 2022 19:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF3718F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649785248;
	bh=KwPW9yKy3O6s/y56BuSot0lytzFBzBqLRaUF9YdWAXs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idmDXM1k0Hx1NSvNSTUG8aJn5iFGzzCz2f4PpbfK4w7yqOflNWT3q7EzGtQjtgRry
	 TYdNaviNbtgoI60zJsxRBZGNSULFDSwkY3ju8G/AHZxJWTQquRmjlw1Lr208HBxtOU
	 oNkqnk2j/4SnEaQKcYhX8l4L9caVSSz25ra1Kj1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 559C3F80535;
	Tue, 12 Apr 2022 19:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB344F80529; Tue, 12 Apr 2022 19:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62C45F80511
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C45F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YHN6zySv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6A53619B2;
 Tue, 12 Apr 2022 17:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DADC385A1;
 Tue, 12 Apr 2022 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649785095;
 bh=KwPW9yKy3O6s/y56BuSot0lytzFBzBqLRaUF9YdWAXs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YHN6zySvezGKOHP/bquwZaPKRVqXDwopc/4F9jNjlyTPeO5xSsCa5C7GF16MowhEZ
 DTi1E/B6ACn44IhpUaC9Nsnft95GAo/r9DcnYo7yFxBobPCmOnY7bteGI3YudtK/KP
 2FfwPEZcvLITAUiUPqZ5ZaUNyIzc7NJVJRGhb+GEWiMPgKE2trAv38n+GB8W8olSqP
 TvmK1cUPP/S4GPvXNMSJykVIfKZfyb5JNHZ9OIgcwwJrIKJ6qsFLflVRLUw6BGAMGZ
 JSFPM1aeKalMWhdu0ksLBNVcVOLo7i9QcxwQfDQnr7F9vqFpUFLCW/L+GaI8DY8Msk
 KTCkkxtUH/CZA==
From: Mark Brown <broonie@kernel.org>
To: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, mario.limonciello@amd.com
In-Reply-To: <20220411134532.13538-1-mario.limonciello@amd.com>
References: <20220411134532.13538-1-mario.limonciello@amd.com>
Subject: Re: [PATCH 0/2] Allow detecting ACP6x DMIC via _DSD
Message-Id: <164978509381.404572.11948454165750728359.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 18:38:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: open list <linux-kernel@vger.kernel.org>, Vijendar.Mukunda@amd.com
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

On Mon, 11 Apr 2022 08:45:30 -0500, Mario Limonciello wrote:
> It's not possible to probe for the presence of a DMIC, so the ACP6x
> machine driver currently has a hardcoded list of all the systems known
> to have a DMIC connected to the ACP.
> 
> Although this design works it means that the acp6x driver needs to always
> grow with more systems and worse, if an OEM introduces a new system there
> will be a mismatch in time that even if the driver (otherwise) works fine
> it needs their system added to the list to work.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Add driver data to acp6x machine driver
      commit: e521f087780d07731e8c950f2f34d08358c86bc9
[2/2] ASoC: amd: Add support for enabling DMIC on acp6x via _DSD
      commit: 5426f506b58424f8ab2cd741bacf4b18b5fe578e

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
