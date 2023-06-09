Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD38729901
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 14:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9578B83E;
	Fri,  9 Jun 2023 14:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9578B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686312337;
	bh=YsWnf1FopHn7KWjdE5iAPcxo4TT2Yn9z9cA89MtOOvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hSXHdQvNgBJ3TOs/t/6MRkCE9nm3Eq8qggKbxBlQz1PIFlI0fegmoN9UJkEliaKbs
	 PtDGjiUgPp1ZfZaR8AZyChXAh+NFfHeXQkbtIu00By8WWwbA/K2SfNji5o9u/Jb2Be
	 lw6P1Gtw5+GfPEI+XeAVzFS8i1WoXd8DCGha2msw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E72CF8057A; Fri,  9 Jun 2023 14:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02B34F80579;
	Fri,  9 Jun 2023 14:03:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8969EF80254; Fri,  9 Jun 2023 14:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA78BF8016C
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 14:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA78BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m8JpU8Y2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CAF160C0F;
	Fri,  9 Jun 2023 12:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631D8C4339B;
	Fri,  9 Jun 2023 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686312197;
	bh=YsWnf1FopHn7KWjdE5iAPcxo4TT2Yn9z9cA89MtOOvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m8JpU8Y243ld0lalorof5UWS+DnwbHjUZpGsc2dSn/omWS7umFZKlik0QIhNxG/sh
	 nc/7dB8aqydCLuVDZ2Nw4nAjaOWZUOnmFhAcs2kJwWW3/G8Ueh39ZyfE8gHkmzNoxf
	 /2/ZvyDqR4e/OlO1x41QCobrFUhk99kjJgqLoLs1pZQEyOocm+07qcboCNjDnqtsEO
	 wIC3Ps3P1XfxaDh3fsZIBeiAf3/XH/ZlDK/l2gRz9GuFcenxr5yn74zQKK5X/zTSh1
	 65TKAUk+vxUa1dfTpJB7XZMf+3x4e44ZxcypZd/C9WSB4b2IQSXbL4DOTZBSqAlYgd
	 RzWYarJ1pE8Lw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87ilbx1kh3.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilbx1kh3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2-custom-sample: add missing
 CPU:Codec = 1:N sample
Message-Id: <168631219712.40482.16853969366597236029.b4-ty@kernel.org>
Date: Fri, 09 Jun 2023 13:03:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 35C6NG5BI7Z244VIQXXB5AF43VVJE7WT
X-Message-ID-Hash: 35C6NG5BI7Z244VIQXXB5AF43VVJE7WT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35C6NG5BI7Z244VIQXXB5AF43VVJE7WT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 01:40:41 +0000, Kuninori Morimoto wrote:
> It has CPU:Codec = 1:1 and N:N samples, but missing 1:N settings.
> This patch adds it.
> 
> One note here is that because of registering timing, probing and
> CPU/Codec numbering are mismatching.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2-custom-sample: add missing CPU:Codec = 1:N sample
      commit: ca27441efe696a8990858156c6c332e786c30b4a

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

