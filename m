Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33C9757D9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 18:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE114868;
	Wed, 11 Sep 2024 18:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE114868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726070605;
	bh=CiD5hifkfSG5Fk3ZwMnWP2C4/b515yIQMdp2KqZygAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDbKCoCvL+DMbloefD5HCoad0XBcdZ9NdS1dJvYc6K/1ISTW1zGEaij6k5LZ3OMCf
	 SBPAjJBN5UBncm5Cb7qoRV/6spjdQcVpqbqQSEbw5RbL/4U9VSBpa9dl47JFxLJF63
	 QhLLLPDDoV9Ux1t3OpCyS3pBsYJ9O1aGvCkIeIHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4165AF8019B; Wed, 11 Sep 2024 18:02:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33416F805B0;
	Wed, 11 Sep 2024 18:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBF73F801F5; Wed, 11 Sep 2024 18:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 926B0F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 18:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 926B0F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oO8TUy93
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70C225C051A;
	Wed, 11 Sep 2024 16:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92166C4CEC5;
	Wed, 11 Sep 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070563;
	bh=CiD5hifkfSG5Fk3ZwMnWP2C4/b515yIQMdp2KqZygAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oO8TUy93S6eXG4cyKpEFT8MQ9/klM5g+3NbSo2dJ/JjBoQkoUR+7KlkJCsHvVvubA
	 /FUKNwbe0AWNOtaOxvVAuoD2TRMWMfTvv3m3t4+OaD46tuQsRxrGTu2eYQUnPqcqKE
	 HMxLiQ+Fp+urCygR43iUB9ma11APafxcCzafkUnYz6Exz+PgvSLsett8tG6HCzei0d
	 puDmtokLU/E2pQK4osLtu7Vo+HRBmGRCJ8oyrzhx67OWRKqiFHQe12SmUy9Xx+D2c6
	 Q9tEbUSomGxYwVJAZNxaZet1pUAQa4EwONCv12dmjXQX3vE7gdLNDzNuv0/FAn3/Fl
	 YIP+nu7HmgIUA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jens Reidel <adrian@travitia.xyz>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
References: <20240826134920.55148-1-adrian@travitia.xyz>
Subject: Re: [PATCH 0/1] Add support for primary mi2s on SM8250
Message-Id: <172607056132.105227.11889587704269825553.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 17:02:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 72F2BDUUUCZZH7ODC2K2BVE7XRQGDN6X
X-Message-ID-Hash: 72F2BDUUUCZZH7ODC2K2BVE7XRQGDN6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72F2BDUUUCZZH7ODC2K2BVE7XRQGDN6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Aug 2024 15:49:19 +0200, Jens Reidel wrote:
> This patch adds support for the primary mi2s interface on devices using SM8250
> audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
> SM8250 and we intend to use it as a fallback in the future.
> 
> To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> To: Liam Girdwood <lgirdwood@gmail.com>
> To: Mark Brown <broonie@kernel.org>
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux@mainlining.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: enable primary mi2s
      commit: 851e3a2a4490b03bb8dd0cda1b8b2a78f6a92805

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

