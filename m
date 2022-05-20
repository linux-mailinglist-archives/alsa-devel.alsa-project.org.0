Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04A52F138
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 19:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE981745;
	Fri, 20 May 2022 18:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE981745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653066029;
	bh=3azuETAmGZlEwX/wPLs4EOiDGdGEXJV56CdJtxT8nI4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tK+OV5tOHN3WuyEd8u3Rt3f+yIp6VknIBPdGuiHzmJ3Nnb5v+GhYKE5NKOGOBPUJR
	 wbeCyNuGi7bwf8mfakg65yTx8CehXtURCMeEWk9RqWr7pqA2gP9dPfe2I6XvkKy0wg
	 eKahhYAj8W+UA9R3wOqAUVzQVdO2cWWIzjj41Wrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03413F80519;
	Fri, 20 May 2022 18:59:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82B64F804C1; Fri, 20 May 2022 18:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB14F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 18:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB14F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUPFO+qt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D77A961E77;
 Fri, 20 May 2022 16:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D16C34100;
 Fri, 20 May 2022 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653065930;
 bh=3azuETAmGZlEwX/wPLs4EOiDGdGEXJV56CdJtxT8nI4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XUPFO+qtP/NLt3gMki4chQI1J4qFlh9mUpktQbMvpfuLd4VkyhdV90Z+NKIvQ1nn3
 COTGJObBu6HwIh4z1UM3WxRKsLxnYyvYqtigLgixZgEvfTVunwrs5wYxghMbOrF10Y
 fK+pnsP1hEGrKm+GICIxLu2S+LBZlkASF5xd+VX6fYBOf4WFD8wDulrgHI4GPuZMvo
 Pzd5xbKwi8CBaS73oJYKow+H/AjyjZ7+Khc/bBK767qmX88EuvqsaXVwi8iiMjss4W
 pfc2EZx6ZnfkJ+slzGnhg1N7tYaTY/akWKWsph29YcAt8Pwq17kUwpg+UNJsNryLjC
 p4FlZ7AhwVFZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, khoroshilov@ispras.ru
In-Reply-To: <1652999486-29653-1-git-send-email-khoroshilov@ispras.ru>
References: <1652999486-29653-1-git-send-email-khoroshilov@ispras.ru>
Subject: Re: [PATCH] ASoC: max98090: Move check for invalid values before
 casting in max98090_put_enab_tlv()
Message-Id: <165306592925.462688.10342904304525051880.b4-ty@kernel.org>
Date: Fri, 20 May 2022 17:58:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

On Fri, 20 May 2022 01:31:26 +0300, Alexey Khoroshilov wrote:
> Validation of signed input should be done before casting to unsigned int.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98090: Move check for invalid values before casting in max98090_put_enab_tlv()
      commit: f7a344468105ef8c54086dfdc800e6f5a8417d3e

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
