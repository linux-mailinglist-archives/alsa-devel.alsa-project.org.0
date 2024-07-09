Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844092C5BF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 23:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DE5850;
	Tue,  9 Jul 2024 23:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DE5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720561957;
	bh=ycuYAdGSjCFvzRGk5dVlud3+ZxsmqTsJTS56z2wlpNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Smmp5CdCr3zpbjEOLQ2v0ZTTONWqZqv2F2bfzB4IG1sAfV1pSmbmHx+U8be7+dWL3
	 +uPTmChIrsRs2WZ29VTx7VHYNhCimh7rAyonJoEUS01sImCmNnjbD85fcUTVR+Qgtp
	 Y2G//M8jRa8nFRGeSeCpBM836lx9EIZhEwi7FY2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A966F8020D; Tue,  9 Jul 2024 23:52:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F0C8F8020D;
	Tue,  9 Jul 2024 23:52:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B919F8020D; Tue,  9 Jul 2024 23:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B1A3F80074
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 23:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1A3F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CMCZ40Cz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7559DCE013C;
	Tue,  9 Jul 2024 21:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FE8C3277B;
	Tue,  9 Jul 2024 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561833;
	bh=ycuYAdGSjCFvzRGk5dVlud3+ZxsmqTsJTS56z2wlpNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CMCZ40CzlD+4NKx9k4FhLID0Of+9zz0UU2TdmtI7qQREArKeO3mVsol4NKUghPz3F
	 wdDEsYV+2efeDk/3lfWMVwMGuiHdd2ISkA1/vVCCn4HB7cvt3V4fME7fWVsP51Xt3k
	 v/nUEPywYrCHNhz/H58tgfg327cbRiUn6OgJ4/igrtoRDCU7LOG/99YCiG3FghwvTp
	 ZWmikeLwlqPqNRQS6iRLyJM6sZWiy5jLTs3usECPewFngH/a/RvfaS46nUfDEkO9QR
	 LedU0FwJY4HJx1PrcqjwVwY3QdfY2sKVf09ndjfAhFE6r31LrIr2RSdErt+8hWmQiJ
	 RWBYleZgE7PTA==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, Chen Ni <nichen@iscas.ac.cn>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240709030921.585740-1-nichen@iscas.ac.cn>
References: <20240709030921.585740-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Convert comma to semicolon
Message-Id: <172056183087.72205.7434504515517519216.b4-ty@kernel.org>
Date: Tue, 09 Jul 2024 22:50:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: OSC7DABCKHJHLT2KF4MNAAOPPKRKI4AU
X-Message-ID-Hash: OSC7DABCKHJHLT2KF4MNAAOPPKRKI4AU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSC7DABCKHJHLT2KF4MNAAOPPKRKI4AU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 Jul 2024 11:09:21 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Convert comma to semicolon
      commit: e52a73e694522c7c94369a7741717a9f50baca0b

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

