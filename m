Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA0B89D9D7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 15:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8462BE2;
	Tue,  9 Apr 2024 15:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8462BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712668154;
	bh=6UT6JdRmlSUWwWxh7sOA/sm5C8Rr31qoQNdkYTzvIrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XvPrPBwQoL+Y4HFMn3ykxt2pSPCpMa+oQaP9UdHMli/PXQm4syKudQpUpJgFRkXzO
	 KqRQkueztu00HIfqbeHfYdLuPNyHIhTfaZIZ6LwTXRCsbEJSAJKgFYqvDge+j191Em
	 qTGAGp3ZwXhVw7ioRsjzWP6wYIU4sx5U9ev4/9oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1705BF805D5; Tue,  9 Apr 2024 15:08:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C19F805D8;
	Tue,  9 Apr 2024 15:08:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18EFFF8028B; Tue,  9 Apr 2024 15:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E310F800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 15:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E310F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bx+QZYpi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B684CE18ED;
	Tue,  9 Apr 2024 13:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD05BC433F1;
	Tue,  9 Apr 2024 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668081;
	bh=6UT6JdRmlSUWwWxh7sOA/sm5C8Rr31qoQNdkYTzvIrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bx+QZYpiRMOXU7l9N991efCKp5nkeBbNXd8ijQiOJqbln0PQxAyKWoTs9PoERy8GS
	 foyS9A9C2vtkiLcBycvGw672yJQ7VyRpPUtiGRIudYBo6CSmV8UqjpcbYCYdS8SdAi
	 V3YWhkVe05zno8cUijUkt3Yye15l2+eG6RMmHmfGTnwLs9rTDzYJEii4YtJOx2o+QA
	 Dv0N2hum8lfAXaaXU2HukBQltEE2zJGWoLn80+2Vip3VL0pALRJgWtKKyMpWIsC+I8
	 ZsoxOdQ0l70D0QXjQipI1N4mQo6amL75z8T7hGE1g2oSgiR7hlO01KcEyREkt9H4+F
	 rPGirVMDMturw==
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Terry Cheong <htcheong@chromium.org>, Uday M Bhat <uday.m.bhat@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mac Chiang <mac.chiang@intel.com>, apoorv <apoorv@intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
References: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Fix uninitialized variable in
 probe
Message-Id: <171266807748.28088.3831139815604734848.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 14:07:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: KFHF26YYY2EUFKKQPMI47HQQH74ITGLY
X-Message-ID-Hash: KFHF26YYY2EUFKKQPMI47HQQH74ITGLY
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 10:35:59 +0300, Dan Carpenter wrote:
> Initialize "is_legacy_cpu" to false to prevent an uninitialized variable
> bug.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Fix uninitialized variable in probe
      commit: 9cb83ed19b35e6c596b4e6644708ac4e011f32ab

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

