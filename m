Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3884248C23
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:57:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84559178D;
	Tue, 18 Aug 2020 18:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84559178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769825;
	bh=8qiooKqbIY5buvznR0kFH1lZk03u/d1h4s6h+UzWh+w=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fULk3CnNIPF6fUckAPwVeRlkRxecxkDuuMvY9ULBfRNmJ9aX93KRwg+/rBYUk2V8M
	 9f8G9xB73edadDItA3oHLHOq/pQhCRxx7pqXhwvZrZME7HvkAzD4e0Pb2LK3h5GoMc
	 XtzDWl/6q+29yyfMoRyOzjg0zuz8ydwtvHv3yRUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168A3F802DC;
	Tue, 18 Aug 2020 18:54:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 559F4F80279; Tue, 18 Aug 2020 18:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91CAEF80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91CAEF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KzyrYJRY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF618207DA;
 Tue, 18 Aug 2020 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769660;
 bh=8qiooKqbIY5buvznR0kFH1lZk03u/d1h4s6h+UzWh+w=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KzyrYJRY/SUg2zTX0I7Qe3AjmpADPvAFy1Ho9yYgcUAqTKntd0HBNEZiVYlRCoGho
 vL4oHNfjuIkQLJ76ShY6jXtC1fgVx0Gw/55CcmOFxiKmczA+8OpEhbfaOLnonsnGyy
 Xxd/GkdFHy1e3XFPP7dS+jt7CBKR99x5qoG23YYE=
Date: Tue, 18 Aug 2020 17:53:49 +0100
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Dan Murphy <dmurphy@ti.com>, perex@perex.cz
In-Reply-To: <20200817172151.26564-1-dmurphy@ti.com>
References: <20200817172151.26564-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tas2562: Remove tas2562 text file
Message-Id: <159776961933.56094.16343409470039919349.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Mon, 17 Aug 2020 12:21:50 -0500, Dan Murphy wrote:
> Remove the tas2562 text file as the tas2562.yaml is now available.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tas2562: Remove tas2562 text file
      commit: b1e78c9fcca83d3666bc149ba8ecc1e472759359
[2/2] dt-bindings: tas2562: Add device specification links
      commit: da9afe50ae2aac72d1b213d028d4e865c7ea9ba3

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
