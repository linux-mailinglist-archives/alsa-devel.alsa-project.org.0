Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE415620A1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 18:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146C116C5;
	Thu, 30 Jun 2022 18:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146C116C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656608210;
	bh=FxOr7jGqldlmPZhNQ+CVV3r/8IUAgqCNNc1MtsgY0EM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sQgGJn5qlmnvdawanem8QE7NIlS63846sSKrGxlzQbf/KkkyM9BMbHE4AEQoFTFVK
	 QPe5FV3l70jHjdzAtCUlfvWxQipekEqC2+X7K99bezyeIlxJgUp26w15xIvPxuQgdb
	 GBM1JZ4OawLGamAChnOaYQVVrFJ5X3wcNluazwGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DFC9F8052D;
	Thu, 30 Jun 2022 18:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A7CF804EB; Thu, 30 Jun 2022 18:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8144BF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 18:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8144BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r4mfjced"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 888E0B82CA7;
 Thu, 30 Jun 2022 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE685C3411E;
 Thu, 30 Jun 2022 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656608144;
 bh=FxOr7jGqldlmPZhNQ+CVV3r/8IUAgqCNNc1MtsgY0EM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r4mfjcedqPKPtKQH2gcMD8xlZOUwGtEjp9vyUNphOWyFXGioqqvRE5LSM/tgm1uw6
 /QfdM30uCJtkoxwfHF4795GUpiDd43MS5/2IZKM6fFjvucFW8Z2wjvKQHjc9N58p/F
 r/Gs1JvPfrWCQUjNZDINiMw9mqTetoiI5tHJntxu46c7YWmCqJgQeKGrBZ7xJca/Mn
 WRHBOaV0mgRDCC71nRGf0XUa+wPuRJbixdpXKyAWVcavpMnje/oTCzcJx7+kt6yqLI
 7DU6xBPQqMlttY+Me4W0eIcr8FoQx382b7cygz5T3a7Ixfn6vJ/qD4hiabTJrR3Tc9
 sq1QRPZMcVYVQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
In-Reply-To: <20220630130023.9308-1-srinivas.kandagatla@linaro.org>
References: <20220630130023.9308-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa881x: handle timeouts in resume path
Message-Id: <165660814249.771023.7178878929435843579.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 17:55:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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

On Thu, 30 Jun 2022 14:00:22 +0100, Srinivas Kandagatla wrote:
> Currently we do not check if SoundWire slave initialization timeout
> expired before continuing to access its registers.
> 
> Its possible that the registers are not accessible if timeout is
> expired. Handle this by returning timeout in resume path.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wsa881x: handle timeouts in resume path
      commit: cf6af24b54903f9f70c29b3e5b19cb72cc862d60
[2/2] ASoC: codecs: wsa883x: handle timeouts in resume path
      commit: 0df73e1a9f7b1152ace21b6406138f7487239128

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
