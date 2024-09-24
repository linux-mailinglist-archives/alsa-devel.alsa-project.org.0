Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5669848B0
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 17:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6513DEE;
	Tue, 24 Sep 2024 17:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6513DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727191748;
	bh=ZEjyvtI0yfzK8QXNQjqiSQbp58gUxIahW6TghC62ghg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZY8OqhRx3ugyEv692XY3SR52bXFYa/lkQ5STqZsqhtp9OMgpEMtTdSMneeqt2ZYAG
	 ojQb+VWdDHS8VhuwJv8YjVKhFwIhgYMas99bJNIiSUcQmbev7yh0Dr3VyznadVKyel
	 cJsL/yncqaeL8kHDBFXibA44if8IXzi1UCdfGUyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D324BF805BB; Tue, 24 Sep 2024 17:28:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF3BF805B0;
	Tue, 24 Sep 2024 17:28:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F095F802DB; Tue, 24 Sep 2024 17:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFD80F80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 17:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD80F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SzPWueI1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4573C5C0FB5;
	Tue, 24 Sep 2024 15:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBEEC4CEC4;
	Tue, 24 Sep 2024 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727191705;
	bh=ZEjyvtI0yfzK8QXNQjqiSQbp58gUxIahW6TghC62ghg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SzPWueI1bLknRl/5kZ5tn4uhaqRFq4IbBgwHqlgK3cncJrKRvytdVyqe0g3mHfl8A
	 aIJVBY4KnEhF9bclWgS4u285Cu53pqP/WCYjj0+Pew7ou45tDA+JuS4vlaNStI7OxA
	 qGr4WFPgcPg9b8yxJ2RdYibjPBI9rSnO39l2rOHL64VAL7g24JNu2UTrakmhQ0s6/f
	 m+pTdNCRdtcnSNkCaAbILkf6NftVCv1U2etCas4BxH16XB+6MhCJnusSdiYOEoQOLA
	 Q1R+eiNw8lAmamzgCHnImYYdzJlfGHvLIF4hy/8kx141it0oSOqiUJXiWGMl11eSnj
	 8wL29Y8pbAfLw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240924081237.50046-1-andrei.simion@microchip.com>
References: <20240924081237.50046-1-andrei.simion@microchip.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if
 substream runtime is uninitialized
Message-Id: <172719170222.1967204.5882794297957729469.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 17:28:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: U3ZGGQEKH2URVBFFSWUUGYDDX7IGFKVL
X-Message-ID-Hash: U3ZGGQEKH2URVBFFSWUUGYDDX7IGFKVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3ZGGQEKH2URVBFFSWUUGYDDX7IGFKVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Sep 2024 11:12:38 +0300, Andrei Simion wrote:
> Update the driver to prevent alsa-restore.service from failing when
> reading data from /var/lib/alsa/asound.state at boot. Ensure that the
> restoration of ALSA mixer configurations is skipped if substream->runtime
> is NULL.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if substream runtime is uninitialized
      commit: 09cfc6a532d249a51d3af5022d37ebbe9c3d31f6

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

