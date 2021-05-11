Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF437A203
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70AC177B;
	Tue, 11 May 2021 10:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70AC177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721811;
	bh=WPcOH1hz8LFi2fMAUx1mSnzJWiTl0dEjkzO5Nqmct2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lygKdK3LaAGbXJUyaHtkUtteXWmIcjf6/0gwuG2pCnWGl8UpsE4F6aG2kW3gPi35E
	 kUqDSyDsnnRLDzW5qE/PsePnAYLDjQYFOInMwgjBsuvh1KAo6705eLj6LCeHq0rrQr
	 Ooo4xs/CFRnciEZg8LZvurPBT1TUCx3q+mYx0VUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F637F804AD;
	Tue, 11 May 2021 10:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC256F804AB; Tue, 11 May 2021 10:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E32F80279
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E32F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UtNcltOD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0049613CF;
 Tue, 11 May 2021 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721646;
 bh=WPcOH1hz8LFi2fMAUx1mSnzJWiTl0dEjkzO5Nqmct2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UtNcltODfvT7w2yRGDCOauN3wcPhkqW6S5c6S+BIXkfF+0b8wTkho934NFdtCbdSr
 VXkPHW0fNRYTrshywUbENRUtSJZrekQaiQrDtv+P/WdF0KO/vjnY9n44qLXEax65H2
 hqo+9HiddSaRwze51yz7jpousDFkJQPDjzj7HpzIE1vo/0pUuFLdiQ5J0wJY8CD5S5
 33Y/fx6+RfAegayvTjdE9in0uNbnZnWeRf8o9Ur2BCYIb4Fgb2LfKAzPlbKYSxAGms
 DT4ondEC8RWnpFJFZe8vxp4uWrVk1fRMxrJWn/gqr1nSst2sBgrETgl8Wq1DYWB3z5
 JZi9iudcSyl9Q==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs42l42: Add support for set_jack calls
Date: Tue, 11 May 2021 09:25:44 +0100
Message-Id: <162072058166.33157.1893164114712321283.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210426155303.853236-1-tanureal@opensource.cirrus.com>
References: <20210426155303.853236-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, 26 Apr 2021 16:53:01 +0100, Lucas Tanure wrote:
> Replace the internal jack creation by set_jack call, so users can map
> buttons in their machine driver
> Also only enable jack detection IRQ after set_jack call

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs42l42: Add support for set_jack calls
      commit: c26a5289e86597e8826ad3093ad71ca0d5d9510a
[2/3] ASoC: cs42l42: Use device_property API instead of of_property
      commit: ab78322a0dc8e5e472ff66ac7e18c94acc17587f
[3/3] ASoC: cs42l42: Add support for ACPI table match entry
      commit: 66df9477bd35dd851e9803e5fdbbf40ee4598af5

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
