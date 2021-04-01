Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6235134B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583DA16A2;
	Thu,  1 Apr 2021 12:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583DA16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272453;
	bh=P6MNOdaWHxHkb23Ta5r2u+eFDKM+94LggzIXr7z73p8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fy+2hqjYFyKsm5HMBS8zENDIjmdM/amfKDxDilkDO8kMJDGCFM0Jhis5q3tUL5m9Z
	 B98pEn+Iqce1ivVZYD6Pjw17r/lKJ3Arx73KqlkQj8Z+CS5Y/uOuVPMOVL6JzhS470
	 y71LdBdePa9XDkaeBE26BxMm2B7t55Sy3om66I0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AABAF804B0;
	Thu,  1 Apr 2021 12:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D40DAF804A9; Thu,  1 Apr 2021 12:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC769F8026F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC769F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bB3/q6L8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 643446108B;
 Thu,  1 Apr 2021 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272238;
 bh=P6MNOdaWHxHkb23Ta5r2u+eFDKM+94LggzIXr7z73p8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bB3/q6L8wHVEBuWb4vrWXDawqc5HI321BuQs70r9pD5Pu42UnjT6pkIbR6IWVa/mD
 vsF8pLjzApOgQsY3A0LV+dpgxaiKjF4kSwNLi47X9Wl5YSypl0yctlKKxpEJJ4ILX4
 QMLUcTNRE18NB6aHIwa3/L2EJnvwMxtcsAP7vSfh863CF2Yi6Q2q7smLGs7Oc9bYWd
 seRR/vMn2JsgIWWvJlwmGtXnaWZvMl4/qp4JfyO1qOhv7bVIK2wfRAMz4wzcXr4MF4
 WHUE7W5JOnOCTtF9DUar7vCERshPb4292dTQ4+OWUcXwH8/0Sm08eydElEzmwv0iOP
 6I2PQnpXcKrEw==
From: Mark Brown <broonie@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, cezary.rojewski@intel.com,
 perex@perex.cz, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, gustavoars@kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Intel: Fix a typo
Date: Thu,  1 Apr 2021 11:16:24 +0100
Message-Id: <161726938995.2219.9727885151861979594.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322210105.1575758-1-unixbhaskar@gmail.com>
References: <20210322210105.1575758-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, rdunlap@infradead.org
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

On Tue, 23 Mar 2021 02:31:05 +0530, Bhaskar Chowdhury wrote:
> s/defintions/definitions/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Fix a typo
      commit: bb0f78e59777d55e0065d16d070b5d43ae80b769

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
