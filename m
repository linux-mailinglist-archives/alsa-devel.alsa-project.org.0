Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C052162D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 15:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88984164E;
	Tue, 10 May 2022 15:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88984164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652187700;
	bh=qiNUFofEKQvjLpQ/+eiLIB1OUhf4l/Ig7oEN2oOkq30=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yvlpfi7uJEjOLGfDwIJ63hcpGncW49Nwn2XLNMruH2mh8ND46zmFpBBUmujKoN2vv
	 ZJWHvu7U7LM5z9N4JTaZdWxJp+bbjpYX/SoFQGVIQZBOs73UW57L6PaCGQWejHmjdu
	 fqLaFaTIJbvcD9Soxr5N4F1MW7564Q+mLezGFRw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE5DF801F5;
	Tue, 10 May 2022 15:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FE3F801F5; Tue, 10 May 2022 15:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26042F8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 15:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26042F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h4CYoTib"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8767614BD;
 Tue, 10 May 2022 13:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB51C385C6;
 Tue, 10 May 2022 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187642;
 bh=qiNUFofEKQvjLpQ/+eiLIB1OUhf4l/Ig7oEN2oOkq30=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h4CYoTibCsRvp1hm8gTOmaO9ksXYpEuFjdzE4SHvBZvlJqJf2gN7Ye9xyj+jvN1Mc
 dvyJ0bKTGHTFdaWTVEf6x5z/TjdWJtw2ty/yqatjhNiAiuhRJPu68ue0a9q8dYoAqj
 xzqUaigZQXk+z6bwWfPaROOqniUA0ZABBczKN4bySKNMakNVUQz6O28ByhSUvBerKQ
 aConbB7auaL5ETDSD4DnYS4Ij9Li//EfLg5EFFgFmyyjxVC/cir7L8D4PXeqe6dL5M
 KqdMW89w0lqdtgDraORXTfqZycYEOtOzTkP6469mfkqfGSkwmprE5zHGOOgfFMUGBa
 TG9VXNe2Ouk7A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220509185729.59884-1-pierre-louis.bossart@linux.intel.com>
References: <20220509185729.59884-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: rt715-sdca: remove useless assignment of ops
Message-Id: <165218764138.65921.1373938687406294328.b4-ty@kernel.org>
Date: Tue, 10 May 2022 14:00:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 9 May 2022 13:57:29 -0500, Pierre-Louis Bossart wrote:
> The ops are already part of the 'struct sdw_driver', it's unclear why
> this was copied into the 'slave' structure - no other driver does so.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt715-sdca: remove useless assignment of ops
      commit: 5118da41c7594ccf4e64003bf325ffcefb3da6e3

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
