Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D643FF5E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8DC1707;
	Fri, 29 Oct 2021 17:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8DC1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635520928;
	bh=rOheY0c4ksMLoID1zAZkXiKjzdta0g5IXspWnZj9+aw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFbGrLWLw+dzIrwm15Gn9YR8fZGhqGTY/Kx7aFeLMeov33ha9Hz4LRtRkNow1lKZY
	 RVLx8l8BM3TTDTarIlHe/iE5nUq3p0nSZ09O8hIAOayjH/MGUewqMbpUkRGZTykUpL
	 po3WuFuYbpuDSNCJY99tJpsRkMQ0VCpZglD4Fxiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCE7F8025E;
	Fri, 29 Oct 2021 17:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F16B0F8025A; Fri, 29 Oct 2021 17:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4304FF800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 17:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4304FF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ncmkwINq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB2EA6115B;
 Fri, 29 Oct 2021 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635520841;
 bh=rOheY0c4ksMLoID1zAZkXiKjzdta0g5IXspWnZj9+aw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ncmkwINq4yXDj8JbMwe0rb1GxUNShaIosYOwDlbvDQ1dsBN8ORnXDmF6zrzj09mbr
 3goaBSZa0giEDVLGem5J8Z2IV1YDRSCwfU39fs6l9rCpvnXjxjV6uQY//NNskkcK7h
 k6SYbLO6cAlGHgKprHUT0tHjvkuiWs2gfWLsS8Dr7N7prGPFWnGQNffmc+DHHl/fQz
 G7I8SkdbrvSgAcsMvGSAfPc2TI1nLCLFhnuVzg8riqpc7rqkiuBOsPTYLczDLNx1mw
 DNvU1RrQvX697Fgxk/6Q9oRh1V9/y/nH3/IP98/Dc0FIZ7jjUigD99jblgKlY7bgUQ
 1Z7o6N3jlpTXw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Vincent Knecht <vincent.knecht@mailoo.org>,
 lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, stephan@gerhold.net
In-Reply-To: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
Subject: Re: (subset) [PATCH v1 0/4] Add tfa9897 speaker/receiver modes
 switching
Message-Id: <163552083943.187214.842641047380618790.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 16:20:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
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

On Sun, 24 Oct 2021 10:58:36 +0200, Vincent Knecht wrote:
> Two tfa9897 are used in tandem on some devices (eg. alcatel-idol347)
> to drive two speakers, for both receiver (earpiece) and speaker modes.
> 
> This series:
> 1. adds a control to allow enabling only one tfa9897/speaker
>    (for the typical phone-call usecase)
> 2. adds a control to switch between speaker and receiver modes
> 3. adds support for an optional gpio also used to switch modes
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: codecs: tfa989x: Add support for tfa9897 RCV bit
      commit: b6a4e209fb7da1b49cb72fedb405f90e485d5a48

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
