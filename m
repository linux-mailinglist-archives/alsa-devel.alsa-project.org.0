Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEF7C8DB1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 21:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BC782B;
	Fri, 13 Oct 2023 21:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BC782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697224811;
	bh=sh12Tmk02dttwiKlHd4emXQh6M+LZUocDGA1gHCo9+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1Zjl7igWhs0cKeVS+nWhaYEDa6UKmU36Wssi1vxKOuE1NsYclMquiwaslGkI39Pe
	 9NPju2B1N4YcmWHbolWJ4Q7/RDyjNZP/zbFDncfTLBoERPmsJNbg/KZSXBzvjKquAN
	 WSULb+BjgYQWpif2A3zDhg/VkQjkLdAWWNxNoc8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B93F8015B; Fri, 13 Oct 2023 21:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE97DF8027B;
	Fri, 13 Oct 2023 21:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B406CF802BE; Fri, 13 Oct 2023 21:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB41FF8015B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 21:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB41FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qd2R1G7T
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55C11621C9;
	Fri, 13 Oct 2023 19:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC77C433C8;
	Fri, 13 Oct 2023 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697224737;
	bh=sh12Tmk02dttwiKlHd4emXQh6M+LZUocDGA1gHCo9+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qd2R1G7T0AS08lW2b5gtWVhjIwvN/shlLldJMJ2kwRoU1owQ1b/qmhQI1CbVZgXyF
	 2Ujd2jNIsubpp61NOckhSZ2sUoKjq60os0DbQudgTv7Mj/SwFnQhlb3q6/pyhp0f+m
	 135geFqH20PE8I9oGcPF+75i7UlPxk0wboC5IqyEwazSGqk4+AlydpTLSEGC032JUC
	 OQSBFpvKZQikhEA6arCMoFzwK7V/DXIks6GUdroU9T+Xj97Y4dQdwNydTqsFqRe2Xx
	 qpmpxrd2Gsy2kaF1pGwT1J8WD1SCKYYu+0LPIv24pfGorM8dL60FJpuI3X/EXbDNvi
	 qCfAg+I7V56CA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231013-asoc-fix-dwc-v1-1-63211bb746b9@kernel.org>
References: <20231013-asoc-fix-dwc-v1-1-63211bb746b9@kernel.org>
Subject: Re: [PATCH] ASoC: dwc: Fix non-DT instantiation
Message-Id: <169722473509.2978444.10926248070491002211.b4-ty@kernel.org>
Date: Fri, 13 Oct 2023 20:18:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: OBOU4QBFPQ6PJFELPLSVGD67LWU72KTW
X-Message-ID-Hash: OBOU4QBFPQ6PJFELPLSVGD67LWU72KTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBOU4QBFPQ6PJFELPLSVGD67LWU72KTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Oct 2023 18:37:33 +0100, Mark Brown wrote:
> Commit d6d6c513f5d2 ("ASoC: dwc: Use ops to get platform data")
> converted the DesignWare I2S driver to use a DT specific function to
> obtain platform data but this breaks at least non-DT systems such as
> AMD.  Revert it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: Fix non-DT instantiation
      commit: 9c97790a07dc4f9bdc6e1701003dc9b86f749c71

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

