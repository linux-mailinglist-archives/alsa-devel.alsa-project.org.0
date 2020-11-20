Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2632BB859
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612421720;
	Fri, 20 Nov 2020 22:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612421720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605907915;
	bh=TiN/PEcXZyvfTQuP3y4oWjBfPiZHOkcTnSjiVhKAWt8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=daq7bkhhbzwprc/C/ZticwuyBFbS1yjqOT/g14/V4stw7Ig+/R11R76hjun88tI2I
	 XDNOWGhJGu7FgBGWcwWQI1pzByWOGgzH/xySD6qtSZN/Ek9eZKNy97v+538AKH5GI1
	 WJE4DxMDNsR2VE81yWABY0uAuNCL73C66QupMgzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 122E1F80276;
	Fri, 20 Nov 2020 22:29:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C37FCF804BC; Fri, 20 Nov 2020 22:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 349B7F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349B7F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SVreCdHn"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C4722242B;
 Fri, 20 Nov 2020 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605907768;
 bh=TiN/PEcXZyvfTQuP3y4oWjBfPiZHOkcTnSjiVhKAWt8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SVreCdHng3F9Tbg5eQKab66RkiVgp6TIka76jQwdm15Ol0XQzAHJ0QZr0KSzc87Lw
 3dturaJzf6DlrxTpXW0vTRpPjapI4fte1VztNZeU1oSh2mupXpVaz32Utm6LnL8jkZ
 O+QDo9KImmvTrCZIoNhz7gp8A3B/aRqmFjvaRDhY=
Date: Fri, 20 Nov 2020 21:29:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20201119161848.3379929-1-robh@kernel.org>
References: <20201119161848.3379929-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,
 rsnd: Fix duplicate 'allOf' entries
Message-Id: <160590773741.47461.854428611172817962.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, 19 Nov 2020 10:18:48 -0600, Rob Herring wrote:
> Commit e52f3f291152 ("ASoC: audio-graph-card: Refactor schema") added an
> 'allOf' entry, but one is already present in the schema. Multiple keys
> is not valid and results in an error:
> 
> ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
>   in "<unicode string>", line 4, column 1
> found duplicate key "allOf" with value "[]" (original value: "[]")
>   in "<unicode string>", line 262, column 1

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas, rsnd: Fix duplicate 'allOf' entries
      commit: 73d2784ecf09d49e319631aea682cb360959355a

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
