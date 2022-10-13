Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC05FDC89
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07AB15C74;
	Thu, 13 Oct 2022 16:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07AB15C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665672288;
	bh=ro9CrNSvl8TcVF1RUG4m+aq9GS+b83O2H6ir8tV8WqM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvkQ6HekkBVBntPTjLjLwRATloPXwqcdcTQsi4Z30FWaB0umdeWhomHVuzs0IhO/C
	 e7GU9oLU1e/w7Bxyp2eB68VQ7Rw3BwJGPuU0YcMSF7yI2BcMflkJqZTPVKKSGohKN1
	 kBTm39SS+k183moSqPO1FdgBc9CQUXDOnlDbYdw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93727F804AC;
	Thu, 13 Oct 2022 16:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6178FF80431; Thu, 13 Oct 2022 16:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19CB8F800C0
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CB8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oF2s0M4A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C2B2B81E85;
 Thu, 13 Oct 2022 14:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3294C433D6;
 Thu, 13 Oct 2022 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665672230;
 bh=ro9CrNSvl8TcVF1RUG4m+aq9GS+b83O2H6ir8tV8WqM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oF2s0M4AGwUjGYJWlpnv+uW12QFlnxn3XYSOMUCbnF7MNM63hT3wAw8O8DsYTR/yL
 8p9Z2bFBHIxkr7jLDQ5sUWCxr5ll2XTxHcfDggDvpW2Ws6gcGMa7N+Y/tSdsxzV/2s
 /vdUXt8mXh/qCVxjCUrLLFVB5RDLzoTB1m7YH6diGNCtEUN1Ex5+Qf608fUkBJ3b9J
 RLrGHKn/bfju8rbxn8yGOI1GxzvlGbW4RPrSSX1CxZemJXiCTUblWY2vA1RUE4CnDj
 WVmiKByWSI1X7Ld/RHOoHfY8QDRwORbSHWRaLOWFuwmWiqaPPntdT2aTZBc4mWZ7+V
 HyBJa+r3AAMSg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, geert+renesas@glider.be, lgirdwood@gmail.com,
 aford173@gmail.com, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, steve@sk2.org,
 ckeepax@opensource.cirrus.com, chi.minghao@zte.com.cn, tiwai@suse.com
In-Reply-To: <20221010092014.2229246-1-xiaolei.wang@windriver.com>
References: <20221010092014.2229246-1-xiaolei.wang@windriver.com>
Subject: Re: [PATCH] ASoC: wm8962: Add an event handler for TEMP_HP and
 TEMP_SPK
Message-Id: <166567222742.170727.16401679138704885027.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 15:43:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 10 Oct 2022 17:20:14 +0800, Xiaolei Wang wrote:
> In wm8962 driver, the WM8962_ADDITIONAL_CONTROL_4 is used as a volatile
> register, but this register mixes a bunch of volatile status bits and a
> bunch of non-volatile control bits. The dapm widgets TEMP_HP and
> TEMP_SPK leverages the control bits in this register. After the wm8962
> probe, the regmap will bet set to cache only mode, then a read error
> like below would be triggered when trying to read the initial power
> state of the dapm widgets TEMP_HP and TEMP_SPK.
>   wm8962 0-001a: ASoC: error at soc_component_read_no_lock
>   on wm8962.0-001a: -16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK
      commit: ee1aa2ae3eaa96e70229fa61deee87ef4528ffdf

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
