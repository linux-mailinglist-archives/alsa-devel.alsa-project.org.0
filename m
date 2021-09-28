Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CA641B3D5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E12216AF;
	Tue, 28 Sep 2021 18:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E12216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632846427;
	bh=tAy7IAqnbjx32LK4cklBVJYwPYWW1rQwIXnfFiWndDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWlgbli6alPmYnETeeGMKCxzPeC6V7t3xUuFAwC4EXAgfre/LtwVf7iUV8Rw2dat4
	 epM3LfzPANEjsv6l6cRGJOte4Hv74CibJHazg4ZXK1gXbQ9xLgOXholtpc9JDA2Qz0
	 KjWUWk9SpedsVT3iIGyNwh8laMgQMZfiavm+FgyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44606F804F1;
	Tue, 28 Sep 2021 18:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE96F804FA; Tue, 28 Sep 2021 18:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E75A3F8032C
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E75A3F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qQUehSV1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8369B61213;
 Tue, 28 Sep 2021 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846248;
 bh=tAy7IAqnbjx32LK4cklBVJYwPYWW1rQwIXnfFiWndDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQUehSV1XIXEkgYQw0kXO+YilJYuFqcNQ/Wv9sSYZRbHb+wmmLbL7QZI2MPfItxN5
 n9bCrAsOcDUSMplSDi58KfgAhkyDPLZZ3ijB0h214Y5AzwNw95Jl9Jf5QkJKYK7wVg
 LIDfKmIxUq/42RtIXfy5S1JgOpqeTa+gbwZ+evZe2EF+ZvKAU09B4BhY1iSEDOZISs
 UOT398heHLZ9hvCQ501ltCa2S034hWGryPvBnfamWUIoRiSh0VFiZr4NjprOIS+lCx
 IqUDbStUFbzeVXVjCaMU8t9xcDGD0mxbGhIRr5Esy3Spmqfsb31SpKZc+SJa7jGRSe
 /IFlFiRjZ+5sQ==
From: Mark Brown <broonie@kernel.org>
To: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: SOF: ipc: Make the error prints consistent in
 tx_wait_done()
Date: Tue, 28 Sep 2021 17:23:03 +0100
Message-Id: <163284573551.17390.4571485878236392753.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928073615.29574-1-peter.ujfalusi@linux.intel.com>
References: <20210928073615.29574-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 paul.olaru@oss.nxp.com
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

On Tue, 28 Sep 2021 10:36:15 +0300, Peter Ujfalusi wrote:
> If we get an error on reply (msg->reply_error) then we should print the
> error value out.
> 
> At the same time extend the print to include the message size as well and
> do the same in case of a timeout.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc: Make the error prints consistent in tx_wait_done()
      commit: b689d81b1608a36b32133877678e82d286422743

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
