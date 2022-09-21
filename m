Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F55BFAC7
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56391852;
	Wed, 21 Sep 2022 11:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56391852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752227;
	bh=6YdW3bLE3mYRDad9mCHTtssVKIrKWjNdwq89se+90a4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5uFcvKjDMQl5VxU3elM3JAJqLENShI0lE6FDuzSpC7kUgFRkRSsT+2LFFmQtCJq2
	 uueaDcHNGLkK1Fdj7ztdktbLeNbAvYk0N4drQPXznDjVePekb7SfvzSlZXqmQOaSt+
	 m1Wi6rm0Z6kX5VeM+SQ2dCKsU+8xBrQBQSBxSiTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFFF3F800C9;
	Wed, 21 Sep 2022 11:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE397F80256; Wed, 21 Sep 2022 11:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FDD0F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FDD0F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cVg0wOlI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84031B82EFC;
 Wed, 21 Sep 2022 09:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788AAC433D7;
 Wed, 21 Sep 2022 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752163;
 bh=6YdW3bLE3mYRDad9mCHTtssVKIrKWjNdwq89se+90a4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cVg0wOlIrux2c1Sq0KGI/3av78Tzbkisd+IPiMwBXiLpWP4B4MUr4+KEXikDPi2La
 buHIYL9mPoDI8o5s69PBnUsSTEBJBKeDj0foSRmIGu/a2whmrvkpUIjoA/OdeR2hcF
 gg32aiGRYA+lj1S14D0aB1a6RRUH4o0LT7Xf/Hgk+GJBUgX7+L5HWkWOVWm2/KSYX6
 CdEEjDNV6egxSqTAiGfimfLXrcSiu+POu9XHZ0czED2WChiy+GCvv6Ngk2yTFyw/UP
 jmiGb8oOSbYg4BwLwC26DNPYs63yK2vpRQ5eqS0KnMIYy6Z3r5CJfO3W+TiwGyBbkf
 30fsK9qmmpyfA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
References: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Add SKL/KBL support for IPC4 CI tests
Message-Id: <166375214058.526450.458482217571245147.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:22:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>
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

On Mon, 19 Sep 2022 14:36:13 +0200, Pierre-Louis Bossart wrote:
> This patchset was submitted earlier in April 2022 as part of the
> "ASoC: SOF: add INTEL_IPC4 plumbing" series. As requested the SKL/KBL
> support is moved to a different series.
> 
> This updates adds minor style fixes and the ops that were missing at
> the time.  SKL and KBL daily tests have been running for several
> months and helped identify missing sequences in the SOF driver for
> HDaudio links, or platform differences that the driver did not account
> for (number of pipelines, etc).
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-dsp: expose functions for SKL support
      commit: 556eb41622b01c50dbc330e03bad2b0a5a082428
[2/4] ASoC: SOF: Intel: add SKL/KBL hardware code loader
      commit: c712be3427ca7b76800f335a6cfabdddab380c27
[3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
      commit: e2379d4a83da44816009971e932db31e665d41a1
[4/4] ASoC: SOF: Intel: add ops for SKL/KBL
      commit: 52d7939d10f25bc6635caa4d390e79a034626f79

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
