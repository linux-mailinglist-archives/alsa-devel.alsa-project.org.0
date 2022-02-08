Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4884ADBFF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 16:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F7F16E7;
	Tue,  8 Feb 2022 16:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F7F16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644332942;
	bh=Psk1ZLqh0UmevxZEu2HWDv2B9PaVEyoi99nYlDcN5bk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ER2ZL+wTiNG5yJplOkHZpXHoE69MfU71CCaAfA7EzoyCwcstMbXm2fXinfZTENST+
	 koZ31yB8iJSBnk0pex/EKmhp1u/XyLeBX1B8ke7KIpbedvaUxAtFbN2jGM6KSuQ15G
	 IKXhSBq3s3mwKORXqbdeV53XWAz3gRoVnChl/hKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0ECF8015B;
	Tue,  8 Feb 2022 16:07:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA9F0F8013C; Tue,  8 Feb 2022 16:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E800F800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 16:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E800F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="epXTRJKM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F8A0B81B97;
 Tue,  8 Feb 2022 15:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98D2C004E1;
 Tue,  8 Feb 2022 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644332869;
 bh=Psk1ZLqh0UmevxZEu2HWDv2B9PaVEyoi99nYlDcN5bk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=epXTRJKMg3TdD2CrQP41zs9bWglTCNWIZKOanGKLS/4N7Fq5u7k5lwd8O7L33yNvt
 cWIEkyoBSAMbcmM+0BslJOs3EKzsJDzd2R7FNIY8oQXrH9/YUH6IOSVplePNoiT7lZ
 VK7EDqqSjlHi6fnuISrAfeBIJu2o6w4jh1tSV7PuJmq28Z+iFYP8MvEJVYn671AOaG
 8Jpr5Of8yH11OCZjpqHZ7Z7EIbIHbTYEaJ/3CIZIeiCYbgEObINpqNmMsxPPejJjar
 JNifvLa4/kr79MLys530o6M1vL+acdekAKpHsTBAl+9leVROqZ4XRLjU5Ayj0WeL2r
 m4i/SkVCsJCaw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220204095301.5554-1-povik+lin@cutebit.org>
References: <20220204095301.5554-1-povik+lin@cutebit.org>
Subject: Re: [PATCH v2] ASoC: tas2770: Insert post reset delay
Message-Id: <164433286760.2964899.3613770196974272763.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 15:07:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Frank Shi <shifu0704@thundersoft.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ye Bin <yebin10@huawei.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 4 Feb 2022 10:53:01 +0100, Martin Povišer wrote:
> Per TAS2770 datasheet there must be a 1 ms delay from reset to first
> command. So insert delays into the driver where appropriate.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: tas2770: Insert post reset delay
      commit: 307f31452078792aab94a729fce33200c6e42dc4

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
