Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49242351346
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6AEA169A;
	Thu,  1 Apr 2021 12:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6AEA169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272425;
	bh=zCVbEj+QZrf0qeL7NPNaHc+CKMjiPPmnunTrdUaxOoI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lcCwUqvxURQGi+AjhxAUyfycDRidf6ooA34mtXnLkPFcUNTz9D5a3aG7710cjBBPz
	 d84t/1RpSewd8ys+RSnaanyboeGXWW6m1uWtN9GMrwkM+3T38p3f6iDnKhI/5idnbZ
	 1fcZFWCpzOm7H4QztvhQ8YCvinc/ztDb6ZM9JcME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AADFCF804AA;
	Thu,  1 Apr 2021 12:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58FFAF80425; Thu,  1 Apr 2021 12:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2ABDF80423
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2ABDF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZUdxuMIg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F2C960FDB;
 Thu,  1 Apr 2021 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272234;
 bh=zCVbEj+QZrf0qeL7NPNaHc+CKMjiPPmnunTrdUaxOoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZUdxuMIgpGv6gbqsJGu57OBWLcLkvfl/AXuSjoxd3fFQSCff+ySkgWI500HEoTwmW
 Tqmu5jB3GKORD4KkusrZD4LEio0mYBJdIHKBLBxjKvQmA7iSShXc9td2XMtJNrUnOB
 CsG9ORuMznyQjAlfhq4Jdg5QCiVmr+zEk6x0rG+kM4EIsdkyeJQmAcVbYCPOboVD3y
 N02tmB4wHsAVLgJ8Px0WRqP766BkKeeOSgP/uaGBeLfzRdprQujut9/TisZAPElzh8
 I1LAbJI5IOdG1Ef6d3e4DJU15i9ATR7ESQQYNWKQvE2FGDt++cMmnkMxtvEQ0ZFF7B
 UuuS/V0VVfsnQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org,
	lgirdwood@gmail.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] dt-bindings: sound: add address-cells and size-cells
 information
Date: Thu,  1 Apr 2021 11:16:23 +0100
Message-Id: <161726938994.2219.8993456253882772159.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210331071046.12526-1-jack.yu@realtek.com>
References: <20210331071046.12526-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Wed, 31 Mar 2021 15:10:46 +0800, Jack Yu wrote:
> Add address-cells and size-cells information to fix warnings
> for rt1019.yaml.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: add address-cells and size-cells information
      commit: e896ec390870287dcc92f3b46d80da88f3b4b1f8

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
