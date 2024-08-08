Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE394C612
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 22:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA06B71;
	Thu,  8 Aug 2024 22:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA06B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723150656;
	bh=7c4tQRSAELTB1T8amQAP3q6kd8OVoXeWj2W715x9jIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MGyGTqIUy2RmhK+g2Udhwskuhm8PgZ+4QLeihpS2v+XDSnvdCAnNkDRMGgPw6UXWf
	 6koIFI2QdAVkB8ZaLp+BT9KhQ+itm7waolGhXPsDqZDe0Gnb0Cgba0qfVP5Wzr9SY5
	 fWQcbK+g8Zn9Diiw8SicUPvUDVkikc2PIs3ASX3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58953F80448; Thu,  8 Aug 2024 22:56:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB4D1F805F2;
	Thu,  8 Aug 2024 22:56:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C78F8057A; Thu,  8 Aug 2024 22:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79F03F802DB
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 22:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F03F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WixlTFq0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61A03CE1381;
	Thu,  8 Aug 2024 20:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABCCC32782;
	Thu,  8 Aug 2024 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723150600;
	bh=7c4tQRSAELTB1T8amQAP3q6kd8OVoXeWj2W715x9jIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WixlTFq0j1bNZegfuhsDPidaMkO1UMMoCEpakA6WQAbgHAATKM/qL2CrLZlYrteet
	 Rtcs4/Dx/Ur2nCg7lOjqBEcP/SVmChvg7VMZayqpBWwLddXZRmM6ExqymPzYZjRT6E
	 mI3nRNUruH8YhEg3rXpPr8cLGttvEL/SC6AnXtrdf2HBH+UzKCkj4AnIRO7z1H9Lkk
	 3cpbWo3vtTxDYBtjav95DrXk44TMyJ4E9elV5v/8GRi89DtjgYOqC6Ck8k4FGBglgq
	 4tKkN+ibwx7DqrxlfUCRTHgcEt/0Dsbcpf99EhVG/G0Q+lYoA42RpEAVkpfRcK3j2S
	 vpxkaROuzrBJQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 sunpeng.li@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240807085154.1987681-1-Vijendar.Mukunda@amd.com>
References: <20240807085154.1987681-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: add ZSC control register programming
 sequence
Message-Id: <172315059143.475406.15663956148866112375.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 21:56:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: EZUUSGJVY5ISVJOVR4LCXZCQLVJAS4DM
X-Message-ID-Hash: EZUUSGJVY5ISVJOVR4LCXZCQLVJAS4DM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZUUSGJVY5ISVJOVR4LCXZCQLVJAS4DM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 14:21:48 +0530, Vijendar Mukunda wrote:
> Add ZSC Control register programming sequence for ACP D0 and D3 state
> transitions for ACP7.0 onwards. This will allow ACP to enter low power
> state when ACP enters D3 state. When ACP enters D0 State, ZSC control
> should be disabled.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: add ZSC control register programming sequence
      commit: c35fad6f7e0d69b0e9e7e196bdbca3ed03ac24ea

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

