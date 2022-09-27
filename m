Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B885EC114
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5205AE8;
	Tue, 27 Sep 2022 13:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5205AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664277716;
	bh=bvLdn54WLXXGn2K8gs+IJk07fcYXo6kaZWU8LNj08H0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvfRJDWhro8N0QHzSj9Mrz4cvJk5JYXRlgk4vKkNI3giJ5rCXIOO97/yT+7xJeXKB
	 InDa46zs4ONgjJuH5OlLEPzmAY0w97OiRTvCACXz9SNL6/MX0ynAUGYqfOWklEYsJ+
	 aq4jXmMPIKsYJurMHWvXm1UUWYmuoWNKRbT6vQlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A68F80548;
	Tue, 27 Sep 2022 13:20:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCD5F80515; Tue, 27 Sep 2022 13:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22D46F80515
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D46F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eQ3OSM6h"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F4CFB81B2E;
 Tue, 27 Sep 2022 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4425EC433D7;
 Tue, 27 Sep 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664277617;
 bh=bvLdn54WLXXGn2K8gs+IJk07fcYXo6kaZWU8LNj08H0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eQ3OSM6hORTvgyGe/6NEH0F5/Wc89CERpmLGFFegS6jDIZDe0mZLnyJaTtE6DGDHZ
 0Lshm/pylr1Grnd25nhLXrHTin3YxaW06YF5svmYzC43o/KReM3L/8P4YDKALsS9pC
 /5D22R/L+lBdCd2xO1MzfkZxtuz8JhX2htkfQXDun/AcGnjpO/N8hxqWYnbIc0NaPx
 pkBPm2TLHaMjoEI6oIQFs3DMbdrYjWEBofGkOYV8JzuYJOFUX6+20Uj6EIj/WgcIJq
 XcOEgkWxPw45NR7jDq2zkZGMp2f5IpkMqxIiCVzpFsvqd5hcOY/iCi09hiYGadyYdZ
 aDltiXSQNzPmg==
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com, perex@perex.cz, ckeepax@opensource.cirrus.com,
 james.schulman@cirrus.com, tiwai@suse.com, 
 Ren Zhijie <renzhijie2@huawei.com>, lukas.bulwahn@gmail.com,
 flatmax@flatmax.com, pierre-louis.bossart@linux.intel.com, 
 tanureal@opensource.cirrus.com, srinivas.kandagatla@linaro.org,
 lgirdwood@gmail.com, krzysztof.kozlowski@linaro.org
In-Reply-To: <20220926074042.13297-1-renzhijie2@huawei.com>
References: <20220926074042.13297-1-renzhijie2@huawei.com>
Subject: Re: [PATCH -next] ASoC: codecs: wcd934x: Fix Kconfig dependency
Message-Id: <166427761398.294040.9515810041975112450.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 12:20:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 26 Sep 2022 07:40:42 +0000, Ren Zhijie wrote:
> If CONFIG_REGMAP_SLIMBUS is not set,
> make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-,
> will be failed, like this:
> 
> sound/soc/codecs/wcd934x.o: In function `wcd934x_codec_probe':
> wcd934x.c:(.text+0x3310): undefined reference to `__regmap_init_slimbus'
> make: *** [vmlinux] Error 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: Fix Kconfig dependency
      commit: 4d73b97b8dbaf09af6e5878ce3288ba93956a3fd

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
