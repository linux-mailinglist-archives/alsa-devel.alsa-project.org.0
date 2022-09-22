Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D25E611C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 13:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32ED2846;
	Thu, 22 Sep 2022 13:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32ED2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663846268;
	bh=vPHa1RwfeSex5KtAHQa+yTSSsZHDEtOtWKVO9DzRPto=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NU/2d72UW1eeiWvK5BsTImJXDpcu7uqZrIGw1VHLPqy4ZKFX0fjL2p703a/++SY2L
	 JzsBe4VHX0oK6S6ms9R6NSXl1acbgRiASlkCjtgLaa94EiDlkoES6voEnKFlJm4KDB
	 6haPICe1eyrKUkVyR13kIJlvm/8VcDQgYhz9KZkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB3FEF804BC;
	Thu, 22 Sep 2022 13:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E70AF8030F; Thu, 22 Sep 2022 13:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BCD8F8012A;
 Thu, 22 Sep 2022 13:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCD8F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GGuQbAQC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B528BCE1D28;
 Thu, 22 Sep 2022 11:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9D7C433D6;
 Thu, 22 Sep 2022 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663846199;
 bh=vPHa1RwfeSex5KtAHQa+yTSSsZHDEtOtWKVO9DzRPto=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GGuQbAQCYysTxYOcTOH090QGAg/99pXkYsIkcNAib3vcM8xSPeFd7YWJptJXM/Liv
 FmR9cQVxq6xbX3yzpTvv53y7jkEg++PSiD35zMn5Z3RUnMNqvviVF+5XmGMTeq/npt
 sC1bEaQXxw+ODjeyeZm8OdaC/WzAAHWBAEUkaYxE7bCR66I4tL7j4OZm5GxiWhaA/M
 1giGCdcGhmm6SGuVHDJF8+lvni1QhcicR2LcnzZ7n7A5kcqN9+RSJAysQ0liAuPCzG
 oPyocLexpRtOgRD4iq92g1z14d/uu5pmot1nFDZWs87VwcTBsq/xCqRrHiCiFF3Aqz
 fiH2cV9GOp16w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 angelogioacchino.delregno@collabora.com, 
 Chunxu Li <chunxu.li@mediatek.com>, daniel.baluta@nxp.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220921120239.31934-1-chunxu.li@mediatek.com>
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
Message-Id: <166384619411.629460.11107464039277326622.b4-ty@kernel.org>
Date: Thu, 22 Sep 2022 12:29:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Wed, 21 Sep 2022 20:02:39 +0800, Chunxu Li wrote:
> add pcm_pointer callback for mt8186 to support read
> host position from DSP
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
      commit: a921986f445ad611b441c8ee7749dc6dfc770481

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
