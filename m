Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F59422CBB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB27E1675;
	Tue,  5 Oct 2021 17:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB27E1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633448387;
	bh=NDqzyzVRCseVfehnZCfJwcwxRplzAv5y7xgVWiv5h6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGBvTovgwygetPvpo0c6kKOWs6jqozy+4xWCfqiZHOnMRITg/3y3N4S5bKFhhLpz9
	 BbOeqVPlxsOzhD/I7tLHtDM6zU9uLl/QhFxjSFrk9BBKdCMRW/mHwSlKKevLzOie71
	 j7tBCyg10x1VgucgAyAVVkRyaMBUHh7ejwn0v7JM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8DF2F80259;
	Tue,  5 Oct 2021 17:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B8C4F802A0; Tue,  5 Oct 2021 17:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E0A9F8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E0A9F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mRLB1i18"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC24861131;
 Tue,  5 Oct 2021 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633448273;
 bh=NDqzyzVRCseVfehnZCfJwcwxRplzAv5y7xgVWiv5h6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mRLB1i18yBikWXrcSr2dYUdfryincbW+qKniOtsmqO5zfQOl62P6VUBu/zWN9rLGe
 iA9L168JWk91b0fezdApNvNbMXDs8mvIcP25+SvInF8x4b6Cy/YKXbGdh8dSfQ3+X+
 mA6drQW9GOlHpV0vfF4/CnyvmTGgLSAFpofDBfiRWueO/p+f2DXvkjcU2vaRIfnSSo
 XRsSjIjZ7b5B39AFBZwg7bjCzoEjsRx5S9qmlKjd/xMSOgJGdHOM0uDJNBSo/FTIl7
 Vtc0RwNvbyJ20j0Ts06507gw5UkKavLwqE5Of3GsaNgoTt5J4dThzl8kAMi3fChM+K
 3WWZ5oRhihKTA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: OF: Add fw_path and tplg_path parameters
Date: Tue,  5 Oct 2021 16:37:41 +0100
Message-Id: <163344779742.1075058.4675393648242065057.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005071949.1277613-1-daniel.baluta@oss.nxp.com>
References: <20211005071949.1277613-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Tue, 5 Oct 2021 10:19:49 +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> This allows specifying an alternate path for SOF firmware or
> SOF topology.
> 
> This is particularly useful for i.MX when running Linux vs Android.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: OF: Add fw_path and tplg_path parameters
      commit: 7b84fd262d8a54ca609dd719c20c8a8e1a7ff759

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
