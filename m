Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7144048C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 22:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D561720;
	Fri, 29 Oct 2021 22:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D561720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635541059;
	bh=2XzSq4mVbWcQ9X6sHFBxKYl/i6WLCiLInFmuv1V6Ido=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZcYG976vr6yF2USQJt4aMADGXZQEh5EV/44hzfT+ZdIyQo/tUSChFO5BIoSkJJsC
	 +9cis98vw4K/mndFd1lG8Fr3xFJ0gHp2tK9PD07FlzLn7T6LHIzWsE7+3QD8urgin+
	 QW7dWIXrrhO39ZSZcw9i/h3p+LijRAFie6Yc5l6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF8CF804F3;
	Fri, 29 Oct 2021 22:55:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08148F804EB; Fri, 29 Oct 2021 22:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB621F8027B
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 22:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB621F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SCwi14Q3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F72A61040;
 Fri, 29 Oct 2021 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635540906;
 bh=2XzSq4mVbWcQ9X6sHFBxKYl/i6WLCiLInFmuv1V6Ido=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SCwi14Q32wkQulSG3D10Dm6er2K3MeGlI+QUsfLSGsZJbzlv07jDgpMx4Yye5akU4
 06Wmo6gO43cbS4g06g93cTtXetvM1MLPwKbTl7AErRrv0jXPZnYZiqxWF6adw+lEah
 udL1sYBYX4dTtYMkcDQ7pY57EkNm73cd4j8BbbrRj16WlMRiAEfwsLVm1sNs3rSevj
 GA40yLMcQv6qWvrhZlN5Hra3fzPhrirN02jM7Hp7O52gD8R9YdI0C2Bu1I5qkQ1qg+
 PFtdog9FbohtpSoxnHJgrkwHztIU6omDZ4CxPjX8UWzY0sW27sntf4Tbfh97g2YUzq
 abEB9occrYu2g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20211029171409.611600-1-brent.lu@intel.com>
References: <20211029171409.611600-1-brent.lu@intel.com>
Subject: Re: [PATCH v5 0/6] Multiple headphone codec driver support
Message-Id: <163554090182.1997146.17202242422434789612.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 21:55:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Gongjun Song <gongjun.song@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, Rander Wang <rander.wang@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>
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

On Sat, 30 Oct 2021 01:14:03 +0800, Brent Lu wrote:
> Support multiple headphone drivers in same machine driver. In this
> case, both rt5682 and rt5682s are supported and enumerated by different
> ACPI HID "10EC5682" and "RTL5682".
> 
> V2 Changes:
> - remove useless 'NULL', 'false' in if-condition
> - can use 'comp_ids' field alone to enumerate driver
> - add comma to the end of entry in structure initialization
> - keep the table of byt/cht/cml/icl untouched
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: soc-acpi: add comp_ids field for machine driver matching
      commit: cafa39b650ec3ba8e9efa0825f1c08e029b5a1ed
[2/6] ASoC: Intel: sof_rt5682: detect codec variant in probe function
      commit: 8fe6ec03183ac04fa6529fdf0d4da1328946a9d0
[3/6] ASoC: Intel: sof_rt5682: use comp_ids to enumerate rt5682s
      commit: d4f3fdc2b7e16e8203c5d55bb91d6572647d4b0f
[4/6] ASoC: Intel: soc-acpi-byt: shrink tables using compatible IDs
      commit: dac7cbd55dca4fd9e646e37401079ebfae3935e0
[5/6] ASoC: Intel: soc-acpi-cht: shrink tables using compatible IDs
      commit: 959ae8215a9e8955f45b41e274a1294d7c9aba1b
[6/6] ASoC: Intel: soc-acpi: use const for all uses of snd_soc_acpi_codecs
      commit: 9a5d96add514079660b3f1270a55f8c2dbdbc1b6

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
