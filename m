Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829175A50D3
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 17:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0535D1632;
	Mon, 29 Aug 2022 17:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0535D1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661788765;
	bh=+II9I2VUO84fey3cODw3Ntjm3FbAKD1mEnge+7FYRdo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQyhmK3sHE3zJC9LwUWoTQayz/XVG/x6Uf5KIggeX1QdK60jn0ROPry1MvORzXXU/
	 AGnr2i84hfSKbrz/929mxGSRDp0S/0f9lMNVz1MMDQCy05gtdLDy3pmokpvSSf+cme
	 r+R3PavvKpm8IzgRxPegDuPUYem7Z3Aj7gupjKxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB65F803DD;
	Mon, 29 Aug 2022 17:58:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 508B6F803DC; Mon, 29 Aug 2022 17:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 360EAF800AA
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 17:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 360EAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i0WV2Nx8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 888F1B81113;
 Mon, 29 Aug 2022 15:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EFAC433D6;
 Mon, 29 Aug 2022 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661788677;
 bh=+II9I2VUO84fey3cODw3Ntjm3FbAKD1mEnge+7FYRdo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i0WV2Nx8FJHxIRF0kPF9suCEsov7v9BmjxoqMxP/RrFl/HLHFi1ApRBPm2Lntr8Nr
 mSdBBYnc80tyPtYweOUsPtuVzxmy+37QzY/5dRVievd/oAj/JF9D+8b8SZNLKHLNJR
 /jYvsfS2cmme0i7z5eq+ejoR8ztN8tytfCSGZEUvObriBHLrt578Sd5VQtb0R1JMSX
 NLpRrPIuwrFks7gKS3W+nzaPowwZOuvJoZqQ3yWqoKU03/iC+MW0TURODdqD8OlUrM
 5ICEc957rKLPvVW5JRAPl2naTy0/TiBGxZDWVKS+QAUll9tnHtfpjECGAm61KzIJ8N
 cf0k2OG63mhUA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220829091319.266068-1-cui.jinpeng2@zte.com.cn>
References: <20220829091319.266068-1-cui.jinpeng2@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: codecs: max98088: remove redundant ret
 variable
Message-Id: <166178866796.855087.12254175359520201304.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 16:57:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
Cc: jiapeng.chong@linux.alibaba.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, tommaso.merciai@amarulasolutions.com,
 steve@sk2.org, cui.jinpeng2@zte.com.cn
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

On Mon, 29 Aug 2022 09:13:19 +0000, cgel.zte@gmail.com wrote:
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> 
> Return value from devm_snd_soc_register_component() directly
> instead of taking this in another redundant variable.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: max98088: remove redundant ret variable
      commit: e0550fffd5b3d32118a335718d1e3ec93e6bc411

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
