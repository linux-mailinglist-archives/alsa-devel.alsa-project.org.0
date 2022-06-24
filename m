Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1803559847
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 13:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ABB2188B;
	Fri, 24 Jun 2022 13:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ABB2188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656068457;
	bh=OAQ3P9yU+RG/aMH6dNSHmU8lPjvxt3CpUYFjlXRfF8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=URjzB99onYXvLESalyFjKwtDjjUYHC6k6YnXv01WRObJEw/5gUdzrLboFkt7micOE
	 wC+Su4Bnsl4Qsa/a3tDq4rlBEhOTL/zzQLkU4R+H1y81ZiqlMCrooHi3CI11BRhGWA
	 ZvZk4zw/vIG3q92dhtoYf/5hZ0DGLjMq5rqCxdrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15962F802BE;
	Fri, 24 Jun 2022 12:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08982F802BE; Fri, 24 Jun 2022 12:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D9C5F800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9C5F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m3AjiTZp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AD7EB827FF;
 Fri, 24 Jun 2022 10:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C7FC341C8;
 Fri, 24 Jun 2022 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656068364;
 bh=OAQ3P9yU+RG/aMH6dNSHmU8lPjvxt3CpUYFjlXRfF8Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=m3AjiTZpADDsusJBrOa3ZqZYwpoC49uZE/IS/tw1iJ5v7Ww+T6E6QUu4GBbr5WPm3
 BaacPaukpNnNPySAog9EnjH29lf8x8SpB1SPsKKp9ZYBVCtI4QV/ZsRDpVI7zfKCZF
 Tty0KZ5ISdw5CuphlT5QV54VZJV+TmujPoRI/31Larzx0caA4lFA7XDEwCgsnwq60Y
 0/GYrSlY+LdlVjsc8/D21nYV7cshCATak54ktjMu7kevZ9nZSyoqmAStO/Nh8JropC
 gsHsxD0kyheTpAL7qS4DBr7yG1xrzEA/0TdcFAfahrv1+PKsO0xTds9YsqdrSHD1ja
 FlDATYisUaSvA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cezary.rojewski@intel.com
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH v4 00/17] ASoC: Intel: haswell and broadwell
 boards update
Message-Id: <165606836275.26928.7739090646897262373.b4-ty@kernel.org>
Date: Fri, 24 Jun 2022 11:59:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com
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

On Mon, 20 Jun 2022 12:13:45 +0200, Cezary Rojewski wrote:
> A number of patches improving overall quality and readability of
> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
> Both files are first renamed and only then actual changes are being
> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
> to match the pattern found in more recent boards.
> 
> Most patches bring no functional change - the more impactful patches at
> are placed the end:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: Intel: Rename haswell source file to hsw_rt5640
        commit: 8b99e24de3fae72ff5ef38832b94b1e41059eeed
[02/17] ASoC: Intel: hsw_rt5640: Reword prefixes of all driver members
        commit: 675002b6ca9132445e340bd106297d584e44fc9a
[03/17] ASoC: Intel: hsw_rt5640: Reword driver name
        commit: a69615e81709da0ff1f035886e8b3faf6125cd22
[04/17] ASoC: Intel: hsw_rt5640: Update code indentation
        commit: 5b66dde4ada531c1a2417d8daf68004067932a19
[05/17] ASoC: Intel: hsw_rt5640: Update file comments
        commit: 2c53debbbf04eb40854fa33813514828fa455783
[06/17] ASoC: Intel: hsw_rt5640: Improve probe() function quality
        commit: 0439f262a9b39734c1440733850969f0342c50c3
[07/17] ASoC: Intel: hsw_rt5640: Improve hw_params() debug-ability
        commit: 6c65908251edc637b53bdeb9e79d918a8d081183
[08/17] ASoC: Intel: Rename broadwell source file to bdw_rt286
        commit: 6d8758f6afd91cced9c6c5571337a5fbc6955bb2
[09/17] ASoC: Intel: bdw_rt286: Reword prefixes of all driver members
        commit: 40b5c9030a87e97c00c84403902481deadd2a57b
[10/17] ASoC: Intel: bdw_rt286: Reword driver name
        commit: 86156bcbca08ee32d04ca56c57ff3fce6fc5fc4b
[11/17] ASoC: Intel: bdw_rt286: Update code indentation
        commit: 9de833d2dcd43c953f7869f27bffd41896adb425
[12/17] ASoC: Intel: bdw_rt286: Update file comments
        commit: 128bb6fb530841348ee4d9b4234b30006c44c803
[13/17] ASoC: Intel: bdw_rt286: Improve probe() function quality
        commit: 9177203c209d9137dce52c7f0bc28e54960e5a41
[14/17] ASoC: Intel: bdw_rt286: Improve hw_params() debug-ability
        commit: 423cc2d0e8506a0ce6e3ef1806a561de1076e033
[15/17] ASoC: Intel: bdw_rt286: Improve codec_init() quality
        commit: 8fe4709962d74a19c0c1dfc877ba600101340c62
[17/17] ASoC: Intel: bdw_rt286: Remove FE DAI ops
        commit: e7f68863545163ec75b6bc3cc48fe888c28e0ec6

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
