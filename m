Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E057235E25B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4481C166F;
	Tue, 13 Apr 2021 17:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4481C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618326693;
	bh=n62q5EPfx7TlonQCJXka/eBID5Q419/EP3vdvBqEKPE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJwD+uNe9bNKXKaxt7p0Dda1sDXpfxJpRIAGwVlwCDF89MJ83ddAu+fFPirVKSQbe
	 RmIzLNPDB+YVY4z9muLBB/KmzmqR/RsBl45Ok5hINklRSAoB5JcYCmi6c84DIuq88A
	 cMIi91WZkJpXwEKvP9HNir4HEXDs/aC77XmNSsg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C8DF8021D;
	Tue, 13 Apr 2021 17:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F8C8F8023A; Tue, 13 Apr 2021 17:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A29DF8021D
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A29DF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a/E6qyJw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 507C2613AB;
 Tue, 13 Apr 2021 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618326557;
 bh=n62q5EPfx7TlonQCJXka/eBID5Q419/EP3vdvBqEKPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a/E6qyJwBMk/HjcwnpLd5MB32RbCMYkv/JEHib6DELW+NG8rEg1ZThPOwx80jvw6t
 drmBxMFRdq1ULdWxLagnVgGc/VQbBBBf39kuDAC8qqdIvx0lzxVnoOUSwgo+NwdN5/
 SZ/7xTbo9LRX0DcVHt8/qGH2GxCEk7OeSmfSA+W1r7eer30/jAiqk1KsuSDxH9SJrl
 U9GXIcBEVD8SJ6D8to1ijr1L7uOCYY6jfFh9sAu23cZp4vRwoYVwQNEVNHoML+0br3
 eKJAcBF2bBlilDcxRakYUKC5RCYoC0LGOzfpp3fRNsK8bw1enI9lHi5HdhU4vbLmdB
 ZUC1yomeaVdlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
Date: Tue, 13 Apr 2021 16:08:52 +0100
Message-Id: <161832446009.49152.6444814116918123903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412132256.89920-1-jbrunet@baylibre.com>
References: <20210412132256.89920-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
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

On Mon, 12 Apr 2021 15:22:56 +0200, Jerome Brunet wrote:
> Previous fifo depth patch was only tested on axg, not g12 or sm1.
> Of course, while adding hw_params dai callback for the axg, I forgot to do
> the same for g12 and sm1, leaving the depth unset and breaking playback on
> these SoCs.
> 
> Add hw_params callback to the g12 dai_ops to fix the problem.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-frddr: fix fifo depth on g12 and sm1
      commit: 858066864a6383d1eecd2fa96a0b8e69935632f8

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
