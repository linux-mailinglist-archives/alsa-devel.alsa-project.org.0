Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB445A15BE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 17:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05EF6162F;
	Thu, 25 Aug 2022 17:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05EF6162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661441398;
	bh=j1fvqVh0D4vhUvOUmY4ADt4O0ZqfHtmTk2qcmFDP/+Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayf7FXBivPWbclUOUFF0gnbY2xFdHZ+/pO57QD9eiexaxAQ2LKSbjuhgLJjgEsFav
	 VHYYkH3iPAnxzVryUJFTkQlj6GWxTDHhjebtfeMTIYZ4OiTSYYS4qYuSaP2PFJhrg+
	 6ktdvBJzYHmgi7lJwPMPvKQ4SH7Apb8zY+0Bx6Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12700F80528;
	Thu, 25 Aug 2022 17:28:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1587BF80506; Thu, 25 Aug 2022 17:28:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4A37F8027C
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 17:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4A37F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VgnrmywO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A999B82A1E;
 Thu, 25 Aug 2022 15:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08990C433D6;
 Thu, 25 Aug 2022 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661441305;
 bh=j1fvqVh0D4vhUvOUmY4ADt4O0ZqfHtmTk2qcmFDP/+Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VgnrmywOkzXYfMeKmSFBbO0q6w0W04macSl+owPa1GbecRKvKtWO0tBLOSfxxxDkn
 USj+NZ5CAcEPtIxJftPVw8GCofzFZs2lsfRvmoMRos11yN97DMMCdYOKR8COo0FSSp
 uGMAdl2t0AxIsxC4/aVbo75UGanqiDfw/5+kXzW4b3zepdq0XvyRD2O+WFBJSB3YN2
 QUhHMXfVwlFH3rLBsPRgy/f94NL79B0Ko8guYstxw4Nm82XTDeorKKbW2HI4lwnQNo
 dNThXBMUj/zOGZGzY+SGlH4pjETCY8G0iLDLjyAqsV7+2996e0TD3P3R2Bga6TfTqp
 QoPjawyFOSqRQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, yangyingliang@huawei.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20220825123525.1845695-1-yangyingliang@huawei.com>
References: <20220825123525.1845695-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: sigmadsp: switch to use kmemdup_nul() helper
Message-Id: <166144130241.526663.10391491400558908399.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 16:28:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lars@metafoo.de, lgirdwood@gmail.com, nuno.sa@analog.com
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

On Thu, 25 Aug 2022 20:35:25 +0800, Yang Yingliang wrote:
> Use kmemdup_nul() helper instead of open-coding to
> simplify the code.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: sigmadsp: switch to use kmemdup_nul() helper
      commit: 4a34613b2017e89fdf4f63cda65da68b5f50f284

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
