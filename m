Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CE53FC97
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A2D61A9C;
	Tue,  7 Jun 2022 12:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A2D61A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599577;
	bh=/gX6O+gjzi7rAiK7FKjnSHiqfF8k5L3gdlo5ny1m594=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qqeUG7/2myyZ/Os0sTYp26EZHoNoiae7VTeNVF6JQMAIk8u4pywc519rrxz2kqo/X
	 fGP81AKPoenffEIi0+5Un4BEe55mSGSKPYtOUo2cxkMs2JziY0P+DWUnh+XrAcVvP6
	 S8D+Uk//DKCawGwV7MQzX3rpi5b3xoI9JdDPjPZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B8EF805AF;
	Tue,  7 Jun 2022 12:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83750F8058C; Tue,  7 Jun 2022 12:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B482F8057D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B482F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JINn3RLR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBFBFB81F13;
 Tue,  7 Jun 2022 10:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF26C34119;
 Tue,  7 Jun 2022 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599318;
 bh=/gX6O+gjzi7rAiK7FKjnSHiqfF8k5L3gdlo5ny1m594=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JINn3RLRndo+wmvNIrQenQqj+cjxdLtMQdY47OE7c5TKaL2oV0O3fBfxvELGWePYJ
 SYAeiJ9Pg5e+swHTcyWZLrbRkpKWja5vFUDcC4ySoHMcUYgUMk4QJpuPoX4zJncPIQ
 o5JdolGhvVnjb4xibmy6kEBzDoADzLu4qbHgCHXoqJyQHHkwc3lCjcdcSo/LDIiPMD
 vtplu+GvKZKgIMJJiY1PAeJ0EUijWE39V18PaiJBVh2KqCrRl0QZnHo0+h64AP/AJU
 zZpqDLBIFZNIozEFaCXsP64FANZKe7LgNsp6GRjx4SSkltPzehNCWHFCyve2/skgYJ
 XFnK3Kc4XO1Cg==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220511162403.3987658-1-cezary.rojewski@intel.com>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Machine boards and HDA codec
 support
Message-Id: <165459931604.399031.1411920963067827195.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, kai.vehmanen@linux.intel.com,
 harshapriya.n@intel.com, rad@semihalf.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
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

On Wed, 11 May 2022 18:23:49 +0200, Cezary Rojewski wrote:
> This series focuses on populating boards/ subdirectory with supported
> configurations by the avs-driver. Note: it is independent of recently
> provided "Driver code and PCM operations" series [1], that is, code
> found here should not collide with it.
> 
> Series starts with a small change that adds a helper to sound pcm
> header, allowing for retrieving string naming a direction without the
> need of substream pointer. Said helper is used by codec driver code that
> follows it but I believe it's generic and helpful enough that it can be
> called an independent addition to the sound core.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ALSA: Add snd_pcm_direction_name() helper
        commit: 90b12a88b710cdc80c00552dfbd589228978bffe
[02/14] ASoC: codecs: Add HD-Audio codec driver
        commit: b5df2a7dca1cc6c66eee0005c92094855dc2028c
[03/14] ASoC: Intel: avs: Add HDAudio machine board
        commit: 97030a43371ea29d65f332d288eb73e8f7bdb3a9
[04/14] ASoC: Intel: avs: Add DMIC machine board
        commit: 6575e5cae7525b07d0b5fbd7d42323363919a867
[05/14] ASoC: Intel: avs: Add I2S-test machine board
        commit: e39acc4cfd9250e7b8ec01897570f3009659c3d6
[06/14] ASoC: Intel: avs: Add rt274 machine board
        commit: e2a4cbf277c4561d01f1aafa3cfafe46bf3feec7
[07/14] ASoC: Intel: avs: Add rt286 machine board
        commit: 1d395ee2e19b33a1008acfc7af186f2851b63d01
[08/14] ASoC: Intel: avs: Add rt298 machine board
        commit: 88429ab16df4cd4a1a77d45b90ec95cf62cc22d1
[09/14] ASoC: Intel: avs: Add rt5682 machine board
        commit: 748102786b3ce0bf402c2dc42386cbfaab71ac39
[10/14] ASoC: Intel: avs: Add nau8825 machine board
        commit: 32ee40b5590081a6b38a55e4ab16b47085f93afe
[11/14] ASoC: Intel: avs: Add ssm4567 machine board
        commit: 69ea14efe99b533652255b07a9736a9856f50ea5
[12/14] ASoC: Intel: avs: Add max98357a machine board
        commit: 282c8f8de72f95325225d94caef61f3cc96401da
[13/14] ASoC: Intel: avs: Add max98373 machine board
        commit: 223a0a945821b96f4ccd9940ee975499706e1794
[14/14] ASoC: Intel: avs: Add da7219 machine board
        commit: 6b5b0d6f36dd45e22f1710e8bcd97f28b4ba41f5

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
