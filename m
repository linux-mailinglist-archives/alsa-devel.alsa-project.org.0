Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1F42C3F7B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 13:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0F3172B;
	Wed, 25 Nov 2020 13:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0F3172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606305745;
	bh=oL0UJYisE3pSM3ttSoyOEO+6oi4dae3Ue1rvIKTOINw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBJETFiNBH04SC8ukK85bIaJvaiY66BZ3j2J56wS2PNUeVg/4BqALh7LisCY23D3Y
	 uiY6MX0jQL4mrTqgRaWKLBn4HSMWSQgCiDuOQmpM+n/Igcm6gNRZo2kAQo4wySvPz1
	 QMU6iYMCa9YLCu81fsXeQQybTEMeSwVvubGjMJ14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6839AF800D2;
	Wed, 25 Nov 2020 13:00:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA82F8019D; Wed, 25 Nov 2020 13:00:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D26CF80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 13:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D26CF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jM8fvG63"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 449F4206E0;
 Wed, 25 Nov 2020 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606305637;
 bh=oL0UJYisE3pSM3ttSoyOEO+6oi4dae3Ue1rvIKTOINw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=jM8fvG63hAXPkyryjFtOw5AsbNW2W+dnxcBssKcBcOd/pCWSWXVWk6YVMucNVWm27
 7UR4VZcT4B/lIO9N/kAZt+hjaOPEDJQmDLRKn0FA6OhzAawI1cZDuLVreutTXFO5NH
 /DSOg5lCJ1F9bxWg8A69KrGfe3UIM45yBxTLWNXM=
Date: Wed, 25 Nov 2020 12:00:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
References: <20201124180017.2232128-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Add 'memory_info' file to debugfs
Message-Id: <160630561272.41207.17443841126102085412.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 24 Nov 2020 20:00:13 +0200, Kai Vehmanen wrote:
> Series that adds a new debugfs entry to query status of SOF FW memory
> allocation at runtime. Information on used and free memory is shown
> separately for each zone. A new IPC message is added for this purpose
> and ABI minor revision is bumped accordingly to 3.18.
> 
> To implement this, additional FW configuration data needs to be
> parsed from the firmware file and this is done in the first patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ext_manifest: Parse firmware config dictionary
      commit: 7f09f79d5cb13186b0f422cf2e1c711c88c92195
[2/4] ASoC: SOF: Improve code alignment in header.h
      commit: 2e4f3f9141cc626147eaf6fbb8a92f17fd069553
[3/4] ASoC: SOF: Change section comment for SOF_IPC_TEST_
      commit: 6dd958955d3053a9c50353e39671622af4b8fba2
[4/4] ASoC: SOF: Add `memory_info` file to debugfs
      commit: 5b10b62989219aa527ee4fa555d1995a3b70981b

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
