Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6417280A8E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613BB1ACD;
	Fri,  2 Oct 2020 00:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613BB1ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592698;
	bh=HaZK10shVaF0sGBaLYo+hXt29nlPICTj9C3MPvCxu7g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYfPVMtoHC4EoFFRBIvGbKRgLC5ADFvV2T7ccLEBOI8XSEYrev9NAzZyOyvWZuAkl
	 nbzlr6fV8IO3uhIPYNHedVOdW8w3L187GA7m/XisVPnFLNwQ/k+wECNkyrFtsSX0IK
	 1Duxg6fMAHtVXXxSwsTsfBOVu6x6jFKlG5HJ2Wm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB70F802EB;
	Fri,  2 Oct 2020 00:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F17F802E9; Fri,  2 Oct 2020 00:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29AE8F802E3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29AE8F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="unZSUCVl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F13172074B;
 Thu,  1 Oct 2020 22:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592459;
 bh=HaZK10shVaF0sGBaLYo+hXt29nlPICTj9C3MPvCxu7g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=unZSUCVlkb3tzf5YIxFgWSj54QCJtrbpghNBF2+OQwr6GQDmuQEtpvZWl0vgvgsha
 gE/2fTuvyM5PLlQlZP3EzNKr+fG+le7Q7ZUcjTgSRXlG/2Vh8oaImbVhMX7bh4uVw7
 76BSP5vprMUx0G+Q1wMZj8WfKDIhQlN1eXWj/oDo=
Date: Thu, 01 Oct 2020 23:46:40 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
In-Reply-To: <20200826184851.3431531-1-robh@kernel.org>
References: <20200826184851.3431531-1-robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Remove unused 'linux,hdmi-audio'
Message-Id: <160159237545.44588.11956509419329615135.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Wed, 26 Aug 2020 12:48:49 -0600, Rob Herring wrote:
> The binding was added in 2013 and has had no driver since 2015.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Remove unused 'linux,hdmi-audio'
      commit: 08dd413b9ddf253ec3ee783a0a21df3754823be9

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
