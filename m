Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A713C35A7E3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 22:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7A01687;
	Fri,  9 Apr 2021 22:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7A01687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618000406;
	bh=BeiGPQF4r8VyBzIQvZKqSDgXcCORBivkOVQHybx4D08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=noaS7nXjGQOC1KuLKX5fkCB3kGvx87p66cJb9kQOtySY2CO6Zuq1n1E3HcszFkTFT
	 XUAYhXVJRRVwBJ+lz5xSpWyjJoURVjqjUyM9mxmr4Rfu62fsBGM7Q8AfpuoK701V8N
	 QLVn6WNAe+D0p3qvvVnFoNxew8yhxdzQPYjdW3h8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CF8F8016D;
	Fri,  9 Apr 2021 22:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89771F8016A; Fri,  9 Apr 2021 22:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54DEEF80113
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 22:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DEEF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbDkesqL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF18E61106;
 Fri,  9 Apr 2021 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618000305;
 bh=BeiGPQF4r8VyBzIQvZKqSDgXcCORBivkOVQHybx4D08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbDkesqLG4c480w9DAzuDLfUZtJHAsUeu8M3gib7hon0C4r2C6bnWymZbAhFaKJ8X
 lU54NOoe64w55zajnjZ58q+7yMdVkT77+ibKHjBmcE0iccy+h9H4WaYL4cxCPYq17A
 vi5VginjD8g7RIDcy1+aJF7YWU3DQjFNA2yveRs8fZmW80xvsJHIYKU1pDT5HPZpUB
 iJcxn8sa7cuIAirRL5zW7l+svlSWWZOvFjsptkzfmlhPS+RcCCe7ojb9uQn06Nm37M
 ycm9nR2qfd9LcvhQEopxkmsBVY8llefLj6Nagd2fYQUb53ujzQd8bRSfNYNAMQRz7o
 r1Nw70wo6qX2g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2] ASoC: amd: Add support for ALC1015P codec in acp3x
 machine driver
Date: Fri,  9 Apr 2021 21:31:26 +0100
Message-Id: <161800014171.27483.4701551511865013936.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1617886984-9500-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1617886984-9500-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>,
 shumingf@realtek.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Alexander.Deucher@amd.com, flove@realtek.com, kent_chen@realtek.com
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

On Thu, 8 Apr 2021 18:32:36 +0530, Vijendar Mukunda wrote:
> Add ALC1015p codec support for acp3x machine driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Add support for ALC1015P codec in acp3x machine driver
      commit: 26e33ed9f18475ebdc981d45150ac9a019e69f07

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
