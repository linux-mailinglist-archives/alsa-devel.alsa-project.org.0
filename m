Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB15B1D75
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1697316FF;
	Thu,  8 Sep 2022 14:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1697316FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662641032;
	bh=qvuIBK510EN7O/FMzgVwGP3upPVbCj22HKVOyWgYzm4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0+0PRBJDSv3FrIG2H3te0vqwiQrDsYKzjEZhRAoACbQnw4+EkxnOAjWRfbYOILO/
	 rGYmHsPbkri9XYJDeAMBnm+1q5ITH9wU1Nx8Ca1L835M7l0fM+js+wRwvbulWN0mLY
	 BqxELJt0qejNVKBuPAzNTFQNbppDtz/+ctOvnJVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14FE3F804B3;
	Thu,  8 Sep 2022 14:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 752C5F803DC; Thu,  8 Sep 2022 14:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22770F8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22770F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ttztZwTQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C633B81F74;
 Thu,  8 Sep 2022 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13557C433B5;
 Thu,  8 Sep 2022 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662640966;
 bh=qvuIBK510EN7O/FMzgVwGP3upPVbCj22HKVOyWgYzm4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=ttztZwTQdfiY725FJwQpHtF06zRglzvuZKMk24GU1XYbFzf32rN7MxaTPMiJGr/r2
 Y+Cp/UX3sEFFhCWP8e2MhpZLQNqyhCWCyhRyolKVAPDZPTPLHoVuXuYHgQm/4fNjse
 Gli6gFh2dptIgNAWX8oRT13fUpzQ0VJKFsHHiR5Ihd2P1iL/fUc1UFiTUwOVhJUkM+
 s1rsmQfedq0wHEhm49vE8KFrS8f1uT2EimPCsSEt/MOSeIqenuZ4Q0EpxEO4Iz2oHe
 ZtKvm8hquKNZ6s6GktmwC7Zl7sU1Wgmsyl+CgcppRvJ/jwQTjJCItha3mysYBiXDvR
 5f1st1A93WzKw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1662622316-23426-1-git-send-email-shengjiu.wang@nxp.com>
References: <1662622316-23426-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458: Remove component probe() and remove()
Message-Id: <166264096479.88408.4541345666660844637.b4-ty@kernel.org>
Date: Thu, 08 Sep 2022 13:42:44 +0100
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

On Thu, 8 Sep 2022 15:31:56 +0800, Shengjiu Wang wrote:
> Most function in ak4458_probe() and ak4458_remove() are
> duplicate with dai ops, so remove them and move dsd_path
> setting to dai ops.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: Remove component probe() and remove()
      commit: e9e7df88996d64544178f48b0299dfe736c6aa22

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
