Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C306B718070
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 14:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E67207;
	Wed, 31 May 2023 14:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E67207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685537729;
	bh=8f8GzhJfe4N9W5OvLLhdtk/pIdTNOPOUzHWRGjRomlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3wwhDlL3ogvLZCXjbaSFpvJb+aBTqkFipOkF2gn20cmY6Q31AC5ZyX79PBY2GuNG
	 KBVgiwQIn6ziC7fq5d67Yh9Lsc19RlzrgqrOFZuljAaIbbW4Vz0yv68MYFBtnNfPqK
	 3mKfLP1zIvLfCbwReDDRn4iCqZIgffbvomo+FsT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4817EF80510; Wed, 31 May 2023 14:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED94FF800DF;
	Wed, 31 May 2023 14:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82869F8042F; Wed, 31 May 2023 14:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC3A6F800DF
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 14:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC3A6F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lkE4788O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 931E963030;
	Wed, 31 May 2023 12:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB92C433D2;
	Wed, 31 May 2023 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685537664;
	bh=8f8GzhJfe4N9W5OvLLhdtk/pIdTNOPOUzHWRGjRomlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lkE4788OZ9g4Q/kb2wSAdFdRaMZu1/ZSWyZvg60qaaMH9UrU5chbl09/tSz/XDBS0
	 38jS2MaeqQrnWuBKVaxce8xSxiwa8Px21OnDO0h9dZyq/gc1HFqFSpfmzcWTZgVIrA
	 nYPvedMW8hrjqFVbYMh7YXw02P684DcC1NQ5D6x7s0RnX7BRdcsPTdGXi/K3YHv3Gk
	 TADXGJeWDQIvSU9dyEZeMwRRsuOy688YzMPLHE6U5M/Gp3wsG9dIIS4q3XaCswl74y
	 P0rOVorL5HelrHrtTdEEVGFGFHSmGBxmlTUjdUZ1WeIS3b7S7sd6d0UuPSLqf02pOk
	 l7mqqDu0ilRRw==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 ctlin0.linux@gmail.com
In-Reply-To: <20230531075334.168637-1-CTLIN0@nuvoton.com>
References: <20230531075334.168637-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8825: Add the management of headset detection
 for power saving
Message-Id: <168553766178.87441.17558631123892687119.b4-ty@kernel.org>
Date: Wed, 31 May 2023 13:54:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: IFPL54CJMWBLIY2KG23QZTJS6HJT465X
X-Message-ID-Hash: IFPL54CJMWBLIY2KG23QZTJS6HJT465X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFPL54CJMWBLIY2KG23QZTJS6HJT465X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 15:53:35 +0800, David Lin wrote:
> The patch is to manage HSD feature for power saving. The detail is to
> disable HSD feature after the headset detection is done. When the jack
> is inserted, the HSD feature will be enabled again.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8825: Add the management of headset detection for power saving
      commit: 8315d8adc048bd7f8eb7ee5722ecef4e6e7d52ff

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

