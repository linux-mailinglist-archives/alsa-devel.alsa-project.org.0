Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0A02B98F9
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:11:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4B81717;
	Thu, 19 Nov 2020 18:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4B81717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605805862;
	bh=w9iWx2X6QmvcfDxwKtNOolhy4g02DXcGt52yMmAY6gQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWxfB8hBqeP2ndxx43HyEROITIQgNTNKN/mUcg4HFYa2YxyuB04B6+Qg+b/tUuZqn
	 8ckWjPsHI5/rNAi6qYv+vNX1QHtoe2REchgdpS/JDxnkw480lLZukJrSIciTzRKFtN
	 owinEell6jT3+NZvxHgxPpGPEkb1wB36u++YrAPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C402BF800EE;
	Thu, 19 Nov 2020 18:09:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBCECF801ED; Thu, 19 Nov 2020 18:09:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790CCF800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790CCF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cctBKL8v"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D46B4241A6;
 Thu, 19 Nov 2020 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605805754;
 bh=w9iWx2X6QmvcfDxwKtNOolhy4g02DXcGt52yMmAY6gQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cctBKL8vV3saNxpdsvDczBwV1NS+jAHo9+gHBwRV/Gk8fJsymBnydla8ucog2UQ7u
 dgwovLmV8xzDN0sOH6XyGGBkx47GVYOtgy9Dojy0KUZGGJKeq0KtDA+dke8FrnHuQ4
 GwfNIssr74smhj+3VPh9tvZxLgsgZK6YUZYYbuFs=
Date: Thu, 19 Nov 2020 17:08:53 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20201117215001.163107-1-ranjani.sridharan@linux.intel.com>
References: <20201117215001.163107-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: pcm: call snd_soc_dapm_stream_stop() in
 soc_pcm_hw_clean
Message-Id: <160580573379.54454.14703259351140820631.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kuninori.morimoto.gx@renesas.com
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

On Tue, 17 Nov 2020 13:50:01 -0800, Ranjani Sridharan wrote:
> Currently, the SND_SOC_DAPM_STREAM_START event is sent during
> pcm_prepare() but the SND_SOC_DAPM_STREAM_STOP event is
> sent only in dpcm_fe_dai_shutdown() after soc_pcm_close().
> This results in an imbalance between when the DAPM widgets
> receive the PRE/POST_PMU/PMD events. So call
> snd_soc_dapm_stream_stop() in soc_pcm_hw_clean() before the
> snd_soc_pcm_component_hw_free() to keep the stream_stop DAPM
> event balanced with the stream_start event in soc_pm_prepare().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean
      commit: a27b421f1d04b201c474a15ee1591919c81fb413

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
