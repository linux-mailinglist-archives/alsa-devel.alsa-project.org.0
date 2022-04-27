Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148D512507
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F239163A;
	Thu, 28 Apr 2022 00:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F239163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097187;
	bh=mx9enblSzngFpWZSZhZN/dFa8Z+1RwTxIf4k6U7d4LE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTjuaHl9rAs43qIZo5X6qYpHSfZRFKXgeFV29MrEV7SEXBkfbumsIYJ3xNk0DT6T3
	 +ERZqUqnAmHdgNHIbab73UAFSJvzcHyQCYGfI5ONRulHoEyc4cgUGa7eXyKeKhppzK
	 Yx6U27TAzHAhgZFibvnXl372a0E4AFvUbXBr9VMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF67F80557;
	Thu, 28 Apr 2022 00:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28F7F80543; Thu, 28 Apr 2022 00:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20E75F80543
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E75F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CAae6sm1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37338B82B00;
 Wed, 27 Apr 2022 22:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F234BC385A7;
 Wed, 27 Apr 2022 22:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096956;
 bh=mx9enblSzngFpWZSZhZN/dFa8Z+1RwTxIf4k6U7d4LE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CAae6sm1gzdPHirKGeA43ZlClnftGqpK/u9BFryLJoAY1SpywQ5WGTUgRsaKQwtab
 wODvNLhRH/paGYl5N9xKXQYzgfgUvaejdBuaHWLZGRY55lYkr2jeASKu3FxtPOXcnn
 w+OFLPAhWTuZkkWdQ1T06oV3STIwJ8TKpEttcoYOiwDLWs3J4kk7xlsZqXu58cFl8X
 SJh2wFYLkvNyJAn3u2XWi5veD1uo2UrvYHkgJWJ34KNyWvcRiERp6uyTZ07af98lQP
 xKrxPVDCzfHVxZpoeE/jeyxLLWe3TZJidZXBthJM5dzyaEOFmSE29XcHnRbgbSFJSe
 bjEbHSwL/jpdg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426183631.102356-1-pierre-louis.bossart@linux.intel.com>
References: <20220426183631.102356-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: bump SOF_ABI_MINOR
Message-Id: <165109695470.498174.8686717828880991544.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com
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

On Tue, 26 Apr 2022 13:36:31 -0500, Pierre-Louis Bossart wrote:
> Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
> did not update the SOF_ABI_MINOR, bump to version 20 before new
> changes are added.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: bump SOF_ABI_MINOR
      commit: afe57ecab58b976c54fcbc31d718f936a0cc98cc

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
