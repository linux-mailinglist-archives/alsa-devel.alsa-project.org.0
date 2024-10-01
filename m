Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF698C4E1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5754D741;
	Tue,  1 Oct 2024 19:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5754D741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805295;
	bh=an7wYpPqt2R7TgWMl+pfDAOwZGn/V/Z9kjfDwk8AGtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lk5OEFRRFqnodGz6nK+D61IeYQ5PMWSc9lDUZKCZSTKN8osmrxQmNDTNps4Blr+pl
	 PdH03Wmfba+wNcmOtDyx/aEQxszFhP8B0aNy48IRCCZ/svGXA/txw1AFM/yyTD9XQp
	 xLWoLqGHO/9/c313fyZxhYZrq28gumY+bPynCSxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A971F8062E; Tue,  1 Oct 2024 19:53:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73265F80640;
	Tue,  1 Oct 2024 19:53:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92EAAF805E8; Tue,  1 Oct 2024 19:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0165F805E6
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0165F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cUdghwbc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A7F75C54D0;
	Tue,  1 Oct 2024 17:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DFFC4CECD;
	Tue,  1 Oct 2024 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805200;
	bh=an7wYpPqt2R7TgWMl+pfDAOwZGn/V/Z9kjfDwk8AGtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cUdghwbcOytt1+ZkD7mUFJTbf/S5CMvNfpMdxCoMCRjb3Gib8E0qpdGuw420cw4SJ
	 H5iuDfEMa6Hu5CC6IhlEnYXq+dydv+v7X5cXQASyim/FHy0AlkOen/bBGH+A95+lse
	 boaoG5uvecAMEuVuoox0RlBGUdUbh9PZkrp6rfcZHDS6qizBPnFQjvLg/UETTWPSoD
	 /mQwjT21NzQLvLGAFOJFeN2ZDaSKupMHZkgfaahikJL5F2EeMXPZssXYv6H+E9+GoZ
	 oKDEzufB2pjrOMgzxh38CbZvRgQuGYEQkCqj6O2ciglGUl/OpJvNv/soOV7FwE3LR4
	 bvMHn35L2HYbw==
From: Mark Brown <broonie@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
References: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
Subject: Re: [PATCH v2 0/2] {ASoC,media}: constify snd_soc_component_driver
 when used as read-only
Message-Id: <172780519475.2298697.14049924817371991791.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: C5CL7QPQM2KYPXTQXLI4HJKTORV3JCD5
X-Message-ID-Hash: C5CL7QPQM2KYPXTQXLI4HJKTORV3JCD5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5CL7QPQM2KYPXTQXLI4HJKTORV3JCD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jul 2024 11:37:36 +0200, Javier Carrasco wrote:
> Declare `snd_soc_component_driver` as const to move their declarations
> to read-only sections for the drivers that do not modify the struct
> after its declaration.
> 
> Apart from a single case under media/, the affected drivers are members
> of the ASoC subsystem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] media: i2c: tda1997x: constify snd_soc_component_driver struct
      (no commit info)
[2/2] ASoC: constify snd_soc_component_driver struct
      commit: 8adff2ff73d8271c993549b106b26f301fa003cf

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

