Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809C2C17E1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 22:48:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD97D1683;
	Mon, 23 Nov 2020 22:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD97D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606168103;
	bh=h1WrtCqHFEifntLejOukfoRyk+72OOTTFpb+0uydT44=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9NZ2Tim4Vbf/NQfr1X5a0PRJ/b6HPrrHWWwA715LQiyNupZt4dq5xi+92lrmBVmi
	 MyqtkN9xHsQMwHh5P1OfXkpmfqS5P8nYT3feBbpP8G0o/EC59F6j9lKja2ZHpNNHrl
	 abSZYGTw/uoMP4f1rfgvwCbK5MIUSnpVO6BEJxHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 152D3F80255;
	Mon, 23 Nov 2020 22:46:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD509F80255; Mon, 23 Nov 2020 22:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA939F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 22:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA939F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hOY17cav"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47C43205F4;
 Mon, 23 Nov 2020 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606167999;
 bh=h1WrtCqHFEifntLejOukfoRyk+72OOTTFpb+0uydT44=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hOY17cav9OLxzc4q5+yNWYMZC3qBgOxIfojY1YOrnf4XOvN5GnRqe2qoqBUGAZHBA
 ae4HOcBIcnqe12QMccsN8KNeGUyjqf7hrRyVVB3mMpwje/pQkISelRy2G91TIW7Vjv
 pu9FWfoprlxHwl7um2xKEdveD59KlqDgZhpU0KzY=
Date: Mon, 23 Nov 2020 21:46:16 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Alexandre Torgue <alexandre.torgue@st.com>,
 Olivier Moysan <olivier.moysan@st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
Message-Id: <160616797659.26421.3555642178452735947.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>
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

On Mon, 16 Nov 2020 18:51:30 +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/aiu-encoder-spdif.o: in function `aiu_encoder_spdif_startup':
>     aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/axg-tdm-formatter.o: in function `axg_tdm_formatter_event':
>     (.text+0x7ec): undefined reference to `clk_set_parent'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
      (no commit info)
[2/4] ASoC: sh: depend on COMMON_CLK to fix compile tests
      commit: c3d900dc905b78788c94f3a063b769bdbad16a98
[3/4] ASoC: stm: depend on COMMON_CLK to fix compile tests
      commit: 82ceffce96336ee9863f3dfde63aef5748ca4ab1
[4/4] ASoC: ti: depend on COMMON_CLK to fix compile tests
      commit: b3cf78e0dacb7fba50d0c1eb9dfa6f92d31529e2

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
