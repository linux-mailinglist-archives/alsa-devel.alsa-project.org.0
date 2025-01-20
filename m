Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30921A172D8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 19:55:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6B860289;
	Mon, 20 Jan 2025 19:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6B860289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737399320;
	bh=n/PTqTBWrRPkcFT5rJxtrsPYriJaJRw9sYqDDFBiW2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m2I2xgHhoZniXwZ24Mh6z4bYrA/WpqtIgbYLN8WATu/9WQP/BqjgorP+us/ASNLnc
	 kp+TdIYZVv0ZK+I7Y9Kh4S71lJ+FpvTcYh+ZUGLc9DqaRT1eVWKnq6M7rDNPjXF8c6
	 OtU3tlENyXEdK1CKQy7vPcOlmg2UT2VxXOBpabKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4364CF805BD; Mon, 20 Jan 2025 19:54:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D15F805B5;
	Mon, 20 Jan 2025 19:54:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29DC3F80424; Mon, 20 Jan 2025 19:54:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C8F6F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 19:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C8F6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UosM6Nf2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DE9FA4045B;
	Mon, 20 Jan 2025 18:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA10C4CEDD;
	Mon, 20 Jan 2025 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737399267;
	bh=n/PTqTBWrRPkcFT5rJxtrsPYriJaJRw9sYqDDFBiW2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UosM6Nf2a98cRkjXCyAktwD/vwC1vRGpqv+saeGZ4LfW52oTRnBetcCAkHVbTBTeN
	 LLtoILh4meqzoYVPcv9uBU3vCIlWwfSpktmAXc/KbsapYQawH10zjEO5Sbho3mv4/E
	 75MT5vjMRlOa4S3ONZT5h6d6ABMoP7qruQ9n8MyjsES/f2jslTYTlqpDtIpUu+uBQY
	 9+KalF2q/RIBL9jQ+QRENvyrS32ZttUlO+x0dtOTvHPCeoP2lz8WAT7CjMuQxGk7Aw
	 szGfSamqzaqgHAZVBKfjvvA6h3cok4WSUb9WwNwuPNi3i1r5dP/iw7No8iw5zWO0Af
	 xU0uZD+noT4CQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20250120101758.13347-1-zhangyi@everest-semi.com>
References: <20250120101758.13347-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: Improved PSRR
Message-Id: <173739926606.67578.17651499078267317949.b4-ty@kernel.org>
Date: Mon, 20 Jan 2025 18:54:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: 3NTD5O6WTHEHSP5KUQYIVJ64KZRHRK6T
X-Message-ID-Hash: 3NTD5O6WTHEHSP5KUQYIVJ64KZRHRK6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NTD5O6WTHEHSP5KUQYIVJ64KZRHRK6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Jan 2025 18:17:58 +0800, Zhang Yi wrote:
> Modified configuration to improve PSSR when ES8326 is working
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Improved PSRR
      commit: da8146ce615ad49ca4d873c1028b1b6fb0bba910

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

