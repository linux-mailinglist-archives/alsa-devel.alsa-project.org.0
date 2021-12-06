Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369946A3B6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:02:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2CE22E1;
	Mon,  6 Dec 2021 19:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2CE22E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813737;
	bh=d6N5WPf2hFxd6GIGieLlBYRm965MfgKYFyCFzJm7o9I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7Tm47uUZN8xe8V3l+D4r0/Q0d4iBfxarO7vqXb9O9AyAXcIxJ8h7zqJdmpqVMbM2
	 H1kH0WVUs8jz/ug17PJ9BHD5x5QCmkvOwu5mNffQHzxcRW4RdULhDdoMAc5f5PaKuj
	 eu68f1hnqfjXYWiEQCp8qA/nl+ajGFPYeKLVImBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33983F804E5;
	Mon,  6 Dec 2021 19:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF80F804E4; Mon,  6 Dec 2021 19:00:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6D80F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D80F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c7uRyzjQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D1CB7CE16C3;
 Mon,  6 Dec 2021 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE11C341C1;
 Mon,  6 Dec 2021 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813620;
 bh=d6N5WPf2hFxd6GIGieLlBYRm965MfgKYFyCFzJm7o9I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=c7uRyzjQ5MOHr8vSdBvfYWPK6ATjUeJVv3JrGySOwPAniOPihEzZCoV2iTPdIZArr
 ZEqxFQrlTIvXtRNsK5oY/4aYkZNLAURyC/2jqTq5TUP+lVq3J7J33rl7ivcXH1Ws3N
 e7WIBc4fuBRenUXoZzoFeZ9uKHvlG6ZwkSmGJMzy+q4Fpw698lzaat/6wwk3fJGADx
 E6ZIPDfeYy54wKNU0/5Ges9oez8HtbylU4D5T3wJufVVb5oCW4BSBxl5d3M/cNyCSo
 nPnELGFo5lIXxuS2APfu/Svz+ozh6GYiJP+XenMs75ZX0ADNEFdg4FAqEyZCveAsRK
 TLoKQuTgi0qWw==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20211203171542.1021399-1-kai.vehmanen@linux.intel.com>
References: <20211203171542.1021399-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: add ADL-N support
Message-Id: <163881361830.2769265.16338080317391853663.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 daniel.baluta@nxp.com, lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com
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

On Fri, 3 Dec 2021 19:15:41 +0200, Kai Vehmanen wrote:
> Add PCI DID for Intel AlderLake-N.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: SOF: Intel: pci-tgl: add ADL-N support
      commit: cd57eb3c403cb864e5558874ecd57dd954a5a7f7
[2/2] ASoC: SOF: Intel: pci-tgl: add new ADL-P variant
      commit: de7dd9092cd38384f774d345cccafe81b4b866b0

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
