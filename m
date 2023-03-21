Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9FB6C376C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 17:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7471206;
	Tue, 21 Mar 2023 17:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7471206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679417588;
	bh=JtUlGAZMXgUNcqufA6J7cwV2ToEYYL5jW3Tbh1xClAc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vaszS7ZMLw9r5E5Co1qxo/P3pnosLB1w/j10XC8KXPju0Mme0xQi5QfkjLRl+1zEV
	 Ez81NHdDblv4IAh/ZP3q5CTxy3B88YtibC9yhKUsm+bb90vxLo5XbaYEKGFkKfDS+f
	 luS7B7/jWmd+viuknqjTx4RxpHevqYK5SWgoe2ew=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65244F804FE;
	Tue, 21 Mar 2023 17:51:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3465F804FE; Tue, 21 Mar 2023 17:51:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 724E0F8027B
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 17:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724E0F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tOzkW1uN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D858BB818E5;
	Tue, 21 Mar 2023 16:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D963DC4339B;
	Tue, 21 Mar 2023 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679417466;
	bh=JtUlGAZMXgUNcqufA6J7cwV2ToEYYL5jW3Tbh1xClAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tOzkW1uNUz1v7Go4gsYwSzpYycomUajHGJIl3lGZelBbAe8TZo6TQTxapIiWJfLO8
	 SutzO7dH/M/pPQhsQovO4TeBJSUSqZj5m53q2/INCFKcOAPUtIkTyU9SLDd+stfnti
	 TSYiK/Ql8hrWS8LrE4Hq+HQNy8OFA0Vuiv+3ShLxVW6qHrqNv9puJxc4Sz7db9jyLM
	 pAQHFjhA+xHJgKAUF/Tuudq+cjPnCQERU1AKRVlB5EJWbIv4LVODb6NdH0lPZie8cD
	 h6OV6+nSDFsRX6sCl47QgBzCpFiEreaqQ4bg/H+qSIgz3M6wgHGggcLLOVPzibwK8U
	 FhinZRHsORQGQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
References: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/5] ASoC: cs35l45: Support for GPIO pins
 configuration.
Message-Id: <167941746356.67241.8098477595420536001.b4-ty@kernel.org>
Date: Tue, 21 Mar 2023 16:51:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: MFWSS3TY25NSB2TPBZUUZMRIRLCBIUA3
X-Message-ID-Hash: MFWSS3TY25NSB2TPBZUUZMRIRLCBIUA3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFWSS3TY25NSB2TPBZUUZMRIRLCBIUA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Mar 2023 10:47:18 -0500, Vlad Karpovich wrote:
> Adds device tree configuration for cs35l45 GPIOs
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs35l45: Support for GPIO pins configuration.
      commit: fa8c052b4c614aa1d2d60e5c9f40e9d885bf9511
[2/5] ASoC: dt-bindings: cs35l45: GPIOs configuration
      commit: c6cec088ab037b57e08e0694e2b150b1b034826c
[3/5] ASoC: cs35l45: IRQ support
      commit: 6085f9e6dc1973cf98ee7f5dcf629939e50f1b84
[4/5] ASoC: cs35l45: DSP Support
      commit: 74b14e2850a34740c121cf2758d4181063d4c77c
[5/5] ASoC: cs35l45: Hibernation support
      commit: 6c07be8fe92c6b0c24ee1c599601dce3506b83c7

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

