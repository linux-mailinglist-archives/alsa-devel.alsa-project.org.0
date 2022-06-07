Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E229E53FC79
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC0E1A9D;
	Tue,  7 Jun 2022 12:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC0E1A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599292;
	bh=OaP6dBe0ipQhDdS0OyxXwSYcURl+blulqTINjWPgrNE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciHrwpPDigPozzJqY8y4VSYuDEc3PsV/zwqDHaNruK1rlx+MO5gykl8gIo3Pg5mgi
	 +kWEtkxBrdLwIL4ZJKrVDv7Hd+Bh2jPi6MLmLsShUtWJdwNWVZbb5KRC9ulOCvj4S8
	 O3Z9mEx5lF5ISlKj9rxx2bVIL1pqhlCl4LwI5Zuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB3ABF8060B;
	Tue,  7 Jun 2022 12:46:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0EBDF8060A; Tue,  7 Jun 2022 12:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DB9F80602
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DB9F80602
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XNfMFvjS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 798DE61556;
 Tue,  7 Jun 2022 10:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A7FC385A5;
 Tue,  7 Jun 2022 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598787;
 bh=OaP6dBe0ipQhDdS0OyxXwSYcURl+blulqTINjWPgrNE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XNfMFvjSj/n+E+hVFXm22+HUfdxm1rf37HvCB/fW95pu51bwQ8ALkVVVKZKwlmdYX
 TK0SBupFDfsxFv+RiprQ2M0lVEhemqW23fRtZtf/5Bn515uTEmNn6EnJV8csWEZhOQ
 Cs+L4sv2jWR2LaR1BbC95s+ofW2OQjQzQNQPvC9NGyuKAjZj45lIKKjq49xSc4JSGn
 FZYc+4euWUpdw+yoMPmVRAMejZqkjPVE3hHFkbBlzjUCN6iGnupEiVtTiqPNGVG7DM
 FEuuuV6/oHyh5mtPY6/W9YYVyU4PstQaNSi8qu44kV/StuvK/3qh3dMCYRYMqY+w0B
 I8qmYbH51y8lA==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220603123937.4013603-1-broonie@kernel.org>
References: <20220603123937.4013603-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: es8328: Fix event generation for deemphasis control
Message-Id: <165459878635.301808.15195636189378527279.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 3 Jun 2022 14:39:37 +0200, Mark Brown wrote:
> Currently the put() method for the deemphasis control returns 0 when a new
> value is written to the control even if the value changed, meaning events
> are not generated. Fix this, skip the work of updating the value when it is
> unchanged and then return 1 after having done so.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Fix event generation for deemphasis control
      commit: 8259610c2ec01c5cbfb61882ae176aabacac9c19

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
