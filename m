Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619770F546
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC336C0;
	Wed, 24 May 2023 13:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC336C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684927810;
	bh=7Q2toi92kbc3u6MrXrJck4rE1II3ijn0ylZFuZ8InwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=puZsmUxRlBbZIazlR8oQBXWB1i65/JWK/JrZDpyYYQS0lQ8OF0DrCHiSQoJoK6yLp
	 0R4+e5cGPxb2ixR8ghBpcqTAbAWN4/wLudw/VdXEQCeKTfnNX8RRblswfN3pbOvQ4/
	 jnTlhUmNdfNr28AHDxQ1OPAzqxQAlXaDFqlIR978=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A40F80553; Wed, 24 May 2023 13:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5995F8053D;
	Wed, 24 May 2023 13:28:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 345F1F80249; Wed, 24 May 2023 13:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0FA1F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FA1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iUKGc7rr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3083C63C59;
	Wed, 24 May 2023 11:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEB3C433D2;
	Wed, 24 May 2023 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684927694;
	bh=7Q2toi92kbc3u6MrXrJck4rE1II3ijn0ylZFuZ8InwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iUKGc7rr6VMrE0d3hPc03v/qzZocxq2fzPdwFK+cQZZlL6vsLPB6vvS4XJ1rAsdCc
	 eIFYUXwuH4OPNnhX4/GbLa1y7WMm2r1+WkOX7PjoL7g9ejW8AfVSWfbesHF9cjlbfq
	 P/mXAhxwTiIQQ8O8IbIfgI7IZM5Qc+wkXkq3k64nRXqsrONojUxnfRHLfaMpTSnDkE
	 KruzlueoqeUh2ApIbLR6tWGZnfB06z2JsuyF3UHMuSRH0bA1Akl+N4ar/mKtjVcHPs
	 pKhNLiFy+aRjwEZdRo0bj3r2JwIOJcys2CWVT3myYx6rixCJAQshHYLOR+HT9neG8g
	 ppJFxrzaf4BNA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20230523165414.14560-1-srinivas.kandagatla@linaro.org>
References: <20230523165414.14560-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x-sdw: do not set can_multi_write
 flag
Message-Id: <168492769255.49784.5898976665110689198.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:28:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MEPOHEG4ZOXKTN6VT3FM5H74QKXHSA46
X-Message-ID-Hash: MEPOHEG4ZOXKTN6VT3FM5H74QKXHSA46
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEPOHEG4ZOXKTN6VT3FM5H74QKXHSA46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 17:54:14 +0100, Srinivas Kandagatla wrote:
> regmap-sdw does not support multi register writes, so there is
> no point in setting this flag. This also leads to incorrect
> programming of WSA codecs with regmap_multi_reg_write() call.
> 
> This invalid configuration should have been rejected by regmap-sdw.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x-sdw: do not set can_multi_write flag
      commit: 2d7c2f9272de6347a9cec0fc07708913692c0ae3

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

