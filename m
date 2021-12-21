Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8647B897
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:53:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9704A1777;
	Tue, 21 Dec 2021 03:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9704A1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055191;
	bh=NflUddK7ZSORKU6UF7tiO2E1Di36GbuGTE02whw17Bw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tk8IGuYxd/3Lh7Ho9rGWKkPoHQ8PZdV0Il3uiOZY7agiSIPpTFHuFzjT9xcv/pCUa
	 NPDZswXwhSc1zLJW5z4rkhPrZBfnaFaF3/mxo8nH3vpwe5LYNf3goaeDuzSTKizTeU
	 P7h1dIhncFtA5lXI0GgPpGfDo3K3AI5DMAmUpYI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D101F80510;
	Tue, 21 Dec 2021 03:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B31DF804EC; Tue, 21 Dec 2021 03:50:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F207F8012E
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F207F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wi9KZ7fw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAAD561365;
 Tue, 21 Dec 2021 02:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF910C36AE8;
 Tue, 21 Dec 2021 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055042;
 bh=NflUddK7ZSORKU6UF7tiO2E1Di36GbuGTE02whw17Bw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wi9KZ7fwyVIefDHjMdgeiKxq5SSqYzmVHLxRgJBKZnNhc7akAidwD1L4ri8QE6+HY
 EYzi4z6pdprQqJP3fGm+niSWTBNNc1cQT7buIp9+l4v4OUC7W3l9gvAe4cflnO5hBC
 aayyfyW1Oi0ityZ5ecXXqsnL19SWafMZ6GQVDPDX8kmWQ/CKpDjsU2Zyh8symQlHPQ
 sfiUarNdHUtjJUwcdKI3qaKUGEL0Ef6SHQVA7+94Hs2b4Ud413Z/oLISXQy/PX8NHt
 jvjiU0AZ/oX1sWs5rnlyz4Kw/ZYVipGXkwcMLSX5eEt1/7W88EXecpcqCLGFJS4K8K
 6LRmISst06oMw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211216000018.2641925-1-kuninori.morimoto.gx@renesas.com>
References: <20211216000018.2641925-1-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Message-Id: <164005504144.2647792.1608765502662236125.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Thu, 16 Dec 2021 09:00:18 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_daifmt_parse_clock_provider_raw() is handling both
> bitclock/frame-master, and is supporting both flag/phandle.
> Current DT is assuming it is flag style.
> This patch allows both case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: audio-graph-port: enable both flag/phandle for bitclock/frame-master
      commit: 9b3c847b5fa0364a00227f13ab8ac0cbaf69be83

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
