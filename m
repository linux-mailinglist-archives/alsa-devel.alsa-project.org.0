Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD1425F5A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE7A1664;
	Thu,  7 Oct 2021 23:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE7A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642916;
	bh=m4HJANNOPPFV57mqo5iLQB7fhTk2U2/wpkQ5dIfb3Ww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dC7H9sBFyZtNt8XFuaiS8oa4w6S/ub84V7TzMP5jgUj4HYxoJrQ78afTE4YAEHoV1
	 jdbZmqQdASERgW+LZSq3O4GTGK6RD4H+G/JTphKlPGEEsTgBubI3BhypvEQgFzJbaf
	 GApJ0Ep3iSGhnXzBalHcDbBYEylj5JZ5bya+FafE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22DB7F80524;
	Thu,  7 Oct 2021 23:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D37EF80510; Thu,  7 Oct 2021 23:38:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62FFAF804FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62FFAF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eB+mq8je"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CF81610C8;
 Thu,  7 Oct 2021 21:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642683;
 bh=m4HJANNOPPFV57mqo5iLQB7fhTk2U2/wpkQ5dIfb3Ww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eB+mq8je9u+SYMX7yuDyZRztJ1+TEQHdhGPN+qrZWD+uCtA4BBZw1ndVfDo5reiGw
 ihje9A2hvtw0CFRlF+uuNO/yr9Kw7FPthacZASuLW/5ZFPtD7YrUZ0eXT99XBLojie
 GZ6XjCHzrPc9ovJPMeb9bNkSCO13fZIoYxFH9m1VyCRcBw8BIi+mW+4OxYce997O75
 R76c7ED/WcP02i3fm8rzNjbFWDsMWT+DYYO1KGLtgZ7cx2KBP0weNWmksNUGFhkWET
 AoYsQQSEWd4RaIoCvSdwQZmFHyz+DGOErTFq2zIohPvr01w0t9q7NiQJuMuT6BzQel
 ifWG83F3NhB9A==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: (subset) [PATCH v5 0/4] Rockchip I2S/TDM controller
Date: Thu,  7 Oct 2021 22:37:31 +0100
Message-Id: <163364264608.649699.437992626098307061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001171531.178775-1-frattaroli.nicolas@gmail.com>
References: <20211001171531.178775-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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

On Fri, 1 Oct 2021 19:15:27 +0200, Nicolas Frattaroli wrote:
> this is version 5 of the I2S/TDM driver patchset. A big thanks
> to everyone who has provided their valuable feedback so far.
> 
> Changes in v5:
>  driver:
>  - change comment style of the first comment to C++ style
>  - make refcount non-atomic, as it's only ever used inside
>    a spinlock
>  - use newer SND_SOC_DAIFMT_CB* defines
>  - change ternary statements to if/else conditions
>  - make _clk_compensation_put return 1 if clock changed
>  - implement set_bclk_ratio callback
>  - always set half frame sync mode in TDM mode
>  - automatically enable mclk-calibrate mode when the clocks for
>    it are specified in the device tree
>  bindings:
>  - add Reviewed-by: Rob Herring
>  - drop rockchip,frame-width property (done by set_bclk_ratio)
>  - drop rockchip,fsync-half-frame property
>  - drop rockchip,mclk-calibrate property
>  dts:
>  - drop empty codec block from Quartz64 device tree
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rockchip: add support for i2s-tdm controller
      commit: 081068fd641403994f0505e6b91e021d3925f348
[2/4] ASoC: dt-bindings: rockchip: add i2s-tdm bindings
      commit: 510f1c133aedcf69847786c14681e7f7bf4db778

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
