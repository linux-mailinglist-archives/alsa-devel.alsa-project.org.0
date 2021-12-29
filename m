Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDB48138C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:32:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCC117A5;
	Wed, 29 Dec 2021 14:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCC117A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784729;
	bh=bk4jM8QLUK3Drk+Pn2dYURwUnfzbNco8xaPEn3dvdCU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0e4xj5G3LXhkNC7KVPFcvJGapmQOzAD5BCLsEJ95H0uMYdFt5j/sdNEiDMMvJ619
	 0Temadxp+WDOQY4CguusBZS8Qf61JmUTrDyoFajOUaz9PGKljKdcYOAIM6/Jaq65qh
	 zPU5f7p7+NgVbN0pmVNw3D+YeYgT+j6NRPmTzX1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44961F80507;
	Wed, 29 Dec 2021 14:29:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACF8F80510; Wed, 29 Dec 2021 14:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D240CF80507
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D240CF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m9AaPfcg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E647B81909;
 Wed, 29 Dec 2021 13:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4942C36AE7;
 Wed, 29 Dec 2021 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784579;
 bh=bk4jM8QLUK3Drk+Pn2dYURwUnfzbNco8xaPEn3dvdCU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=m9AaPfcgi8aWZin3GD1ksPkBlmIPdqIomyB3jW5OoIpD/gsOcT6zhF5p66aDhNV8S
 hwuNZGkxqEs/oPTd3q++pI+nP+KEv//q5cDaZM32iwENl54VNBw5fF2gK1uNzyiK6O
 omj3L4FEMSljFBVkKKw5UsNDC43krAeYAGbvQQDU5uy9C5ZwK1gMp3mcAmhMb6OxO2
 9vPE/c2tShHhkv8q+qKVl1CzrYrZ+VCTyhRmcMdLQy7kPYOPZG8fz6CqMUwWVk1Nsp
 Bp6Qb0NCHFlqj66vfkBs9XNqrKyV5FlxZGcuR3Hy8XZWvg74/k301qNSxj0qn1gHh6
 kSgIek5StfNEA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>,
 robh+dt@kernel.org
In-Reply-To: <20211228064821.27865-1-trevor.wu@mediatek.com>
References: <20211228064821.27865-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: update control for RT5682
 series
Message-Id: <164078457646.1246652.7413539172267193137.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, shumingf@realtek.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 28 Dec 2021 14:48:21 +0800, Trevor Wu wrote:
> Playback pop is observed and the root cause is the reference clock
> provided by MT8195 is diabled before RT5682 finishes the control flow.
> 
> To ensure the reference clock supplied to RT5682 is disabled after RT5682
> finishes all register controls. We replace BCLK with MCLK for RT5682
> reference clock, and makes use of set_bias_level_post to handle MCLK
> which guarantees MCLK is off after all RT5682 register access.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: update control for RT5682 series
      commit: c5ab93e289ce554a4e0d47330dde120284541aa1

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
