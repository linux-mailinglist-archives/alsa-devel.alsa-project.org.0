Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBD8FBDB7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 23:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0F07A4A;
	Tue,  4 Jun 2024 23:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0F07A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717534928;
	bh=GR11cOGiVBb2/VgBAF5/sZzZJ18pk1DLL2A/v780xM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mCEed7M74XE35wxGtm2hypYDSo7A3Z4a82b55dbhulKLuPpNVAZ50F1AeKE14LDyF
	 ra9pBJ/yyimMy+AEyEznQVOVP8i3YHJrmEJ7rHd24xMrYKp/qsykmbuqnStUj0grxJ
	 hQUZufppDA7/Z6nBMzHYiZFc5Ns3oZIxiOrn37ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22A0BF80587; Tue,  4 Jun 2024 23:01:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E5A7F8059F;
	Tue,  4 Jun 2024 23:01:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E306DF802DB; Tue,  4 Jun 2024 23:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AD98F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 23:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD98F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ojfrVVSc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCB8B61255;
	Tue,  4 Jun 2024 21:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5021EC2BBFC;
	Tue,  4 Jun 2024 21:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717534801;
	bh=GR11cOGiVBb2/VgBAF5/sZzZJ18pk1DLL2A/v780xM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ojfrVVScUAla/q/8p5rwFtAVhayUYVuxe7pQoJjAACQXBR2H9+nSYwWaJ5R4tUdgU
	 H22TwEG9jROHhVvHIGquGtB47zasbatd7xAV269rnsmUkq58FyleDqOsnuMd6gUtJB
	 kY7FGQrRVMsrY8uiKGlCWh41nrXyQcdEB4cZ3IJydm+PYbTdocQRmA519miGBoWxlg
	 NkFu4SpCJbritcYoXgpVNJBu9ZNxhbY/FVuF7zgMuPnMx70wiiLbmrKUXPRnBj35MQ
	 39ADxIhdYPNOuCv0ygBFxUpr/50dzmN+A3C6jsShXPlfpwSyaKHdBASxO3xl15TrQm
	 hLGvKTRB/3nCA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20240604021946.2911-1-zhangyi@everest-semi.com>
References: <20240604021946.2911-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: Slove headphone detection issue
Message-Id: <171753480004.301205.3916865445761167999.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 22:00:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: NZS7EJO7OCVA2OPHHONFYH4TVBAN2OBM
X-Message-ID-Hash: NZS7EJO7OCVA2OPHHONFYH4TVBAN2OBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZS7EJO7OCVA2OPHHONFYH4TVBAN2OBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Jun 2024 10:19:46 +0800, Zhang Yi wrote:
> When switching between OMTP and CTIA headset, we can hear pop noise.
> To solve this issue, We modified the configuration for headphone detection
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Slove headphone detection issue
      commit: b7c40988808f8d7426dee1e4d96a4e204de4a8bc

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

