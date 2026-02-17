Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJH7D1DBlGkwHgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Feb 2026 20:28:16 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0E14FA62
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Feb 2026 20:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3C460216;
	Tue, 17 Feb 2026 20:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3C460216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771356494;
	bh=wIjh6yOyK9DvQrfMqC6CYjP8Xq2hI3p/QomBiTZqeDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eKhYTmk3bIpfe4388mvLQXXztXmhNEt6NVALnyQUriI6hl+cZYOjQaRiqP5e48Cw5
	 JXgOgocWEtuSR0kHsUbeAhyTriZze80f7u+hHIuNOXtsdXQ9ZOzdvRJqlJZwp8ugFG
	 I/2BbwppilcyNtcwec55Ipn6PMqfQycLHzcsSQkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC4EF805E1; Tue, 17 Feb 2026 20:27:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D41F805E6;
	Tue, 17 Feb 2026 20:27:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DD1CF8016E; Tue, 17 Feb 2026 20:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_SAFE_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B47D1F8016E
	for <alsa-devel@alsa-project.org>; Tue, 17 Feb 2026 20:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47D1F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZXS0WWk/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA0CB60053;
	Tue, 17 Feb 2026 19:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD78C4CEF7;
	Tue, 17 Feb 2026 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771356278;
	bh=wIjh6yOyK9DvQrfMqC6CYjP8Xq2hI3p/QomBiTZqeDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZXS0WWk/SEhYE2UgtiVxYfMprA0V3mTvmuBWGpsGrYButsFgpVf2A8rBlKF0ggnML
	 MFpd75tjsw3oH7r7ZBFVT/NEc5Tg/kwkMuzG6mQJ+ZKdYFM0S9UPcHueNiHHVZswbK
	 jmdQakIX/xUrxjHawla6ShbxtVSo9A5CYlW52dRP4QTO9h/Z16zeiSfUBSoULY0kOq
	 iDt3kgTYa+ovYWyjEAsFaWpNNlv4O/wgutEl+Fy01RyaMM8YX9PWykdJk9LgdEVIIy
	 L2mjK9qMWWSRJDz0Jkv+k4Xw4tOfDUye8v1EyVPZrv3zkEd+lygji7+IOYzCTcCMtU
	 okz22Y36QRCUA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com,
 dan.carpenter@linaro.org, sandeepk@ti.com
In-Reply-To: <20260214104710.632-1-niranjan.hy@ti.com>
References: <20260214104710.632-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2783A: add explicit port prepare handling
Message-Id: <177135627519.310944.4176958928133427758.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 19:24:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: YRFFX5G4JRNMD5TZJIRK6I2M4CZOIU7B
X-Message-ID-Hash: YRFFX5G4JRNMD5TZJIRK6I2M4CZOIU7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRFFX5G4JRNMD5TZJIRK6I2M4CZOIU7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[alsa-devel];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,opensource.cirrus.com,gmail.com,linux.intel.com,perex.cz,suse.com,intel.com,linux.dev,ti.com,linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4B0E14FA62
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 16:17:10 +0530, Niranjan H Y wrote:
>  TAS2783a required port prepare bits to be set during playback
> even when it is using simplified CP_SM.
> 
>  Normally, SoundWire core handles prepare sequencing automatically
> depending on the type of the device available. For simplified CP_SM
> there is no need to set the prepare bits. However, due to a hardware
> limitation in TAS2783A, the port must still be explicitly prepared and
> de-prepared by the driver to ensure reliable playback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2783A: add explicit port prepare handling
      commit: 0d68ad088e334088b031423e59886ae118c11202

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

