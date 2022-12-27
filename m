Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C742D656A61
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DEC1FD;
	Tue, 27 Dec 2022 13:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DEC1FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142591;
	bh=vEIpeY9CnxdnlI0n6ZoQauj/xBx95xlm2rvC1G7qlaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oBtQ5Oj4gGqW8yhEE7LA637/F4e7rOgnoThOaKxYAicKFzuBTzDJzkTXyFjtGh0gW
	 hYXKA2ZMxrwgizldF1LWfVbo/MOd5lVIR2Q6UuIwsHvzMbmIpyoSLxG/5UpE4gwADS
	 ED5dMojyf9ovHvGDEY9jUNSTGSzp7UkopfHUeNNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59347F805D5;
	Tue, 27 Dec 2022 12:57:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31530F805D7; Tue, 27 Dec 2022 12:57:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E901F805D4
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E901F805D4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RbaRGwnb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 20B22B80ED9;
 Tue, 27 Dec 2022 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00616C433EF;
 Tue, 27 Dec 2022 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142256;
 bh=vEIpeY9CnxdnlI0n6ZoQauj/xBx95xlm2rvC1G7qlaQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RbaRGwnbjZZd2Jpm47JEQhvw7RSUFelkxyAFs4cN2d3OGsnShX1CWj87yicFBMVwa
 Cm0d1veZTWQEtpyHofquIQwS4Icz3u/69ewdfkGlXdqsd/CwgyvxcxWjf75pDAY8HW
 Us8xZY3R7wqE9sBwPE6YlgeWh4iZbQg8MpZIigeK1jfWyagpYz3niE23x+v4m6O2d+
 I4V7hOpPLHgrd+9DhnqGwX7mnVD6ToX7Sje++LQQ2FxFM7i1astJkmQ8E+vQ44NQ4g
 ljjzLyLSccUu4QVXUTLT6eJw4Z/nAvWg16XSH7QRJk6FUUhbJ9QCvHRxLOnin/2y4U
 8FB75H4RdC3ag==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20221223055846.3285-1-shumingf@realtek.com>
References: <20221223055846.3285-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt711-sdca: add jack detection mode for JD2 100K
Message-Id: <167214225471.82924.961483337320548896.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com,
 pierre-louis.bossart@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 23 Dec 2022 13:58:46 +0800, shumingf@realtek.com wrote:
> This patch adds another jack detection mode for JD2 with an external resistor of 100k.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: add jack detection mode for JD2 100K
      commit: 51ea51b18904cd1a0fb244ce41dfd903c2ada628

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
