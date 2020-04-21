Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6741B2F04
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866B316D4;
	Tue, 21 Apr 2020 20:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866B316D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493496;
	bh=/DKz1eOspQ/TtOHTkmj/WSzVJ0L8WJx/bY+4YpFt/e4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmUjr9+7ZOhqdVoKjR1bz3Jt7LwQ860lx4+WVTmg844tsxOFNg7Z4uJC9ifbIW7U+
	 sbtURnbihqSDEz7/15NCtm+whOsYI7h5zZYTOB4wixS7QOhpJOqdvng3AFKL9dM0cK
	 ewmQBZl47c1EvUfQ9zbWwKyBeF8/DqypjmYppKrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168E3F80246;
	Tue, 21 Apr 2020 20:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F38F0F80212; Tue, 21 Apr 2020 20:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16CB4F801F5
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CB4F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W31p4oxE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AE19206D4;
 Tue, 21 Apr 2020 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493346;
 bh=/DKz1eOspQ/TtOHTkmj/WSzVJ0L8WJx/bY+4YpFt/e4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=W31p4oxEgxDdzTACrPMkpBUXysMOBpPy/An7oSX7Y0ERC1jp43TgoGUmNs6jtBowl
 b/iQ/wRimgI2fkXnZ9xX1AsXkS6+K7slRDBWI1g5tbZKctXSSGhVHWOGoxIZ0fkeHA
 MwMrYM+TxtxQg2VbFnZWxgTS7GZsrmVtK+iFwZUw=
Date: Tue, 21 Apr 2020 19:22:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Sven Van Asbroeck <thesven73@gmail.com>
In-Reply-To: <20200417221341.31428-1-TheSven73@gmail.com>
References: <20200417221341.31428-1-TheSven73@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Message-Id: <158749333763.13706.411241319032866689.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On Fri, 17 Apr 2020 18:13:40 -0400, Sven Van Asbroeck wrote:
> Add devicetree binding for the Microsemi ZL38060 Connected
> Home Audio Processor.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
> 
> Tree: v5.7-rc1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/2] dt-bindings: sound: add Microsemi ZL38060 binding
      commit: 19f303caf63693502cf34897ade76202afe5f445
[2/2] ASoC: Add initial ZL38060 driver
      commit: 52e8a94baf9026276fcdc9ff21a50dc2ca0bc94b

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
