Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD40694C52
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4C5100;
	Mon, 13 Feb 2023 17:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4C5100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305233;
	bh=Z5wDnvOGNHRIFgJc+WGtrzbrEBxSmidUa+bQ3LSxztc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NX4dfimdIfy4FTF8/+aCkRBI8lSmTCEQdyLI4JpWkdGOWiE7ofIi6WYSeu1S726qT
	 PIztosQxePd3DGFy7Dm+4Cz2bceE5wXLSv53wdQSVGzuTutTUq3JYmfpVE5xCHqS8y
	 iwe8QnsREEVn8rBTcf5pKhgUMgGYjNWPcYmgeIY8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF697F804DA;
	Mon, 13 Feb 2023 17:18:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDA58F804D6; Mon, 13 Feb 2023 17:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 178AEF804B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178AEF804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BtZQE/gF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAC48B815C6;
	Mon, 13 Feb 2023 16:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EDDC433EF;
	Mon, 13 Feb 2023 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305127;
	bh=Z5wDnvOGNHRIFgJc+WGtrzbrEBxSmidUa+bQ3LSxztc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BtZQE/gF/++2WEj5M0RL7Ph6EZp6UZ9k/BKk6EQZuca2DTZrylsJhjXN44fjVMG85
	 jbe3E6uoOKMb0UVMsyYbtVBMCOLF5+5s/4m2esiuqqU43Wcb2MVEQyr4jsONScGHO5
	 4pP/qQP6qoOMpBWTu9PYVlNSWj0scLk8hO+KVvMoljf5T9JkHul7ljNiKm4/BnY+rG
	 S1HWCyetPRcOCYpIa56Jjhbi2GS3DcRmm2iRea7xGt1N0nev+EE1UgkBOmyUoIeeft
	 cxI/ao42OiuiQD8kXOywoqY9TsDB3OIOutfoqOIVs99P7SFskygruJK6K1ve77IuPX
	 eRw0ujLC0FsFg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20230213010547.105312-1-yang.lee@linux.alibaba.com>
References: <20230213010547.105312-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: codecs: Remove unneeded semicolon
Message-Id: <167630512528.2770751.9782489444187002292.b4-ty@kernel.org>
Date: Mon, 13 Feb 2023 16:18:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: LRFKJGE6ONRRWQ4PMFW2E7SI2CGSZSKT
X-Message-ID-Hash: LRFKJGE6ONRRWQ4PMFW2E7SI2CGSZSKT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: herve.codina@bootlin.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRFKJGE6ONRRWQ4PMFW2E7SI2CGSZSKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 09:05:47 +0800, Yang Li wrote:
> ./sound/soc/codecs/peb2466.c:1851:2-3: Unneeded semicolon
> ./sound/soc/codecs/peb2466.c:1887:2-3: Unneeded semicolon
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Remove unneeded semicolon
      commit: d227116c0e216da2eceba1d51a364ff025dffa58

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

