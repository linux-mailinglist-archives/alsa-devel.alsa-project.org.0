Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C01529094D5
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2024 01:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C5EB76;
	Sat, 15 Jun 2024 01:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C5EB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718408759;
	bh=NUdjis44A+P8r9hqKdMvkCt7Jj4IXY5URCzPLgFWQaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZiQYQEEkJkg+mSQ1bFmSenGyAJdWmrD27rNZSph9gDzkQEdeH3+nwk517Iq650cIt
	 KE3sQiGpJxrxlzGpFPQl67pd2ai8tgroowE9o86DIIe5+t3+injH82esQM3u1/TM6Q
	 gTPiybybJTJfUEN7NakZckRiQrc2ZRtuDbAs7VdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907F9F805A9; Sat, 15 Jun 2024 01:45:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C87E2F805B1;
	Sat, 15 Jun 2024 01:45:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92EA8F80448; Sat, 15 Jun 2024 01:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF680F800D0
	for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2024 01:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF680F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ib6YR8D2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A3C562023;
	Fri, 14 Jun 2024 23:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C877C3277B;
	Fri, 14 Jun 2024 23:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718408621;
	bh=NUdjis44A+P8r9hqKdMvkCt7Jj4IXY5URCzPLgFWQaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ib6YR8D2txQiOT/1hRIvvDZQ4hkUJFGvlV3KKqIQaHAvtz8nm0BrTvpSBeGizAi+m
	 WIdeZ1Y7IwOGA6iCN2xDI5OnhqGe3SJ6atAfU0Lepvf41WEqDQG4U0kQgXYuScpMj+
	 yd2nF7kjKdcWsokxaijDY/9/TBvqYh5W7lvqPma6Bd4U2iyrUZqFv3+2kjvm+HfK2L
	 D+AXpycj2Xr+o5He2j5HIdeOVlkSWtNj72S4T3Pfk/Htd+/XP/lCzmNMw2SO2RZXgW
	 oXECI3/UbArOGz0Ynr6XLoO74xYoXgPUfQXlOq35h751xqvrYWh8EFQNKE8oNMu/Y4
	 lMJG+hB5LdvuA==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: dmitry.baryshkov@linaro.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
Message-Id: <171840862015.307440.8711592846059609297.b4-ty@kernel.org>
Date: Sat, 15 Jun 2024 00:43:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: QNHKHNALCEF5GZJEHSMGZ2CUYBC26EKB
X-Message-ID-Hash: QNHKHNALCEF5GZJEHSMGZ2CUYBC26EKB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNHKHNALCEF5GZJEHSMGZ2CUYBC26EKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 13:13:05 +0100, Srinivas Kandagatla wrote:
> There is an issue around with error handling and graph management with
> the exising code, none of the error paths close the graph, which result in
> leaving the loaded graph in dsp, however the driver thinks otherwise.
> 
> This can have a nasty side effect specially when we try to load the same
> graph to dsp, dsp returns error which leaves the board with no sound and
> requires restart.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6apm-lpass-dai: close graph on prepare errors
      commit: be1fae62cf253a5b67526cee9fbc07689b97c125

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

