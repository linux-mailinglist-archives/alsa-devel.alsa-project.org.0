Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AF7CF726
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 13:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4BA1DA;
	Thu, 19 Oct 2023 13:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4BA1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697715629;
	bh=676Rjq+LE+0fgew437xG06OYxKy/BUx3vyMw4uKlDRY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+ftFW+2QUsjXrDX8DE0I50o59itVnj92PpQDIaKAmMLsIU8kr3lvR4tX5TmFbkre
	 PGoMJIeBr4yii3ZKEixTbjOllvC2LhTmo4i58+HKwa0S7CNhMajftE/ElXJ/7zk1lu
	 VICZQeSUMk6VbZ+Ov1qWP4RfS9W5D3+sC7QMhBb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0DC8F80557; Thu, 19 Oct 2023 13:39:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93283F8024E;
	Thu, 19 Oct 2023 13:39:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D312F8025F; Thu, 19 Oct 2023 13:39:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 752BFF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 13:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 752BFF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nxuvfXr0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0FFF2CE2BBB;
	Thu, 19 Oct 2023 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1174C433C9;
	Thu, 19 Oct 2023 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715561;
	bh=676Rjq+LE+0fgew437xG06OYxKy/BUx3vyMw4uKlDRY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nxuvfXr0NdkqgNKDibvY5zZVlOquM0vrsHJ6aWJa8REP1fYrVCrJY7tEm5597yMn6
	 AjB+GUHDS0cVa7DJkgTkLQculCExmRAxd/vb5CpFSCfHPJPJ3R/hWgXMPFehieFweP
	 3+cjJ8TtNGSpXeUysAOTJw8H+MJ6Ejd/iMXJ+AL43Im9+pPAZw7A4G16NpkQBTLZjF
	 NtKjRt4Iy9iAvKsULXe8sjSD9J8XBaq8224kdOHDuwCbugvwT31+bNgarWkV0EPQ52
	 ejXLmm7nNFx1EbleUkBO+uSVaJQt6NjFgZVlzIhIeWNSixEoP79NcVrxqBwZnyLhV2
	 QAJ9q4wZ0WFAg==
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231018064444.23186-1-David.Rau.opensource@dm.renesas.com>
References: <20231018064444.23186-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7213: Add new kcontrol for tonegen
Message-Id: <169771555936.23143.9693813241096265778.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 12:39:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: EK5PKDA7P7QEGWZVMOPFJKDLBJWKQRJO
X-Message-ID-Hash: EK5PKDA7P7QEGWZVMOPFJKDLBJWKQRJO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EK5PKDA7P7QEGWZVMOPFJKDLBJWKQRJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 18 Oct 2023 14:44:44 +0800, David Rau wrote:
> Add new kcontrol for tone generator
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7213: Add new kcontrol for tonegen
      commit: 64c3259b5f86963c5214e63cfadedaa2278ba0ed

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

