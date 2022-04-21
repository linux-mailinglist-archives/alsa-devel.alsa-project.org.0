Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B868D50A712
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5114516D5;
	Thu, 21 Apr 2022 19:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5114516D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650562032;
	bh=lrtzbEuKpZHOKWZb69274w108tG5SW6js9bDqJhKMWk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbA3pn928kVBxm7wa0p4+b6zc2WMPgL9fkXEsZwvNfJiihl6OQQWDdtEDjh6RILjH
	 U5koiy1ywSogJouDCD6Z7nZQZBV9uoNe5OtS5iGLry7oLqzGvUbrJcmBdImoNgGJWB
	 t2TrYeHMfDfmAIfsqH1kDYIeyBNmKnEg0G72tVxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB82EF80511;
	Thu, 21 Apr 2022 19:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C508F804FE; Thu, 21 Apr 2022 19:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E32F804F3
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E32F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ahCLEQeE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCD1D61E02;
 Thu, 21 Apr 2022 17:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C8BC385AA;
 Thu, 21 Apr 2022 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561891;
 bh=lrtzbEuKpZHOKWZb69274w108tG5SW6js9bDqJhKMWk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ahCLEQeEWecdDppJyN4yX4wzXGXPOnN2qh0BWfIV01vTSLRmk4Rsu+s4vULf60rWt
 UG4Mien4mqL5K4eIMCqHKun7sNB0J0xoGfw+YlGUf9qQAnpGg4H8i8Y13qLwwIq/QU
 ILvMrcqeRb8l9pW48N+5xhwzGgDOTOkzqNCeyERRHLK+M+PcYQD/KbAjfXs8KbNCrv
 baOmOZJ3CovIQMzbqegMz42jt39a4NbbO2YXDhz0VZ3FO8904DXHQNTBRY5HkcS5tB
 yWpZ/gP+T/ZBIHv1Jg0DJzOXqJdPzS8/3R4lw97BRekBXg6FG9Vqvm8vQVQvNBAQho
 /T7p/Vj/qpsHQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pmlbgn5t.wl-kuninori.morimoto.gx@renesas.com>
References: <87pmlbgn5t.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: care return value from rsnd_node_fixed_index()
Message-Id: <165056189024.376935.2442606345335558453.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, dan.carpenter@oracle.com
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

On Thu, 21 Apr 2022 02:55:58 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Renesas Sound is very complex, and thus it needs to use
> rsnd_node_fixed_index() to know enabled pin index.
> 
> It returns error if strange pin was selected,
> but some codes didn't check it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: care return value from rsnd_node_fixed_index()
      commit: d09a7db431c65aaa8303eb456439d1831ca2e6b4

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
