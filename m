Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2D121F78D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DBE82E;
	Tue, 14 Jul 2020 18:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DBE82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594745032;
	bh=irvfRDzY/K0ARRQhB262mQahABhtwmib6ye2BEgbh1g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYbudzdiOxpbX05rf9F+Q99D3VPf55/ji60cDqB6y712wXtOw0aoUGBFOcl6/N7xj
	 a5vKtTzkkJWzHhK/hzL2wTa0/tDSvlVFwbS3adH5o05ILXGPjMSfP3n7wsDqfMeWAm
	 c6JxH1NhFvinObRODPF8juPsfMUbzCDTCR6dA27g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23EC4F802BE;
	Tue, 14 Jul 2020 18:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B20F802DB; Tue, 14 Jul 2020 18:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E93F802BD
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E93F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wsf1aHfn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04E4222518;
 Tue, 14 Jul 2020 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744801;
 bh=irvfRDzY/K0ARRQhB262mQahABhtwmib6ye2BEgbh1g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Wsf1aHfn3DXD1Ju2Os7ztOjkQRzT1LIy/nMPQymcD77GM3Z4je+RMO8XHPtOsRlLE
 c0jG1gKFWJpiqHlP3FM25PEUaoPJ3EwGRnsjTRu3/WSn4HS3ouwCzSimIWEpTZtpnQ
 yE/MD6M4MswleCBVqUsjftDR8lj0OjAxyLbhGwMM=
Date: Tue, 14 Jul 2020 17:39:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200623114005.791643-1-yamada.masahiro@socionext.com>
References: <20200623114005.791643-1-yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] dt-bindings: ASoC: Convert UniPhier EVEA codec to
 json-schema
Message-Id: <159474477218.998.2572332784309869444.b4-ty@kernel.org>
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, - <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org,
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

On Tue, 23 Jun 2020 20:40:05 +0900, Masahiro Yamada wrote:
> Convert the UniPhier EVEA sound codec binding to DT schema format.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Convert UniPhier EVEA codec to json-schema
      commit: 08277cd63797d97185284bc3e86d085fb9ff2adc

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
