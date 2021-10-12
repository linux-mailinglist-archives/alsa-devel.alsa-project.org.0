Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D226E42A396
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 13:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F847169C;
	Tue, 12 Oct 2021 13:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F847169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634039237;
	bh=yPmGfrIx5fsPNeovUyGC2nx0U7hr1ByxkC91ZqFvywU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4G6fVes7WmPcHxbHWE3d6uyebSThzFV2FKGInvr8GfJar9EASK3gRIInE5Pm830W
	 /UI4yqvk7iMXwyN/yXYEW01zKVvrTr7FYMudAyo12nZOo9I5/dvcHsNjH/ojqgDIND
	 1fcU8GooAhMmFVSDoERv9fXQUdNkzr6u45Av6mFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE2BEF804E7;
	Tue, 12 Oct 2021 13:45:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5BD7F804E3; Tue, 12 Oct 2021 13:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E8AF80088
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 13:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E8AF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kx+uAsyN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5898060EFE;
 Tue, 12 Oct 2021 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634039121;
 bh=yPmGfrIx5fsPNeovUyGC2nx0U7hr1ByxkC91ZqFvywU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kx+uAsyNqvX2hV5qn2Ah1xUjmbfU6xwJ7DONv8uVHgnvWHtBAkCV9aEzhb5AsbEER
 tl2VH/EC37fCYXfoDsN9M4Xi+6nDagAHm7CGCD31ZdyJJflOT63dUP8DOiCfYV0JIO
 hZrJKklagjh/utfDpW3x+PBcvE03pu+o+av00XIk+h5c6FURuroNKuVipaDaeidpox
 avkp/mwKY4mKT+fb9jxRmRu8mXUxmKweZ3DsjbAEIRG/hSO2odcIudcRkfJV7SddY3
 7BoMA0ZGoGeV2iD+PemNDskaE/gZBOMIF2UP4TRdQvVxFh9AohtxRnIIloA8PcNEgI
 W5dl1uCrXUB0w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Ensure 0dB full scale volume is used for
 headsets
Date: Tue, 12 Oct 2021 12:45:18 +0100
Message-Id: <163403898174.2091644.6707785151456646793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011144903.28915-1-rf@opensource.cirrus.com>
References: <20211011144903.28915-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
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

On Mon, 11 Oct 2021 15:49:03 +0100, Richard Fitzgerald wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> Ensure the default 0dB playback path is always used.
> 
> The code that set FULL_SCALE_VOL based on LOAD_DET_RCSTAT was
> spurious, and resulted in a -6dB attenuation being accidentally
> inserted into the playback path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Ensure 0dB full scale volume is used for headsets
      commit: aa18457c4af7a9dad1f2b150b11beae1d8ab57aa

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
