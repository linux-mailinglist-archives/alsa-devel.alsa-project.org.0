Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36A8A6917
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 12:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD2C852;
	Tue, 16 Apr 2024 12:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD2C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713264833;
	bh=ORzJHukE90c6p0exd6bxeQUjEqrZvTR2VChJYnwV0/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JSsit9/xMBLjGyox9dCojePwVuQQQFJ7sey5vBw6oIGOP0kzohbXpPJ1XJADMnslg
	 ykWGJi7Zv2+1+byrXAVuiqive1wXBvwJJsFyLZSo5gG/GfiJsuxNQZog9JdU7eUGhg
	 DLzRhjpTv/pYRgYKpU3+PeVo8TINDhu9hRtgzVWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF1E8F80571; Tue, 16 Apr 2024 12:53:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23ABBF80571;
	Tue, 16 Apr 2024 12:53:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53A7BF8025A; Tue, 16 Apr 2024 12:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A042BF8013D
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 12:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A042BF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oZkmmSoT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9823CE0E4D;
	Tue, 16 Apr 2024 10:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DB1C2BD10;
	Tue, 16 Apr 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713264655;
	bh=ORzJHukE90c6p0exd6bxeQUjEqrZvTR2VChJYnwV0/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oZkmmSoTSZSqXS8zRaN1PnfQTn4PAXyWKk9cpe8zAz7s9QEJ6+3KQWgOCTD4p4LO/
	 9a2ptGGd9WtmlcpM7b/PR3ZNYjQ1yDa8RCQyySi7FvTkPFiNswA7o1ecBHxSC3BYS/
	 Xji30wUXo/jI8UcxHQ6nwhadTkWfXnoV3d8ep6/Ruih/4BFP/M/nKtbaA3GO4V/ozB
	 sUpOzleF9lnYU3GZYXpDxpEOqI8W2GOlE7n5UKK78TSXmIJfGg5XlQiv93qdIcVPyK
	 ZXyxtzuCI368SdRWPR7HjbBaOt8QWQKigVQeO6OSMUxBtIXJW23NVFMgv+XafR+VfM
	 e2GhOs+iNTxCQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 pierre-louis.bossart@intel.com, bard.liao@intel.com,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <6a103ce9134d49d8b3941172c87a7bd4@realtek.com>
References: <6a103ce9134d49d8b3941172c87a7bd4@realtek.com>
Subject: Re: [PATCH] ASoC: rt715: add vendor clear control register
Message-Id: <171326465306.1672629.12253085432451197854.b4-ty@kernel.org>
Date: Tue, 16 Apr 2024 19:50:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: ODU37RQDLZNYYFNTLXVSELJBJ5ITNMXH
X-Message-ID-Hash: ODU37RQDLZNYYFNTLXVSELJBJ5ITNMXH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODU37RQDLZNYYFNTLXVSELJBJ5ITNMXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Apr 2024 06:27:23 +0000, Jack Yu wrote:
> Add vendor clear control register in readable register's
> callback function. This prevents an access failure reported
> in Intel CI tests.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715: add vendor clear control register
      commit: cebfbc89ae2552dbb58cd9b8206a5c8e0e6301e9

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

