Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747346F1942
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 15:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624D9130C;
	Fri, 28 Apr 2023 15:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624D9130C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682688169;
	bh=YXZ6wBkDngEyZN4eRJNnqElsdj4J/sdr5XEoXlwXYAM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TjD+R34RhjFDqYrOdTx9CITjGpEGzn2UPQYVz1/+W0UtJs2tDkf0gAHc4cFsgAbYk
	 qAnh3/g/8Agm61aEk33T25XE1sHzesJBkqLu3BUSoD8SMFTAF05ksr8DsCDWOv9D3m
	 ZVvmUgGYyZFMkUIkwiSu4cOgAO98Iq8/EEogN334=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF86FF80236;
	Fri, 28 Apr 2023 15:21:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6633FF8025E; Fri, 28 Apr 2023 15:21:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E6C4F80137
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 15:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E6C4F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pjpjkgTu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6FE963920;
	Fri, 28 Apr 2023 13:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC5EC433EF;
	Fri, 28 Apr 2023 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682688104;
	bh=YXZ6wBkDngEyZN4eRJNnqElsdj4J/sdr5XEoXlwXYAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pjpjkgTu6jqC5LYXrxU/d99poHI4PBoY5M7FO2xIm5OEMXxIzFZWvoa+17wJ4pUZS
	 8OicSSErqd7l79eCtsUXrPJPkhajyzHLv6kWZy9uIWbxugDchuWbwP53mo59hdpLAQ
	 CLHDYdy9uLZOVvmEAeCXBJ8D+gL+bKatYGZoBbRBWyEPvJBtN+TWZVClRaf4BQ943H
	 lAIqR5Q1N3X01Sp6BcMpICHnklaoJfq27v9eF1TvaQ9sYk9y4HfZOtGVeJeM+j4ffY
	 a8ZTVIDwE7RHSPxkEMv5rPYPZYDkozEvIE1cTteeuoSUdo75wwfn+A7LteBn53IRIe
	 UHBZbSN1eMRKA==
From: Mark Brown <broonie@kernel.org>
To: Enrico Belleri <kilgore.trout@idesmi.eu>
In-Reply-To: <20230427191645.24519-1-kilgore.trout@idesmi.eu>
References: <20230427191645.24519-1-kilgore.trout@idesmi.eu>
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS M3402RA into DMI table
Message-Id: <168268810348.376424.496991162529348922.b4-ty@kernel.org>
Date: Fri, 28 Apr 2023 14:21:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: 7B67I23HFJZ67HBMF4B7G4RJFHJTB7GB
X-Message-ID-Hash: 7B67I23HFJZ67HBMF4B7G4RJFHJTB7GB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7B67I23HFJZ67HBMF4B7G4RJFHJTB7GB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Apr 2023 21:16:45 +0200, Enrico Belleri wrote:
> Fix builtin microphone on ASUS Vivobook S 14 OLED 2022 (M3402RA)
> 
> Same issue with this model as apparently with other Rembrandt laptops: https://bugzilla.kernel.org/show_bug.cgi?id=216270
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add ASUS M3402RA into DMI table
      commit: 110ccfa9dd6ca1272e50fbea614aa31f01d2c17e

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

