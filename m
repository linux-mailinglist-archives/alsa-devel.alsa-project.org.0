Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67A1BA457
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:13:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D291116A2;
	Mon, 27 Apr 2020 15:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D291116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587993217;
	bh=RMGtcuq9poVdZOs8i7AlANrnvmz1YVBx+61b4lQ+NlU=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rj2cCi9i1pKu+Sef8x1cjNpqgBhLQ1vZKDhsifFgndTTlxv5oxdN02cW2wPgOu+Pm
	 obYgv+75EZ2TrwfaW+UDF+aPr5LG8GAqGqXfyINXyfztP/n0NHOTTfkQeaD6r/jTww
	 y/6+0CeOk4JNT2JJmYlx47dN9MihDpZymSZ14Lhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC9EF8028D;
	Mon, 27 Apr 2020 15:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15E77F8022B; Mon, 27 Apr 2020 15:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D83FF80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D83FF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="18PqGg0U"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AB032072D;
 Mon, 27 Apr 2020 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587992959;
 bh=RMGtcuq9poVdZOs8i7AlANrnvmz1YVBx+61b4lQ+NlU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=18PqGg0U4x8bsr3mYRoxNY2EOchx4rM0d4uMWf33pwI2Mrnf+PB6I93E023rf+xBc
 v4e5SaKR30XDPNYw7TYhvyfFG1Dl1E85Odlw5MQltqiknTLUb+eWR7Ynz/+JOR3jjj
 X4ga4Tn+VQ/uh8xTkbEoZHOCq1dIkyh1NO0sUBX4=
Date: Mon, 27 Apr 2020 14:09:17 +0100
From: Mark Brown <broonie@kernel.org>
To: rafael.j.wysocki@intel.com, peter.ujfalusi@ti.com, perex@perex.cz,
 alsa-devel@alsa-project.org, tglx@linutronix.de, tiwai@suse.com,
 Jason Yan <yanaijie@huawei.com>, linux-omap@vger.kernel.org,
 jarkko.nikula@bitmer.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20200426094238.23914-1-yanaijie@huawei.com>
References: <20200426094238.23914-1-yanaijie@huawei.com>
Subject: Re: [PATCH] ASoC: ti: remove comparison to bool in
 omap_mcbsp_dai_set_dai_fmt()
Message-Id: <158799293954.30174.6898589997938617808.b4-ty@kernel.org>
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

On Sun, 26 Apr 2020 17:42:38 +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> sound/soc/ti/omap-mcbsp.c:1188:5-11: WARNING: Comparison to bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: ti: remove comparison to bool in omap_mcbsp_dai_set_dai_fmt()
      commit: 1597bfbfdb3c6e97ad0f63abedc2a26d6c1850c7

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
