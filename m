Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33859686D15
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 18:33:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C641EF;
	Wed,  1 Feb 2023 18:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C641EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675272801;
	bh=XmgwpHMXcx6cF7ZijRoo32yT2OPtby/iS7JRxHm+vcU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8YGTL5ORthVMTDWx1gNhDKU2fpF+2yt5cu5+IVBE8C+k+Jv+JwNrOQqmu9W+DxUi
	 Kk00BesmS/4Ily7mjhtpbaIhkZ8WUiKhuHrxnl4yrwmX23Dw9jo/9yOyGauIwe7I1V
	 t3oNjqypB5tpPde43wnF1XrMxY5g4AzuQXGuAt1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE43CF80423;
	Wed,  1 Feb 2023 18:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB738F80423; Wed,  1 Feb 2023 18:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA3B3F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 18:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3B3F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dZa9bnsd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24E8A618A8;
 Wed,  1 Feb 2023 17:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9AFC4339B;
 Wed,  1 Feb 2023 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675272730;
 bh=XmgwpHMXcx6cF7ZijRoo32yT2OPtby/iS7JRxHm+vcU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=dZa9bnsdKvTcbbtInRJQG2M6gM3Vf4mOLCSw1WFkXRJDJ/dPNRb0j+ib2Tth+Bgkx
 UilPN9t0FLNqmuiPBqKaxWjju+HJMAGVDyPWEv+h7LbcC1LSXSlfCSyUqb5qkQ60F+
 KM+3plbkdoXNde0GVdNO5SzbpH7jlSyWzC0hh3QGl98V2VRJLaziY5Ry9bGyXUeg9D
 y/weQ0eEzfsUf93tIf74xui8dSpxpQ+J5YAQBhVS7woZ42CA7xUoxNqptHCxhQDgph
 GivhUf53eRYD4UpO/m4Qo+0EHBtzxTgFk5pBqpoGbfSEc1AnICxQGab8xo7f+ngkho
 w+U2hHmzxBBkA==
From: Mark Brown <broonie@kernel.org>
To: paul@crapouillou.net, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-mips@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, 
 Christophe Branchereau <cbranchereau@gmail.com>
In-Reply-To: <20230122210703.2552384-1-cbranchereau@gmail.com>
References: <20230122210703.2552384-1-cbranchereau@gmail.com>
Subject: Re: [PATCH] ASoC: codecs/jz4760: add digital gain controls
Message-Id: <167527272868.579168.13652532030958567402.b4-ty@kernel.org>
Date: Wed, 01 Feb 2023 17:32:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, 22 Jan 2023 22:07:03 +0100, Christophe Branchereau wrote:
> Both the DAC and ADC have digital gain controls available
> for their mixers, which go from -31 to 0db by step of 1db.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs/jz4760: add digital gain controls
      commit: 36acae192d65195342d02595f45e404cc0f2eca0

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

