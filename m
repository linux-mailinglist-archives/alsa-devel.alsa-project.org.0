Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E72C5CDE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5014182B;
	Thu, 26 Nov 2020 21:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5014182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421365;
	bh=EM0Gc7hlnQ4Cs9nEMQ22xspbkHodETF50L21WryubTw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ru/CfgoINgbXbVDNvGI8plRqyX9RZTEc9Ox5QGJQYOfDEhhEcR0E4la8UVTa70tol
	 hXp0Kxttfs11BUyR6m0pmhAMkJV7oj9Lt3nyZvk71uKNZvLE0SLL4A1OTTmXBso4kx
	 +P1gCeJkquhRUvppMuY0K4m2cEwvso5KtO0AjaHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AB2F804E0;
	Thu, 26 Nov 2020 21:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46116F804E4; Thu, 26 Nov 2020 21:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD234F804DF
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD234F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1Za8wBXm"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 705F420678;
 Thu, 26 Nov 2020 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421175;
 bh=EM0Gc7hlnQ4Cs9nEMQ22xspbkHodETF50L21WryubTw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1Za8wBXmvqp6zDKkhxRm/KTTcX+iZIfA2yWgsi5di58elphv2wjzubUVtM0UwCv4H
 pvTWgv2dyztFSu2GDuCl0gQJoTyI8mRy1J7JJqW+QCgDw6uaItaKn1vfpl+8Udzhns
 d388oFO8ZegfVpPvLZbVvFr/JUuw5lLqCic6gh48=
Date: Thu, 26 Nov 2020 20:05:50 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, vkoul@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20201125130128.15952-1-yung-chuan.liao@linux.intel.com>
References: <20201125130128.15952-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] regmap: sdw: add required header files
Message-Id: <160642115072.9278.5484290158146538846.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On Wed, 25 Nov 2020 21:01:28 +0800, Bard Liao wrote:
> Explicitly add header files used by regmap SoundWire support.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: sdw: add required header files
      commit: d9a500b2985b139d7019231ec16e379d2031cb40

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
