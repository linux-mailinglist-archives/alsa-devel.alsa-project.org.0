Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902E688827
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 21:16:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC982F7;
	Thu,  2 Feb 2023 21:15:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC982F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675369006;
	bh=90+83JUa3aCx3Qxq9grwhDgZO6pg9KQsVAzYsh3KHgs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nUJ8PZjOW/1FZ/xj+MGVWhC45DszS/ay6+e7NtOpWXCnj4vVy/C97RVSwdMHlfIb5
	 DTbc57BIOXM8GpkvyRjp6EgwH5O5gm57/3PquXVUlZl+/8K5WgnoGtXCOLxi+fDxr5
	 rYOHAll7rVr2dzHhIO/WeWUHYGpFo4ViVLtFYguw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F6FF800E3;
	Thu,  2 Feb 2023 21:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B944F804C2; Thu,  2 Feb 2023 21:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC39DF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 21:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC39DF800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LScRtsZL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E6D161A73;
 Thu,  2 Feb 2023 20:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA4EC433EF;
 Thu,  2 Feb 2023 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675368940;
 bh=90+83JUa3aCx3Qxq9grwhDgZO6pg9KQsVAzYsh3KHgs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LScRtsZLI6kbvVNMwo6ZZAvq+OCE/R2Z5Zh+ADsX8OMy3qvMJ0HQWe2ZOLNCEDO1N
 0/shpbgtZknqV14gPpzKQFEV839L60ptleOboIzjHYrtTWit0yeKmSL078wdpBVvsk
 OO0QBOXdpJvZzDXM96FH1GInhfGXBJzC1y1s4JDubQ7H0dbr3FceUTntvt8jTsDb8g
 4y3j/VAki8Djw+gOz6Ro+nKV6HDFnVzWhF3E1aYpyx8r9z3Se2d+H3oDKMabShpRcV
 U/+W/Spo2vSNp0qqYmbwLwSS464RkHQnWtoAmNjkmUBkCTcYYiODgwb0ZN1EPG0w35
 5W3TWjeCHL/uQ==
From: Mark Brown <broonie@kernel.org>
To: codrin.ciubotariu@microchip.com, lgirdwood@gmail.com, 
 claudiu.beznea@microchip.com, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20230202-mchp-spdifrx-fix-uninit-mr-v1-1-629a045d7a2f@kernel.org>
References: <20230202-mchp-spdifrx-fix-uninit-mr-v1-1-629a045d7a2f@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: Fix uninitialized use of mr in
 mchp_spdifrx_hw_params()
Message-Id: <167536893801.1481377.11250986201319801994.b4-ty@kernel.org>
Date: Thu, 02 Feb 2023 20:15:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org, trix@redhat.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, nicolas.ferre@microchip.com,
 patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 02 Feb 2023 09:34:19 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   ../sound/soc/atmel/mchp-spdifrx.c:455:3: error: variable 'mr' is uninitialized when used here [-Werror,-Wuninitialized]
>                   mr |= SPDIFRX_MR_ENDIAN_BIG;
>                   ^~
>   ../sound/soc/atmel/mchp-spdifrx.c:432:8: note: initialize the variable 'mr' to silence this warning
>           u32 mr;
>                 ^
>                  = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdifrx: Fix uninitialized use of mr in mchp_spdifrx_hw_params()
      commit: 218674a45930c700486d27b765bf2f1b43f8cbf7

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

