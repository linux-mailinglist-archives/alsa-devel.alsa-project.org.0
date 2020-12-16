Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0732DC384
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:55:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04034181C;
	Wed, 16 Dec 2020 16:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04034181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608134105;
	bh=NvjgEWYpRUtjMYB6cWUikuRN3Hf+zsqc1bvR9h7G4b8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmtUZ1HneXq5enUkuERt3pI9XxCH0h1G2t1MmYD3WL/pygkJeGNHIHwBFo9f/nTfH
	 ggPy4mPZduO/s6nK5+9R6+NqZ0aDRNu61H9PgH4LWn3Mch/YjmH3LhH+5b0o+lYemx
	 rxpam12cisAR6+WT7OlEmWdhZJkXNDusxEKLqKwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FB24F80168;
	Wed, 16 Dec 2020 16:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 078BFF801F7; Wed, 16 Dec 2020 16:53:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D806F80168
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 16:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D806F80168
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org, Thomas Hebb <tommyhebb@gmail.com>
In-Reply-To: <f8b5f031d50122bf1a9bfc9cae046badf4a7a31a.1607822410.git.tommyhebb@gmail.com>
References: <f8b5f031d50122bf1a9bfc9cae046badf4a7a31a.1607822410.git.tommyhebb@gmail.com>
Subject: Re: [PATCH] ASoC: dapm: remove widget from dirty list on free
Message-Id: <160813397774.31838.3814954649059477238.b4-ty@kernel.org>
Date: Wed, 16 Dec 2020 15:52:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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

On Sat, 12 Dec 2020 17:20:12 -0800, Thomas Hebb wrote:
> A widget's "dirty" list_head, much like its "list" list_head, eventually
> chains back to a list_head on the snd_soc_card itself. This means that
> the list can stick around even after the widget (or all widgets) have
> been freed. Currently, however, widgets that are in the dirty list when
> freed remain there, corrupting the entire list and leading to memory
> errors and undefined behavior when the list is next accessed or
> modified.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: remove widget from dirty list on free
      commit: 5c6679b5cb120f07652418524ab186ac47680b49

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
