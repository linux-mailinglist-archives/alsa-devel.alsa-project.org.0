Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB74397964
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 19:43:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CD7016F7;
	Tue,  1 Jun 2021 19:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CD7016F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622569382;
	bh=ZXMNqTMcmh04IX7GoSWkccVgeNTrfBB+eFFRU4ksCa8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qe7Mnojode2UuUacRNnAgg7RIILTUMzBj8Z40A0nXBaumaA5w9+vRtcWJIziYnA1H
	 MITM3cHf6w3XZcp3jiVXZOXNI0CgI4lFJFN3lcg3VcJrZkC1Nc7fc0SkLlZJkvPmtn
	 38ivaqivP0UBlE/ZPfmslptSsxLEJGd8Lsc2GMa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9C7F804EC;
	Tue,  1 Jun 2021 19:39:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD9AF804EB; Tue,  1 Jun 2021 19:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63724F804CC
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 19:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63724F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fFo9SUQc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C19F613CE;
 Tue,  1 Jun 2021 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622569145;
 bh=ZXMNqTMcmh04IX7GoSWkccVgeNTrfBB+eFFRU4ksCa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fFo9SUQcHYKuM0bjJvwshBJhbgB4cDCrzdkOEznEUopij9PtufyLglUXT4ja4E7Pv
 m3RH1ahR++iz0o/UfK3EgHK++2tKMsnbm8qzigZEtS1hochyoHiFG+Rk8f0R2RNb67
 XQpQArEXAr2SgiJqL/rd3/mKjaVbPmaUgDi/BdoANF1U3ng4xBvkVr6P7DXBnRRgup
 zMB6B558pep8j8Pav0di6XuSj5FbPSucAV2kdvpoKyV7818k4AiE49NjX51uHV0w95
 Ya8okeIoKrQyOFWrcxNIRWXSPrd8r/359otGc7vo0E5p8nMqVMMhC3N/xmqBMj2iD9
 Gab9ViOMRAO6A==
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: rsnd: adjust disabled module for R-Car D3
Date: Tue,  1 Jun 2021 18:38:15 +0100
Message-Id: <162256892745.19919.5169599491003503490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87bl8rk02q.wl-kuninori.morimoto.gx@renesas.com>
References: <87bl8rk02q.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 31 May 2021 13:18:37 +0900, Kuninori Morimoto wrote:
> Renesas Sound driver is assuming that all SSI/SRC
> are connected.
> But some SSI/SRC are not connected on Some Renesas SoC.
> ex)
> 	H2	E2
> 
> 	SRC0	      <=
> 	SRC1	SRC1
> 	SRC2	SRC2
> 	...	...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rsnd: tidyup rsnd_parse_connect_common()
      commit: ec02b5a1d1c91b1e05b62f8092252137cf9be488
[2/4] ASoC: rsnd: tidyup rsnd_dma_request_channel()
      commit: 039f2ccc64b8a2649f54d654a4d7d92864c6fdb1
[3/4] ASoC: rsnd: tidyup rsnd_parse_connect_xxx()
      commit: 73919dbe480d0b6cf3eeb54d25cb2538b6d3b024
[4/4] ASoC: rsnd: adjust disabled module
      commit: c413983eb66a0f6de37c13f7da3dd5fa488e5967

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
