Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0E5738E7
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7020172B;
	Wed, 13 Jul 2022 16:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7020172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722740;
	bh=t8fIVopFw1scYtgSMTsw0uvBlyue03PrQLAZCZlxZ/I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LIUJhR0WdE0vOBMv8F9rRNBmRRqGK+rXibasMzk6+mGnNkPZdpTXxAzoe4G8akW9a
	 Tcbcq3XFeDXUve4pA/amLFeadxqWo1mD1kMSqvMPSmgE2HuzpkBUUFi0W9yRFK/u+6
	 bCMGTaDrnGPO05zINn+X8E4KfsFO6OvGTRz38Fp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC11F8054A;
	Wed, 13 Jul 2022 16:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0657F80249; Wed, 13 Jul 2022 16:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD84CF80254
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD84CF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jr1e0JzI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B798B82016;
 Wed, 13 Jul 2022 14:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DC9C34114;
 Wed, 13 Jul 2022 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657722653;
 bh=t8fIVopFw1scYtgSMTsw0uvBlyue03PrQLAZCZlxZ/I=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jr1e0JzIMhCF311XdRUyeVZ3SdFEjupFRE9kgRAMTuRP7tXuqdESvptSWknpiiKHX
 Bj10yiKzl0UgkIBGxk4al4/b9Z4GHyKB9EojRjsPAWpHKXsHhsO+e9i457pznSFk4Q
 qqxPL9R0QfxDfsUGE6eke+b/FpFOcJHNr9C7EB1nx/Z/zLRKO0pBjF16Hh9QdEdBdo
 YiP7Vam32xNMjl6DxHN9uMQUAKi8RyGPyhpgzoBKK2nxSJfxFaJflCk6UiuaPXksuq
 tIZRalBu+MLj+NF/i3yUaY0ndX084eDr39B5llHubANmoWvKm1dWrJQ1g5uvSsSQGd
 LZFC4w7GJyesg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, windhl@126.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, matthias.bgg@gmail.com
In-Reply-To: <20220713102013.367336-1-windhl@126.com>
References: <20220713102013.367336-1-windhl@126.com>
Subject: Re: [PATCH] ASoC: mt6359: Fix refcount leak bug
Message-Id: <165772265219.116109.17965989340023594785.b4-ty@kernel.org>
Date: Wed, 13 Jul 2022 15:30:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 13 Jul 2022 18:20:13 +0800, Liang He wrote:
> In mt6359_parse_dt() and mt6359_accdet_parse_dt(), we should call
> of_node_put() for the reference returned by of_get_child_by_name()
> which has increased the refcount.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6359: Fix refcount leak bug
      commit: a8d5df69e2ec702d979f7d04ed519caf8691a032

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
