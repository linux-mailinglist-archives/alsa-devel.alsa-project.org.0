Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EB825B1D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 20:33:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB84E9A;
	Fri,  5 Jan 2024 20:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB84E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704483216;
	bh=CE7UjEaDI5KMulL1/tLDiQr0CWV92dV7m9QiTsWAdrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cEMeciWcnk74hS5tL7CKnRpaJTNk/3klxR7s8YPtrs6A4epsfdUm8969sAHqnQGX4
	 0kbK4zp+pCmIoC115Nlvsd6iI82tyDLaLB/ypPiWaeV3a93YtLOHuv5kmUw48R6+qI
	 jm4pVed54ttiXQrjORfVMnClOjkvXvXxBSdy4XDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF339F8057D; Fri,  5 Jan 2024 20:33:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25FD2F8055C;
	Fri,  5 Jan 2024 20:33:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BEC6F804B0; Fri,  5 Jan 2024 20:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E549F80238
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 20:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E549F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sYb0c6/9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB2AACE2002;
	Fri,  5 Jan 2024 19:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BF3C433C7;
	Fri,  5 Jan 2024 19:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704483163;
	bh=CE7UjEaDI5KMulL1/tLDiQr0CWV92dV7m9QiTsWAdrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sYb0c6/9+4SJRNj0rSrQJokQoxVGDDQ4v12DrEd9BEc2614Sp3o3hdmnsFEzlUzyr
	 2zam8lIhRG0w9pBRy8vOo7EBUCESyp4gZcqsoILwvBKxlCVy4eU3rvQPKV7P8vx9EH
	 IX2GXRZM06D9Oe8l1Rgbjaa/a/RjxRBuFZE6aJLs9UeLbT45Qt3Rxy+NqxE+IDPTFS
	 wV4fVywlSZwWBNxqCcFe7MJjlD9Jx1kh+LvBjaqdareEf8iPtIjmqIVq4u94sAaVhR
	 Cayg+z1vwxXpH5faIE+B6vTBgC8kha+nyCsaP5ySbXf64gijZQiR5OKXYltuF21BGO
	 r0VMAl4VxcfNA==
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1703813842.git.cy_huang@richtek.com>
References: <cover.1703813842.git.cy_huang@richtek.com>
Subject: Re: [PATCH 0/2] rtq9128: Fix pm runtime and TDM usage
Message-Id: <170448316228.816841.3370890831614540620.b4-ty@kernel.org>
Date: Fri, 05 Jan 2024 19:32:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: FQY26PHIEJYVQ55JJLSYWJ6OJAJ7UT3I
X-Message-ID-Hash: FQY26PHIEJYVQ55JJLSYWJ6OJAJ7UT3I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQY26PHIEJYVQ55JJLSYWJ6OJAJ7UT3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Dec 2023 09:46:00 +0800, cy_huang@richtek.com wrote:
> This patch series fix rtq9128 pm_runtime and TDM usage.
> 
> ChiYuan Huang (2):
>   ASoC: codecs: rtq9128: Fix PM_RUNTIME usage
>   ASoC: codecs: rtq9128: Fix TDM enable and DAI format control flow
> 
>  sound/soc/codecs/rtq9128.c | 73 +++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 32 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: rtq9128: Fix PM_RUNTIME usage
      commit: 35040410372ca27a33cec8382d42c90b6b6c99f6
[2/2] ASoC: codecs: rtq9128: Fix TDM enable and DAI format control flow
      commit: 415d10ccef712f3ec73cd880c1fef3eb48601c3a

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

