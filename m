Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE6623358
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 20:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98B751CF;
	Wed,  9 Nov 2022 20:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98B751CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668021647;
	bh=KjkKpABDy8OeBeVkXUOWJR/+NxgUIP0eVBrO0CIT2pg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2wHSHVQRynMAHGVP+w7H7AyLJJoLSIAuEy7PebjzOSGagrSs3MKaINMI1tfOn+JO
	 k7rEM8wwjckLa4tmdyCw3GcdYZxLPSb2WSL1S+q+X7xRU6vSj3DC0XXg7NdoPx1xSw
	 WME8BRXLNLzbDKl0qxkWsXGl22xqMDbjTMWRD95U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E498F800EC;
	Wed,  9 Nov 2022 20:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6181EF800EC; Wed,  9 Nov 2022 20:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC98F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 20:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC98F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O7wiuRzJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7039261C1E;
 Wed,  9 Nov 2022 19:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B427DC433C1;
 Wed,  9 Nov 2022 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668021585;
 bh=KjkKpABDy8OeBeVkXUOWJR/+NxgUIP0eVBrO0CIT2pg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O7wiuRzJgFuqH/LSvl6UcOtawT2jlc4AtjpSI1SQ9Bbh0Wv0YDrx2B13Q1LA2Pu+h
 EsR+Jum1+/cfBQ6+cPuQiUwwv/HPN+ip+HdXlybqhnyUWm+Db3PBUg0nPlC5MdQopi
 RJ4xAZd8Cghqg8V2MdG2muGzdFzJULKnpoVo6tZp385JXrhmpGw4U36HCJdHyi1kNY
 6qzv6jXZl6TOvpJvYqZwQUNUM7lqTT/zfw2r+OvVZ1Z6V/kaLv8K4LNRGD/p9PjbWn
 naUMJU2xuQelSVtJ6wUegtPVMRlYSK6amfowqnPN03YCBoEo81ZhqBS+abpRXC2efH
 4V2wUGIdmiLHQ==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20221109170849.273719-1-olivier.moysan@foss.st.com>
References: <20221109170849.273719-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: dfsdm: manage cb buffers cleanup
Message-Id: <166802158345.681172.6341903177442237519.b4-ty@kernel.org>
Date: Wed, 09 Nov 2022 19:19:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On Wed, 9 Nov 2022 18:08:49 +0100, Olivier Moysan wrote:
> Ensure that resources allocated by iio_channel_get_all_cb()
> are released on driver unbind.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: manage cb buffers cleanup
      commit: 7d945b046be3d2605dbb1806e73095aadd7ae129

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
