Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632559F876
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 13:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253781686;
	Wed, 24 Aug 2022 13:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253781686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661339676;
	bh=0jQSAV+e3DFpfOT8Uw+ldmXyihIQw4KJzWHoCN/nq/I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7mN2uPODNMCT/Wz+zvHjrOKnJam3lTifjbImyaW5LRqPBiGF3dTLRfgysfDa24te
	 E/vlflX/bLwQ8Aa7qVoTdtmxuThBIjZV+WI62r8cP26pI0M8PwKwtIGPAjWj+HCndj
	 GzA0xuKbHaCDxvsXXxEgg7mlUHDvRRPHFOc+wn0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86426F8053D;
	Wed, 24 Aug 2022 13:12:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C759F80533; Wed, 24 Aug 2022 13:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 172F2F80525
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 13:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172F2F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HemH+J2+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 534286192C;
 Wed, 24 Aug 2022 11:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FDCC433D7;
 Wed, 24 Aug 2022 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661339551;
 bh=0jQSAV+e3DFpfOT8Uw+ldmXyihIQw4KJzWHoCN/nq/I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HemH+J2+CHNXyNDfyzK+72NI/FKUv8yMkZzWvDC9kgRfsQu9d/8Kuuuiq/cH/hHkw
 3G5oaRIGJZ+iO6BYj8tyHXzMmuJF2OuzZHLcrHmJ4yJW5iQIYpXdpkncT4pijcfKDJ
 wF60ZLLUCWVUAhp0zqjlr4fVW7Bh3gN0ZtJZIMQO+CumUt69dQpEoLf79JKq2lWWYO
 +vIhABC9ACC9FaPvV2wf/QWdLAd78w16aDQgSipv+/n7Fg7P1yr5B97CE6/VG+6a/W
 LtEEAfzpYy+hBY6OkBcCr+Ncfe2gqEkyIHAagiwwwvu8H6t6R34NlHTMm9t+j7Tz61
 u5LUb3K63sRSQ==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20220823151939.2493697-1-nathan@kernel.org>
References: <20220823151939.2493697-1-nathan@kernel.org>
Subject: Re: [PATCH v2] ASoC: codes: src4xxx: Avoid clang
 -Wsometimes-uninitialized in src4xxx_hw_params()
Message-Id: <166133954873.17904.8458082648861330231.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Sudip Mukherjee \(Codethink\)" <sudipm.mukherjee@gmail.com>
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

On Tue, 23 Aug 2022 08:19:40 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                   default:
>                   ^~~~~~~
>   sound/soc/codecs/src4xxx.c:298:59: note: uninitialized use occurs here
>                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
>                                                                           ^
>   sound/soc/codecs/src4xxx.c:223:20: note: initialize the variable 'd' to silence this warning
>           int val, pj, jd, d;
>                             ^
>                             = 0
>   sound/soc/codecs/src4xxx.c:280:3: error: variable 'jd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                   default:
>                   ^~~~~~~
>   sound/soc/codecs/src4xxx.c:293:59: note: uninitialized use occurs here
>                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
>                                                                           ^~
>   sound/soc/codecs/src4xxx.c:223:17: note: initialize the variable 'jd' to silence this warning
>           int val, pj, jd, d;
>                         ^
>                           = 0
>   sound/soc/codecs/src4xxx.c:280:3: error: variable 'pj' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                   default:
>                   ^~~~~~~
>   sound/soc/codecs/src4xxx.c:288:59: note: uninitialized use occurs here
>                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
>                                                                           ^~
>   sound/soc/codecs/src4xxx.c:223:13: note: initialize the variable 'pj' to silence this warning
>           int val, pj, jd, d;
>                     ^
>                       = 0
>   3 errors generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codes: src4xxx: Avoid clang -Wsometimes-uninitialized in src4xxx_hw_params()
      commit: 7d3ac70d82080f7a934402d66c5238e1d99be412

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
