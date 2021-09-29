Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2541C56C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 15:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2438016A3;
	Wed, 29 Sep 2021 15:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2438016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632921542;
	bh=/7ffRfO70FzWtNxTpBsYQ6/zH6FWWTHiDyUtdaVoxNM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2wsEoVnknIMzc0fpj+cQRFmKjtckmHcjinOiyHP35q7pIzPBGFK5FZSO0emPgHUV
	 OT6rCc/4qmWAoCgY47gyAL2BYtrZikSS06Hh9yqlughsySJCMu+fG9zRQag7fZGoRz
	 uoAbP8IOZ5EO1FiMYBDrwyo35pb3DtgYdUXH/wpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68DB1F80272;
	Wed, 29 Sep 2021 15:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86ABEF80161; Wed, 29 Sep 2021 15:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C62F80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 15:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C62F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VggxSjaX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 395E8611C8;
 Wed, 29 Sep 2021 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632921455;
 bh=/7ffRfO70FzWtNxTpBsYQ6/zH6FWWTHiDyUtdaVoxNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VggxSjaXR3LQSOrES/Fvon5cf53q55be9Xwqlb67r6AmQoa/D+PywZcGiGnxyc8/M
 JMnbE/07Vc3r4f+wMc66bIVYFGWzk6jM58KMy204c38ODHx6fM5JKyDNy1B6VqOQbn
 /o/w9/CNRcGRYnNAHcWwPSYSTkh1Lm59FIJQBIu1xABqI09/zJhWs7mDMYdhvQU55E
 32pI3oXGw95sabLY2AJLE0Ztkuv1w/yqSqBcHVcxXy448+G3qbeT3QYu/hQfe3b9me
 KKi8xiBQqEUSXXRDa0/2LmOh88fp5WCogTZhThYk7vxaQDonvwtLopuK1IcfHo21fQ
 nvZ8xbFz0IuLg==
From: Mark Brown <broonie@kernel.org>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: ti: Constify static snd_soc_ops
Date: Wed, 29 Sep 2021 14:16:44 +0100
Message-Id: <163292102842.46827.14999239239747146155.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
References: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org
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

On Wed, 29 Sep 2021 11:31:21 +0200, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: Constify static snd_soc_ops
      commit: 5100436c27aafdbc860de17447862304c5639b60

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
