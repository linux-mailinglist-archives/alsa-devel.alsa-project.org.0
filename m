Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBB62C143
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F061F1697;
	Wed, 16 Nov 2022 15:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F061F1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668610025;
	bh=8h23STOhuohvcppjywrWDE9rgijY1078aR3HT6vsyLw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QsgQlvQ1TGKaJZyffA/NOPY2CYseka5nYHU+7RtBVs8OjcYRgHKpVhuoQnqrVhEOO
	 B9hZztminZNuWv3KUHGr8xE9o/g4ztz+ndfPo2j91J2pC60IaeHXb4jkusVPq7ih5q
	 WNE6dJKizaEpZDXV595jP9kq9mwqcq/201Wkntj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E81F80089;
	Wed, 16 Nov 2022 15:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C878F80169; Wed, 16 Nov 2022 15:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E93AF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E93AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TH566u3Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1D4461E0F;
 Wed, 16 Nov 2022 14:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE952C433C1;
 Wed, 16 Nov 2022 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668609960;
 bh=8h23STOhuohvcppjywrWDE9rgijY1078aR3HT6vsyLw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TH566u3YDkmybi9jLXSgYBo9bevNguw9KV8wGIEhTi9puLCKWA6JcDv1LHJIl8rpV
 IE6qjPFKfi9yXCVazpvxFfKSYv2bOMtVCd7lcroDsZ7qNKa3wUxs+x/j/zUZpj2c9w
 gFgVZIKko1zYxQYoc4/xwq8nQOx96UgR5Dlk5utfHMjiYGM4SRB23DWDyNye0xt5cT
 f6/0OCyF3W8MKhtU1id4d0jblMB0w8mLLH9l09er4R9Vb7UznDLKAtPHy/mHqMCw0+
 Py5lOw/e4yznIvNDTKy2pc/y2oSgox9GbAVnrnQJ/uF+KqsuSQUxuuKlqMFWbrTVA/
 a9Fj3mdAGZtlA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
In-Reply-To: <20221116105938.762550-1-Syed.SabaKareem@amd.com>
References: <20221116105938.762550-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 1/2] ASoC: amd: ps: update macros with ps platform naming
 convention
Message-Id: <166860995741.526370.1821465531343150450.b4-ty@kernel.org>
Date: Wed, 16 Nov 2022 14:45:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com
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

On Wed, 16 Nov 2022 16:29:22 +0530, Syed Saba Kareem wrote:
> Update macros using ps platform naming convention.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: ps: update macros with ps platform naming convention
      commit: d25ec74c6c5419f834bab506f251bc760bdfb858
[2/2] ASoC: amd: ps: Move acp63_dev_data strcture from PCI driver
      commit: 7d95977533e14738e8193c14a7efac369288aeee

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
