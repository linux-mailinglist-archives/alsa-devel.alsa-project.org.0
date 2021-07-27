Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656E3D7A2E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C6C1F30;
	Tue, 27 Jul 2021 17:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C6C1F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627400984;
	bh=amQ7J8QFGOG4xab2fJlivijQYjsObT1nPCdsO16qYII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmRBz4oC27/1W7qD7Rje357oJhnCmWwqV0FfKZgXUYtAb82ZOVHRShIsRx83sDRYm
	 IIf8DcU7/o917uzX94K75l8obvvgFka7/LiMVp7fCmT6K7XR/EGBdxALG9sLixHQhl
	 7F8j6Ahcj17MI3HMmEPZjKCluDFGZJulDp5HldKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C495FF804F3;
	Tue, 27 Jul 2021 17:47:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FCF1F804F2; Tue, 27 Jul 2021 17:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99C88F804EC
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C88F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RRXXwHSl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7763C61B60;
 Tue, 27 Jul 2021 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400839;
 bh=amQ7J8QFGOG4xab2fJlivijQYjsObT1nPCdsO16qYII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RRXXwHSlIL7B2qZqa16uDL0nLvin72y+x9FeqvKQ6UwkOEuHaz/V/n7xcuggJJTkI
 JqeF3wUxKEG6pUFBi0lRMsUYsQ6hXRK/fvgDi8jREDqCG1GyI+9rBuuxrqrQJUx573
 pjoT1oiPhMp0TrAJJwZGktxHRqIlu3M96jCIBzb6CK9ySj8CmvY4RlK2vQUHUa8KY6
 T9V+kA6IQZft+5V+LQ3Vou5U5R8Vll0Hfpl2Bm1BYHnVKwlDEvmI21UZnjVEaOvQGK
 hJI7DmwdD5st6iq9IimN132Z0ufYKb4bvDHRaxD1m+LKYZw9vw0K5ro+79cKdl9G2y
 BFDiO+y7ObIlA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Select SND_DYNAMIC_MINORS
Date: Tue, 27 Jul 2021 16:46:27 +0100
Message-Id: <162739969148.18968.9498267627877546344.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726182142.179604-1-pierre-louis.bossart@linux.intel.com>
References: <20210726182142.179604-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Mon, 26 Jul 2021 13:21:42 -0500, Pierre-Louis Bossart wrote:
> The indexes of the devices are described within the topology file, it is a
> possibility that the topology encodes invalid indexes when DYNAMIC_MINORS
> is not enabled in kernel:
> 
>  #define SNDRV_MINOR_COMPRESS		2	/* 2 - 3 */
>  #define SNDRV_MINOR_HWDEP		4	/* 4 - 7 */
>  #define SNDRV_MINOR_RAWMIDI		8	/* 8 - 15 */
>  #define SNDRV_MINOR_PCM_PLAYBACK	16	/* 16 - 23 */
>  #define SNDRV_MINOR_PCM_CAPTURE	24	/* 24 - 31 */
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Select SND_DYNAMIC_MINORS
      commit: 2635c226036c1bf44b86575d0bc721505c8201e3

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
