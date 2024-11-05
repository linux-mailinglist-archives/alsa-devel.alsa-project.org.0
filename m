Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40D9BD298
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 17:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068BEE69;
	Tue,  5 Nov 2024 17:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068BEE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730824766;
	bh=omxC84VGn/+YQr7YbyZx+jQOt5oTJWK99g8fh9uYgT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R50Hb6QomCOnKZuoZU3PCmCfP6U10cVGGJfnYZJceRjpWFBbxyN2S/9ahBbf0NlcZ
	 NbLqfvJNeibWHdat+Im299DNEGvXpUoZz+5A4PyjShnO2jRBSut6euoP/qp+TfipK4
	 zFOuYs65BlItw7Fid0uqrzy0Vh9YBk9H5mIb07sk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EFEF805FB; Tue,  5 Nov 2024 17:38:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C680BF805FA;
	Tue,  5 Nov 2024 17:38:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B77CF805BD; Tue,  5 Nov 2024 17:38:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C55F7F805BD
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 17:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55F7F805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DvaRf/uh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EC1C5C3E40;
	Tue,  5 Nov 2024 16:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2500DC4CED4;
	Tue,  5 Nov 2024 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824705;
	bh=omxC84VGn/+YQr7YbyZx+jQOt5oTJWK99g8fh9uYgT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DvaRf/uhp2xk2i+id0MOV/XKBXEpoPGF27r9aIiU8ES8BhUS5q77LiwNV32tTkqWp
	 n+RCTU3Pn2wPlAOHxpxykq8dChEwd4WqOCpaQSeIToC/kBgRDGDU/kEg0xIERNSssh
	 jkJ1caVmGpeZBZK5a2G9l4JJ6ycq+hZ1y6oEPjwFnMRfQcGPyNPgp0xF6J18oJR1LV
	 /XyL/or9i5/T/ssqty5KadvXy9rKQJDxuCRqFz/BbpiwXLoqAQg4qaFUyqW7zqc5qk
	 JfzwqDuHJ/D0+i1cDyWM2UIDW4oJOxMKeKJ3O4DkSEi+rwAes9whSKQGJUEZ+cOdUY
	 D38kuNRb/TSkw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: mario.limonciello@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component
 load failure
Message-Id: <173082470287.77847.14499487480313142859.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: TWUZE6VJLGP53ABF6TYKAC4RQN5JBNW7
X-Message-ID-Hash: TWUZE6VJLGP53ABF6TYKAC4RQN5JBNW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWUZE6VJLGP53ABF6TYKAC4RQN5JBNW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Nov 2024 14:43:10 +0530, Venkata Prasad Potturu wrote:
> Stream name mismatch with topology file causes tplg load failure.
> 
> As SOF framework assigns dailink->stream name, overriding stream name
> other than link name causes SOF dmic component load failure.
> 
> [   35.474995] snd_sof_amd_acp70 0000:c4:00.5: error: can't connect DAI ACPDMIC0.IN stream acp-dmic-codec
> [   35.475001] snd_sof_amd_acp70 0000:c4:00.5: failed to add widget type 28 name : ACPDMIC0.IN stream acp-dmic-codec
> [   35.475013] sof_mach acp70-dsp: ASoC: failed to load widget ACPDMIC0.IN
> [   35.475018] sof_mach acp70-dsp: ASoC: topology: could not load header: -22
> [   35.475072] snd_sof_amd_acp70 0000:c4:00.5: error: tplg component load failed -22
> [   35.475083] snd_sof_amd_acp70 0000:c4:00.5: error: failed to load DSP topology -22
> [   35.475090] snd_sof_amd_acp70 0000:c4:00.5: ASoC: error at snd_soc_component_probe on 0000:c4:00.5: -22
> [   35.475117] sof_mach acp70-dsp: ASoC: failed to instantiate card -22
> [   35.475254] sof_mach acp70-dsp: error -EINVAL: Failed to register card(sof-acp70-dsp)
> [   35.475261] sof_mach acp70-dsp: probe with driver sof_mach failed with error -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load failure
      commit: 224b898f7c5ff575b02911e21383f271761bdeb6

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

