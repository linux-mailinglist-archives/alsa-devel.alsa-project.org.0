Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE84AF495
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 16:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC5118C3;
	Wed,  9 Feb 2022 15:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC5118C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644418821;
	bh=DU6/v+izv8pNNZTJCmiuZGDYo/sZMpJPw+31870/nB0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqQxQW3tok7x7IRDJXrKO/JNlYYbrxIJZd4MmvybMSgMFKnaRL+ZNfqwwT4lWQ7ex
	 qxglNtgZSt0xFNosLUcDQNwSZUXnmwwzZnC1qCBC1ITv6tuXYHchUR11bnkTreo5+W
	 kd3cODxnoDlhRAh9JCrvCV5nupxZBR22CLdqgduc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93489F8016B;
	Wed,  9 Feb 2022 15:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D812F8016A; Wed,  9 Feb 2022 15:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14C39F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 15:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14C39F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bl+7PVYD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25E70B821B8;
 Wed,  9 Feb 2022 14:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD73C340ED;
 Wed,  9 Feb 2022 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644418744;
 bh=DU6/v+izv8pNNZTJCmiuZGDYo/sZMpJPw+31870/nB0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bl+7PVYDhIHLxRa03h3xGNvvNewR9YeDWEpdTTP3xPq3MoEDMqZqikKqdVceX3FzX
 A2nSLJu7I1kp/iZ8GRbcROtvxWyamXNColnpvQSaMQBwnUNYlJ/Rdy+84hxA7aaM/I
 PrumA/bGR/Hq+2CXHu9ALHXgrHFmYVikTgTedYZ2OGvUUXDFP5W4Q5hBtT713gsjaj
 OqcMvLwbVzzHOSR83sNgG8qi2O/vACjF5w/z7RC8Pw3vTvP0S4j3Ep4ChwrtDavvoE
 R2g6rclN4FleYSOrxg52YiRz6ofqBSuqrpGclG/k3mP9vRDpvtBloOcFwO0l+RKdnt
 BsH3UF/gqAoEQ==
From: Mark Brown <broonie@kernel.org>
To: bleung@chromium.org, cychiang@chromium.org,
 Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20220208031242.227563-1-tzungbi@google.com>
References: <20220208031242.227563-1-tzungbi@google.com>
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
Message-Id: <164441874351.2366723.7610524171266812751.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 14:59:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org
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

On Tue, 8 Feb 2022 11:12:42 +0800, Tzung-Bi Shih wrote:
> Updates cros_ec_codec maintainers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] MAINTAINERS: update cros_ec_codec maintainers
      commit: e4e3a93c6e267572ca2345d8d86053e166843a8c

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
