Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53571916648
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 13:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883A293A;
	Tue, 25 Jun 2024 13:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883A293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719315301;
	bh=0J08+6yd5i9j/VGiGzoX+5NKF+XEowmODy49szGTeJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p3FeoDn5YsFjgWbXLMGgEud8Mj8+vY2WHKuP30ogZpRgG7zTaaX/XE2LnK1Jv9n3V
	 ldLM72qsH0QgrUrcv8e9dXpWM5nuNDLp4gZzfX4zvATReuKoxdhxFLabsc6pdHYnTq
	 phKVxru3HvAfqnvyPSoVhLyqvF2lrXFLlgkHdkoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD1D7F805E3; Tue, 25 Jun 2024 13:34:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA1CF805DF;
	Tue, 25 Jun 2024 13:34:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50673F805C0; Tue, 25 Jun 2024 13:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4C05F800ED
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 13:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C05F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rky4jUuJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADADDCE1A24;
	Tue, 25 Jun 2024 11:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E663BC32789;
	Tue, 25 Jun 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315240;
	bh=0J08+6yd5i9j/VGiGzoX+5NKF+XEowmODy49szGTeJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rky4jUuJRX5vH7kvUdQb+4uSY6SUyeC96rpl7ANLX+Ja+ZAsh6c+CFDNaWD44C4pj
	 oLLZnb1EqzqdhotKogr2+a+EWQG2qUDk9RItHVDlnFUR4NzDaNX/xBWi4U1jAqiwTF
	 XYZ7D+OCk0J2wmj3R3BzBpYZDsNzm1aG961HmoWmG3YH/maIBXrEQgkMYS9E6ixuqz
	 O/mT909aVkibI1Xgo0/MFtVWVlNdhFw9G+0suG7IH8p+B4dzedvrmrfWkhYAMiLIka
	 owqrldX03vZTTkQiiXzGcw1WPbuJWqz/gQryHk2nCjj+AP9KuNduNVsOIjY3/3N9Nt
	 q5IAHYFNROagA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: SOF: topology/intel improvements
Message-Id: <171931523966.64144.7398167268117575892.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 12:33:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: UVHCGJS56W3FNEUAKEZVEHPS26V7CZ74
X-Message-ID-Hash: UVHCGJS56W3FNEUAKEZVEHPS26V7CZ74
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVHCGJS56W3FNEUAKEZVEHPS26V7CZ74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jun 2024 14:15:16 +0200, Pierre-Louis Bossart wrote:
> Two updates for corner cases seen with new topologies, and one
> correction for the number of periods reported by Chrome stress tests.
> 
> Peter Ujfalusi (3):
>   ASoC: SOF: ipc4-topology: Use single token list for the copiers
>   ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input
>     pin format
>   ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by
>     MAX_BDL_ENTRIES
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input pin format
      commit: fe836c78ef1ff16da32912c22348091a0d67bda1

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

