Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B381C41184D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246BF16BA;
	Mon, 20 Sep 2021 17:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246BF16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632151993;
	bh=yP/YJNeA2tz6XnNHMwBQIfm4ho9yIpZM1lSmIN4EOm0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TayuNh+DF9tcNpR6stAXY7uKSTwrSgI1Cov9XjYYz0cjnTFEm5CBqSjVWZIabcJPq
	 xiRCJ1MaATPmX5Y/s1XPq4udpsMY517mYbnuCkpE4nDGEBc4SHuWMyESJY6Io51dP9
	 xARwQ5ggRSZQGyHNG8BQIbO/gT34rMMfUh1svfi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A23F5F804B1;
	Mon, 20 Sep 2021 17:31:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 006CEF80279; Mon, 20 Sep 2021 17:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A107F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A107F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VTobWhKx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78C5560F36;
 Mon, 20 Sep 2021 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151899;
 bh=yP/YJNeA2tz6XnNHMwBQIfm4ho9yIpZM1lSmIN4EOm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VTobWhKx4cmut0d+yKe0A0xtidGvSk0H44JHFMgkodAIQfONPqDNOny/3D0UVzPFY
 n1brImaJI26ezg2v9DBUNpmJLmS3nF0i4J1Jxkfol8al4tBniIan6M/f3St0+gaKhX
 VVZbBthul2+ph3YA0zkzgufG19AMmlFcghnJZflHBBSfz7e375LkyM8H+/2b9Xlh/U
 drGysTEfL9s9Lh7Pcyc4/8Js+p44MdEOGsPh4PE/YPOcZO6GghoxauabDruGgJ3fHs
 CZDc55kIia4ZGbqU3NSlWrH6oVkxJfYa7ZyPEf2H3S4AZ22imfGFPQMUJwsjHOMA9z
 4Ayqgiv6ePUdA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, vkoul@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, perex@perex.cz,
 tiwai@suse.com
Subject: Re: [PATCH 0/2] ASoC: compress: Support module_get on stream open
Date: Mon, 20 Sep 2021 16:30:44 +0100
Message-Id: <163215150719.38322.2208003533151877316.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901095255.3617-1-peter.ujfalusi@linux.intel.com>
References: <20210901095255.3617-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com
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

On Wed, 1 Sep 2021 12:52:53 +0300, Peter Ujfalusi wrote:
> SOF is marking all componet drivers with module_get_upon_open = 1 which works
> fine with normal PCM streams, however on compressed side the module get upon
> open is not supported. The module_get works when module_get_upon_open is not set
> becasue the snd_soc_component_module_get_when_probe() will pass NULL for the
> substream parameter of snd_soc_component_module_get().
> 
> In order to re-use the existing infrastructure for module_get, the proposal is
> to convert the mark_module to void pointer (like the pm mark) and implement
> matching code for the compressed open/free to pcm open/close.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-component: Convert the mark_module to void*
      commit: a739fdc26211952edb34bf1ac9ed7afe220a5d54
[2/2] ASoC: compress/component: Use module_get_when_open/put_when_close for cstream
      commit: cd46f3824480740879d2c15d65c6e6b038f96021

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
