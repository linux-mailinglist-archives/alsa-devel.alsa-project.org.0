Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFEF708E62
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 05:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AD6B206;
	Fri, 19 May 2023 05:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AD6B206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684467289;
	bh=8FZuxtdcNDCBpb+eqQE7LLSk7QkrZ4DcK9YO3sDCf6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WbnlRNLdehlklXFjREcl1rb3nl0Soyy01dMESys26JHMOSNMy8KlNtLrWDNTpHQfA
	 wCcB1KWcejqRjrUqw0wqfN67rPd31pBUeKzJLQSAnrKFvd2WxWjCjp2EtQHmXMJbhu
	 ekXxSVY3710SWQl6BSZVgHC+aXGqxCRYnrj7VZj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6745CF80272; Fri, 19 May 2023 05:33:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B9EF80087;
	Fri, 19 May 2023 05:33:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E8CF80272; Fri, 19 May 2023 05:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB240F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 05:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB240F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ff7mHDJC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8F8164371;
	Fri, 19 May 2023 03:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4DFC433EF;
	Fri, 19 May 2023 03:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684467219;
	bh=8FZuxtdcNDCBpb+eqQE7LLSk7QkrZ4DcK9YO3sDCf6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ff7mHDJCzg53BsY+d6W3AMjxG8kUyDmCubT7U1A2qB/kderJeKkvueI/lMKf5bq8D
	 9/S4R1Ze6feAnsZIZcbHWPNRyWSj3TZSNBxEBnZTtuofvOKEoYphTO9cDj8itcRX2g
	 yOGXhG5OLjeC5R8zHTwPtvW7I2Ik7OIvOjRAGs1oa3rQ1Kr088YBzDiiShGR5RgXIN
	 WKgDp51sP8xE853Z8JndYBNu5nz/p0ymFWVJRROJ/xaHtyNAWH+UB1eCTIN9rNXmgL
	 ykcRrLutvDeKvLVS+Bcd0H3vK7er/S6+uR3X0wdQU2i5hWcuwuIh0uUVMTsEi7LpGV
	 4kVjTFHf7mgiQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230518150250.1121006-1-rf@opensource.cirrus.com>
References: <20230518150250.1121006-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] ASoC: cs35l56: Bugfixes and efficiency improvement
Message-Id: <168446721839.559735.6041471929366523184.b4-ty@kernel.org>
Date: Fri, 19 May 2023 12:33:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 2NZVHKUA5QPW5JEE2V2IZF5JNC7EC7ZC
X-Message-ID-Hash: 2NZVHKUA5QPW5JEE2V2IZF5JNC7EC7ZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NZVHKUA5QPW5JEE2V2IZF5JNC7EC7ZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 16:02:47 +0100, Richard Fitzgerald wrote:
> First two patches are bugfixes.
> Third patch skips the overhead of rebooting the amp after applying
> firmware files when we know that it isn't necessary.
> 
> Simon Trimmer (3):
>   ASoC: cs35l56: Move DSP part string generation so that it is done only
>     once
>   ASoC: cs35l56: sdw_write_no_pm() should be performed under a
>     pm_runtime request
>   ASoC: cs35l56: In secure mode skip SHUTDOWN and RESET around fw
>     download
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l56: Move DSP part string generation so that it is done only once
      commit: 608f1b0dbddec6b2fd766c10bcce2b651995e936
[2/3] ASoC: cs35l56: sdw_write_no_pm() should be performed under a pm_runtime request
      commit: c9001a2754528fa5da20e8674b3afbd8c134cc91
[3/3] ASoC: cs35l56: In secure mode skip SHUTDOWN and RESET around fw download
      commit: 1a8edfcffa2803afc0ef3a6a48819230cdbda2c9

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

