Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C083565660F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 00:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA2765A0;
	Tue, 27 Dec 2022 00:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA2765A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672097705;
	bh=7DsybbBBAfTaw/MyZaW8yFKygVp4C3sX9HBvOmr/AQA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bawINosVb2jsBNS/z57tcFXGYUP85Nbt6TbGpEVK1XPaRFoeOpNt+64SLleo8k17h
	 peHYRdadQIOiwJUi98rjBg2q9NIMWCBFNUfuO0szDbXTn8l8cPK3pAVVWkyBznMGtz
	 p6vMiv7rxA7KVKCNq0fEVw48tysjr7vOht6khSos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C951F8027B;
	Tue, 27 Dec 2022 00:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95229F80310; Tue, 27 Dec 2022 00:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECBAAF8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 00:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECBAAF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TJ+UpzFE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AB24DCE0ED9;
 Mon, 26 Dec 2022 23:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9623EC433EF;
 Mon, 26 Dec 2022 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672097634;
 bh=7DsybbBBAfTaw/MyZaW8yFKygVp4C3sX9HBvOmr/AQA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TJ+UpzFEDwFLbxscII1eoB1vN56nUV4f50QVIrLfxfIGy1TgNdofvm/WE0BV9Lvqc
 V5SRlFyEasnroQlJ6MeslSpE91Z1bJWIqCbDeZppdKEoo1HEmBVdKBa4kBDKcBp+/Q
 8llM+rzO9OjBzxA16aAuYBGrHp0824GJ7Jr3AxyNNSveArcpa2IR3DKUmUUo9vg8Fs
 R9vncwZFKL77rbliQqprVR+CXCsRvT4QHQ2phwCU3ARrExANQRzmc47t8DF/3h+6/9
 FdK7v2WUFC/AkEs5Z3/CCsVRzZ7rzKK9vVtzS+i/QCgVvYxcrmyw8gefh+/8XT+6bu
 sl6CuwhsOT+sg==
From: Mark Brown <broonie@kernel.org>
To: Wim Van Boven <wimvanboven@gmail.com>
In-Reply-To: <20221216081828.12382-1-wimvanboven@gmail.com>
References: <20221216081828.12382-1-wimvanboven@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Razer Blade 14 2022 into DMI table
Message-Id: <167209763231.330820.17564668361422560655.b4-ty@kernel.org>
Date: Mon, 26 Dec 2022 23:33:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Leohearts <leohearts@leohearts.com>, linkt <xazrael@hotmail.com>,
 Brent Mendelsohn <mendiebm@gmail.com>,
 syed sabakareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 16 Dec 2022 09:18:27 +0100, Wim Van Boven wrote:
> Razer Blade 14 (2022) - RZ09-0427 needs the quirk to enable the built in microphone
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Razer Blade 14 2022 into DMI table
      commit: 68506a173dd700c2bd794dcc3489edcdb8ee35c6

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
