Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB8C639114
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 22:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E3717AD;
	Fri, 25 Nov 2022 22:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E3717AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669411776;
	bh=0xBZcr14lwyjsHF7dlJH5PMtKmV5NZzWzABfHd8Uv70=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1Ekm1H1AP3ZyMOPHa7eQT9qrB4TmJAQeZA3atheZUv+0i1zw/zH1qxDLRbn+IEq+
	 pTdE8Q2dKcMbiuAKyABCt0z79NhmJPwxLw5lwpfiURlmhR2eALDGag+d92WCKvmeqD
	 w7hTTcoOGmX4or6p0lBjCj9P0iC1P/4iSzJTukWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC956F804C2;
	Fri, 25 Nov 2022 22:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BC0FF80236; Fri, 25 Nov 2022 22:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC16AF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 22:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC16AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FyN/y/wG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C497B82AEF;
 Fri, 25 Nov 2022 21:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E78C433D6;
 Fri, 25 Nov 2022 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669411708;
 bh=0xBZcr14lwyjsHF7dlJH5PMtKmV5NZzWzABfHd8Uv70=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FyN/y/wG71gRL4bdCvbpZKzn2vTFfMiK+ezemjIgv+82RiuxYyGSzeFyGp5bb8P+g
 2Dxmj+R+jwjx4SSiFgjhDyXYSrbnbddPrpxKQB+xHE+9CiWzHAMbY1FkRL5cZ7z0JH
 6dGr2aRScUydMJobgS0ZNJbacIEeLKC9iFwzwp2CcmLxpIqYAdR2tQF7qxpSj65DTd
 N/lhPEsvr6t0/FGeSJbNt5H35jUBYRdEnH9VFxS0OfaRlqvxTeaVTQ8czJz//eJHBk
 BZ4K5FFfMRz8ClZ+N1GjKVosFB/OwaLV9SwUgQesX7bdkjnIM6Muu1GExfzQ+KS3q+
 jYHHOCstluExw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
References: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: ops: Correct bounds check for second channel on
 SX controls
Message-Id: <166941170704.2089698.5303217854145032084.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 21:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

On Fri, 25 Nov 2022 16:23:47 +0000, Charles Keepax wrote:
> Currently the check against the max value for the control is being
> applied after the value has had the minimum applied and been masked. But
> the max value simply indicates the number of volume levels on an SX
> control, and as such should just be applied on the raw value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ops: Correct bounds check for second channel on SX controls
      commit: f33bcc506050f89433a52a3052054d4ebd37b1c1
[2/2] ASoC: cs42l51: Correct PGA Volume minimum value
      commit: 3d1bb6cc1a654c8693a85b1d262e610196edec8b

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
