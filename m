Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32A6A1D96
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 15:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F6320B;
	Fri, 24 Feb 2023 15:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F6320B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677249669;
	bh=LKmVV0m6xGyLG9qE93DqqAXhRUxqCXETgLzJaRz2uEQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WdgBrFvHiYREjqSRj34OftPm+AC5+s724Wxjms4g5oBDC3pGyYRPTXLjDges0B7aJ
	 YB5Wo5oEeR/VlNai1K4ufe4fdAEddeTb6MIyWu2z63GaGNhuM7MXN9ddNriBxIIrSO
	 9CTVWdVpkA+Klgen4YsfJCcPPdoeEj/ouGIuwCvs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48999F80116;
	Fri, 24 Feb 2023 15:40:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 863BEF80125; Fri, 24 Feb 2023 15:40:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02513F800C7
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 15:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02513F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YNyr027Y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45C1360D30;
	Fri, 24 Feb 2023 14:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62889C433AF;
	Fri, 24 Feb 2023 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677249603;
	bh=LKmVV0m6xGyLG9qE93DqqAXhRUxqCXETgLzJaRz2uEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YNyr027YCSQ30Cqc/OruICX9b+A9PLrgMrQ2vP6dnooxyqy/S70ESJ1nQo3jE7wKz
	 GtFROuSpuP0GnU+GuFK8XcTO5dzPNGB0MhOitaM8zlsHCM4VdsCiqp1NkiES5FM34P
	 oPDGXHZKGEbCCs518hWt97A7kaSfsL8op3IzEAAY8XEn/mx60DfJXwZlfw1YhD1ZIO
	 GKDhoZgkjnwRHrnoR7DUn0jkO0X5fPSylVav5d4c8HzHDwlcWgrXFgLJMUOjI+YxkF
	 I8d0R1mgopVQAPh0kioXuBpnkbERcl8trDVHnXOi6mNKNMEHhDJWDYU76BrfElhodb
	 HInfPBrHXtf4g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
In-Reply-To: <20230224104551.1139981-1-nuno.sa@analog.com>
References: <20230224104551.1139981-1-nuno.sa@analog.com>
Subject: Re: [PATCH] ASoC: adau7118: don't disable regulators on device
 unbind
Message-Id: <167724960093.39105.176831330034376421.b4-ty@kernel.org>
Date: Fri, 24 Feb 2023 14:40:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
Message-ID-Hash: GMO3YMQCZYOEOAPGJGOM6DSZIQ4MJWCB
X-Message-ID-Hash: GMO3YMQCZYOEOAPGJGOM6DSZIQ4MJWCB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMO3YMQCZYOEOAPGJGOM6DSZIQ4MJWCB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Feb 2023 11:45:51 +0100, Nuno Sá wrote:
> The regulators are supposed to be controlled through the
> set_bias_level() component callback. Moreover, the regulators are not
> enabled during probe and so, this would lead to a regulator unbalanced
> use count.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau7118: don't disable regulators on device unbind
      commit: b5bfa7277ee7d944421e0ef193586c6e34d7492c

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

