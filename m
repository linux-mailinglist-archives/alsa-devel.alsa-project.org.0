Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992187FDFBD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 19:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED6BFA4D;
	Wed, 29 Nov 2023 19:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED6BFA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701284051;
	bh=DxwZUWnH+fUEWYdcU14h0/83veMkO4N+Vygul07agts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRs5bviTYwf/8OSc5ohUIsYUDkCuktaEN8QvwKyD1ZhNM7cAUaTVIbOY/WcVwHtUx
	 y1+XPgHNB4zkX5grs/+W8OScsv4kXlzVjorz73W68eYNM7/7TKGP3/CgT17ChRB4By
	 +WyIQjkDAtBOoNeis++Rt7eqUMRT+mvlPFQd1Tc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F923F805E3; Wed, 29 Nov 2023 19:53:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A263F805E5;
	Wed, 29 Nov 2023 19:53:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A6CBF8016E; Wed, 29 Nov 2023 19:53:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 973EEF80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 19:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 973EEF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RpAV7EWx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C956F61CAE;
	Wed, 29 Nov 2023 18:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BD6C433C8;
	Wed, 29 Nov 2023 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283980;
	bh=DxwZUWnH+fUEWYdcU14h0/83veMkO4N+Vygul07agts=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RpAV7EWxZCkujRUV0enyuR4b+3x5ArpOQGQpckIeVOGys1iMMIG2liwgzKPE0ryGI
	 wRjmW1PsbgoLpg75TNzJl79Q/GhVN03Oa47rro+duw/H8+5lxqGZfMd8CM/a2NEDlX
	 cQJXNK/gdo4lE2GOzVQbEYEQJmdysgIuh0+hfS/uaK16VzcVEQ3pTIOm1H5F6b03tS
	 tyCVhVz/j1t8wWv7hMtSHPpUMvhFmcM+ZlHtPfK9K/WVewIEbfr+mAqNPW5jJKkZuj
	 LBTRnicElx3Ak69ox8C15S3LAMOu1BwuRsXMc/SqtI+p0hq90CHf0hyRWOUk02m/At
	 XYmS8KlMQdpkg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20231129122805.10635-1-peter.ujfalusi@linux.intel.com>
References: <20231129122805.10635-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: Move window offset configuration
 earlier
Message-Id: <170128397860.290371.17008582761429227584.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:52:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ME2ZTYTVEDA3WFQZYCH6BB26USN25QCR
X-Message-ID-Hash: ME2ZTYTVEDA3WFQZYCH6BB26USN25QCR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ME2ZTYTVEDA3WFQZYCH6BB26USN25QCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 14:28:05 +0200, Peter Ujfalusi wrote:
> With the added exception handling support if the firmware fails to boot
> up we are trying to do a panic dump from the telemetry slot. The slot
> offsets would have been configured only after receiving the FW_READY
> message which makes this panic dump unusable for early boot failures.
> 
> With IPC4 the DSP window offsets are at standard places unlike IPC3 where
> the offsets needs to be queried from the FW_READY message.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4: Move window offset configuration earlier
      commit: 729bb2cd2e0601ac6d52c53535a543b9db196fad

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

