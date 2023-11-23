Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA6C7F6537
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 18:19:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DECA839;
	Thu, 23 Nov 2023 18:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DECA839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700759992;
	bh=EvzPaWl4rEWWAqN92zDuxih44+QveIo6CQqfvVtHmxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KuB/P2OJRxcBp25IEnGuOXjLkEGh9N+LANf90MlHD38ougc8vA0KEEvRyBgjMrarS
	 Uh+zT3KsFNHoySBr2TFN0oFnS6hdqKP8VwPIey3oUM9/Rp6fnIIYBrX7XiA0CERfDj
	 KE2iEzqncVXOTDbXl4TYePjk4QWe9p1ZL0h2INaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5FA2F80551; Thu, 23 Nov 2023 18:19:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A720FF80578;
	Thu, 23 Nov 2023 18:19:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14866F80249; Thu, 23 Nov 2023 18:05:54 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A9CFF80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 18:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A9CFF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ut51JJ2B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96292CE2B3B;
	Thu, 23 Nov 2023 17:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9510EC43397;
	Thu, 23 Nov 2023 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758802;
	bh=EvzPaWl4rEWWAqN92zDuxih44+QveIo6CQqfvVtHmxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ut51JJ2B31MOyFR3mR2gsVC1yQJUTnd2mInxrcNp6lXSoTIHMr6anHzBixsognlP/
	 ATUOchYc+UKMA3zGAjkvppOWxiokiEu+uYPaPnrIONO3YRtkruLyAPzVSPfE7AbIC+
	 9lUSCrewRfLkLgcJuUdg7g/PTXgt2KrVVWoa5opbf1RM6E64gBDR7zT+JWZs5YZrhP
	 K2P4DYJMZ23yHKAv4XGHHdTH2RgRZlq58RuieGmAJDlewM/gSB95zR8oInLZOGVoco
	 ls0t1bfjcfvhoZi46iN1OJXzxbMkEhK8YevIhDGzFxvEDtJZX+2Go4raS8IAfTKBeg
	 SX/kMRMjp42TQ==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
References: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v5] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-Id: <170075880043.2448402.15081787699005605640.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: XNYHVJMANBWHGWLV2RPKG6ZO45KJO6OU
X-Message-ID-Hash: XNYHVJMANBWHGWLV2RPKG6ZO45KJO6OU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNYHVJMANBWHGWLV2RPKG6ZO45KJO6OU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Nov 2023 09:06:58 +0000, Maciej Strozek wrote:
> Add a polling mechanism that will keep the driver operational even in
> absence of physical IRQ connection. If IRQ line is detected, the driver
> will continue working as usual, in case of missing IRQ line it will
> fallback to the polling mechanism introduced in this change.
> This will support users which choose not to connect an IRQ line as it
> is not critical to part's operation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Allow driver to work without IRQ connection
      commit: fa91703dc2e010e48a230dc92967cb5ae23f8680

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

