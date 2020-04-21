Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 231111B2F08
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B1E16C1;
	Tue, 21 Apr 2020 20:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B1E16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493511;
	bh=FwcHGUYdMnDibj/tRCqmioRk8NJPli42GayBPx027Pw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXGgCvQj367L9aL52rxjuwPHDcnCykSl8UO3IRWomyEpap/r3hHpae0jQIi1ZDy5A
	 wsyWdQ/qZvf6D7U44WpeVvSaqeU2/2Z+iHpaJaClXdd61lb/LTVvXUWLwdBk0WcC3C
	 Zkk0V41FFO3M7iPw3lYsFMrkLyDSYyINT85DkPvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F8FF8028D;
	Tue, 21 Apr 2020 20:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D4F5F8028B; Tue, 21 Apr 2020 20:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E273F80252
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E273F80252
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eK2EvRMq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56F05206D9;
 Tue, 21 Apr 2020 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493351;
 bh=FwcHGUYdMnDibj/tRCqmioRk8NJPli42GayBPx027Pw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eK2EvRMqCoy5KAlgM/CatYGa7aZv9+O9BbdwG0SYk1b29oAlt7ThQMoKL3REtyXkO
 rpz4apg98lYR4E9JXQTCCofMqT6leAp9UCThGk2rPKjkEJOa2eZovD9dUgaFdZUniE
 2orodMJywuJiOar76mwN+At/k9AiGOztnVPpN56Q=
Date: Tue, 21 Apr 2020 19:22:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, festevam@gmail.com, tiwai@suse.com
In-Reply-To: <cover.1587038908.git.shengjiu.wang@nxp.com>
References: <cover.1587038908.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v9 0/7] ASoC: Add new module driver for new ASRC
Message-Id: <158749333764.13706.16975370508037163881.b4-ty@kernel.org>
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

On Thu, 16 Apr 2020 20:25:30 +0800, Shengjiu Wang wrote:
> Add new module driver for new ASRC in i.MX8MN, several commits
> are added for new property fsl,asrc-format
> 
> Shengjiu Wang (7):
>   ASoC: fsl_asrc: rename asrc_priv to asrc
>   ASoC: dt-bindings: fsl_asrc: Add new property fsl,asrc-format
>   ASoC: fsl-asoc-card: Support new property fsl,asrc-format
>   ASoC: fsl_asrc: Support new property fsl,asrc-format
>   ASoC: fsl_asrc: Move common definition to fsl_asrc_common
>   ASoC: dt-bindings: fsl_easrc: Add document for EASRC
>   ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/7] ASoC: fsl_asrc: rename asrc_priv to asrc
      commit: 7470704d8b425c4c7045884690f92cf015563aac
[2/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl, asrc-format
      commit: b84b4c9a688d803b0e7cf91fec9a5d8b3ba47768
[3/7] ASoC: fsl-asoc-card: Support new property fsl, asrc-format
      commit: 859e364302c510cfdd9abda13a3c4c1d1bc68c57
[4/7] ASoC: fsl_asrc: Support new property fsl,asrc-format
      commit: 4520af41fd21863d026d53c7e1eb987509cb3c24
[5/7] ASoC: fsl_asrc: Move common definition to fsl_asrc_common
      commit: be7bd03f0201b5a513ced98c08444a140eab92ea
[6/7] ASoC: dt-bindings: fsl_easrc: Add document for EASRC
      commit: a960de4da241d409a73e318ab19e6b5fdcd95a83
[7/7] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
      commit: 955ac624058f91172b3b8820280556e699e1e0ff

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
