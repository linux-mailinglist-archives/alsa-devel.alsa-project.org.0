Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916424D47E0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 14:15:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B1B191D;
	Thu, 10 Mar 2022 14:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B1B191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646918159;
	bh=QDNquidF6BeD/URlJSXbDXcfjvClofQSBuYPeZ+AuDc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FOZzNByFof4uKQHruA2k0eubhE/nIXwJlfn0EGnX3p6gGNhllyMUAWgqYbM06vFaF
	 IJ2EA6ZF7+zewuJ3hvdLgSR8iCmfleMg12THT7tDfdMouwL5PNDR1ek/ohAVc2j98C
	 TeBA6nhKxBeAVBcd7GYOflVCQQ5bbGhzeRiAVD1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 453F8F8051F;
	Thu, 10 Mar 2022 14:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C75F8012C; Thu, 10 Mar 2022 14:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5482F80519
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5482F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="reG3wPZ4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0B5561A1E;
 Thu, 10 Mar 2022 13:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D642C340EB;
 Thu, 10 Mar 2022 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918037;
 bh=QDNquidF6BeD/URlJSXbDXcfjvClofQSBuYPeZ+AuDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=reG3wPZ4rvbFfjAtFgKD8h/dhEUhG8YfKCpvzgTJGkrTo65UYiw5NJxBmswqHzu29
 m2IudxMyKuJW58+9AMrjSz82xeCQII1ZV0Vpp3i2LY6RNYTgC0IyuCugt7B8qMQb3H
 9zeHtfVKBIvkaUhixpz5GSVcMuBbqVOR8ekRZxTbVgSp6o4vPAJ3Ic+W4mWqtm2259
 Cao57n20ZR5wpOR+HCahzxKiIJAuOqXRtZ30CM3icTWp2VwXiQxkTL2t3PC+psoipo
 mO04ato1boi6qtkbunj2r0dim1dBC9SDLAXmRUyi0AfqbOuEU+4CEZm0I1x+gR0MY+
 4LJkOhppkNzeQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, festevam@gmail.com, Xiubo.Lee@gmail.com
In-Reply-To: <1646879863-27711-1-git-send-email-shengjiu.wang@nxp.com>
References: <1646879863-27711-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Disable TX clock when stop
Message-Id: <164691803517.2018412.16511906603132824768.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 13:13:55 +0000
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

On Thu, 10 Mar 2022 10:37:43 +0800, Shengjiu Wang wrote:
> The TX clock source may be changed in next case, need to
> disable it when stop, otherwise the TX may not work after
> changing the clock source, error log is:
> 
> aplay: pcm_write:2058: write error: Input/output error
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Disable TX clock when stop
      commit: 6ddf611219ba8f7c8fa0d26b39710a641e7d37a5

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
