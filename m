Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA94C4CA6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 18:38:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38FD1EEC;
	Fri, 25 Feb 2022 18:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38FD1EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645810683;
	bh=+wp+3uuiWhe0VTKlpeqGihsQ7q/9/zw9m7xanygmfY8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=op5wH4I7fqFWvqYNbyWGPr2MFVLShMUkspYPry7kDkku9bb7py94UnPTXFE7XJOIA
	 jALyxslMI30nL7wnRU3trB2drCSQpFeP5WIdPAovSBCFW2peRdlV1XQ4sgudrH8FZV
	 tIxyS4iBI4C39cAb7hCUD7jtXUPiJv3zkOybawuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2494F80515;
	Fri, 25 Feb 2022 18:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D726EF80515; Fri, 25 Feb 2022 18:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C66F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C66F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rHUrgL8T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72B13B832D3;
 Fri, 25 Feb 2022 17:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F7AC340F4;
 Fri, 25 Feb 2022 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645810553;
 bh=+wp+3uuiWhe0VTKlpeqGihsQ7q/9/zw9m7xanygmfY8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rHUrgL8Tcj2YMkcGKnkfAc+Mbjt5TIG1LvIX9PBUEfeyp45vKeOZv2wjJZNVmh2iq
 7UQ75tXtpCwD2RTEkIECf6zBFHQ4pWSCaaIhJwvf7WqkKj/jVq3Di6crreFQLcaulJ
 vaHmEZmGINzrRbnSa48ItqBZjLsd8HgMbv6/npMhELtcQIr5MKMJUA4ktc17pQwtZ3
 rlsgFRCteHHGC5I89aeXO1yETUoN4+Zc9AC6/Pb0agPoOM0IIPzeRgB++ljtszuVQ5
 qOt2xMQr2G0M5BBQP2a+dD8/Tp1EiLZwLX9GxYQSoEc9PCvii2fsYbQQXn+1BNOTZY
 3zsog9mOkCPSg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
In-Reply-To: <20220225120034.11028-1-peter.ujfalusi@linux.intel.com>
References: <20220225120034.11028-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-priv: Drop duplicate sof_compressed_ops
 declaration
Message-Id: <164581055133.2548431.12267523994240560363.b4-ty@kernel.org>
Date: Fri, 25 Feb 2022 17:35:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

On Fri, 25 Feb 2022 14:00:34 +0200, Peter Ujfalusi wrote:
> Other commit added the declaration of the sof_compressed_ops, drop the
> instance which added it as Platform specific ops, which the
> sof_compressed_ops is not.
> 
> 76cdd90b27b4e ("ASoC: SOF: pcm: Add compress_ops for SOF platform component driver")
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-priv: Drop duplicate sof_compressed_ops declaration
      commit: c8775fb16b9bb37cf811ea0b55d50d8f42054c5d

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
