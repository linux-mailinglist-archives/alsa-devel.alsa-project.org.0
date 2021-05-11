Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8A37A246
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B9F17B7;
	Tue, 11 May 2021 10:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B9F17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722217;
	bh=UvnrVy15yOPUZ60y7QJKhfJnRwmi+PCofWvnjZ/cqHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btvMuz3qJRF7cEsBEQgNCuvAcvtvxwjcWXlNC91fDRIuIDmDbHozOLpua02+imqRI
	 Wc1fn0Jg9jai22tXG01GH5+iujR1WxydcTp+EXDfZNni0eW8W+kpcICitJpIF9Oxq6
	 2fglY5SV3Zf+dMzXXBahz1InVVLhM0Ex79tYaE4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6419F80553;
	Tue, 11 May 2021 10:28:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49CC8F804ED; Tue, 11 May 2021 10:28:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0290F804E6
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0290F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DTrPgIb0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01F2661947;
 Tue, 11 May 2021 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721708;
 bh=UvnrVy15yOPUZ60y7QJKhfJnRwmi+PCofWvnjZ/cqHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DTrPgIb0rfuGeQsWMDKyzrTqqNHFtm1+J10orwP3uCX5pjoHjRxuS3PQWYbNa/5rF
 Z+1G/mrGEloinbbl1hwcXpKGXb3Be7Ms4OLNVJbjUR6ccvL8/6kN0Nx5XaAbbvdZ8F
 3LTz4JNGaI6x+gTgp9dFuGM/eI7FCaPujhkurIZZSEHfYHSXbpmr8vawzOAHzDtoWr
 byD62016lA35PVBdVFe0sG+Oj/VR72aqoDPNIItU0mUm3MkUpXNiFCS6XQcLkYHM3+
 h4rY3a4XR7uKppQHtqtwj5AU1kDjQ1Yb45NZuTF5OEyt0YQdXvIZTeAJzwTy5dW+YN
 3WQ7gVbJ1PvhQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 00/10] Tidy up device ID reading on legacy Cirrus parts
Date: Tue, 11 May 2021 09:26:05 +0100
Message-Id: <162072058170.33157.4969636330813029107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 Mark Brown <broonie@kernel.org>, david.rhodes@cirrus.com
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

On Mon, 10 May 2021 14:13:47 +0100, Charles Keepax wrote:
> Pierre requested I have a look at some cppcheck warnings in the cs42l42
> driver, since it is reassigning the ret variable without ever checking
> the result.  Looking a bit more broadly this happens in quite a few
> legacy Cirrus parts, as they all use the same process to read the ID,
> factor out a small helper so they can all share the same code. Whilst
> in there fix up a couple of other trivial error path issues as well.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: cirrus: Add helper function for reading the device ID
        commit: c8b198ed31000a48f507bcea3828374b75418a2f
[02/10] ASoC: cs35l32: Minor error paths fixups
        commit: 283160f1419ddebc8779c3488e800cd30b31289d
[03/10] ASoC: cs35l33: Minor error paths fixups
        commit: 77908dbecdb6be2e875ced738b5c036bb83e8d78
[04/10] ASoC: cs35l34: Minor error paths fixups
        commit: 8cb9b001635cfa0389ec54eb511cb459968ad1d7
[05/10] ASoC: cs35l35: Minor error paths fixups
        commit: 60ba916d87600684a1e127b484e1c407c355caad
[06/10] ASoC: cs35l35: Correct errata handling
        commit: 1a46b7b82df57b6b6a4e891cdbb2de1cf818a43b
[07/10] ASoC: cs42l42: Minor error paths fixups
        commit: 0a0eb567e1d43cb87e9740c8e417d6fcff061582
[08/10] ASoC: cs42l73: Minor error paths fixups
        commit: 26495252fe0d1ebf548c02cb63b51abae5d5e5a3
[09/10] ASoC: cs43130: Minor error paths fixups
        commit: e2bb1077cee4d13dc85d53d76deac73b24d7f845
[10/10] ASoC: cs53l30: Minor error paths fixups
        commit: 4fc81bc88ad9d6bac90d169382c6045c47d48648

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
