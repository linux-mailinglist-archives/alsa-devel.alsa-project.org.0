Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543B12C8A15
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:57:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0B371715;
	Mon, 30 Nov 2020 17:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0B371715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606755450;
	bh=rBr8YtlXc+2AXACTkB4gNA9wQVJzRxTliFY7C0TWO3Y=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQSwYXBq1Z1+1HLHNxill8JhppIqXj7IFe6C8eAn2RvyvtNfhPFl+L45yJOzCN180
	 jZTN+cHkasN063cy+OUI5AxE13q91slv0md6ElJxL636wfGAYc5Q0JnmtA6I1/rfgK
	 FVS3NTxN4OTt37HVXA76u3HL1atgVJX67wFgB8O4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E5EF80247;
	Mon, 30 Nov 2020 17:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C58C6F804A9; Mon, 30 Nov 2020 17:55:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB877F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB877F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1gCl4bVs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F5B32067C;
 Mon, 30 Nov 2020 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755337;
 bh=rBr8YtlXc+2AXACTkB4gNA9wQVJzRxTliFY7C0TWO3Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1gCl4bVsz5iftTDm64p7k6IURVp2RgRve+bOgK/DBo4xevhr7NIzgXtej2qZQJfwM
 GPPYTBZhO5S0Q/XX6Z62Rxv4PP7SfbDXImKraW1l5ZSOaAhJXBobxuw2t7J+FUxJKr
 DJayfl8cMfhjddchVTvz2N1C3x1pkcluDlicuAGo=
Date: Mon, 30 Nov 2020 16:55:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
In-Reply-To: <20201104201209.907018-1-alexandre.belloni@bootlin.com>
References: <20201104201209.907018-1-alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: adau1372: Add bindings
 documentation
Message-Id: <160675530954.30326.371904938338211202.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

On Wed, 4 Nov 2020 21:12:08 +0100, Alexandre Belloni wrote:
> Add device tree binding documentation for Analog Devices ADAU1372.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: adau1372: Add bindings documentation
      commit: 32025c7c50c602a6c0bc3bef0e9a774003e2e7ae
[2/2] ASoC: Add ADAU1372 audio CODEC support
      commit: 6cd4c6459e47402ab90802eca61a18b231434053

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
