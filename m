Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D80BC5F07D1
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 11:42:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77FEF1683;
	Fri, 30 Sep 2022 11:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77FEF1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664530957;
	bh=6x+elF2SZC5ic+0fA4rneezY3IQnt25XELEbk3XW9tQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My/rHv6eSKEIEgkF6Gq2suCIn9QOhatZVGAcjlAc6/gArBhi5rvpHyAFfpTQtmVgI
	 m7ppy2MGP08vHa7dk7BXBBywvWf4ZpZYuBMOaH+hzPwGY298xXUKrkDvSH+GnufV2l
	 jUe1WDLDD3qPqd8ZonixZsxsCGfsKsPpQZH9yQec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E956FF804D8;
	Fri, 30 Sep 2022 11:41:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B97F804AE; Fri, 30 Sep 2022 11:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F62DF80155
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 11:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F62DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rXmUC3Po"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD11E6227E;
 Fri, 30 Sep 2022 09:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C31C433C1;
 Fri, 30 Sep 2022 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664530870;
 bh=6x+elF2SZC5ic+0fA4rneezY3IQnt25XELEbk3XW9tQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rXmUC3PoHpoXm8rO7Ee4teacryZkbSN+rApangzDsXTSRh3BZmNK0ukBwauVitymm
 oM20gwmbxClU5prTfXImokrwCADa/L6HlxJqmvbrXybLBLxoj2YDKSpgBJIhBtcK70
 f0imI4IgvFQ2Nz+J742LM4btt/aneshkKclRJ2UR8JRLreEGeCXXcrDlJBhFxPUZaH
 IitWM90NZHtnzFCo3JaXB09jCoa8dQx0eyReyfrIwVF+qoF0LIl7tr5k131osPtpY3
 0YRoFe2jaSp8ytiifYeWmJ1xoMT+/2ctC3LygrIt9GdnzU0ZFrFqs3nyN7OhMRQvkD
 CzJNEBcVkSR9Q==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20220930072804.2524352-1-CTLIN0@nuvoton.com>
References: <20220930072804.2524352-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8825: Add TDM support
Message-Id: <166453086825.89101.8700755143310490911.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 10:41:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On Fri, 30 Sep 2022 15:28:05 +0800, David Lin wrote:
> Support TDM format for NAU88L25.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8825: Add TDM support
      commit: dacdef1bd2fc6e1ab528fa16d70756965cd2877b

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
