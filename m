Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114A451A8F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E5C1684;
	Tue, 16 Nov 2021 00:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E5C1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019451;
	bh=fljXcnt0NW4ts0u0HOYNRGJqgyX3OFxwnxjFcxMhNf0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVSOR15zTevdKuLVb1wxjiOM0aHUDtYehNmC3bYkx3CE+MjMg6v7tguOigTIyoUld
	 y0NjLjkLVJLITzWl3leF64aLJUkW8KnrCfDhOMYKyKNTxWzXLY5LRu1zf8HZqyq8Si
	 w2yEkxm7NrU2dULwg0I578S8WCfZMW5zDpHSlyms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17371F804BD;
	Tue, 16 Nov 2021 00:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B2A6F804E7; Tue, 16 Nov 2021 00:35:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63E0AF800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E0AF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IyQrUAT0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A62FB63252;
 Mon, 15 Nov 2021 23:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019301;
 bh=fljXcnt0NW4ts0u0HOYNRGJqgyX3OFxwnxjFcxMhNf0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=IyQrUAT0hwOK0DbR7OXEvTaS4LasnZWjC8o6yYlemGJ6Bz54HLskjbfKxC2Fe+353
 F4/8Ei/0kxKTXqjyegm2Av1cIQki1XIoi3q9qckjomyYsVZjq0YeA5poHRaoEameJ0
 9noaIs/0gatDFavUdnZ6EIIrHCE1kqK9tVrv+q8avEFhg5LAuirbGOHqzLJX2wpdxZ
 r+dexf0fKKZ9yz7UVXmsrxyzrCtAChDRlgsGSB9+Rt3F+GudA2VHvBVukhSDoxA7Qa
 uCWb40Z9T7rO+6QeZtaG1HN8YfVValQrjOR8Ocq3R/U/98RUZcazZoApsUESayvlYO
 Z+PlQBKWtghfA==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, brian.austin@cirrus.com,
 alsa-devel@alsa-project.org, David Rhodes <drhodes@opensource.cirrus.com>,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com
In-Reply-To: <20211029214028.401284-1-drhodes@opensource.cirrus.com>
References: <20211029214028.401284-1-drhodes@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: cs35l41: Change monitor widgets to
 siggens
Message-Id: <163701930042.675370.4765321366031881305.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:35:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 29 Oct 2021 16:40:27 -0500, David Rhodes wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Currently the internal monitor sources are input widgets, which means
> if the card is set to fully routed these will not enable unless connected
> to something in the machine driver. However, all these are internal
> monitor signals so it makes no sense to connect them to something in the
> machine driver. As such switch them to siggen widgets which will have
> the same behaviour except not require external linkage on a fully routed
> card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: cs35l41: DSP Support
      commit: bae9e13fc55cbc5ae25409385b2f1ba9187082d0

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
