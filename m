Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D16132A6F23
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 21:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73DDE16B5;
	Wed,  4 Nov 2020 21:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73DDE16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604522736;
	bh=sL+uzl9X6tKjB/W6kN6SuAP14dbnQ0+5+TWtRsisIGY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHKYBrL1K35XD/wHhGmldOADrNehFjtK/ZhTLQ5Y1Z7s6XH0HBOEomP/OrGmNjIoL
	 hCz8M+RcIw8Rik7/if3xGOjwV+8dTpdlchXUb+fA7hE3omWdzawzYAEz6Z4WJb5eY9
	 Fz4LKYlC0aTZ7RWIzVdqEYpu4iBGeo9yf1NWVHYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3265F804BB;
	Wed,  4 Nov 2020 21:43:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5608AF8029B; Wed,  4 Nov 2020 21:43:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8822F8029B
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 21:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8822F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yfswSxe3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4452F20795;
 Wed,  4 Nov 2020 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604522596;
 bh=sL+uzl9X6tKjB/W6kN6SuAP14dbnQ0+5+TWtRsisIGY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yfswSxe3+qPLy7DZr1kdfqKBFbAZvqkh3scFmRhASlrh11cs98y6TCozUqpHdx0HT
 tdOa058m9bzRf8kWIoIxyoGwuJa2WvksnQr7InA4cCC+I4kFcqLHfL8WyA3s67jGJS
 SbusGaNiIv80W7QIjdOmGdLGFD7XFtLIvWEcTr5M=
Date: Wed, 04 Nov 2020 20:43:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
Message-Id: <160452257413.7226.13520802978285851073.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On Fri, 30 Oct 2020 10:54:21 -0400, Amadeusz Sławiński wrote:
> Almost all other allocations in ASoC API are resource managed, the only
> exception is soc-topology.c.
> 
> This patchset clean ups few unnecessary functions in preparation for
> change and then changes to devm_ functions for allocation.
> 
> Amadeusz Sławiński (6):
>   ASoC: topology: Remove unused functions from topology API
>   ASoC: topology: Remove multistep topology loading
>   ASoC: topology: Unify all device references
>   ASoC: topology: Change allocations to resource managed
>   ASoC: topology: Remove empty functions
>   ASoC: topology: Simplify remove_widget function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: topology: Remove unused functions from topology API
      commit: 841fb1096713bdd85cb2484557623136e10041d2
[2/6] ASoC: topology: Remove multistep topology loading
      commit: a5b8f71c5477f4327c66a085d9714fe298510819
[3/6] ASoC: topology: Unify all device references
      commit: e59db12b8df3ab07dcfe3540ecdf782d4272f263
[4/6] ASoC: topology: Change allocations to resource managed
      commit: ff922622443767b27232eb01bae1d9a8d42df073
[5/6] ASoC: topology: Remove empty functions
      commit: 033df362ea3635179d1defed2230be69ed632c05
[6/6] ASoC: topology: Simplify remove_widget function
      commit: 8d456654839cd4fd10225ffa9c70c64784615f95

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
