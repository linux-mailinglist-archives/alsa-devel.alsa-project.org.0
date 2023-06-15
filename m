Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCA731942
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11E66C0;
	Thu, 15 Jun 2023 14:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11E66C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686833681;
	bh=jjQPD3Rd3TRkAAFucYVz3Qi1gC6lAoRcvE6Yq5DHQW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f4N+daCvhPVsw8SmYPf5HxXdMwYattLyj9n3wbgqClYyRC2pYHSFzoDRHnrrbqNo3
	 M+XreaJW8My0RI0RXywG1lxyFhKSD6iJvCqN+Tbyozf0VHx3T8Av3RcQk8bDmU3TzL
	 qPT6gwg/hzK9I5W97IfRyocZOt7EiDyLdq9+fMsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12481F800ED; Thu, 15 Jun 2023 14:53:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0247EF80130;
	Thu, 15 Jun 2023 14:53:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9054AF80246; Thu, 15 Jun 2023 14:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5452AF800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5452AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FwB8XfAx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF72561634;
	Thu, 15 Jun 2023 12:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8670EC433C0;
	Thu, 15 Jun 2023 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686833592;
	bh=jjQPD3Rd3TRkAAFucYVz3Qi1gC6lAoRcvE6Yq5DHQW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FwB8XfAxPhaae2u7ft+pYqNleYN8P9d+9WBjKrJRw1uwEwbryzFnXK+slOkQ2jlZh
	 dXLO+oPexijqDa6L+dAVLiE7efA3ublAZxUXhE3d5Sj7YF+NOZKtH/sZ2ucgzWlnEr
	 Z3UPZfG7zgntaRv8gT5Y33JVXIrioWeL37uE7OzHz/LrPrhfw9BUzBTjv72ObOj6PC
	 VKU1nwCMC+c0TZ2HBabR0ov7n/39vj/OvcRH4dWt53dGk/OZ4CIltXLCVL3mDvSwUk
	 i5tdQnaVpGOBNbudKZSAB0HdGosO/cLPdHEiaFWSHIrrD93wYbvAL41z6bTgQI7cyc
	 wNjZ3CBLXR2lw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
References: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
Subject: Re: [PATCH 00/16] ASoC: Convert Realtek I2C drivers to use maple
 tree register cache
Message-Id: <168683358998.543460.7392476219485838823.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 13:53:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: A62KJH7MQNWSEP6HCXPCPLFJTHYQFP6R
X-Message-ID-Hash: A62KJH7MQNWSEP6HCXPCPLFJTHYQFP6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A62KJH7MQNWSEP6HCXPCPLFJTHYQFP6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 14:57:46 +0100, Mark Brown wrote:
> Many of the Realtek I2C/SPI devices only support single register read
> and write operations so don't benefit from using the rbtree cache
> instead of the more modern maple tree cache, convert them to maple tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: rt1011: Use maple tree register cache
        (no commit info)
[02/16] ASoC: rt1019: Use maple tree register cache
        (no commit info)
[03/16] ASoC: rt1305: Use maple tree register cache
        (no commit info)
[04/16] ASoC: rt1308: Use maple tree register cache
        commit: 4f69e29ace9dce5f8226bfc99b77b8497d3d3d79
[05/16] ASoC: rt5514: Use maple tree register cache
        (no commit info)
[06/16] ASoC: rt5616: Use maple tree register cache
        (no commit info)
[07/16] ASoC: rt5631: Use maple tree register cache
        (no commit info)
[08/16] ASoC: rt5640: Use maple tree register cache
        (no commit info)
[09/16] ASoC: rt5645: Use maple tree register cache
        (no commit info)
[10/16] ASoC: rt5651: Use maple tree register cache
        (no commit info)
[11/16] ASoC: rt5660: Use maple tree register cache
        (no commit info)
[12/16] ASoC: rt5665: Use maple tree register cache
        (no commit info)
[13/16] ASoC: rt5665: Use maple tree register cache
        (no commit info)
[14/16] ASoC: rt5668: Use maple tree register cache
        (no commit info)
[15/16] ASoC: rt5670: Use maple tree register cache
        (no commit info)
[16/16] ASoC: rt5682: Use maple tree register cache
        (no commit info)

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

