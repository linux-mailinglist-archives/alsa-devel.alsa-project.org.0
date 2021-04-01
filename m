Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C73516AB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 18:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB52516BA;
	Thu,  1 Apr 2021 18:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB52516BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617293861;
	bh=Cnibmwj6f0ETV7KocKFsDxMa+XbFc5GMHnVOB7+uVj8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmjD7iPxSNvP+Qb2z4kj/Cnm+jiEfxouQKjqpZhiBV3+IIWkwDqYthf0HCyO0Fi6v
	 hN3Q5gp84Ev6IfiXmxh82Pq245F5p0V+ViGt5yp8uhdGnFJ8yz4/ymbC53Cf37kC3Q
	 X2VeLf5gtfEbYxaB1Y0pvJq+zqwIf4Qizj4RRMg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 205EAF8026B;
	Thu,  1 Apr 2021 18:16:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04B69F8026F; Thu,  1 Apr 2021 18:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC312F80240
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 18:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC312F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PpMAOA90"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B51C61375;
 Thu,  1 Apr 2021 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617293769;
 bh=Cnibmwj6f0ETV7KocKFsDxMa+XbFc5GMHnVOB7+uVj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PpMAOA90TD5bN5u2X9vxHO3I3m86DnD/Y5ANwMziPl7/lpYCGRYjj8OsxIJuv6oa0
 JBkWvYBToj8InYMr3aXWqZGkvhA/LXviMznXaMRmllRz/X2oK7jUldkfIKu8TyKXqv
 pbNyrVUHKrjQ7b7uylBhIS5cRSyLQjxj8+IzTyJNaE5Rx0nkmZ9qd4u4qPJkXt8DjW
 ldPvVcQyhD0sN5RmOyn8FnEk47eAKj8Hti3MJE2RSCWjhUV9DNvgH2pau03lf2+0lj
 h/lWhEKVxpd/gJ6Z+pkvarhPtcR8WWtuTSCGy2y/XbaAVwopgHfa7nfLV9eBhE7FGK
 1ucnb582cLpJg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 andriy.shevchenko@linux.intel.com, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH] ASoC: Intel: Fix a typo
Date: Thu,  1 Apr 2021 17:15:48 +0100
Message-Id: <161729333652.31618.13965688976437699792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322065053.74022-1-unixbhaskar@gmail.com>
References: <20210322065053.74022-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, rdunlap@infradead.org
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

On Mon, 22 Mar 2021 12:20:53 +0530, Bhaskar Chowdhury wrote:
> s/struture/structure/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Fix a typo
      commit: ebf721fbbb6e077864783c8d0146021815bb1f24

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
