Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF964606F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:39:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B3F188B;
	Wed,  7 Dec 2022 18:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B3F188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434791;
	bh=qSza4H82mdMpbCFfcyf6/rY8vJ/rlTzfwv8qc4wJ898=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4fO7AY/c5lKLBkBbvu2ZkUlyB8sLXVN/4GsU3hcr6r/uaWdi5P3X/wvW3Nmoe9fJ
	 caOCgwcqgtnli5uadvTX7BH8AZdtL59SLQ8vXeWbRW210/3m34qHzmZsuBSEJQEpsk
	 PmHRsOBw+lh4kO3Ua5xcMHhG3FR4tJ2B26VPJd0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFC4F80570;
	Wed,  7 Dec 2022 18:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5FEF80567; Wed,  7 Dec 2022 18:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 603CCF80567
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 603CCF80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VMNINyvg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2981B81FE9;
 Wed,  7 Dec 2022 17:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E89FC433D6;
 Wed,  7 Dec 2022 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434669;
 bh=qSza4H82mdMpbCFfcyf6/rY8vJ/rlTzfwv8qc4wJ898=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VMNINyvgSLOgWcwHRpomCG5dTh6aVNzHk0GL8UolqwWzW0Eilb/1IKwDhPlsFLJcH
 E3sAb2RDsCRKg5QKU0nP6Doiw8JPBRgwAUA/7+VDJfCHq2RHzyVzGTFYk+NI6zSAaA
 0tgSu/Ts6qbKQOi8/gpN/5mE6O97+MkEpQ8AJCf4xilpmYALC4Gom+RXDn5sLZ/I9A
 faxx+rio4a9aLoac+o1bW2DIsoxBV2tJQczyzv1eHfLjbxcxe4uXa1plKihXnBFCwd
 71wpsWCZookvWCZemhhRxvcbACc5MX+vtIOiS+lWrUSrQwqPf1IWjxAQh5OTc0UnED
 aVObzXKTvh4DQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/6] ASoC: Intel: Skylake: Topology and shutdown fixes
Message-Id: <167043466737.393374.2015082133648997354.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On Mon, 05 Dec 2022 09:53:24 +0100, Cezary Rojewski wrote:
> Even though skylake-driver is going to be replaced by the avs-driver,
> the goal is to keep it functional on all the configurations it supports
> until its EOL. When comparing chrome trees against upstream
> skylake-driver, couple fixes pop up that are not part of upstream
> repository. These fixes are backed up by real bugs (issue trackers),
> address real problems. There is no reason for them to stay in the
> internal tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
      commit: 72d9a541d7f186f0ec97c71ba7e477dd9bf4155f
[2/6] ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
      commit: b0d16e54e7559f2055123ea7b1d9ff1bb808ebad
[3/6] ASoC: Intel: Skylake: Drop pipe_config_idx
      commit: 75ab3c00769009e32e5cf51c8b503de4f73114e4
[4/6] ASoC: Intel: Skylake: Introduce single place for pipe-config selection
      commit: 4ac587f3578c5ca490e4df55af6403f5474eb2f0
[5/6] ASoC: Intel: Skylake: Fix driver hang during shutdown
      commit: 171107237246d66bce04f3769d33648f896b4ce3
[6/6] ASoC: Intel: Skylake: Use SG allocation for SKL-based firmware load
      commit: 451d85c46cf719a09a052510d4d4cd920103163a

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
