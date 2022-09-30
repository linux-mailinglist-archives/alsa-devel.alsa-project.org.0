Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6F55F0662
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733721666;
	Fri, 30 Sep 2022 10:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733721666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664526521;
	bh=UlyG5Hp2qKxD39ltFJxeWxwyGpL49K7h6rVl7P24Xh8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=czzcaYIDQRu1uOfnSw3noMKDbJIN6uS5VFCTwKm4qmPA1EjKBODptQa89UQ4FtzQx
	 Ex+v6q9RT+TLVshNzh7hygp++cFiW0sE45PicpfXoXb+SPIa+pvKcxeUqmwUeHOc6l
	 wCCeBahew7uhDULThpWh4SxzVuphosiYKoldnzms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDFFF800AA;
	Fri, 30 Sep 2022 10:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B28CF80155; Fri, 30 Sep 2022 10:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A631F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A631F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R6oNXMs9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48C4BB8276B;
 Fri, 30 Sep 2022 08:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717ECC433D6;
 Fri, 30 Sep 2022 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664526458;
 bh=UlyG5Hp2qKxD39ltFJxeWxwyGpL49K7h6rVl7P24Xh8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=R6oNXMs9k8PW8D2NE23JdJ+O9a5WIYAFVI3G+LK97R7AYjnmJlxInotwNCk4scXB8
 Hbx+ZAXxIpW+QAciUTb5fzBy/89e6fHvQKhmP2uAE2J+Y4IfBoq9APYF52q47xxDCw
 ZrOsg1XMOplHrDMQb4wysAeRDNCb7iFz/mPdA48elHPjUVA1Ky+dNo7Iak8TizoyLb
 oPrXFChkrPC6Z4aAZ2o+fYbXrwFtW4KtGAm7wxI3d/P621cY8yINpfI7CcilNk7V26
 7FI+Wb0n17yoI1CH8BSk0dWj0UKPuK2sWWA9iwO5u1UXLsM9G11OJYNYjjuiWhXUD/
 yoaEarwxrWsjw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
In-Reply-To: <20220929080654.326311-1-perex@perex.cz>
References: <20220929080654.326311-1-perex@perex.cz>
Subject: Re: [PATCH] ASoC: core: clarify the driver name initialization
Message-Id: <166452645714.46391.3469312121408388461.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 09:27:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 29 Sep 2022 10:06:54 +0200, Jaroslav Kysela wrote:
> The driver field in the struct snd_ctl_card_info is a valid
> user space identifier. Actually, many ASoC drivers do not care
> and let to initialize this field using a standard wrapping method.
> Unfortunately, in this way, this field becomes unusable and
> unreadable for the drivers with longer card names. Also,
> there is a possibility to have clashes (driver field has
> only limit of 15 characters).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: clarify the driver name initialization
      commit: c8d18e44022518ab026338ae86bf14cdf2e71887

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
