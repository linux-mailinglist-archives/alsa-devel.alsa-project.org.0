Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4464747383
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 16:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B90287F1;
	Tue,  4 Jul 2023 15:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B90287F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688479246;
	bh=Rz4B8MHS9txQmFz0LcpLJ1buoy3ozqfsNNEcFtPbKqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dPhB31EO44lDrCKilMmMgVKf8N9VVrgSCBjTOmlUw/XCr4RfAlpUZE5C3Xqig1Rs9
	 04f6x0fCwdk9+r5wRjfiUSEDzvFV1Bb0v/qjiTlsGK3jNH3egjBv05QE4ZN/JUw4z/
	 jYUImoMs1TRSBCQ56BC8+NZ/DDJTXgD9LhwrmyRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03898F800E4; Tue,  4 Jul 2023 15:59:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 355A3F80124;
	Tue,  4 Jul 2023 15:59:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 071B3F80125; Tue,  4 Jul 2023 15:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91AAAF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 15:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AAAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dU9DnKCb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFC4261261;
	Tue,  4 Jul 2023 13:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A161AC433C7;
	Tue,  4 Jul 2023 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688479178;
	bh=Rz4B8MHS9txQmFz0LcpLJ1buoy3ozqfsNNEcFtPbKqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dU9DnKCbUtQlsSLXuzeuGgmel6qzYFu9wkqmw6ntxqF9XYeh3Vh4Eb9l67a9s6J2K
	 qtPhBaLtyrSyRuIicwn7tX8YgmI7xeBJa1uui19xvDKbjhnmOcLMwC6Rh+WOeVykSW
	 V1xY4UuIn8mm5A+B7f+NM1wx9v/WiWXAKviFkyDlHdd6tt87MVcR2hClDZUdY045jD
	 Dz44o+wGfumCb1StQXr+mzwy1rbGl6dXtoVNKnaN/3ktCf/RZ4T8nd6v14euCkm+1x
	 WQmEFRGCXT5FHTi1B4YjGwyMgMteDjgwqhGl1ro9LTUQwGQHME6NdjZX+bW69Yscms
	 XBPuXhl860tSQ==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230703124701.11734-1-johan+linaro@kernel.org>
References: <20230703124701.11734-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix missing mbhc init error
 handling
Message-Id: <168847917636.48984.6400261777618066312.b4-ty@kernel.org>
Date: Tue, 04 Jul 2023 14:59:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: RGQGRAUZOH6MSA7JPLKFT6SNFW6V7SJC
X-Message-ID-Hash: RGQGRAUZOH6MSA7JPLKFT6SNFW6V7SJC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGQGRAUZOH6MSA7JPLKFT6SNFW6V7SJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 14:47:01 +0200, Johan Hovold wrote:
> MBHC initialisation can fail so add the missing error handling to avoid
> dereferencing an error pointer when later configuring the jack:
> 
>     Unable to handle kernel paging request at virtual address fffffffffffffff8
> 
>     pc : wcd_mbhc_start+0x28/0x380 [snd_soc_wcd_mbhc]
>     lr : wcd938x_codec_set_jack+0x28/0x48 [snd_soc_wcd938x]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: fix missing mbhc init error handling
      commit: 7dfae2631bfbdebecd35fe7b472ab3cc95c9ed66

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

