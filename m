Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B216D8208
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 17:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B351E7;
	Wed,  5 Apr 2023 17:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B351E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680709006;
	bh=6uAUWj2LjSDCaYsVxyfHMXJlEA0t1d2IhrhQy8FrHuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6HfXsQjdhZFHRV9Jzgg2Ow3KXlPTL3wwKIjz0MVvjfzaLJ+LCy4NYvT7dV4VMiUi
	 XVACxDpqntdZazlmq9RI5yYw/4mT1bRfRTOkdvs2Ja2v+kURukTM2xt8vy1PbEoOxc
	 jm6BqX3hq6KuLSGJ/j3Vrs7/EpXsnEy12ikSAK1A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C480EF80249;
	Wed,  5 Apr 2023 17:35:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ACE8F8024C; Wed,  5 Apr 2023 17:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95624F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95624F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HVoiwecb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69A4862717;
	Wed,  5 Apr 2023 15:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54024C433EF;
	Wed,  5 Apr 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680708947;
	bh=6uAUWj2LjSDCaYsVxyfHMXJlEA0t1d2IhrhQy8FrHuQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HVoiwecb/ThJcarG7UDJjrvvROgxnPz/ognPPc1RBNKoPeeST9cdr2W2FgiqYszSR
	 HBbtbQ71iJrM08dQH6NvGoSyOp9AkJpj5PHK4wIajCRfhboSf8iedtzNvQ6UEm7j7N
	 PzNjMsVw0yE+txn3X23xc4wZQQvTsedwqK48NiuJHI/IjoerKsjBC+IJq23Ieuaqs+
	 3VwrO4z8gKbRH66PYq+ZI8u4dfIbRZ164Nm7p44jSiMEDd6SKQ6eXfAKB6R26Avt/f
	 eWiCUIymEPeXPIZOMmFtNeBiXwt/AETiUyHKjfdx0pvRgkkb+U+BwmEyytOj5RHvdf
	 ak46V37jyWxIg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH resend 0/5] ASoC: clarify Codec2Codec params
Message-Id: <168070894705.71826.16313725811061177061.b4-ty@kernel.org>
Date: Wed, 05 Apr 2023 16:35:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: GGIRZGPO4H33YVSRGZFXVEXESCQGDCUW
X-Message-ID-Hash: GGIRZGPO4H33YVSRGZFXVEXESCQGDCUW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGIRZGPO4H33YVSRGZFXVEXESCQGDCUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 02 Apr 2023 22:59:13 +0000, Kuninori Morimoto wrote:
> ASoC is supporting Codec2Codec, but its parameter name is
> "params" and "num_params" which are very unclear naming.
> 
> This patch-set clarifies it by replacing to c2c_params / num_c2c_params.
> 
> Link: https://lore.kernel.org/r/87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc.h: clarify Codec2Codec params
      commit: 7ddc7f91beb285246e926e3adf0b292b071aea33
[2/5] ASoC: audio-graph-card2: switch to use c2c_params instead of params
      commit: a1cd7e8017aabe4dded887dcca30e126ec2753c3
[3/5] ASoC: meson: switch to use c2c_params instead of params
      commit: 433f4a1697fae78c34377de1ef3abd26aec8214e
[4/5] ASoC: samsung: switch to use c2c_params instead of params
      commit: e7a73b05542d82e209af450dd90b730255f6e775
[5/5] ASoC: soc.h: remove unused params/num_params
      commit: 1ea63f29c27712d6b9c45af67cd71299d849c5e3

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

