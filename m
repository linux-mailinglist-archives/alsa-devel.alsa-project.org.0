Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A93299B19
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:49:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2DD16BB;
	Tue, 27 Oct 2020 00:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2DD16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756173;
	bh=We4cdzGBDbRGEyCoU6OWymvSRmeCba+BnioTbAIZiNk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HdcGGfWhvpbNJIfX+G0t/iLgzI8Pbwwh1/Yb6Nvcgruzhob1+LaSEQV63hxRgxsIy
	 MKlrUGQ/DFIPlFkQnUB8ECVkHe9PHJXtpiuUuoiUAP0nBB/rX0tf0Koq6xnbu5VgTu
	 G0JzQ2p7dEGGXBVrlvSCgO5d7EFtgEtRx9+WH1GE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94256F804ED;
	Tue, 27 Oct 2020 00:46:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C54AEF804EC; Tue, 27 Oct 2020 00:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD4E8F804E5
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD4E8F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="olvGEJR0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD3A820714;
 Mon, 26 Oct 2020 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755960;
 bh=We4cdzGBDbRGEyCoU6OWymvSRmeCba+BnioTbAIZiNk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=olvGEJR0odQ2kDH7Qp2DHq32wXNxiSwvBni1eu1s8nnZ2wJhif7biOs7zkMfpj1Xo
 QIRQALE/TQLbs1OjML4U+us6UAjnKC+buc+NGO0aea2xvGTGycmBKWxj0B60/EicVU
 x0S5AGQt6xdzHrNHVpCnq3Kbs9D2QZhhZha0tASk=
Date: Mon, 26 Oct 2020 23:45:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201019105313.24862-1-alexandru.ardelean@analog.com>
References: <20201019105313.24862-1-alexandru.ardelean@analog.com>
Subject: Re: [PATCH] ASoC: adau1977: remove platform data and move micbias
 bindings include
Message-Id: <160375592347.31132.7208017773603046861.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, lars@metafoo.de, tiwai@suse.com, nuno.sa@analog.com
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

On Mon, 19 Oct 2020 13:53:13 +0300, Alexandru Ardelean wrote:
> The change removes the platform_data include/definition. It only contains
> some values for the MICBIAS.
> These are moved into 'dt-bindings/sound/adi,adau1977.h' so that they can be
> used inside device-trees. When moving then, they need to be converted to
> pre-compiler defines, so that the DT compiler can understand them.
> 
> The driver then, also needs to include the new
> 'dt-bindings/sound/adi,adau1977.h' file.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau1977: remove platform data and move micbias bindings include
      commit: ab589bac553f79d559952aa088480a72258ac5bc

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
