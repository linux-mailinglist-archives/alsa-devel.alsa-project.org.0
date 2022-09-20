Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB05BEEBA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB18850;
	Tue, 20 Sep 2022 22:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB18850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663706903;
	bh=HYli6/cvxotMBPYQELJFv5WGyh/XqaUzoeHSir/vKA8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mcXL2aO+/0xOsslsKaTP+GHGgah+wmvCLRC5IhasKqSruriUW2NrJPAlzPvJ9BjWA
	 ceyogvmd3igTsCDFpnWiYIwTXu4T9be4SLaaCyO/5QCZCmMrU6SwuOxoxrOLZeIKyh
	 ca2zMzL4yQdtJ3ikgMhk7hZNIAxq2CYuF0WoSVRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D0F7F80539;
	Tue, 20 Sep 2022 22:46:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18157F80539; Tue, 20 Sep 2022 22:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF617F80539;
 Tue, 20 Sep 2022 22:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF617F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YbhnGHFY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B4341CE181A;
 Tue, 20 Sep 2022 20:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AF3C433D6;
 Tue, 20 Sep 2022 20:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663706800;
 bh=HYli6/cvxotMBPYQELJFv5WGyh/XqaUzoeHSir/vKA8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YbhnGHFY/LqduHDsATHsaeiSD1PpZnjnVP61BY+U63BG8Rr/T6Zl+jKsfV87a/JIA
 KIqajDw/eonnTVG2zxoq/4ck+aqS0LjZ90/+70kP/NYZYgLE1k2r8RDLGDAXmUiQpA
 y6DVW2JXxWfkESO7UUiDU1iS7xqPyH9TuLkWW33q5jmc8ywDuEHeKrQxPZDDJ+B0uR
 LYo/EGTH/GxpivGgDXaLiFJ1kdpvCJAF6ULeLP1LImNHsyAyU7bItQ1I4i3PVoBBiA
 ZG7iuoDfRnLnIfDNsiD4G5jJIBLrvPWina5kP7wnC6uav9foC5rSIrJWMPUY2lEMSt
 YaLj8ZeUhmilw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>,
 lgirdwood@gmail.com, 
 angelogioacchino.delregno@collabora.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220917022610.594-1-chunxu.li@mediatek.com>
References: <20220917022610.594-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
Message-Id: <166370679567.361668.2078852324764910878.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 21:46:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Sat, 17 Sep 2022 10:26:10 +0800, Chunxu Li wrote:
> add pcm_hw_params callback for mt8186 to support continue
> update dma host position
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add pcm_hw_params callback for mt8186
      commit: 78091edc1c7806846049e1d480f6a8051507ed94

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
