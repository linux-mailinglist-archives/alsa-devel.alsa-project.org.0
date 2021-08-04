Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F483E01FB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 15:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB12B16F3;
	Wed,  4 Aug 2021 15:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB12B16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628083781;
	bh=M3Kijz6SZCBATcBd2xIMFa9KWMKNc4NhvC9Cix4h3ko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dYyKB3y0D7mk0QbOJ//fumqLzi7ZeLA5mzWVlUTA6k5EBi6Ma2FPFc76XyTYjYJAE
	 /NtW0uOlgq9MBxBl+9gcrAEdqcyLMM8NBIgOABx49LiTG/UrJNqp1mKaOEYsJsj0Eg
	 kDEUzrRELDYlpgSnoJy2bE+E1rVyj0xLnBeqro8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B349F8016C;
	Wed,  4 Aug 2021 15:28:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49570F8025F; Wed,  4 Aug 2021 15:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6F3AF8016C
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 15:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F3AF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BVTAU/eR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B80FC60F43;
 Wed,  4 Aug 2021 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628083677;
 bh=M3Kijz6SZCBATcBd2xIMFa9KWMKNc4NhvC9Cix4h3ko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BVTAU/eRaWf9EEzkvsN/qaUbgxTwbeOdHwJOgWJTHqkRQMTS9X4eduRPOpIIORHqX
 lEWseZEyG5ql8lDUJ2ecbKV9QTMJLQm+zEIIQzbxqJNDhQpV1ftQFWrWWXIkG5hD2+
 a34KZl3EWBDEJkXYqPnn9GyiOUn1JtbnuRiOcLojXI3suGxMR5Oiu0md/SWf3+2op5
 2/gBsvscHkBrZqcRwDzfjp+nGGVS9gTRnXU0Qw+1ZwNz9p9isWZeEe4Eq0KeQbrv90
 ocG2zyzLRQao5e93ZdufW8XRwxIC0sCWrDhGFGl9I19X3P/X2/SRe6NdFxCRpoWN7/
 k/cbLyQJDVhLQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: amd: vangogh: Drop superfluous mmap callback
Date: Wed,  4 Aug 2021 14:27:42 +0100
Message-Id: <162808309883.3116.8747870700946092324.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804075223.9823-1-tiwai@suse.de>
References: <20210804075223.9823-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On Wed, 4 Aug 2021 09:52:23 +0200, Takashi Iwai wrote:
> The mmap callback of vangogh driver just calls the default mmap
> handler, and it's superfluous, as the PCM core would call it if not
> set.  Let's drop the superfluous mmap callback.
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: vangogh: Drop superfluous mmap callback
      commit: f2553d46783409656d82e46913354ed0c058cc0c

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
