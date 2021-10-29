Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3ED44048B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 22:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5381916F7;
	Fri, 29 Oct 2021 22:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5381916F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635541050;
	bh=IPg6nSSMi2IfwMSUIGvn+Ln1n/eLa9+lEO9Jbi5n7kw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrNLvNxyW8BHGPbKwss30BKnyWdA0oiCThqi3PNuu5va14mxjFebACJmw2TLdoOSD
	 9gAwKxejWXN51RGexGss7Zh9P6+yz/MuNDPw54Fx4xvmAGNngUE7Ke4H8AntuRvCpI
	 R8qtED9LvbpfsSWeHfyX//42p2lR91jw1RthCjRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B771BF804EC;
	Fri, 29 Oct 2021 22:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF007F8032B; Fri, 29 Oct 2021 22:55:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9222F80271
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 22:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9222F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mvPzReQD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51EAD60F57;
 Fri, 29 Oct 2021 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635540901;
 bh=IPg6nSSMi2IfwMSUIGvn+Ln1n/eLa9+lEO9Jbi5n7kw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mvPzReQDpfMEeyj5/9ZeCP5gI6VL39O85cIOCc+w6QM9WR2u3mE7tBfy7un0Vw3jE
 5U7M/Xs0p5cbeJwCeCCdXSmbCQEe/8WZlsGGZ3wr4xszNXlTuNBctKAXhXtpRJgJ4j
 52ssX5G/4r+tsLjw6Xhq7zqftx6F25shuge21I3nDd2gAKAec9kPgSEKo4Vx8/uzrc
 B02WxkRgDDMBQOPwNnSbUkHDfbWBLPn3gpfnnuQm1/Am1MB2lV1rk30/NJx5kgrNg1
 s00soI7ra9s7DtQcpibl+qPO9QF+SKXGQLpdbw6Cfj8vcZnKkWrrcWK7qYMFLqkQLu
 wBYHtiWewUc7Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20211020155715.2045947-1-brent.lu@intel.com>
References: <20211020155715.2045947-1-brent.lu@intel.com>
Subject: Re: [PATCH v4 0/6] Multiple headphone codec driver support
Message-Id: <163554089709.1997146.9920801603298776810.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 21:54:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Bard Liao <bard.liao@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Libin Yang <libin.yang@intel.com>, Huajun Li <huajun.li@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
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

On Wed, 20 Oct 2021 23:57:09 +0800, Brent Lu wrote:
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
