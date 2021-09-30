Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5041DCEB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:02:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CAC716C9;
	Thu, 30 Sep 2021 17:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CAC716C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014153;
	bh=u4R0VNMPtThjldunJRGnob4gVVYXBhwzUwcsqnQGS40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GwjtuQ+ELzhI93ahISNWBc7RIIzmIHm6GAm6uTc5VxRqpTcZrhFBfnZJmBr8Zjxn8
	 H5mIo4z4Niar1JVB0t3LeRWvyMZzwySuNg+R3KQqcWk4VF4tHzeAFHSc04rWbygZML
	 i5yWyFwh3/fL8MaQ2KAweHsjvbdzmM7JLl61h4/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9EAEF804E7;
	Thu, 30 Sep 2021 17:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D65F804DA; Thu, 30 Sep 2021 17:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346ADF804D1
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346ADF804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q68LBmRS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8FC61994;
 Thu, 30 Sep 2021 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014005;
 bh=u4R0VNMPtThjldunJRGnob4gVVYXBhwzUwcsqnQGS40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q68LBmRSuzne4IMhpBTlC0ye11yFgoSxVKAi4lAdgVmS7/CPG3y78XuUNLmvMkaAw
 VufmJ2gxcc+k6yiCTINdxbQJd3CXqjCEKePN4EAp7AAqQFHEWb+At1LUeYTKU90nl7
 j5cDKrgmoSb/gIlC0KvOtnmSNTRRn73JP7qlRON2O4IO4H1eBoNmWnKVgbxIsY3q+c
 P3y5SGJSyIC1HHqW96CspaDV1lxCcTWA19AvsQYBS/s3rZtNj1/EeYyZrlHfrcKTu1
 v6vbJXadTdSvcIgjE34ODpTu6UyirsFD4u1/l+bcW0/QwwQvvcXhQBHnH8yJHxYTh5
 0CbiidSpSf6JA==
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt5682: move clk related code to rt5682_i2c_probe
Date: Thu, 30 Sep 2021 15:58:55 +0100
Message-Id: <163301248177.43045.18325807154751324693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210929054344.12112-1-jack.yu@realtek.com>
References: <20210929054344.12112-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 wenst@google.com, Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Wed, 29 Sep 2021 13:43:44 +0800, Jack Yu wrote:
> The DAI clock is only used in I2S mode, to make it clear
> and to fix clock resource release issue, we move CCF clock
> related code to rt5682_i2c_probe to fix clock
> register/unregister issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: move clk related code to rt5682_i2c_probe
      commit: 57589f82762e40bdaa975d840fa2bc5157b5be95

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
