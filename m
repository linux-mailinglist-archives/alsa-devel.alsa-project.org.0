Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2A726731
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DBC820;
	Wed,  7 Jun 2023 19:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DBC820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686158685;
	bh=OlBo12fFW4VunhufBSQGV0C48BtVXpUZ+Qw4dlgrB6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YU1rCaFhMta1BhXcVG57SjYRBZ2EtZRMr90gQwuz/V9o2hwYzTfY65yH5YdL6RlOJ
	 qsmkHES4Lb/a3XNk/QtxhfXD59SH4ZR37yUYleeeCmfHZjRa/TvcAZYXqZJNJGLuMT
	 Y2EAdaL6iA97UeWYQdNnYOY9l27TvHNRED+pkP7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE08F804DA; Wed,  7 Jun 2023 19:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65939F8016C;
	Wed,  7 Jun 2023 19:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF13F80199; Wed,  7 Jun 2023 19:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A002F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A002F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m/vTVPRb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBF8C63DEC;
	Wed,  7 Jun 2023 17:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9225BC433D2;
	Wed,  7 Jun 2023 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686158626;
	bh=OlBo12fFW4VunhufBSQGV0C48BtVXpUZ+Qw4dlgrB6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m/vTVPRbEch2cCc1N6kjRXU6nLcyVRNBqs1bYRa7qvYlmlLarNXd1K9yK5YYTuajW
	 OcSjJkoIiBZdp5c5/jDYFLu8t8vGoUvKyYU2ICY3nmS4X2IVO1SKvQAJz/LQH1sgLQ
	 WAQxvgsHZhVYkce3RRAy0vpdoWA798Z0p0ZjcrkvVJuYJ44e+4VZfA379gmuuW8ioj
	 hYVXfvBReHdX+u9tEgkY/fYqG2MXzfAlJ9LWznvghZzAefjvUBmweC0xT18XZuOpEe
	 r9tDeqL7ouGWvD0fRtBOeM+szQMSI9X2KRLqlF9oUR+UiPljccj6w2g0KDN6MnBFkI
	 8zXfuVzR/eRiA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
References: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: HDA: two cleanups
Message-Id: <168615862529.61571.12923823722918831725.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 18:23:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: TCYEQHYX3HC6TAE5KQHJCRTFNLAQFZJC
X-Message-ID-Hash: TCYEQHYX3HC6TAE5KQHJCRTFNLAQFZJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCYEQHYX3HC6TAE5KQHJCRTFNLAQFZJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 17:25:27 -0500, Pierre-Louis Bossart wrote:
> One removal of a non-existent Kconfig initialization and one
> correction to enable SoundWire link when no HDaudio external codec is
> detected. This will generate more information and help resolve cases
> where the ACPI information is incorrect.
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
>   ASoC: SOF: Intel: hda-pcm: remove kernel parameter init
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
      commit: f751b99255cacd9ffe8c4bbf99767ad670cee1f7
[2/2] ASoC: SOF: Intel: hda-pcm: remove kernel parameter init
      commit: 3bd45b8dea73eabc9bbfdcdc69675e3ef8ca8920

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

