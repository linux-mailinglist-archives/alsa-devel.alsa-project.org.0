Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A820A64CCB8
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 419D62A38;
	Wed, 14 Dec 2022 15:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 419D62A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671029740;
	bh=w5xhvVMm8HcONvBFdH0GaBJz/7H0mrmGXMjWGZuBv8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UTh1x/p7FAqXH8dLkFoJTm9VMebk1WhdpZ5UPgYkq/fDEg3hwDVed2ozKzDePehCy
	 NFRjEFUOtg8yqa9Fb1QeHCTrUoCTNWnVCi/zFydq3x2TPW8qsT93VqMEAK6n7Fv3At
	 Pw3FDYjUb4VdoiAGWAp+OTi7nSUYX0xJdGuFtG+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EF5F80519;
	Wed, 14 Dec 2022 15:53:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE8EF804FF; Wed, 14 Dec 2022 15:53:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2562F804D0;
 Wed, 14 Dec 2022 15:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2562F804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nl26XP32
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CCDA61807;
 Wed, 14 Dec 2022 14:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54770C433EF;
 Wed, 14 Dec 2022 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671029632;
 bh=w5xhvVMm8HcONvBFdH0GaBJz/7H0mrmGXMjWGZuBv8Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Nl26XP32SxbpeOA3E7n4KLxmMIyuxGZPgbGDEYUueETTuCIhMhZz1JUnrIC/ufWYP
 8eetISDpNIk5bH/qt3D8VjaKqGpE5y0dmyOrKWFqQwCm0nbH9ug1SYHO8ZOGcT5+u3
 RgII5HQxOL9HrcZK0ndL1oL+FWTfyd3eddZQwlgwjkP0bQFBOo2Jacz/0bdh1YfskP
 ft7jQhHjFtklBVqVd/3x2oMu/YT60dGF7vSL7pxRYfguRXIpRQUbvY3vtJ8ST4tiJY
 B9YsN3HSFf6rs3juaYnTCTB0TM2ZItJ0FTBGIB0XvT4yvXUzHoZ4Bi8Yg5frCjljIC
 7JS8QxUyvDb5Q==
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
In-Reply-To: <20221213115617.25086-1-yc.hung@mediatek.com>
References: <20221213115617.25086-1-yc.hung@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: initialize panic_info to zero
Message-Id: <167102962807.215050.16757916120691616071.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 14:53:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Chao Song <chao.song@intel.com>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 13 Dec 2022 19:56:17 +0800, YC Hung wrote:
> Coverity spotted that panic_info is not initialized to zero in
> mtk_adsp_dump. Using uninitialized value panic_info.linenum when
> calling snd_sof_get_status. Fix this coverity by initializing
> panic_info struct as zero.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: initialize panic_info to zero
      commit: 7bd220f2ba9014b78f0304178103393554b8c4fe

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
