Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539C6EAEBC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043D6E89;
	Fri, 21 Apr 2023 18:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043D6E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093370;
	bh=AQz/ygcuCJEP8Mt00swsFBF3E+MDJ4NXhhrFqWZoUcY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L1UCNYmTm6PcsJ3bSQe/2zzUamcTnNNIRafseFnnyHpqOcWRRCmKv4tD1bnvzwntK
	 5HnzByQwBcI+rT+cWKUh81hzCn4hTCo5t/RzyfG/9EtElGVpjRbHuBUieVfimw3Hhr
	 JT62mPc6++/vRxhEmF7CI+NDgqz/Buu6vOOEHe/s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94055F80568;
	Fri, 21 Apr 2023 18:06:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B02F4F80558; Fri, 21 Apr 2023 18:06:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CF074F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF074F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BnH5+19G
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 523986518F;
	Fri, 21 Apr 2023 16:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859D5C4339B;
	Fri, 21 Apr 2023 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093196;
	bh=AQz/ygcuCJEP8Mt00swsFBF3E+MDJ4NXhhrFqWZoUcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BnH5+19Gczz1f2QWgEorzd7Bw9V8wzoTNPpzneaUJc16F8U5SxCq37d4p6a5CbCqZ
	 ChEsqGP9BYCUgTfRRA+3uOqhieK+bfqquSzFg1q8uB7Ue8ffOI02+4TOGUrIxwMqws
	 Gs0mwF2giYS1+gk9KM8TQ1axpfDBhl34nxXqdamcXYJAq/uSWnzXjhUIE3ueCtRDSj
	 fgJQedEIePu2YcGIcWLRzsuBvFIJ7dwvovkR1BuYsI0KRInvcLljHFgmuj8Iz7lDuB
	 6nu9mi21gDuow0RiBdFOmeAmhdZX9bT3beZDtOGXNnGnkH+Jm5ZFoEVnr76hY9BNDI
	 HhINd5dfPFt4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
References: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: pcm/Intel: Pause-resume improvements
 for IPC4
Message-Id: <168209319527.108546.203024989311525283.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: T2PY6SYI2T5A4ZK5ZEJVKC6OAZXI2UZ6
X-Message-ID-Hash: T2PY6SYI2T5A4ZK5ZEJVKC6OAZXI2UZ6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2PY6SYI2T5A4ZK5ZEJVKC6OAZXI2UZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Apr 2023 14:41:35 +0300, Peter Ujfalusi wrote:
> last minute patch for correct the pasue/resume operation with IPC4.
> 
> The issues are hardto reproduce and needs extended stress testing to be hit, in
> which case the audio breaks due to DMA errors.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: hda: Do not stop/start DMA during pause/release
      commit: 3e94369729ea8a825cf8bf304bfb1749de62ebf4
[2/2] ASoC: SOF: pcm: Add an option to skip platform trigger during stop
      commit: 6d0a21dd95c349bbe3663a4870ff7e70ddc6c9b6

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

