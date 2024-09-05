Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C396E232
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 20:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B48AA4A;
	Thu,  5 Sep 2024 20:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B48AA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725561792;
	bh=rhLETavs68nGr7DS1KdS0ob2HrU49NpqTqneiCZMjeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r/OMA+qiSaIdof7ySFLVkSTX7F4R68xwIOwROG8R7aNWAJbXismzfSQVK9NpORVFL
	 5wnHaOxPzWP+hwSRURLSn/F8RSA6lj4Egy+7eF2YW5SHs3IWi2QwAMUE+IfVWexW1/
	 8y2NqqS7qO/q8gcZjj9ZUKTpA11iy/zZQs4mOQd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048F8F805BB; Thu,  5 Sep 2024 20:42:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F69F805B1;
	Thu,  5 Sep 2024 20:42:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79F77F8016C; Thu,  5 Sep 2024 20:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E877F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 20:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E877F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CPHiGNUV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 260F8A44EE3;
	Thu,  5 Sep 2024 18:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B29C4CEC6;
	Thu,  5 Sep 2024 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561750;
	bh=rhLETavs68nGr7DS1KdS0ob2HrU49NpqTqneiCZMjeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CPHiGNUVos7zRIzXMZegnHHn8Zqg5wxbD4ahHAyvJi3GZV/1cjWYe/5lF7orR4hE6
	 9hiTPcdq3Nd6nHAtEqvam8TKEnwfORxqhmPp9cVsKUC/TAc/jgvxFO67uO+LFd0r6N
	 o+5NTbmNslEqiaj84SQ+2SMgGDbXNaNZoIEixgkv1YX+kic8JRDKLwmm5NELcQzBBx
	 1Ud9kwEIZufEtiTuIyfEcXUihnhGiVYiRC2aytuORl9flnV7ap9h0rMb5diCcEoVj6
	 60Bt0fK6FPPruH2bUnUlJlwQdyNy4NTuB9onIL4mJ5+DoGRxROBEXmEIytg5i4cssQ
	 ucagn5YQK+JiQ==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 brent.lu@intel.com, kuninori.morimoto.gx@renesas.com,
 Chen Ni <nichen@iscas.ac.cn>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240905022017.1642550-1-nichen@iscas.ac.cn>
References: <20240905022017.1642550-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: convert comma to
 semicolon
Message-Id: <172556174721.65454.13363391345780291618.b4-ty@kernel.org>
Date: Thu, 05 Sep 2024 19:42:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 562PAFO7R7LHF3CQZP2CYLHHZCQRWZZP
X-Message-ID-Hash: 562PAFO7R7LHF3CQZP2CYLHHZCQRWZZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/562PAFO7R7LHF3CQZP2CYLHHZCQRWZZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 10:20:17 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: skl_hda_dsp_generic: convert comma to semicolon
      commit: 813751eaec93bfeb6236aaed99607a44c01b3110

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

