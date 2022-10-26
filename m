Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960060E6FE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 20:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9873A80;
	Wed, 26 Oct 2022 20:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9873A80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666807758;
	bh=J8UwWhmIgCBWqaVD39kMiiJyb9EFtzXG9666f1DVkck=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUdbqn36u6ipRl/G9IjWRmw2bCGvC9a7iQJ+YwWaZp1eexmBRVHhsQ2toh4xcA3ye
	 BEDQBNRfV3tcZls5w8ZUrIaxgLbiXEtdaNndlhaJ7PcTH0099sewc/q64/UiwFyzpY
	 8JILKjwLR2xA9HYSkzsT2xfrmRsWic0ATWCwUu4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB4DF80552;
	Wed, 26 Oct 2022 20:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 681EFF80271; Wed, 26 Oct 2022 20:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 243B9F80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 20:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 243B9F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="INJFjjRG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51F6D62006;
 Wed, 26 Oct 2022 18:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD0C433C1;
 Wed, 26 Oct 2022 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666807651;
 bh=J8UwWhmIgCBWqaVD39kMiiJyb9EFtzXG9666f1DVkck=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=INJFjjRGpsB3nGuFTbX8o+6N0lyhXo7RTZbiiUtKEdzQtwA2W0Gbvx3fo3P7oMKEn
 cF73VW0TWrJcz0gscaGHznce+9oqKahg5s3VHIvPo1gnzZIqWDOcfQd4l/zdUdSQDr
 X7mMWtGaR5Ll6NyuOwrnSGx6hDcV9iWJ6GJolz258aYBEDJKeg0MCKlB6tGKJtAcVw
 K+BOiuyQYSatCkriFPsVbolFMR4woiDTJ4bGgb586i1fhQJmF8ho9fzOyHz3una3O8
 C4rOUzZWRsdIJuvsZ2UcIQNmxUAkHTTHBNC9xh5intknNrT35uekCYQ2Yfn383mLst
 bAwfS51gDnXpg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20221025140942.509066-1-hdegoede@redhat.com>
References: <20221025140942.509066-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote
 UMPC-01
Message-Id: <166680765040.867857.17285553657653297354.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 19:07:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 25 Oct 2022 16:09:42 +0200, Hans de Goede wrote:
> The Nanote UMPC-01 mini laptop has stereo speakers, while the default
> bytcht_es8316 settings assume a mono speaker setup. Add a quirk for this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01
      commit: 8bb0ac0e6f64ebdf15d963c26b028de391c9bcf9

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
