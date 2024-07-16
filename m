Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAA9329B6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 16:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FE286E;
	Tue, 16 Jul 2024 16:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FE286E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721141427;
	bh=8WQ5SlhuRTQjpns/GLooy7U1HTe6n74GnCF9hYexhNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FL6dT8kmfgpRjv5KgLcGb11miPDCLOpXjGu+Qw/oj/gFqH0C3yfOkKassqdj3Hp8K
	 ifT9MdFW1+qUTl7icZdPY0FUJnuk91gt05sfEeU6+crsliLtVB/8fYXxA8bXylUnRJ
	 yADZ5EaBFuzxbthjSKsHfFYQMZ0OBS1UwP4VghXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F3EDF805AA; Tue, 16 Jul 2024 16:49:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93091F805AD;
	Tue, 16 Jul 2024 16:49:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB84BF804FC; Tue, 16 Jul 2024 16:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2491CF800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 16:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2491CF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vol71J+6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25D0160E93;
	Tue, 16 Jul 2024 14:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3C1C116B1;
	Tue, 16 Jul 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721141142;
	bh=8WQ5SlhuRTQjpns/GLooy7U1HTe6n74GnCF9hYexhNU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vol71J+6opG6uf2V8Js9u8hX6Nw4uuzdi2if/5TGnukv3EcZk+FwbrYFVpne9B0K4
	 Weyyn8U5YAn7zNQTd/K6xKjQMIoTKnVuePbKbYj+ArLXG2jHGoipBVgWs/wpkrpaDh
	 5D+tXxBPB0Vg2cNuLytk2ZeFfiRJhhZ4gH3i0tNgY/HkE01R0puPjMhVwJ8YRzor8J
	 mCG6+4Vl0cm4J6/8ySijfjQuEtSK3k29EALiJn2NgC0f3l9uiuZd6U2BlQYg7fX7Qy
	 npEiGfANupxxKGi12VKXxdijMxsEHjsLW8HrVqS+X4x27eMby1CruEMPPOo9ZF7Sx+
	 8T8JaWd8V5/hw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Mike Krinkin <krinkin.m.u@gmail.com>,
 Todd Brandt <todd.e.brandt@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
References: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASOC: SOF: Intel: hda-loader: only wait for HDaudio
 IOC for IPC4 devices
Message-Id: <172114114117.56252.16346089758764770806.b4-ty@kernel.org>
Date: Tue, 16 Jul 2024 15:45:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: J2IALXTR2MGCYRJGAJK23HFVP6DIGPNF
X-Message-ID-Hash: J2IALXTR2MGCYRJGAJK23HFVP6DIGPNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2IALXTR2MGCYRJGAJK23HFVP6DIGPNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Jul 2024 10:45:30 +0200, Pierre-Louis Bossart wrote:
> Multiple users report a regression bisected to commit d5263dbbd8af
> ("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio
> transfers"). The firmware version is the likely suspect, as these
> users relied on SOF 2.0 while Intel only tested with the 2.2 release.
> 
> Rather than completely disable the wait_for_completion(), which can
> help us gather timing information on the different stages of the boot
> process, the simplest course of action is to just disable it for older
> IPC versions which are no longer under active development.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for IPC4 devices
      commit: 9ee3f0d8c9999eb1ef2866e86f8d57d996fc0348

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

