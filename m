Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998A4C36CE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 21:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6B71AEF;
	Thu, 24 Feb 2022 21:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6B71AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645734150;
	bh=jHJhesHy+9/fGMrcaHrx6dRyS22nbc2nynNMtLMtBCY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOsvToTtQciLFC1Co/RzdYhzFQRLzdWO2iZrGM12xjUEZxrX7ALsEFr/wLuPjMlid
	 zcgUqIAJL3urFLHJYD4+gSnWcLtGxCdf0mvHfmhT7ZOEa5x7w3xcSMz/zmCXLdhihU
	 XcBzlzyOeZ0H48caPma9MyYBtghLWtV8lPBhcBwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEF8F800B6;
	Thu, 24 Feb 2022 21:20:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC281F804D9; Thu, 24 Feb 2022 21:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F89F80169
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 21:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F89F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k08/uO31"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7759FB82684;
 Thu, 24 Feb 2022 20:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5CFC340F2;
 Thu, 24 Feb 2022 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645734040;
 bh=jHJhesHy+9/fGMrcaHrx6dRyS22nbc2nynNMtLMtBCY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k08/uO31fAuRW7vQFOqGyJslkunL8DVwQipPk0y+Uik8Z/1FtQ7IJnau+PPf8mB1k
 YA2ykCk+TocFcfWpUOvPww1Rh+HFQY9XyrTUsYqbmeoB1Y0u0rtlhEHZBw1i9H0euK
 CUXS2AZ8SDh/LffuLfhT1eqAn+3LaOOkrkL5053dmw2r9He56rKIpMFXwGt2NCMS74
 idvZdXx9OY8LGa+5kV4GGqVeG1pgPrTxY1Kn+yLQLUgmskGMXM5M9gv+1Bz7VKX14l
 /AOLtA3N701mPQYB1hNWA209cjUKnGdrUawBmJ7pjqrD16cX625cW8ugfk1XwrpseS
 m+nH0lBuYjb9g==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20220223153849.84471-1-daniel.baluta@oss.nxp.com>
References: <20220223153849.84471-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: pcm: Add compress_ops for SOF platform
 component driver
Message-Id: <164573403817.3139675.11623054539337651313.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 20:20:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
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

On Wed, 23 Feb 2022 17:38:49 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Now that sof_compressed_ops initial implementation was merged
> we can enable it in SOF platform component driver.
> 
> This partially reverts commit
> 8a720724589e ("ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS reference")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pcm: Add compress_ops for SOF platform component driver
      commit: 76cdd90b27b4e7379ce4d9032dda1927ac69ad01

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
