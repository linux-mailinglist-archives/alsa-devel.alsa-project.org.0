Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72364F93EF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344AD192D;
	Fri,  8 Apr 2022 13:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344AD192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417118;
	bh=9PcRN1KVHKzxtFwa+szuQRyy7nvnR2Tc4v2DTfZkrvc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oebYTMihQs2fXyKh9lLB0kEgHlQYkfYgE03GD4Fq/dVy6W2ySmClnl1+g+KmqS8bL
	 BHiWMog7BQ7uBa7PQTCHJ53gPlQtNjldSX4NiQxOYkZs47h+QpTZ7BCP3XuucDhgVL
	 YCJyf1FYNmMmFqjH3FEnyWlECmu0zstM5rzFBg/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B1D7F80311;
	Fri,  8 Apr 2022 13:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33FDCF80128; Fri,  8 Apr 2022 13:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FE2F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FE2F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PSXXQnMS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87007B82A63;
 Fri,  8 Apr 2022 11:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A62C385A8;
 Fri,  8 Apr 2022 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417052;
 bh=9PcRN1KVHKzxtFwa+szuQRyy7nvnR2Tc4v2DTfZkrvc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PSXXQnMSjzyNsP9cirEzffzqPrnZjsf6iVxxKrwqW3JAl6L6Gr1oxFulYR4pSbCVD
 j/oY6k0Fj1/9ZAd+fxdhRNReE6wyXauHCC/1hOoGw0KMjoDQUjS6CrvGiBMIni2BcI
 lnK6yDc6ezB9blZDTSQt3t1yFdw1FMXSQ0IaYgRH2PQzXv3z5srSmyJSzDyPRSauzO
 i2ermbXzubEoxiU9++WDMvAEtpVe7+oKmX6oqEr5Q9FHh2clAQpdIoi3W5/674zEJz
 KRSGU/CqjXsHVRdJib5a3J/afu+y6KbValRTpgBp84YrdbOpROVTiG25P1zAg/Alvd
 2GcbiEG3gZ3bA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220406192005.262996-1-pierre-louis.bossart@linux.intel.com>
References: <20220406192005.262996-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt711/5682: check if bus is active before deferred
 jack detection
Message-Id: <164941705051.1295287.125293907055326530.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, yung-chuan.liao@linux.intel.com, rander.wang@intel.com
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

On Wed, 6 Apr 2022 14:20:05 -0500, Pierre-Louis Bossart wrote:
> This patch takes a defensive programming and paranoid approach in case
> the parent device (SoundWire) is pm_runtime resumed but the rt711
> device is not. In that case, during the attachment and initialization,
> a jack detection workqueue can be scheduled. Since the pm_runtime
> suspend routines will not be invoked, the sequence to cancel all
> deferred work is not executed, and the jack detection could happen
> after the bus stops operating, leading to a timeout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711/5682: check if bus is active before deferred jack detection
      commit: 770f3d992a3f7330f801dfeee98429b2885c9fdb

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
