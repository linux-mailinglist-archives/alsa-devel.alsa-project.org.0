Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E533A879B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 19:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BC0168D;
	Tue, 15 Jun 2021 19:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BC0168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623778417;
	bh=Rdz4u0dD548hQlAPF6EISilDnI1Xwl3Uw2h8hinLM6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2OODMdxzlgRrOGE+tElje7yTqMIyZqlNuXi5/tUSrWC3F/QTysYoPq2kLJkSqaEy
	 YbbwfSFTE8I1N8Q01zTsStFe8J0bWFQzBos5yTulBhs5ppvfhrswOGoaSUKlZTWw22
	 xrzRO5l8OPiRPiRpTXak1U8y9WW3QmMANVMi/WGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C5CF804E6;
	Tue, 15 Jun 2021 19:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 480A0F804D0; Tue, 15 Jun 2021 19:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A496F802A9
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 19:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A496F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k2Kv5yC7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F06B861414;
 Tue, 15 Jun 2021 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778201;
 bh=Rdz4u0dD548hQlAPF6EISilDnI1Xwl3Uw2h8hinLM6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k2Kv5yC7k6iBREpyDqDVXPPe6gYHQi39CacItMwVySP3KNhQa8DnYoBgne/cX5RrF
 Og5g53RTE84HX/N9iLRo2ozeW8piIgjbn+j5Bl+jGl/Yk1KPVDrcGEE+USGoLUq3Vl
 ywPoBFiPBrStz56ttumZTtF/8tbN78zq7jmJtjzLIV6Lkgq8oTaNh5fc+NTF7xX1Sq
 MkYb2HYbJ/0rjes1HstDk1nAlM3yPcvVwTB+2BuOTfAChUEUCzaPwMR4jomA8baWbo
 UPVAUgn8G9ajv1wja79aTs3HgzelSgS3H7/vAGbmP25sQa754qoT8nk+1btQnAfycM
 XTJPuQcLCrmww==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: remove incorrect module
 interdependency
Date: Tue, 15 Jun 2021 18:29:23 +0100
Message-Id: <162377763943.21612.12264093680635019137.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615094839.27237-1-srinivas.kandagatla@linaro.org>
References: <20210615094839.27237-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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

On Tue, 15 Jun 2021 10:48:39 +0100, Srinivas Kandagatla wrote:
> For some reason we ended up with cyclic dependency between snd_soc_wcd938x
> and snd_soc_wcd938x_sdw modules.
> 
> Remove this cyclic dependency by handling them in respective modules.
> Without this below error is reported during make modules_install
> 
> depmod: ERROR: Cycle detected: snd_soc_wcd938x -> snd_soc_wcd938x_sdw -> snd_soc_wcd938x
> depmod: ERROR: Found 2 modules in dependency cycles!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: remove incorrect module interdependency
      commit: b90d9398d6ff6f518f352c39176450dbaf99e276

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
