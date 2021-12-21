Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75C47C745
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39A11852;
	Tue, 21 Dec 2021 20:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39A11852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640114105;
	bh=x7j1ETCuHiL0HpZR9luQpYuCn0hIxPlFZQZghd10zX0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJuaQ7QUBQE8cC6ROx2+AsHljy2Cj6LLWB8ud318l9FcuEoYE7wqtzBztpek7aJZb
	 a17WmreIaaiktAQq7thc9UHvSQLaHqvG43SnB9IAiRTpDkPB3Z0zTpQCak1LoniAsh
	 an1ga+oQtEzzl//WcpPfzjo40zgfcdwfRkfuanyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87025F804FE;
	Tue, 21 Dec 2021 20:12:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DF1F804FB; Tue, 21 Dec 2021 20:12:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A4DF80125;
 Tue, 21 Dec 2021 20:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A4DF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H5pe08zM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2421661792;
 Tue, 21 Dec 2021 19:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BEFC36AE9;
 Tue, 21 Dec 2021 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640113961;
 bh=x7j1ETCuHiL0HpZR9luQpYuCn0hIxPlFZQZghd10zX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H5pe08zM3gaRa7LoADnQ7I2fBJU/1Phv0wHtKHATwfHdwIjZLylnnt9jsYwnJv+Xr
 QsEnZRcZFPKOak8AS2YB7+dpHTmXkqyCh6x4P56G47QGh0hb0XDePa4umdobF6ks1l
 Pa0mXK20AbUgMbLfDFVPUDmndIs2QsCa63zRmoLz/bPhAvb3W8CJlpT/MNcN1+t5pD
 MUKriVX6glVM7FA8EhTiaIXKJbWGHUmMAjBQqYicHSdYuLlJzoRcL/isS5qh4iPxeD
 40OsjFbPXUzWqamInQ3iO0g2QkVbLGWOVLtfYDHTm+/73zgE2qvWfhf2OlYtrkqo34
 Ngf66av1qo1Ag==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20211221165802.236843-1-AjitKumar.Pandey@amd.com>
References: <20211221165802.236843-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH v2 1/3] ASoC: SOF: AMD: simplify return status handling
Message-Id: <164011395741.93163.9178952950299537578.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 19:12:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com, Ranjani Sridharan <ranjani.sridharan@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <bard.liao@intel.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

On Tue, 21 Dec 2021 22:27:57 +0530, Ajit Kumar Pandey wrote:
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

[1/3] ASoC: SOF: AMD: simplify return status handling
      commit: 2dc643cd756398c3013fcc2d3c2a07c9c4a0a3bd
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
