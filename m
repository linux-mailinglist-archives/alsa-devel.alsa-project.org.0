Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931E57E1A0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 14:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C5218C2;
	Fri, 22 Jul 2022 14:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C5218C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658494222;
	bh=sr9TSpthQysYY2JifDw21pcWDlAmyQ036571H/CVHyg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxDTlQfeN4+Ij3tGrV8AWgAgjKEixgsO0/1VuTHj0yNQocfMhZduBPT+GQUahctX7
	 XIoE5BYqdt1vvYJdDFvmWXwZRFw/kbrA95PU86t9yE3Q1dyRs/4cd6Dr1G2m9Skrua
	 SMmsp70k/9Cn4MOIX3vXzdbhvw9b/1S7plfTMQ0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7163FF80551;
	Fri, 22 Jul 2022 14:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18CA4F80538; Fri, 22 Jul 2022 14:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A80BCF80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 14:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80BCF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RH7urC7y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53F98B828E4;
 Fri, 22 Jul 2022 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC56C341C7;
 Fri, 22 Jul 2022 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658494093;
 bh=sr9TSpthQysYY2JifDw21pcWDlAmyQ036571H/CVHyg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RH7urC7yBKGTFFfwLG4KbGtTb+z7BhVtkivw7AssselmbptlC5Yg+lmnfM4eU4+zC
 e2PusPZfv8iGYtjS3egOVr27kMgOe+ftMkOsI/3r1BiYp8FJtSy7o7A0FoDTHLJapH
 iNlxuMI6ZN3eOIw0IblRNSLEILqOMF4ZkpiLv1i15dTZA7e5Wh7irWSLB0kgH/lIi5
 kzc8JGV4OdwyewhQlFatR5hiFldBfLMfZqvcV0hjlkUwhnhY2Ce7cSHh/Zxm6TFD9s
 esxoKS5/OMxnE4+LfXQ+i4EkpuiVS64Yi/y6aO1x0AoGnVoPC8TY5I2Bd7veZvPLcY
 ixIRISZTp05mQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, 
 nicoleotsuka@gmail.com, festevam@gmail.com, perex@perex.cz,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 -next 0/5] ASoC: fsl: Fix sparse warning
Message-Id: <165849408996.139149.2173688518682124551.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 13:48:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
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

On Thu, 21 Jul 2022 18:29:48 +0800, Shengjiu Wang wrote:
> Fix sparse warning
> 
> changes in v2:
> - use pcm_format_to_bits
> - use u32 asrc_fmt, then convert it to snd_pcm_format_t
> 
> Shengjiu Wang (5):
>   ASoC: fsl_sai: Don't use plain integer as NULL pointer
>   ASoC: fsl_asrc: force cast the asrc_format type
>   ASoC: fsl-asoc-card: force cast the asrc_format type
>   ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
>   ASoC: imx-card: use snd_pcm_format_t type for asrc_format
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl_sai: Don't use plain integer as NULL pointer
      commit: b17079d37fe1570019d7defd9e341d5c18aba8f5
[2/5] ASoC: fsl_asrc: force cast the asrc_format type
      commit: c49932726de24405d45516b3f8ad2735714fdf05
[3/5] ASoC: fsl-asoc-card: force cast the asrc_format type
      commit: 6c7b077dad62178c33f9a3ae17f90d6b0bf6e2e5
[4/5] ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
      commit: de27216cf2d645c2fd14e513707bdcd54e5b1de4
[5/5] ASoC: imx-card: use snd_pcm_format_t type for asrc_format
      commit: 409a8652e909e323c715f3088e6c3133e37c8881

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
