Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16755BD7E0
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DE1886;
	Tue, 20 Sep 2022 01:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DE1886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629066;
	bh=r8l1H1dUP1+Xajl2EvdwygN3Ilujb7RC3UjtlQLP+dc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJrHLf5bSHCBf70b77VjWbiApaJMFry8oIRItqqLnJKQ9xgAeF4GPX7yWtNwMeXeN
	 64LatzVXMfIQg5FDQuLZ8O6p6E0A/KjEPnxfQtwR5iAK69L/fVn/FmfHEFiqDCdX1M
	 +3FKGrDjdVEkhWzhcwOkk0H6Su4OQoVRD0GYPWqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57DCDF804FF;
	Tue, 20 Sep 2022 01:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F87F803DD; Tue, 20 Sep 2022 01:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB7BF8032B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB7BF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LOi5qsTq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62035618C4;
 Mon, 19 Sep 2022 23:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC10C433D6;
 Mon, 19 Sep 2022 23:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628977;
 bh=r8l1H1dUP1+Xajl2EvdwygN3Ilujb7RC3UjtlQLP+dc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LOi5qsTqDfLHBI8TxbV/CnJKxdNqUur3/SBKCasNjDZlAg1Q53zrUbKqV0K29zFdy
 wUdbZS2oytzcCRkmR6ZyjB7e1uo+dryeWBp49GvagnTwRYEuzJ8vrTdiA/W9gxTEcL
 MTWMlBBubbHb7cxQ7uoI0mFbJpXbR5e6+UGqZbTBNaZqd6gs5AkruWoPk0MUUBE3Nk
 3pH+NDIiEZ+7kVOz5TClP2UkaXw8F1b8GO74SEUXE2owW5AyvJ+NlAz/WXuoz7nz0A
 1brHmanZs61cDzMen/enpA9rkHtJyHmsBozLe+BFigSwhkY0rXXOfb0tz+nF8Pombs
 cGJn/WI6vKlvQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220919173453.84292-1-povik+lin@cutebit.org>
References: <20220919173453.84292-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: tas2770: Reinit regcache on reset
Message-Id: <166362897579.3419380.16445673057492770418.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, navada@ti.com, Dan Murphy <dmurphy@ti.com>,
 Stephen Kitt <steve@sk2.org>
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

On Mon, 19 Sep 2022 19:34:53 +0200, Martin Povišer wrote:
> On probe of the ASoC component, the device is reset but the regcache is
> retained. This means the regcache gets out of sync if the codec is
> rebound to a sound card for a second time. Fix it by reinitializing the
> regcache to defaults after the device is reset.
> 
> 

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: tas2770: Reinit regcache on reset
      commit: 0a0342ede303fc420f3a388e1ae82da3ae8ff6bd

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
