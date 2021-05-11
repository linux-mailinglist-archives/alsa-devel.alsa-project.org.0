Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08337A208
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385B71777;
	Tue, 11 May 2021 10:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385B71777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721890;
	bh=aIbKrZTp+E6EVIDHCNWvzoJpW7zVJeecbnlZyRKFuck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfXBHpx1Dswy34191xrucNFz0tDPW70CLR3sbcwjMAyDiYuiJJ79LowosBl+ESLRY
	 vi7GzFOPuDkkWs7OehlehRAbeF6unGuaJSwJZeicTXIMF7qGJJOg7w8+lCuJV26k5B
	 p3cdUQledzaZsuyBUJBsSviLRiHrtvh55m7Tj5z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F27FF8013A;
	Tue, 11 May 2021 10:28:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2721BF804AF; Tue, 11 May 2021 10:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86CD5F804AC
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CD5F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jk/YdMVZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91A6E61107;
 Tue, 11 May 2021 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721664;
 bh=aIbKrZTp+E6EVIDHCNWvzoJpW7zVJeecbnlZyRKFuck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jk/YdMVZ7Q5F4MdPuwZwTMDGhDedzAF3Uo4XIes00YTrJwb0XrjDrHlpKmk84n/aR
 xegkHek9ygsElz5tUP5BuVytq09QhG5kx249XL7QsPoGO6e653eQu/cgyS0jTX/MRh
 /wSPtlVWPG679y8pa8Bv4ES8Suo3UKobYQxGov3Km70EXsQ3rIzshR+IiTQk0g5yjs
 tbQml0CbcfEj7FowDU4KCz2ff31xi+YZAKnXGKWiFmpMTh9Pu0xFrVlGdGj4xktsOV
 wZBim14CTApR5Apquoih+LyUIfTdD8VoFG569CWfG2siHzt40OHYQ+JVxyHsrsHtbE
 ZtrhJNEu0hmvA==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 nicoleotsuka@gmail.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com
Subject: Re: [PATCH] ASoC: fsl_spdif: add support for enabling raw capture mode
Date: Tue, 11 May 2021 09:25:50 +0100
Message-Id: <162072058167.33157.3402941285699720192.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1619425444-8666-1-git-send-email-shengjiu.wang@nxp.com>
References: <1619425444-8666-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Mon, 26 Apr 2021 16:24:04 +0800, Shengjiu Wang wrote:
> Since i.MX8MM SPDIF interface is able to capture raw data.
> Add support in SPDIF driver for this functionality.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: add support for enabling raw capture mode
      commit: 604e5178444ea1d8053cf073e2c68fbc73a4e142

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
