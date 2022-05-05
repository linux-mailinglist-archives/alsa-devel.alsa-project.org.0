Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ACD51C39F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902A71828;
	Thu,  5 May 2022 17:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902A71828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651763635;
	bh=0D7MU0dHkdxGOE7RXexlR/iR0tAYQw8+ivhRWjMp3FA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkBe2R+whhjeko8T3ZGGMk00b2VFF8sxijMzhMc4JQGoWUo6JhJbfRCJ2CMab45aH
	 cwe7GaU1UVaA6G7zp18Y0kujZkpRK/BbTIKh71y2qmQV6XTFQ35vAcuUA4qq5F1bJV
	 7URb2Dd1LdizKphxsdVRMdHeWccICP75zqbYYakk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2348F8050F;
	Thu,  5 May 2022 17:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E923F8050F; Thu,  5 May 2022 17:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC62F804CF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC62F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="agnsg3TY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7D4FB82DB5;
 Thu,  5 May 2022 15:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D23BC385AF;
 Thu,  5 May 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763533;
 bh=0D7MU0dHkdxGOE7RXexlR/iR0tAYQw8+ivhRWjMp3FA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=agnsg3TYnwpX6aPG9clT2R2gXSbQqDEzIxmBhg26tkwdUNDbOZNE36zATNUWDZQ2o
 7vRcwxtXNheKa7AfP1EH7J3TNuHB6FbnbZ3BqIsKWlStqbmviwNnJ6mgvItQvdVE5Z
 VHTEitiQq2SGquRDA3E7RYjzqFP5VmKmZbItMRVpp/rh8/wDjRJ0GP3fdSFsQBAvNX
 DGrUtguzIspgflva/h4TvNF2u/Mzfgm1g+qOXVduyW5gQmENDXnPeegYIzmlWNLoai
 iaxAyDL8/+lN9+1gLHmAjE4M3ODJDfe8Pr0HE5NhTaBI3WIChrDAs1nPTTrj4RbtUi
 /esxfEI2tDc9g==
From: Mark Brown <broonie@kernel.org>
To: j-luthra@ti.com, peter.ujfalusi@gmail.com
In-Reply-To: <20220505111226.29217-1-j-luthra@ti.com>
References: <20220505111226.29217-1-j-luthra@ti.com>
Subject: Re: [PATCH v2 RESEND] ASoC: ti: davinci-mcasp: Add dma-type for bcdma
Message-Id: <165176353126.543130.13376348569850557799.b4-ty@kernel.org>
Date: Thu, 05 May 2022 16:12:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: j-choudhary@ti.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Thu, 5 May 2022 16:42:26 +0530, Jai Luthra wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> Set DMA type for ti-bcdma controller for AM62-SK.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-mcasp: Add dma-type for bcdma
      commit: ea706e5604e6d68ec7ec7243f0af0b569045e925

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
