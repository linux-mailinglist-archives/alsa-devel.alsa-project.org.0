Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DD64CB65
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4022A07;
	Wed, 14 Dec 2022 14:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4022A07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671024797;
	bh=Gjncl+uo/rvrBzyT+YEpr2GJ5y0nLCp+mO+ilIuCaAM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TJuqjCkmBqWJjWLsgS7w6tuTxKYt3ggHhRcYtzThIwcGV1Q7uO/C/mw6YjcoY5ZtG
	 XVI08B0aCy9eDea2LpXSPUQ6vyRVPtYFwziTLzwyITvtF91A8/1qENUqiVyX9DFAhD
	 teABWVCUPTVmXKPajb1bXBnHZyIM0lcx+Yypf3zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02319F80537;
	Wed, 14 Dec 2022 14:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B689DF80536; Wed, 14 Dec 2022 14:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE4FEF80533
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4FEF80533
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nfp3a0NL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D75A5B818B0;
 Wed, 14 Dec 2022 13:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF190C433F1;
 Wed, 14 Dec 2022 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671024721;
 bh=Gjncl+uo/rvrBzyT+YEpr2GJ5y0nLCp+mO+ilIuCaAM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nfp3a0NLHLUAjc1NYIewzZlt2nv824P+0xzuyMxDNHJLSKUnIcnKeNBkHO360CFva
 GlsBQjlGqIJd8hmM/ZbYEFRgUVoJp9UeGkMAUcn6po5UYLffIvScwdYKq1dvx/6Hky
 D3CJXzf+7W8YBT8g/IYmEUj/jaIjbDQE6OY5BzYtqp8sKeJvs2fTYKirU+HaBPskxj
 jUf1UehVoaNMsPjWWh4AkrBJ68UuG6bZyD0tOCAGKT6gfmmA6qKGjHwzzSE5ohFeDr
 /CzST+k5zVfpLerbExy/gS5xMCDe2HMoywbEKa5uC78tJTf7Rm7NxLCy05gPe1JmcC
 aFWKDJWftpl+w==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221209091657.1183-1-m.szyprowski@samsung.com>
References: =?utf-8?q?=3CCGME20221209091928eucas1p1cfc768d888a6e6c57fcaa0fe3?=
 =?utf-8?q?20cfced=40eucas1p1=2Esamsung=2Ecom=3E?=
 <20221209091657.1183-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: wm8994: Fix potential deadlock
Message-Id: <167102471963.27755.7459442612107772910.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 13:31:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 09 Dec 2022 10:16:57 +0100, Marek Szyprowski wrote:
> Fix this by dropping wm8994->accdet_lock while calling
> cancel_delayed_work_sync(&wm8994->mic_work) in wm1811_jackdet_irq().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8994: Fix potential deadlock
      commit: 9529dc167ffcdfd201b9f0eda71015f174095f7e

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
