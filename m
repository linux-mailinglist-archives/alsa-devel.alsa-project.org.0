Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A06E51DE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 22:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E1CDEE;
	Mon, 17 Apr 2023 22:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E1CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681763323;
	bh=f5WmfpzL8IKLAgdbpNwv/8PyUKUYDvOrFroiYuwRsVg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aRYMo2yNlAVc+iQjp41axVURqbRu15ja0yhB9OyD4/wPrVEpYJVOBzXRvgZT0l+ra
	 Yaj1DGmAbksiMmNCeONcRRlOQhnT+5UFLdFjEzPVby1JnXvvqJC5Zv0UpMXKus+/Q4
	 7dbtfZWH4lpmZZIkWT4STLUOWktcM+m86zcI6Jp4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 561F9F8025D;
	Mon, 17 Apr 2023 22:27:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A06F80266; Mon, 17 Apr 2023 22:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9794F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 22:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9794F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gf2wLhb+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F04F60BC3;
	Mon, 17 Apr 2023 20:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04660C433D2;
	Mon, 17 Apr 2023 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681763262;
	bh=f5WmfpzL8IKLAgdbpNwv/8PyUKUYDvOrFroiYuwRsVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gf2wLhb+ale7Pra5hMLANyXZzrTRGIcwy5FNCGzsmxPpZLXC7Np0Ndu45JjgbFPLf
	 f4dIS4xsCNstsPg/ua8zCRylp6htgrnlzHne0O5hvcwEaIOnjlK2KNGdembYXeaqyt
	 n0oXoLQjJDVcCQ+8mxHxLhOitR3ItKEm4QX3xFbNaoh7GiTC9re2n2ww9x5c/HI9BV
	 lUWtwD73Maj4RRdIsiZE9UdFDISvoQRSniWYIWT9PT2xOWHI1+p2vlTxGV7DM11hSj
	 fX4X4N0spQR39CUb818wmPQoxthqdX+rV7y3qr+jxTDdwrzXm5V+iBW5556P3fyWEF
	 VcBKFjxc69j+Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ASoC: cs35l56: Code improvements
Message-Id: <168176326169.1296984.12735339184719682836.b4-ty@kernel.org>
Date: Mon, 17 Apr 2023 21:27:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: 7BKBRFSDXDD4QGCKJFQ73V6ZCS2HFDXK
X-Message-ID-Hash: 7BKBRFSDXDD4QGCKJFQ73V6ZCS2HFDXK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BKBRFSDXDD4QGCKJFQ73V6ZCS2HFDXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Apr 2023 14:37:48 +0100, Richard Fitzgerald wrote:
> Various code improvements. These remove redundant code and
> clean up less-than-optimal original implementations.
> 
> Simon Trimmer (5):
>   ASoC: cs35l56: Rework IRQ allocation
>   ASoC: cs35l56: Allow a wider range for reset pulse width
>   ASoC: cs35l56: Wait for init_complete in cs35l56_component_probe()
>   ASoC: cs35l56: Remove redundant dsp_ready_completion
>   ASoC: cs35l56: Don't return a value from cs35l56_remove()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs35l56: Rework IRQ allocation
      commit: 7d72351a4ef6e1e763bccc24d43c44ffbe1a1555
[2/5] ASoC: cs35l56: Allow a wider range for reset pulse width
      commit: b82396122b028a07ce2977e3f33123d7ab526d91
[3/5] ASoC: cs35l56: Wait for init_complete in cs35l56_component_probe()
      commit: 440c2d38950f738d7a35d3d29533728e74586d54
[4/5] ASoC: cs35l56: Remove redundant dsp_ready_completion
      commit: 4be476830bf96c0095e4e1acdfc12081aa0fb165
[5/5] ASoC: cs35l56: Don't return a value from cs35l56_remove()
      commit: 9ed4c762e214a6592184d0dd65b6db86ad30e6d5

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

