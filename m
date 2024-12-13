Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EAA9F14EB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2024 19:27:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32DA310;
	Fri, 13 Dec 2024 19:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32DA310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734114478;
	bh=IgsRLbyjKbDnKZEGJ3MxQziXE1RmxfMqUEJ4Xfp0AXw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZZbnOk7fjkQbW7tS7HWY9eMMGxzodSGsTpoPkyj6oOLPyla3V2nY255W59LG7Tlnb
	 4m/3JOGvzjIbjuWIYXNz2sxAdS/MWy5vqobtT9nSb8nIU/O49Llw8uNrxP14nxzv4e
	 fHm6wfDrPyVmmSRmQZGni1mYEWNdcbMZTCZoBOm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7DC9F805ED; Fri, 13 Dec 2024 19:27:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 308F2F805EB;
	Fri, 13 Dec 2024 19:27:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0C4CF80212; Fri, 13 Dec 2024 19:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9250F800EE
	for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2024 19:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9250F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tVclJOVO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37424A42DA0;
	Fri, 13 Dec 2024 18:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A467AC4CED6;
	Fri, 13 Dec 2024 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114419;
	bh=IgsRLbyjKbDnKZEGJ3MxQziXE1RmxfMqUEJ4Xfp0AXw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tVclJOVOf2RkdXGpgF+xzGmOWG3D4dwbR02GAwQcZ/q1ERmrWY9QQJyCXlLkfGgYy
	 lP2TMn0VqqiW/lzwrzJgJdgiBywyqJMRgEGM8iJVyiQ/TSfxxjpx2jXcZGiUhiVGdA
	 4T0ynGJk2xDc6xXQGo7jbq1yehcx/oxnnDjbZZLuh/wZ1J/G6D53jdeMpe5ytrzSVk
	 WOWrmSIXWACfDurEwngeQ6fL/dlU/lPQt+nQSqQoDj2PAVenLVcsuyQ2Skn7XUhhSG
	 Q+XW4vkSLM968vts7NDMOpAcBWyAfrfAP1Afw34HRwJqpOT9O3kOwMTgyxaLgi3Ptc
	 6w7X4Mbx2SfwA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 0/6] ASoC: fsl: add memory to memory function for
 ASRC
Message-Id: <173411441641.280424.4148595189607458156.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 18:26:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: EVKPNGQXFZ6LGYIZGNZV5HNCRD5GEB63
X-Message-ID-Hash: EVKPNGQXFZ6LGYIZGNZV5HNCRD5GEB63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVKPNGQXFZ6LGYIZGNZV5HNCRD5GEB63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Dec 2024 15:45:03 +0800, Shengjiu Wang wrote:
> This function is base on the accelerator implementation
> for compress API:
> 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ALSA: compress: Add output rate and output format support
      commit: f4425e3ab2f796d442a44f31262eade9b6427ff7
[2/6] ASoC: fsl_asrc: define functions for memory to memory usage
      commit: 8ea7d04a4e9e30876c9d8184b4b8e4cab33e0372
[3/6] ASoC: fsl_easrc: define functions for memory to memory usage
      commit: 27147695aaf7ccb0edc3f21454b5405c9037b4ba
[4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
      commit: 24a01710f6271ec32b629d714e6a64a69665128b
[5/6] ASoC: fsl_asrc: register m2m platform device
      commit: 286d658477a43284f7be2539b059ecc90ba109c2
[6/6] ASoC: fsl_easrc: register m2m platform device
      commit: b62eaff0650dc6dc2a4bf0f50714f2357a23fc71

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

