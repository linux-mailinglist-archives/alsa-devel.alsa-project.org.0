Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F1604C23
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2FABADEA;
	Wed, 19 Oct 2022 17:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2FABADEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194671;
	bh=AKdjSjqhfyMLh9EcXa2O+uSYw6EByKpCQewc2c+0jck=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTS1FYD0jLYS4Urf9Z4/HrMTbLPj1pVBNcFUe3hxMV8vZg9wt4S8KvGkkOufk39tx
	 3LshBNPrfAHocM/Q8JlTkEFNHzeNd6vHj0eh5OJKdlitJQLpSfKANhzysMCfkVruQ0
	 2E8T2Gghl2tRDISaqZpXRZB16WNkzTKMb1DkxZy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2EDDF80548;
	Wed, 19 Oct 2022 17:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01CD3F80543; Wed, 19 Oct 2022 17:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACE7AF8053D
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE7AF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N482c+5c"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6744F61920;
 Wed, 19 Oct 2022 15:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A958CC433D6;
 Wed, 19 Oct 2022 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666194612;
 bh=AKdjSjqhfyMLh9EcXa2O+uSYw6EByKpCQewc2c+0jck=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=N482c+5c5LbnGDRacYUtcJC3ppY5zO4sARi9SOZhjGpq7Pe5nh2dAntYAd/miee1F
 JKNLcZhM4WBcPg5ebXvyZDrWNIt6MMd2W4rW00ZLpaSg1xCYLY0M2zjMmPNpvmfP9z
 Pcblnt31myzS41Hw6ef/dEOz18Zg+euf9i+CrbuNRtl+FpkykiqI5tcBulz8Jtzp3V
 a5GfPDKE7aKFEnRXnkZJYrTeMNc22GKsvdEG5BuXo4dfSz8yyGCI0qkKjB2rLpYc85
 C1P3P174+ys7toF6VyLNa9lpC7LdVxskzONnvTgk3U5N9QJ49moyRR0Efzd/MFT19l
 1FWNYfIXjqXSg==
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lgirdwood@gmail.com
In-Reply-To: <20221019012302.633830-1-aidanmacdonald.0x0@gmail.com>
References: <20221019012302.633830-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2] ASoC: simple-card: Fix up checks for HW param fixups
Message-Id: <166619461019.884966.4133490951229701907.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 16:50:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, tiwai@suse.com
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

On Wed, 19 Oct 2022 02:23:02 +0100, Aidan MacDonald wrote:
> The "convert-xxx" properties only have an effect for DPCM DAI links.
> A DAI link is only created as DPCM if the device tree requires it;
> part of this involves checking for the use of "convert-xxx" properties.
> 
> When the convert-sample-format property was added, the checks got out
> of sync. A DAI link that specified only convert-sample-format but did
> not pass any of the other DPCM checks would not go into DPCM mode and
> the convert-sample-format property would be silently ignored.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: Fix up checks for HW param fixups
      commit: 32def55d237e8507d4eb8442628fc2e59a899ea0

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
