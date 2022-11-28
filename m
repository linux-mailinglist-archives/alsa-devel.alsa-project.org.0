Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AE63AE03
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:41:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E321B1701;
	Mon, 28 Nov 2022 17:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E321B1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653714;
	bh=2aAj41uWXGXq6GbtLmmhZiikU9YNlKAsW7HQ6KVUe5E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/Qab5QgK1E8140k9ywkjnWN2L/kVnhCiYhlqg68iU0x1mywnXbGhb+Tv3eHOCdgs
	 9NuwLIUke2OHauApxiD1ksKhTCcm62CuJnJRBejHkJTxrj7ftK59xRnc6YDOR2P+pQ
	 TTZIQ9V6Lj/bgXBhQeXssFUezBgYODa0D4Gbvz4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E88ADF8057B;
	Mon, 28 Nov 2022 17:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18303F80579; Mon, 28 Nov 2022 17:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6F3FF80566
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F3FF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IVFmnKQh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C684661053;
 Mon, 28 Nov 2022 16:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B1CC43142;
 Mon, 28 Nov 2022 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653563;
 bh=2aAj41uWXGXq6GbtLmmhZiikU9YNlKAsW7HQ6KVUe5E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IVFmnKQhrrz2j2gY9JFkJE/memEkEiPMU1YFWpz96zG1EMKTbu0QGTTnZWdPQja9S
 p8H6pZOBB8z4fCRgPejurNhar6/oLQCyNtu1jXVl8j5ee0TTS0F22D5TNaSewbe9lX
 TdAi15pb1YSy5JGTyck6tQBZoiutDuTgv7zyjgTfRLmVJeleSE8hfP1bZuCumPXlZk
 oXx0JrdoKq7injwmYMx74Ajj0YYAJqjqYcbppzreSo6g2MXwllLATS6Uhch/taE1Yi
 p4t4QMYIrcc7uX7y2T34SDgqTDzkRU9B4JjIDXJIXRYjs5JMsgxhnkcSAANM6PgSth
 HGkytNk3nBiXg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8mz8wcs.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mz8wcs.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: adg: use __clk_get_name() instead of local
 clk_name[]
Message-Id: <166965356286.629583.9255321084544272685.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Mon, 28 Nov 2022 05:46:28 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current rsnd_adg_clk_dbg_info() is using locak clk_name[] to ndicating
> clk name, but we don't want to use local clk_name[] everywhere when we
> support R-Car Gen4 sound to handling non compatible clk naming.
> 
> This patch uses __clk_get_name() instead of local clk_name[] for it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: adg: use __clk_get_name() instead of local clk_name[]
      commit: 7aa6d95d7ff5b86f8632bb0b4fb90f0a8eeaa7b6

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
