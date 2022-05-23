Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDF53153E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 19:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5C3F1752;
	Mon, 23 May 2022 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5C3F1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653326852;
	bh=dh+fAnKS8WI2flC692OoPZ+G9PyKzBI6qdryJjOK4yQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUgIAv96ZkOqyBJbhM9kOqxN9vSzyFXRRD/mCUZ1ZJDUAwJjtp4u8DzMeRAeuTKXY
	 mR9ZL4JUT6+XH4x8iH/JkCDfn9pbEUoxA6jkXdKUxvG/icsCMBvwmjkhB0u4sZnTFj
	 R9JH1JTBdrQ8aqRqZMG4Jt0B+5xIcNDgWxx4MqtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED392F804D0;
	Mon, 23 May 2022 19:26:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB7EFF80236; Mon, 23 May 2022 19:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C61F8025E
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 19:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C61F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SNB/lAD3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3395611D1;
 Mon, 23 May 2022 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7D2C34116;
 Mon, 23 May 2022 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653326756;
 bh=dh+fAnKS8WI2flC692OoPZ+G9PyKzBI6qdryJjOK4yQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SNB/lAD3U3bfcbSAR6YCwn69/9c7U6PhIVPDgyDiIAomqxgdDZGAYA56IR3NfTHAp
 yV/d4aKVwc/vf6shLn0B4YQNS34p4LRUoNosg7+m38wgYO2RIxHBkc1e6KUUui6Xlx
 eXCwXGyaAZrC8pu9HCIJnzId3g+TG+blUKS2akJCBWwG9OsfW5U6Vc8QLJZnr50ymh
 UKNFnOwuPsv3oivbZ53kX6e+Emhih1XL5sKKjTi9zuyXX7mB6yiuzzQddjKQ5vKpSq
 NsRN9J7/WUPxrZDY4jqXgg5+XtqsPC31S6DiTTNvacHFJWujiH9yQk+d5zDwEewg8b
 BmGPTe+Yg7SNw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, tiwai@suse.com, shengjiu.wang@nxp.com
In-Reply-To: <1653284661-18964-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653284661-18964-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
Message-Id: <165332675410.2124944.12107532437710717569.b4-ty@kernel.org>
Date: Mon, 23 May 2022 18:25:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 23 May 2022 13:44:21 +0800, Shengjiu Wang wrote:
> There are multiple xDR and xFR registers, the index is
> from 0 to 7. FSL_SAI_xDR and FSL_SAI_xFR is abandoned,
> replace them with FSL_SAI_xDR0 and FSL_SAI_xFR0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
      commit: e4dd748dc87cf431af7b3954963be0d9f6150217

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
