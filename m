Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F947C578
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:52:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E8317DD;
	Tue, 21 Dec 2021 18:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E8317DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640109170;
	bh=NmEmT3Un/vMD6zH7cnBpscoeivgF9Jg5mO8daytArtY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uH682vWRCxRHK9NJNB17rIlqtiwYna5nrS0K5EgU57jJjPLfV5SybzMjmA8MxyqHt
	 +sgcJxnupWUaRsiy+aR1uOrvzp2CAH5sins927K0CtQt79JbHXj0aM8JHOpJsqBK1I
	 3TvLPxQXKvIEVXEIHZc2DleOTl2Jskmx1TQp/opU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E9AF8010B;
	Tue, 21 Dec 2021 18:51:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AC25F804D9; Tue, 21 Dec 2021 18:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4D7F800E3;
 Tue, 21 Dec 2021 18:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4D7F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jroo0rkA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DF913CE1882;
 Tue, 21 Dec 2021 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BB2C36AE8;
 Tue, 21 Dec 2021 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640109056;
 bh=NmEmT3Un/vMD6zH7cnBpscoeivgF9Jg5mO8daytArtY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jroo0rkAdUpEJiZe+QLjWSk8+7iOrgg42lrqSTlwkSazlkQ67i6LgQxNG1Oc2vZ+w
 uUywvn/WqNMaiJqOw5HSdQxTJr+jXmGA2GlqTL7HHF3aoa5GJC196El2i8OOeemVYF
 oWGx9r01qaeN/MXvXuTnUHO7eUIyQKT+GKgZmTXbejgyhD1UmaoTvW7d56TU3K/9EJ
 2NKH0pz3/tZfI0BBLhr8PFTbveN2msqG2um7Si8edQ6YP1qMIcKcrzYHmwl8pcykqm
 ZAacZFrkN0giRH4Q/BAMVUkHc9jOPD3A4fjvVLVljzBxk3CrNNt9ffVFX/Ru9CnNnW
 OIYOq2I7lHMXA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
References: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: SOF: AMD: simplify return status
 handling
Message-Id: <164010905266.2818037.15491289903542342464.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 17:50:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com, Ranjani Sridharan <ranjani.sridharan@intel.com>, Takashi Iwai <tiwai@suse.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <bard.liao@intel.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

On Tue, 21 Dec 2021 21:48:07 +0530, Ajit Kumar Pandey wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> cppcheck warning:
> 
> sound/soc/sof/amd/acp.c:222:9: warning: Identical condition and return
> expression 'ret', return value is always 0
> [identicalConditionAfterEarlyExit]
>  return ret;
>         ^
> sound/soc/sof/amd/acp.c:213:6: note: If condition 'ret' is true, the
> function will return/exit
>  if (ret)
>      ^
> sound/soc/sof/amd/acp.c:222:9: note: Returning identical expression 'ret'
>  return ret;
>         ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: amd: acp-config: Enable SOF audio for Google chrome boards.
      commit: f487201343312faa697ac40124085a834e0e26d8
[3/3] ASoC: amd: acp-config: Update sof_tplg_filename for SOF machines
      commit: 0082e3299a49286a7761f4d237530b07c00676fb

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
