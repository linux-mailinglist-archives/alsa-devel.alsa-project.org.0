Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0AE60AC35
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A987490;
	Mon, 24 Oct 2022 16:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A987490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666620221;
	bh=pNwuaU1Ukcpu+2WY7FOqGXayA5lGqbb30IfbM7hnsHo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bU8WQUfyNJQWRsnwBBLJSUfHuVfw1xl6DJpMOkk9Se5yHd98MPzCzuee7OLCdhWE4
	 G6MTT2Lv2pOsnS/+GzcvVPg0LJ9GTvaDjJqXQvsxSLKMsP0sHJpN7rrt1UfXaoX+tH
	 S8xeAY8d99e3FbzKLfbOnAqX1eiJuaM+kiw5JeTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C926F80552;
	Mon, 24 Oct 2022 16:02:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE993F80551; Mon, 24 Oct 2022 16:02:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDCC0F80240
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 16:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDCC0F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EmVx/iDv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 910BCB81B8A;
 Mon, 24 Oct 2022 14:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C74DC433D6;
 Mon, 24 Oct 2022 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666620120;
 bh=pNwuaU1Ukcpu+2WY7FOqGXayA5lGqbb30IfbM7hnsHo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EmVx/iDvv3b0A31uPTIJbXEwiPmYCrMxxgvtk0/N6LcykmG/6kiO3KW7rJjoITGDX
 jEJbUqjCWOr87OiQeqv+TORr/zhDoRuCo3tXQ1w5fUmIgEKSqG9QqWDzgSFoqAHLNR
 p0WP+MxEfpoO33CA8XLZ62Lpn41EoS6XiTtQh6LC+xR5wvv2ravMbo3WnVvd4vn3ho
 uB4B5JsjrjRShNYreRERf9V2MLlBxhZsZZLWgy8sBjepfb+5o/DtI0IB+Xty6z7Qh2
 T3xIH/jDfvoIKsldCuYQ21KEg4HBW69CAU3tcezG80QP8xDDgThmz+qiCiJLoPZBOz
 Sya0su8WFyROA==
From: Mark Brown <broonie@kernel.org>
To: samuel@sholland.org, lgirdwood@gmail.com, Ban Tao <fengzheng923@gmail.com>,
 perex@perex.cz, jernej.skrabec@gmail.com, tiwai@suse.com, wens@csie.org
In-Reply-To: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
References: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v2] ASoC: sun50i-dmic: avoid unused variable warning for
 sun50i_dmic_of_match
Message-Id: <166662011789.251784.4030037448307420483.b4-ty@kernel.org>
Date: Mon, 24 Oct 2022 15:01:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, 23 Oct 2022 00:44:45 -0700, Ban Tao wrote:
> In configurations with CONFIG_OF=n, we get a harmless build warning:
> 
> sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
> 'sun50i_dmic_of_match' [-Wunused-const-variable]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun50i-dmic: avoid unused variable warning for sun50i_dmic_of_match
      commit: 2cfcc1085d3b7b7c893be41034853d4c63a41092

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
