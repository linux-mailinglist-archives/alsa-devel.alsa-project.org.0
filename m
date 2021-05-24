Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1E838E61F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 14:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE8616C6;
	Mon, 24 May 2021 14:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE8616C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621857779;
	bh=I/AnOl07xJ78/MlMBrSL4ZrBn/VkAl/y+yaLeCLFMGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QNbspvMzMsQkjt1Gr/j2edmVsEiegYKKcMIXcJEv+pdv5GI7kh9EFpZ6rJ80P/hfE
	 vt7DqwiBKXrESkQLyAYcw4zhipwOZyW6tPq3sP3eFvaI3gVQkRnrnLHFv89yPd10BH
	 rLdzsGge4QOeyameXzlmHCeyQ3mb36qj++/U17+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92FAEF80425;
	Mon, 24 May 2021 14:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E935F80137; Mon, 24 May 2021 14:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1850F80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 14:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1850F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QvkNw20K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B9936128B;
 Mon, 24 May 2021 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621857629;
 bh=I/AnOl07xJ78/MlMBrSL4ZrBn/VkAl/y+yaLeCLFMGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QvkNw20K223eZiCt9lDwQbruNbPbC126q+a7an9hF/N2qZwgV03A5DoBemDvFntN7
 TdavodDp4gl8ZZeysenWiG/rFwFVvZuiD2ucvjc9s6ghrFT5VKwyov2camHoQSvVBc
 4qV11Ugwj87M5vlPKiQlzwEMploNia+14zLDjGHTrhTbfGouGcnim4w1pMzSoCWzlw
 hncJuw39vN4rrMHTd1ZGv3jKeBApYZvB/qdMqFWa+RRXUCDxPNADAzjDpep5yww9Tr
 oKg+dQJuMZmp7Pt9kY0la8pOAzWw5eEAzHzBs2hOTUzsgE/KxZSZd+3d7G72eB1JIc
 KDyRHmbC7GRgQ==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH RFC 1/2] ASoC: dt-bindings: codecs: Add bindings for nxp,
 tfa989x
Date: Mon, 24 May 2021 12:59:56 +0100
Message-Id: <162185746496.49382.12917440362021007479.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210513104129.36583-1-stephan@gerhold.net>
References: <20210513104129.36583-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

On Thu, 13 May 2021 12:41:28 +0200, Stephan Gerhold wrote:
> NXP/Goodix TFA989X (TFA1) amplifiers are controlled via an I2C bus.
> Add simple device tree bindings that describe how to set them up
> in the device tree.
> 
> Right now only nxp,tfa9895 is supported but this will be extended
> to at least nxp,tfa9897 in the near future.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: codecs: Add bindings for nxp, tfa989x
      commit: 17ba36b704692a433d38cb230e99ec333ecd14a2
[2/2] ASoC: codecs: Add driver for NXP/Goodix TFA989x (TFA1) amplifiers
      commit: af00978a0a06bab60bd5adf54a65ea69d19ce35d

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
