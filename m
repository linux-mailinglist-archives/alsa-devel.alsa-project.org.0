Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A97C038D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6E71529;
	Tue, 10 Oct 2023 20:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6E71529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696963190;
	bh=mvpvmndHx4es01fXFJnukVPvWq9dBDgSdAeZcg5lgoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UfvP9E7bRDxuIb8Dra07cDlvfLc79ClE9aD7xwL451FUIMe+g5NlGOiy2BlOMe+Iu
	 mW9SitGoU9EWafmmKGTUyqv3K+My15opA1vDZVML4tL15LX5S33sqGgYgIS0H4YS0H
	 4VqfhHR1KgBvvMsm8nFvQKNdl/8LP75ssYABPXEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C5ACF80568; Tue, 10 Oct 2023 20:38:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00830F8055A;
	Tue, 10 Oct 2023 20:38:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA963F80552; Tue, 10 Oct 2023 20:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A080F8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A080F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rIMAnnBX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F88ACE201E;
	Tue, 10 Oct 2023 18:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7166BC433C9;
	Tue, 10 Oct 2023 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962813;
	bh=mvpvmndHx4es01fXFJnukVPvWq9dBDgSdAeZcg5lgoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rIMAnnBXt1mfbUSB1Zapux2zhHjuGVU5eVqMnzn0F7q3tgPZChSSGDoXMql3U5j4j
	 AVDWyNK4xs6uApqlcmrS4wCoPKkOWkRjElbL3sxx1795Bb3z9xENuSsrt+2+vATA08
	 qigEfl37uw/bSEj0igZWP4cd+ayQvAsSZNykg7Wbjl9ZMgjac0AfnJOSFTPb2Lbdqs
	 PZu0V6aNGMxpAImVkJdwmb36MYCIHxwypkdLgfcFJlWvIVjZ2p8AaXTIV6SV6RZ97E
	 ESl1yqFhrFhoq52CKmUKdPnvAXUbzKnrBfRRbcxYDWmXo4w2iXXu8Pvv8c37e5hmKv
	 NuG1reNWHHv/Q==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87il7fcqm8.wl-kuninori.morimoto.gx@renesas.com>
References: <87il7fcqm8.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: fsl: mpc5200_dma.c: Fix warning of Function
 parameter or member not described
Message-Id: <169696281217.221758.7268025279867309737.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: HMQV5K25LCQKRFMW47K4GEZWOXV3RLZV
X-Message-ID-Hash: HMQV5K25LCQKRFMW47K4GEZWOXV3RLZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HMQV5K25LCQKRFMW47K4GEZWOXV3RLZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Oct 2023 23:39:43 +0000, Kuninori Morimoto wrote:
> This patch fixes the warnings of "Function parameter or member 'xxx'
> not described".
> 
> >> sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'component' not described in 'psc_dma_trigger'
>    sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'substream' not described in 'psc_dma_trigger'
>    sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'cmd' not described in 'psc_dma_trigger'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not described
      commit: 4a221b2e3340f4a3c2b414c46c846a26c6caf820

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

