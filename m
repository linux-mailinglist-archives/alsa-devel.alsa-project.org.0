Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2847A1DBB04
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4211809;
	Wed, 20 May 2020 19:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4211809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589995145;
	bh=yHlEbQ436cPIfFD1oyX4yafwtT/b8QhDnXnebWNb7uI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arZk2Cqts9maRGI/ASq70St/rmnd2KnA1fpTo36bvcCnHzfT7qZqnfAJgIUcI+YtG
	 GYV6ykfPL9YkWFX1jLo+6ClL72pK5QAI4UFQOLKcJnQZ/o4DldahZa8kmkhumXKb/W
	 6UvrvN14Wq4QErwMLTUUELOsDDpdmYOL9O37CmpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5468AF80213;
	Wed, 20 May 2020 19:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341C4F801F9; Wed, 20 May 2020 19:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615EEF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 19:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615EEF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ynn89FV/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB8642070A;
 Wed, 20 May 2020 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589995036;
 bh=yHlEbQ436cPIfFD1oyX4yafwtT/b8QhDnXnebWNb7uI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ynn89FV//DJviWXl6X8oOoC21Q7k+6hWKM1eZBYrz4keTcj42CUPLWUe56fw5A/2G
 J6Z92s/1dy/WlzVZPc+/jW/CIiejOpM40IUHOa90ZxrDtjddVZN9hCn16vuDbcD8Ps
 CkDE5/BD6CRQXP7RfRyBngvDqT9P8ZGR6bpNbNZY=
Date: Wed, 20 May 2020 18:17:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
In-Reply-To: <20200520083516.2120802-1-lkundrak@v3.sk>
References: <20200520083516.2120802-1-lkundrak@v3.sk>
Subject: Re: [PATCH] ASoC: mmp-sspa: Fix the error handling in probe()
Message-Id: <158999503367.4807.15705967670453692304.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Wed, 20 May 2020 10:35:16 +0200, Lubomir Rintel wrote:
> If we fail after pm_runtime_enable(), we fail to undo it. Same with
> clk_prepare_enable(). Let's order them after all things that can fail.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mmp-sspa: Fix the error handling in probe()
      commit: 6ea460d52299f7febd408f2710d7c43ce505bc2c

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
