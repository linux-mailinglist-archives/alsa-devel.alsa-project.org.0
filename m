Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D882B39AA62
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 20:46:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D35C171F;
	Thu,  3 Jun 2021 20:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D35C171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622745961;
	bh=TRbzEjqd6F1rvkQqzUZpCxer4BSH6P4i4D6NOAwFxe8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRo43VKz4afWRP/OXNtmj7sYeK+yePafBzVdf5aXEXVnX4ZvWyDlDfWMja/Jiiy1G
	 5+9KKMK7bh/FaUitdUASNfb6+XXGHmFhZr2Xx+d1caN3PbUSYHzCa36tIQJonFzvZM
	 mItuT2fK6GF0czx7893rKh7E5yEr6g0UHhKicaQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D1EF804BD;
	Thu,  3 Jun 2021 20:43:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5F4F80254; Thu,  3 Jun 2021 20:43:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 966C6F80254
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 20:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966C6F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SJsMMI4M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5094613F4;
 Thu,  3 Jun 2021 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745781;
 bh=TRbzEjqd6F1rvkQqzUZpCxer4BSH6P4i4D6NOAwFxe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SJsMMI4MXP6sLkNxkoE83JPmAiojQcAr4jtAejzDvnBuIT2pWpzHkkkUgkThOxfck
 py8jPSVZDyHZK3W+gkBn3rCOwDn/djkIJYORFRohQAp+bcxdK5OgMUBOSM3a/gPFXZ
 FpIdKY/pnif7YpRZE+W6TU0eOsdJ2sZzjlkeVZWRZBlNNs8B4FYkadG3/IUnBkv7ps
 IZxiWpzpfWL/xU6QloCYxvJWbxi0G7GHuwIwWKYB+IjpK9etylm6InWW/IFA2Y1gYt
 FqHT2/v32s6pLoNnV34YTXerb3Y9DyoI8oh7HUwHDWz3LArL0KYHbhqYS1g8dSQFsm
 GuaYDuQjW1pug==
From: Mark Brown <broonie@kernel.org>
To: Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH][next][V2] ASoC: rsnd: check for zero node count
Date: Thu,  3 Jun 2021 19:42:01 +0100
Message-Id: <162274557552.14795.11440858083758467099.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603110315.81146-1-colin.king@canonical.com>
References: <20210603110315.81146-1-colin.king@canonical.com>
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

On Thu, 3 Jun 2021 12:03:15 +0100, Colin King wrote:
> Most callers of_get_child_count() check that "nr" is non-zero so it
> causes a static checker warning when we don't do that here.  This
> does not cause a problem or a crash, but having zero SSUIes does not
> make sense either so let's add a check.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: check for zero node count
      commit: d66e033910593d99700cd9e2a75698395fcd676f

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
