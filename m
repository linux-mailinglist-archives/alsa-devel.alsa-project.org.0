Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FE58ADC9
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 18:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3664A1640;
	Fri,  5 Aug 2022 17:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3664A1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659715228;
	bh=ywwB+GB08IUTf4SICFzx9j3r3Iv2wp4vQCEBN2KY440=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDYyWAsN1FtKxDmgrqqBuF8yD+BbxOoBydjI5ghCTprKg5naEGEk2rgMlJ8EpfB1O
	 gfI07UJglAsHMOQDDh65+fi3N4cjT6jOQzDId2L44Qb6sNJXjFNQB6KCBaHdjcNe7G
	 4jeOqvqvFTrm8sxF/mPGrSfs7jAqdurtior8ojIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E84CF80271;
	Fri,  5 Aug 2022 17:59:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BC29F80121; Fri,  5 Aug 2022 17:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDDCAF80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 17:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDDCAF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mNx2Cklh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CC3FFCE2AEB;
 Fri,  5 Aug 2022 15:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A52C433D6;
 Fri,  5 Aug 2022 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659715161;
 bh=ywwB+GB08IUTf4SICFzx9j3r3Iv2wp4vQCEBN2KY440=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mNx2CklhalDxm48D6Q2k9NP//oWe9k32xyZlG3Sc7hroajh8Cp0k/q4uKOv95dN3f
 ZBXFKmSHVL2m65XeOSSSQUljySFzls/O8ufLE6T0mpECRRXQpgvN/0/LRgl1W0riT7
 5I8chWa0jyOsebpCnZfRoN0STR6y5kOkKMX4mW4nKOitfkWAk+KaMrNS7wC4L1d3gY
 TrbgJdeN7FfaoN/cvNkvysxACuzYIYEVdPrLmvA3WpWvrh4u3DECHqKTLYYYhASn1l
 aZ5+TF2VQ0vbzYxhK2T9/AhW+IfL7tbMCWzwq6UAL2Raao4SSOKN8wUlG1ZVM17jy1
 6Ui4K0CiKPDPw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220805133332.207932-1-pierre-louis.bossart@linux.intel.com>
References: <20220805133332.207932-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: fix sof_es8336 probe
Message-Id: <165971515972.1109790.8567073242302551613.b4-ty@kernel.org>
Date: Fri, 05 Aug 2022 16:59:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: tiwai@suse.de, Eugene J Markow <ejmarkow@yahoo.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Fri, 5 Aug 2022 15:33:32 +0200, Pierre-Louis Bossart wrote:
> Changes to add HDMI capture support broke the machine driver probe for
> all other platforms. The commit listed in the Fixes tag added a
> board_id descriptor but didn't add the default name for the
> sof_essx8336 machine driver.
> 
> Add the missing entry and remove the now-useless platform driver
> alias.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: fix sof_es8336 probe
      commit: d5beb74f17e25a3cb331a0cd8af795e8cfc5d36c

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
