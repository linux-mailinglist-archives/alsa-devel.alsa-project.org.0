Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC162603F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:16:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10EC1682;
	Fri, 11 Nov 2022 18:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10EC1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668186989;
	bh=BK/wlyQirHPg/jPftmmgrMeftFTDzLPkC19m/RcmKrw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gqRzKMGSVo+WsHj6venDCAF/44ZLRr+qGMgwfquuRB8bq6SlFgCZcu+kAO12dDHcp
	 U2+W9QIBNKNYJOuB8ls1I1JmstpXPDvrqB5bVO5H1+Rxpd8A2V3Z3ZQYUO/F8pDWin
	 WdplAAFyhj64dYYCdmuidOfwJPDVAoAMikicGMtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D292F80548;
	Fri, 11 Nov 2022 18:15:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16FDF80548; Fri, 11 Nov 2022 18:15:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA81F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA81F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="II/7ZMYW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DE576205E;
 Fri, 11 Nov 2022 17:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555CAC433C1;
 Fri, 11 Nov 2022 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668186900;
 bh=BK/wlyQirHPg/jPftmmgrMeftFTDzLPkC19m/RcmKrw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=II/7ZMYW65BZoTbAUdgF0v68reMfz3flpvZQNmckZEFYwwLY9a/MQ1/GN/PJVZiDg
 GhkBQUSrq4qxEqV0BJHfVMCRySntU25YutqSXCU3JWxM3JlX7yWrnu76TEmUt2MFLB
 cuR++M1jeF1l2FfLcGwV3HlfHl5eJJaHCdfAhanXXS7F1jMZQZsiu1idPVwCAmdDAI
 5CmpQm7MIb5MRcEcXV9cFYibzYtOU+W/Fzr2IsBK3CdjoQz2hcRD1OPvl0Pqxez4pt
 Km6D4ipBxWRfosU6CNXj/61fixqNubS0BAK4Pkk8oRGk9okZ6oIYTAM834bDrYSEbl
 dasE9F3JEBRvA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20221109091244.17198-1-shumingf@realtek.com>
References: <20221109091244.17198-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/4] ASoC: rt1316-sdw: get BQ params property and apply
 them
Message-Id: <166818689808.487154.4016775094193741676.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:14:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, jfmiranda@gmail.com,
 derek.fang@realtek.com, flove@realtek.com, pierre-louis.bossart@intel.com
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

On Wed, 9 Nov 2022 17:12:44 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> If the machine driver level sets the BQ params into the device property,
> the codec driver will get the BQ params and apply them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: rt1316-sdw: get BQ params property and apply them
      commit: 3c46b589db83db8a445924d0273005631a056aea

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
