Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F358B588322
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 22:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F4E1FC;
	Tue,  2 Aug 2022 22:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F4E1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659472150;
	bh=9+uTudOKSevR9wNY63ife8yPw0XoLqdJ5VHxjsyvLOc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1eDAfGYDgbNHIuNm2PWqvdBgkiGoXSYCEzkYZ2ogmuNfD8y8OPf4wPIY4kJ93N/5
	 xX1z3AuJehLW/cGDHWpLgZZ8CFICSaLg5kUz98QmaTqJJRSXeajdM7IWZoL9DwU07G
	 phOXrFU36cyw7c92lt4OyimSTN7p9EwXq0r+8oho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC03F800B8;
	Tue,  2 Aug 2022 22:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54163F8026A; Tue,  2 Aug 2022 22:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BB28F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 22:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BB28F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IEdM/T8c"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F45AB820AA;
 Tue,  2 Aug 2022 20:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064EBC433C1;
 Tue,  2 Aug 2022 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659472079;
 bh=9+uTudOKSevR9wNY63ife8yPw0XoLqdJ5VHxjsyvLOc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IEdM/T8c2RW0QTzNsieYpVLNgoykjJDlyv//avXW9ZRb9k4zySej4HuKm/zg/kLto
 bFLBHU50b+kAx9B2snWI8pASz+/I56GDipKnI2rYJHxh5jC+g0IovHqWNWaFDG0tK9
 aK7yTzjFUcnwsI+A8rZvKPvGqDDsIVqXWNV4XQdWi+sVPLIgZt/ua8qJuEySx3SfK5
 DlUXU9U2ZaHXFlSZFs4ibTVkobs0azBOL1vATHdXGDGB2Q8J8JKDe4LSswJDqyvRC+
 RqzHzFw6tUVsaS9xXnCwxRcrBFs0jB9s/fKiuXyVEUqJ7nIsyAiLxejo+y8ZcmziyX
 Q36yi7D43nZ4g==
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220802062503.159328-1-Syed.SabaKareem@amd.com>
References: <20220802062503.159328-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Update DMI table entries for AMD platforms
Message-Id: <165947207673.2174889.4273360535834711916.b4-ty@kernel.org>
Date: Tue, 02 Aug 2022 21:27:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Sunil-kumar.Dommati@amd.com,
 Pananchikkal Renjith <renjith.pananchikkal@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Vijendar.Mukunda@amd.com
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

On Tue, 2 Aug 2022 11:55:00 +0530, Syed Saba Kareem wrote:
> From: syed sabakareem <Syed.SabaKareem@amd.com>
> 
> Updated DMI entries 21EM, 21EN, 21J5 and 21J6 for
> AMD platforms P15v Gen 3 and P14s Gen 3.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Update DMI table entries for AMD platforms
      commit: c0fc96fed7ffa3e58f58b9cdb7158b5c61e026a2

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
