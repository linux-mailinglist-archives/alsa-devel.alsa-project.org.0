Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680959712B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 16:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 972F21657;
	Wed, 17 Aug 2022 16:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 972F21657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660746787;
	bh=m6l9A6JFJVk5sDcAAx0rc+8lNOpVT7N8YCrh37JoVv8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rowpVj3PtdBVWR2/GLGjvN1PVBkuRz9MBcsw2UC9vvXtbHQtbPR8vumOWsUJS3WqU
	 2giVvPmFwAlXAYiGhDwDuQiiT8lhPIWSG58gBpOOlVBDhW0TuEguKzJsJ2YbA8sGXA
	 tMZByX66/ydxZ90UB/rj9d1HbaMN0P3ccG6Z3DLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B50F804CB;
	Wed, 17 Aug 2022 16:31:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA393F804C2; Wed, 17 Aug 2022 16:31:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_126,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C650F803DC
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 16:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C650F803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DtbFDIIG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 085F6614B9;
 Wed, 17 Aug 2022 14:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6090C433C1;
 Wed, 17 Aug 2022 14:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660746670;
 bh=m6l9A6JFJVk5sDcAAx0rc+8lNOpVT7N8YCrh37JoVv8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DtbFDIIGd7L1UG7t6nGP6H4PFZCBcHcfopHF1hyidthFZfOVT+HZE5qQLovFc4d4A
 orWknOPkiMWhWoNjCm7v56yNJlfHImR7EnSVCfDYUM0HoF1kAVy7KY25OnbI3pfU3q
 kBtBMXN3EPRlmokjQ9m7rfurj8MzvYIdTN/lJr4sFwQ2C1loQvpIINLz/UHJb9es6G
 KuvWs8lKwlX1JFdvvxFLcuqzyYfhNuoQfH1hVUohPbHiPXRx8ld8Flf46KyHqaC2BP
 bKUZCDHPC9iXR1GVewNBVw1d42ZRIQhRscCgXzDE794jHKZa2ipnIjVA+2t1CGipvH
 b8RnEWAsjxnJA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, vkoul@kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC/soundwire: log actual PING status on resume
 issues
Message-Id: <166074666854.210979.4761279701927958076.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 15:31:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: tiwai@suse.de, vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On Thu, 14 Jul 2022 09:10:39 +0800, Bard Liao wrote:
> we've been stuck with problems in the dual-amplifier configurations where
> one of the two devices seems to become UNATTACHED and never regains sync,
> see https://github.com/thesofproject/linux/issues/3638.
> 
> This is a rather infrequent issue that may happen once or twice per month,
> but still it remains a concern.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] soundwire: add read_ping_status helper definition in manager ops
      commit: 874de459488b8741afc0e9888d39f2e15a962b3d
[2/4] soundwire: intel/cadence: expose PING status in manager ops
      commit: 133547a1ef16cbdadb5c0023e5917924ae326dcc
[3/4] soundwire: add sdw_show_ping_status() helper
      commit: 79fe02cb7547fcc09e83b850cfd32896d7dc6289
[4/4] ASoC: codecs: show PING status on resume failures
      commit: 917df025e1db1286afb6e46914ae3e8b40241568

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
