Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6A50A713
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DAF16BD;
	Thu, 21 Apr 2022 19:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DAF16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650562050;
	bh=pvjWS/7gvq0FF19pafGJQJMuF8OjnvIMW/8E1FoI0mU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjmT8wpOKU+tNSugSPeTpGpqADx+ABnK5Fsvd9PHLBHkfly7gbid+UsdXwyQhCNKz
	 YiVVvYZ5OMZjmCRX8oT8sAHcsk1ZyqW2T4lbuQiFUPqPHqPHHOgmgAbU5QYShY7F6M
	 ogjpwDRwP2VIvMsU6/r3B89KsJX3V+nGLpEhuSPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D24F80529;
	Thu, 21 Apr 2022 19:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68CF0F804FB; Thu, 21 Apr 2022 19:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD0BDF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD0BDF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IcwqdMJZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B1561E0F;
 Thu, 21 Apr 2022 17:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6CFC385A5;
 Thu, 21 Apr 2022 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561896;
 bh=pvjWS/7gvq0FF19pafGJQJMuF8OjnvIMW/8E1FoI0mU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IcwqdMJZBk6G299ZOu9GLaAbInLrLWCkWMFTOVYIormnU5LF+eBe7wVnFSRcG5O3U
 9a3Q9CRl/jeuj/O2v8+eIcEeQO32LeoyYnCWe9UT2BDNc6gDFec4EVYYBhnoe0apVR
 NZHNr18u7DKg69qZeJElDkxgI7X1YDyatm70aDbdHAP8iIX6+Xmy2nMBAx4G2OiYjy
 4pnZ5KFlI7h71+kFqZbgZGGfcVN4EBSRBtRyh6YQYoabb15TIODDC06URf7BLvsuni
 ZDFNIpYbPTcF01SDhxXszmWmucSN4Wx4dp4d7kzWYkMUh6uiZ08s530OtG2FDFrvyJ
 5BvLqD0wbA0aw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, jbrunet@baylibre.com,
 broonie@kernel.org
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Message-Id: <165056189462.376935.4705329277665588764.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 18:24:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org, khilman@baylibre.com, narmstrong@baylibre.com
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

On Thu, 21 Apr 2022 13:38:00 +0100, Mark Brown wrote:
> These patches fix event generation issues in the custom controls in the
> Meson drivers detected by mixer-test and by inspection once I saw the
> pattern in these drivers. I'm also seeing other failures due to these
> controls having invalid values, eg:
> 
> # # AIU ACODEC SRC.0 value 3 more than item count 3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: meson: Fix event generation for AUI ACODEC mux
      commit: 2e3a0d1bfa95b54333f7add3e50e288769373873
[2/3] ASoC: meson: Fix event generation for AUI CODEC mux
      commit: fce49921a22262736cdc3cc74fa67915b75e9363
[3/3] ASoC: meson: Fix event generation for G12A tohdmi mux
      commit: 12131008fc13ff7f7690d170b7a8f72d24fd7d1e

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
