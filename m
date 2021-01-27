Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75B306245
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:35 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733741780;
	Wed, 27 Jan 2021 18:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733741780
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F17F804E2;
	Wed, 27 Jan 2021 18:14:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0142AF804E4; Wed, 27 Jan 2021 18:14:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D0F0F804E2
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0F0F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FzYOUCiw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0218664DA9;
 Wed, 27 Jan 2021 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611767692;
 bh=i0LRGpjxwnOHsyf3tncOoZPkW+4nHkElcB9K4VCx58w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FzYOUCiwfCw42LS1HBQRpq1gHSjYeSemSC19d6fgmdWYPqvCeJG6B+Y9IwBhmbrgF
 6ExdCiwDzeuE+3XYOY1Q7PUfmntq9dp+WDh8aBb3x5V0byZvqnspSw6TNCpRE4hyx5
 7eq/O4N28ViFmt4Ry2BI2fRPfqI6qr6Z3npFWErfUJ1UZDTIYUd4nGZVeiTFXszx/L
 SDam2OQ1psNJwtvLJxULa61aSTCEmq7cRrKs+YCYDb/dxQOrAQrr2/tMIll3p7RAhx
 TxFMZ8yusgnLy79hXwD9y9I24d+SIBQlc3+UimxK8/JFNpmFlEj3whBHHXivbY10zs
 hcIbGLyNoG49Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210127122358.1014458-1-kai.vehmanen@linux.intel.com>
References: <20210127122358.1014458-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: add a pointer to download repo in case FW
 request fails
Message-Id: <161176762854.34530.2494973195992218973.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, Marc Herbert <marc.herbert@intel.com>,
 pierre-louis.bossart@linux.intel.com, Bruce Perens <bruce@perens.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>
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

On Wed, 27 Jan 2021 14:23:58 +0200, Kai Vehmanen wrote:
> The SOF firmware and topology files are not distributed via
> linux-firmware. To help debugging cases where correct firmware is
> not installed, print a pointer to the official upstream repository
> for Sound Open Firmware releases.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: add a pointer to download repo in case FW request fails
      commit: 89e641ae647a4ebc1d608fd56f331a4f4886da5f

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
