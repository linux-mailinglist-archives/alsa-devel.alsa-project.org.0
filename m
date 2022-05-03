Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0D518923
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 17:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80509F3;
	Tue,  3 May 2022 17:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80509F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651593219;
	bh=+r5JUz0l7szzamDatd3JTuEFtkoENIQbckVPReq3Qsc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEVMJjAOb2j5gwUf9JaIIzIHjD/NA7ivtKIQL4EO6UxnW8fGcsol85gr03Z+El7NP
	 K5rheRUc89XdtPVHGNtMc1xd3xf7QmAHpPtWSn6zApMDZQu3n+j4h3jQOohxNOrNd0
	 ty2OukByggyBQZIi6A3+HAzxxGPMcUOeueGfseFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99160F8052E;
	Tue,  3 May 2022 17:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71729F80507; Tue,  3 May 2022 17:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DED8F80158
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 17:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DED8F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pxr2hm/A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61D4161685;
 Tue,  3 May 2022 15:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0E4C385AF;
 Tue,  3 May 2022 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651593062;
 bh=+r5JUz0l7szzamDatd3JTuEFtkoENIQbckVPReq3Qsc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pxr2hm/ARfeLga3lGUZ9RhYYHRTrbUAOhL10AXyH20pzNt2gSKr+ZgX6RLRfEMS98
 IM7UeA6BAFwQ0f3PEdPmUiPp84robbNDpiQYUGllfLohY0U2c6IcUqxQw2EvpKQYDG
 Lr/rKY9JWUii/wGt7mu2MiCggEh3d7G7LZuRBejvomHzkut4cxhL2IeRNgg2N8jRIT
 bBLxQWwPYkl0fkljoJNZ9Zana2WNjkAko4jhP5CNpqVlwPJBoZ2TPnLjxzNUhfzOYx
 t6GOdcz9HrEhfroW0BGEvo7EcXA3cLorBxEl1yeRaCa4eJM3hQmjCTzusqSnlEvmTp
 8NOVh6IpDHZ7w==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, senozhatsky@chromium.org
In-Reply-To: <20220427185221.28928-1-peter.ujfalusi@linux.intel.com>
References: <20220427185221.28928-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v4] ASoC: SOF: ipc3-topology: Correct get_control_data for
 non bytes payload
Message-Id: <165159306095.184114.374784208868422637.b4-ty@kernel.org>
Date: Tue, 03 May 2022 16:51:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cujomalainey@google.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Wed, 27 Apr 2022 21:52:21 +0300, Peter Ujfalusi wrote:
> It is possible to craft a topology where sof_get_control_data() would do
> out of bounds access because it expects that it is only called when the
> payload is bytes type.
> Confusingly it also handles other types of controls, but the payload
> parsing implementation is only valid for bytes.
> 
> Fix the code to count the non bytes controls and instead of storing a
> pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
> store the pointer to the data itself and add a new member to save the size
> of the data.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Correct get_control_data for non bytes payload
      commit: a962890a5a3cce903ff7c7a19fadee63ed9efdc7

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
