Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B81AA656A21
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 12:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618A4739C;
	Tue, 27 Dec 2022 12:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618A4739C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142277;
	bh=MVhpv8rXzR6Te24jCkntBS3xe22aOWW6rhIHAEiEsTI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KhNh2D/+PMWhO0bP2aSOUrOHMhTuE1o1LUhG515uX4GTJQEw9a6NvZLEQoL9ulIw+
	 i9MDg6gmDPq44QOo9o5ChoBiInlnL/Tiyc+ksSEE1Ilr40fxJAwhm98+aKDiBTxKhX
	 L1R5Ej4FNKwrfL4bgfeFrw/R7HcOP5OHTl7GYB/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42770F804E7;
	Tue, 27 Dec 2022 12:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B56ACF804B4; Tue, 27 Dec 2022 12:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6ECBF800F0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6ECBF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PSUPvLMA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1EA99B80ED9;
 Tue, 27 Dec 2022 11:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C59C433D2;
 Tue, 27 Dec 2022 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142211;
 bh=MVhpv8rXzR6Te24jCkntBS3xe22aOWW6rhIHAEiEsTI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PSUPvLMAwFNazUcuumTkeUgtQFmpg2Vw/cgqNm7UwT4p+V6Any1e1GpEiBrUGc63I
 jpqUEuEjJyUZM3fBL8N/QA7A/d5CwFQTWQUrqabnWeCUFaYnJ46ZDjNbTu4fcIDVOk
 zvGW2TXYdD+BeXEtF8qzXP45KEJS3NSDcaFiEIOOAtU/oNPAZd/h9rfu2LNjp5pM2D
 3exLfJN9KJP2Sz9vWXFJ0WfnJCZa3CqT5r7q8BFevoF87UKmAmkeRzIEPusaT7wmp6
 VM4HsNIHDwpr4wmAWYz9Jp9V7Z7dvOTlJi+hFG4y728CFRfC/CMbWKO/Cw4Nh9KX0I
 vQXmATWtnoltw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jarrah Gosbell <kernel@undef.tools>
In-Reply-To: <20221209105621.39237-1-kernel@undef.tools>
References: <20221209105621.39237-1-kernel@undef.tools>
Subject: Re: [PATCH 1/2] ASoC: rt5640: Allow configuration of LOUT to mono
 differential mode
Message-Id: <167214220970.82924.10318641625938014586.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:56:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: phone-devel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 09 Dec 2022 10:56:20 +0000, Jarrah Gosbell wrote:
> LOUT output can produce either single-ended stereo signals, or mono
> differential signal. Some applications are wired to use LOUT in mono
> differential mode. Allow to configure it via device property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Allow configuration of LOUT to mono differential mode
      commit: 44b54f54b41d36e8a2302a2c18a65268751c9067
[2/2] dt-bindings: sound: rt5640: Allow to describe how LOUT is wired
      commit: d8510532ccf3bc12e2b1c0c285d4b61d4b713e1a

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
