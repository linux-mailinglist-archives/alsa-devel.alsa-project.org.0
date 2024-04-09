Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CE89E624
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 01:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800DD2BCF;
	Wed, 10 Apr 2024 01:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800DD2BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712705765;
	bh=bwhva80xBES8MQgIEVfQ5wdS3dodWnBtOjZWDuGv3Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pcKTISBQ+3d6hfcPfutqsiY9MuDCKoggK+FHupQ0Q1S805DDmEuuQWY05wvJPFVap
	 e1UiVrGVROc+eLoAdrOGMfJv6BnFxAHYpPpvXumr0Ag3y3TqJwBh9Tq0UOrKaKhCmB
	 2Bqv6IJO3OSZQh4MY6N5/xSmwY6GouX5e4sHaNJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A6EF805AF; Wed, 10 Apr 2024 01:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48368F805C8;
	Wed, 10 Apr 2024 01:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 982C2F80423; Wed, 10 Apr 2024 01:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32272F80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 01:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32272F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XW1DaTKc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 827AB61A5A;
	Tue,  9 Apr 2024 23:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B027C433F1;
	Tue,  9 Apr 2024 23:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705651;
	bh=bwhva80xBES8MQgIEVfQ5wdS3dodWnBtOjZWDuGv3Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XW1DaTKcNUzViRiAAvxYTCzJsgBr6wilHWSS0jqIeyOMDa2cYvwXEJp+zSiH4mckv
	 1EbqH3U2D4+WmP9HPnlPMyr/GzpJz9hjAGDifJ/IKXGI/WPW1QSl61la9nVl93QDSK
	 RJJQZE+bf1cdIhhzby064WxpIcJVABUIdd6S/pPt9i896TKQdRJHuoohDJhZJKxKya
	 xTefKr02DOJbmV0FDt54LFfUMjcDJQOu0S1K2DZsM8l8Q5Ga9EIzuZNlp1F3ucZcyU
	 zO1KyNKNxgLuexwK+LgwMOm02FkWJdbbuP5yyzgeN33ZrSCGDx/uPPgKRKhd/f5y8R
	 D3vNgItcWco+Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: misc fixes
Message-Id: <171270565002.199334.309648974862019777.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: HBYRBPPKTJQWSFSTIAXWS23SVUIKWFIC
X-Message-ID-Hash: HBYRBPPKTJQWSFSTIAXWS23SVUIKWFIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBYRBPPKTJQWSFSTIAXWS23SVUIKWFIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 14:41:44 -0500, Pierre-Louis Bossart wrote:
> We somehow missed the default path for DSP libraries for LNL, and need
> to restrict support for D0i3 w/ IPC4. Also add debugfs support for
> firmware profile information so that sof-test scripts can show what is
> being tested.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: Intel: add default firmware library path for LNL
>   ASoC: SOF: debug: show firmware/topology prefix/names
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: add default firmware library path for LNL
      commit: 305539a25a1c9929b058381aac6104bd939c0fee
[2/3] ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3
      commit: 90a2353080eedec855d63f6aadfda14104ee9b06
[3/3] ASoC: SOF: debug: show firmware/topology prefix/names
      commit: 17f4041244e66a417c646c8a90bc6747d5f1de1e

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

