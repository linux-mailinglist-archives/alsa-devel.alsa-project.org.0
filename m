Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3B979B83B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC3DEAD;
	Tue, 12 Sep 2023 02:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC3DEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477285;
	bh=WoSZuuZToBcsek+2qM1hUT4GFK4S9ngVS3iIz4yb0c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kIloDE0WIuUZ9w3A0I3YD94n7V+ij1F9BgAVp2Zw76OlKe9gLNd0g/GaVgEjKpfnV
	 PuTxaWrpv4L8J4bdcccOWtsLxsZJRL/tBaPj+CbEVfPYjOVi9/T+wUOFiRObu4+eyC
	 je7tie+LlR0CfNHrPDf4wgx0nhQfXN1x7+vlnppQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C48AEF806B4; Tue, 12 Sep 2023 01:58:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96385F806AF;
	Tue, 12 Sep 2023 01:58:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D925F8067B; Tue, 12 Sep 2023 01:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B976BF80674
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B976BF80674
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uarpI7vh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56CA261486;
	Mon, 11 Sep 2023 23:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D23C3277F;
	Mon, 11 Sep 2023 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476673;
	bh=WoSZuuZToBcsek+2qM1hUT4GFK4S9ngVS3iIz4yb0c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uarpI7vhSp5ytnyWont9pj3X6rOugfLaoj8jWIU0g+Na2eaj0zXBTzdaEimi8dcFM
	 JBYubp7AJYghYtFpkymWGTlWNDDnJilpvKEKnRrPKlR41vw0+t7PbGxuvStEE6/O/C
	 eYI3P7o9TXFhOGjzX3KCJEQbacjuIUSA1y/oCKnzX/b3UCAVFpxDTw6riNLTI5c0Dp
	 zAQCjAXV4Iz9HVPyE1gFZe/JO4svqitiqxeqhBH2xnkoUHkBckFaqxNK6rQcAI084R
	 XnJFncvxMNLRUTulicOxkgrDW4MVPSHrBNs9j+OnzgjvSWxItXsnII5CSRHsmngl8c
	 RdTz9x08jIeWA==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Message-Id: <169447667032.2387538.4844060984020698450.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 3DOP7NXGISMYTG7UGU5GXUUOKLYR4BZO
X-Message-ID-Hash: 3DOP7NXGISMYTG7UGU5GXUUOKLYR4BZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DOP7NXGISMYTG7UGU5GXUUOKLYR4BZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Aug 2023 11:20:39 -0500, Vlad Karpovich wrote:
> Checks the index computed by the virq offset before printing the
> error condition in cs35l45_spk_safe_err() handler.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
      commit: 44f37b6ce041c838cb2f49f08998c41f1ab3b08c
[2/4] ASoC: cs35l45: Analog PCM Volume and Amplifier Mode controls
      commit: 18050443b9fc4e809c077fbf0967349410e86117
[3/4] ASoC: cs35l45: Connect DSP to the monitoring signals
      commit: 3fecf69aa7fdf1910267dee1dbaa8ed865cf2cb6
[4/4] ASoC: cs35l45: Add AMP Enable Switch control
      commit: c3c9b17d27887f7b2f6b85d0a364b009b8436539

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

