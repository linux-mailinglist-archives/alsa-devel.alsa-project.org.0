Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839E41B3CF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0143E16AE;
	Tue, 28 Sep 2021 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0143E16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632846369;
	bh=6hWvGOle/2+2TeWx4tUsgFaZzillo5KnbpUn3z0yFYY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZU40CFrT8R3lIBZnH/0OU54nnKJwUsmjhd8egZZ24+hE3LE01b84uXDPWf8V1yuSH
	 wOouKQ6Cxh2dxfoy39J0o1sW/VApsFsN9cZrmQVdQMfKuDF5feZZE6nPrhEy5PRs7X
	 9O/CGiuy8/v3wALeubM5ynmEXQJXvMDJxsMxOsKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D96F9F804E4;
	Tue, 28 Sep 2021 18:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3635F804E1; Tue, 28 Sep 2021 18:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A048FF80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A048FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B56Zf1jh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BE806124B;
 Tue, 28 Sep 2021 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846242;
 bh=6hWvGOle/2+2TeWx4tUsgFaZzillo5KnbpUn3z0yFYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B56Zf1jhEFvFvSDz5m6Vl61aXSIeW2mYD89pk41doku4fpWabTkbEONa7+tayZAGr
 IBv3+J5BUl+3srxqXWgbIThh3hPm+/GP7AvYreXw/2K9bBsvTYxMXK+aeGMY3Z261n
 dCi5rdEyKyKc2bZ9qyMwplmIcnhMb3ndy3cQFgowoB+rZYBqKIacWqSjvAYx89LQ8P
 Ivn9TGzkCgwDurmnGlp3XyT+M7K1F9yNpkWJKLg1xf/DC0LX43/0n0QpAA1I0qjiu5
 yjEEDh69BRMjq0cSuoBjwfyzJdfwpg5Q++LsRUlYTkFIRluI6TFZNrnUw/ZAyjbqfB
 1nMCBLiJHomTQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: pm: fix a stale comment
Date: Tue, 28 Sep 2021 17:23:01 +0100
Message-Id: <163284573551.17390.205358041085476333.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928074030.30553-1-peter.ujfalusi@linux.intel.com>
References: <20210928074030.30553-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Mark Brown <broonie@kernel.org>, paul.olaru@oss.nxp.com, daniel.baluta@nxp.com,
 bard.liao@intel.com
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

On Tue, 28 Sep 2021 10:40:30 +0300, Peter Ujfalusi wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> There is no restore_stream flag anymmore.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pm: fix a stale comment
      commit: a1ce6e43e2accf30e780a9a339218b4958857377

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
