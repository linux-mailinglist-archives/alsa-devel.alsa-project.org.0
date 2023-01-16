Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A566C2A8
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8CD5762;
	Mon, 16 Jan 2023 15:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8CD5762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673880601;
	bh=f2dRy9DEZaZXHnJafqlaDPBfDccF+ACeuVkBazxU81w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wtddx422/MOUp8/sXpIbRb9ptWsDnGchkoNkbUZRcvEbIVAL2Icm6J8oh4h8OMMIu
	 U0S6NtkQcgVIfMWK8I0lrX6IWOuq2UlZQSnwO/gcFdFd+FTBVWYGthQIVSi4ZU4qg2
	 Yhnss9lxYTZ2vCu4/ITmFF3GuTi+XXEUFlucSpTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B9BF80482;
	Mon, 16 Jan 2023 15:49:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16AC9F8024C; Mon, 16 Jan 2023 15:49:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90816F8023B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90816F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C3n8BZx2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B64F7B80E37;
 Mon, 16 Jan 2023 14:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDAFC433EF;
 Mon, 16 Jan 2023 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673880534;
 bh=f2dRy9DEZaZXHnJafqlaDPBfDccF+ACeuVkBazxU81w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C3n8BZx2YcPLI0dyc51vJ14D/jLocX7Q7KwIlZ60SoZh22zWvskc8LF/4e3dALwtD
 gupGf75oKXTrGXhMDlwj0sJxRywUHcFYeuEyIrHRwUbOvYPbrb+W8FTQ6l+TlW621w
 GOJBflXeUnv9mdCigsXyVZMRvwKwYjzC4Vcfgb2NmhsYzdIPHXsxZod7xqWWb4yx30
 5FqUV8IU1K/9R2WcekHPh+zNE1BNgXEVloS58OBcsuzsxMzJGcd7v4//2Avardp+YQ
 cI0jpipGlhdksXD24uZcmPPded8UOmblkUp3czhzo4RtEYWS9tN8XJMkSCo6py568R
 cS5iyz5CVvDqw==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1673852874-32200-1-git-send-email-shengjiu.wang@nxp.com>
References: <1673852874-32200-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: initialize is_dsp_mode flag
Message-Id: <167388053087.388539.12925338339363701914.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 14:48:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 15:07:54 +0800, Shengjiu Wang wrote:
> Initialize is_dsp_mode flag in the beginning of function
> fsl_sai_set_dai_fmt_tr().
> 
> When the DAIFMT is DAIFMT_DSP_B the first time, is_dsp_mode is
> true, then the second time DAIFMT is DAIFMT_I2S, is_dsp_mode
> still true, which is a wrong state. So need to initialize
> is_dsp_mode flag every time.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: initialize is_dsp_mode flag
      commit: a23924b7dd7b748fff8e305e1daf590fed2af21b

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
