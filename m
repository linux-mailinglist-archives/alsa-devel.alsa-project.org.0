Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A75414BBE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 16:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CE015E5;
	Wed, 22 Sep 2021 16:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CE015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632320642;
	bh=3znKXZEw69RZVO7GNKBBy2vVDp1Qy2/xtsvfwgxbMVE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6dIsv8jBOHAzBiF/fHRDF6mO8/E4qcC7gIjIxgNFJR4F33R7nHBYaUmKCOj9ukQf
	 NhdBBZ4uBetW18ctxeI/Oiwkct74zdBmW3vOTDGnf54yp7C1yGQtE9cFjYNEWml4a1
	 SIo8lAKNhTkgUr3suFSlh7mx+NHHz8hPfdfn1MMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B16FFF8013F;
	Wed, 22 Sep 2021 16:22:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A536F802A0; Wed, 22 Sep 2021 16:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B005F80246
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 16:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B005F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JhHuo6oc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 093D3611EE;
 Wed, 22 Sep 2021 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632320554;
 bh=3znKXZEw69RZVO7GNKBBy2vVDp1Qy2/xtsvfwgxbMVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JhHuo6ocGb4Ot7QOPLuqBUNr/NH6ObSg3cO8+Ip3BLpXy1DMItfF20E6lv69OM/pl
 qCwvf/2si716QToqPMHbTm6C1ZZPXi6CbhCiedJ7vaF3/2HURb4JrFjgxd3OX+P5Ps
 MdxtJ6uyogMyExBSZsNUjTZI02E8arUdp0Lg3L5GpPngZjm8kn3ZhM+vBBb4CrLw16
 PFIViryKkxAP+tXd0wBUd0BQm9Y6Df1Nrn942eb0dIFBITDUL876xRrRYpKpbVuo8W
 BwldfpN8FYB6oBpdxKrtAB3X3Q6myBnrl/DdRR+GrE+YiF3eeFcHW9uHUmpSQ7Dtna
 Jg8oQkTriSiKQ==
From: Mark Brown <broonie@kernel.org>
To: Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Use modern ASoC DAI format
 terminology
Date: Wed, 22 Sep 2021 15:21:40 +0100
Message-Id: <163232020287.53242.3096961203697456839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920170414.17903-1-broonie@kernel.org>
References: <20210920170414.17903-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Mon, 20 Sep 2021 18:04:14 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the cros_ec_codec driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cros_ec_codec: Use modern ASoC DAI format terminology
      commit: 94767044f0c5b66de79a03f1ed02e2515da4fab5

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
