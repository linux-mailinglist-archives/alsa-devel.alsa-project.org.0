Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7039E719
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C15167D;
	Mon,  7 Jun 2021 21:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C15167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623092632;
	bh=UDTIqn2KhidWbOKg/cr23HiqjigP4ZQDXXl9Gsm9qWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcfUWQz8GfWCJkLy+9nhD2cjDBi8s7yT37Y7LhvDSsMVARZ7pmSMBau6Sm8r2cfc2
	 mDXGJVM1AD8MozKIrFTCVBg5iK9zDY2CeWE+Zf+JpWbvtdDYejPtrLtB3tki1UDDep
	 564I4yBjYr6koslZPzp/ETkeGIZe9gIAB+tfULuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E726BF804CB;
	Mon,  7 Jun 2021 21:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D65DF804C3; Mon,  7 Jun 2021 21:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D371F8027C
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D371F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WRp8nhd5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD52C610A1;
 Mon,  7 Jun 2021 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623092480;
 bh=UDTIqn2KhidWbOKg/cr23HiqjigP4ZQDXXl9Gsm9qWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WRp8nhd5dBUXut+2oL7HuFUNbcIrA7cnm2NnkD4l9Z4YWNmJE5Ggnsyg/7rgc+Xp1
 t1O8C1n+YMZeNfyRCJHUlwiVg6xuxkZnsYbonoq2fk+t5J4ykfB7E6fodBv2SSod5d
 AxH5IoDkSS/HgghvF3sbRCE78E9nEIyRWnQ5X3G2gJQMOrseU9PiRfoNG6z5eVKrJ+
 RSmLisb0RoMgMjS5kiqzfEvATczFn2pOcJEIEmtjPnSS22aHA0Ol9dn2EPXWAvp8CZ
 Jp5jleVU6LZf94Kc23fdHz4AyRyGvpog7LnSuoTX54t8GDq30CMp3Zuyz6sc8sz8C2
 4VSa1wfe1+pnQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Colin King <colin.king@canonical.com>, Lee Jones <lee.jones@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH][V2][next] ASoC: rk817: remove redundant assignment to
 pointer node, add missing of_node_put
Date: Mon,  7 Jun 2021 20:00:47 +0100
Message-Id: <162309220525.30523.8337033233150694025.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603113659.82031-1-colin.king@canonical.com>
References: <20210603113659.82031-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Thu, 3 Jun 2021 12:36:59 +0100, Colin King wrote:
> The pointer node is being initialized with a value that is never read and
> it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> The function is missing a of_node_put on node, fix this by adding the call
> before returning.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk817: remove redundant assignment to pointer node, add missing of_node_put
      commit: d50b86b3f6abc4ff8a35f706a6b8251a2d4cf58f

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
