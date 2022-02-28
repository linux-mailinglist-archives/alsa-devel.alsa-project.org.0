Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1154C78A2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:18:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8901218A1;
	Mon, 28 Feb 2022 20:17:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8901218A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075916;
	bh=D1eQNOjeR56Hsq6FqLXuVy5KZUZzLJePgCy/Ezcdl1A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kkLWd+RNWLVI6CV1JWFAa+6z4j6h3WgWtTUx0igMHeK8ma659tbQJdzlANk447EuX
	 esJYgwOuNUJBXNParfvzMI2uwR1T6bcj46+ftjG1K34TLF8IexyQVwNOKCqMnk2Cbk
	 CJzFXAaDqeKh/2HrVrGTwLyywN/jYlMR4HXIKdKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 707DBF80534;
	Mon, 28 Feb 2022 20:15:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19989F80517; Mon, 28 Feb 2022 20:15:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58A02F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58A02F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FSspaE2i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B6576158E;
 Mon, 28 Feb 2022 19:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30ED0C340F4;
 Mon, 28 Feb 2022 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075722;
 bh=D1eQNOjeR56Hsq6FqLXuVy5KZUZzLJePgCy/Ezcdl1A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FSspaE2i0qtkgkrh6+IEh6DvbQO3mbRalV6ejVev+VmkEDPMBO1zbKM9QmvuW5qe9
 0/JLX2kxeKNmCWOvhyC+I0b0qNlCEbAQE5A/X9XVTiA8VZv4w7SiiaUIwJc/+7bjbD
 N2HWhgCrGHlEfEvsbxY6HRbqGMHjUQiBVfJxf9JgOKG4vppS0VBbrnt1bYEC15qFB1
 RtFdXkxPuWFIy7cZ8z49KCjOCmKp/mHqldJtx0ux2LS/JkJdXJ4auBLfhn14/QGqcw
 T1/C8GxAsSEo9UImqs1Gmch/qpRICP7DN2mzmlHBx36/5rGVi9wUNK4LINht4nfVmJ
 ETJesE3+307aA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
Subject: Re: [PATCH 01/10] ASoC: max98088: Use modern ASoC DAI format
 terminology
Message-Id: <164607572091.3538791.7145987255670941686.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Peter Rosin <peda@axentia.se>
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

On Tue, 22 Feb 2022 23:40:17 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the max98088 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: max98088: Use modern ASoC DAI format terminology
        commit: 14688a14dac34aac979c1e5386278f914a73164f
[02/10] ASoC: max98095: Use modern ASoC DAI format terminology
        commit: 2232314b7dbcf19a897e72e00d154b19669181e5
[03/10] ASoC: max98371: Use modern ASoC DAI format terminology
        commit: 012df28f5e143747c82d2b03428f607445fda893
[04/10] ASoC: max98390: Use modern ASoC DAI format terminology
        commit: c536d745adbc83abb782077a212a8cbdd7300b54
[05/10] ASoC: max9850: Use modern ASoC DAI format terminology
        commit: 9dcef176c4d68abc9765b420c38cca6aa85600da
[06/10] ASoC: max9860: Use modern ASoC DAI format terminology
        commit: d14c87d8ef0da4500ee8a0a3273972f4bb549412
[07/10] ASoC: max9867: Use modern ASoC DAI format terminology
        commit: 2594d0aaedade65b4f746cda0f304400eb1a9870
[08/10] ASoC: max98925: Use modern ASoC DAI format terminology
        commit: 02dd4e6ba25ca343adf228c34955ca0036a6ade3
[09/10] ASoC: max98926: Use modern ASoC DAI format terminology
        commit: 502e1c8d07222561b046a1da7b8207696f575288
[10/10] ASoC: max98927: Use modern ASoC DAI format terminology
        commit: 677c90bac3f198434f0256338cefc77e4663bcca

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
