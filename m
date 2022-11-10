Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982806248CE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:58:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24053167E;
	Thu, 10 Nov 2022 18:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24053167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103084;
	bh=djLkJnlYM/WpHPHjrcSKIXdUgztKhrT88LtNeoe5VYk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hynbc+BV7uwo8kCbi1J/sTAlkM3+p2DKv0/jCRjMP7gj+6ezK3hm0bw+hxOxuuANt
	 tPUnkgp4ELGJ60Kb7KazxQHQrRrUjKkI2M6InQe3iHgrXOqR9RnpPmBem95MQZ3Xyf
	 GSH9fwMHL9xbQ+NdvHP9Qb/FCkc/JgRj3L8QvCFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B398F8057A;
	Thu, 10 Nov 2022 18:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE310F8055C; Thu, 10 Nov 2022 18:55:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53351F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53351F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MxfQqbnb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3937DB822B0;
 Thu, 10 Nov 2022 17:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1937EC433C1;
 Thu, 10 Nov 2022 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102934;
 bh=djLkJnlYM/WpHPHjrcSKIXdUgztKhrT88LtNeoe5VYk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MxfQqbnbiSui7pFUDMupg96obb4lO3fznt41zJfVFJKE4h3IwY5hKH4swSfSAOltl
 uGqHdq5/hfoOh6Mi5o+7pX+1Slv5cqnsE4riGe2PHnDN6ZsKK1tTre/vKPxEUAi1IR
 Te+0SHnyBjQuU+1aAeReAGd0GrNhpq7/S1X9RGnOzRBE7KQVBaUzX3nTJDWlUI1ZD5
 50QZMfCrW+9a5hICdF6sbZja2+jzACeeW8usIMA7xi8bGRV92EcZ+kaYewHqqZlI0x
 xwOnqqBarty1JCzaqE8Ijih6/P1OviXJYaqSm4rci6YkSJTfccJW5VjvZ/qpeQRMOF
 4dcpupE+FNMCA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, chao.song@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20221107085706.2550-1-peter.ujfalusi@linux.intel.com>
References: <20221107085706.2550-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4-topology: Add widget queue support
Message-Id: <166810293281.959181.9316024301484825385.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Mon, 7 Nov 2022 10:57:03 +0200, Peter Ujfalusi wrote:
> with SOF topology2 for IPC4, widgets might have mutliple queues they can be
> connected.
> The queues to use between components are descibed in the topology file.
> 
> This series adds widget queue support (specify which pin to connect) for
> ipc4-topology with topology2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Add support for parsing the number of sink/source pins
      commit: 6327c7297fc86d2203ab31882152a9d0b049f7b2
[2/3] ASoC: SOF: Add support to parse pin binding array from topology
      commit: 3b3acedbd0f30b822e05e5e51b646a67de0031fc
[3/3] ASoC: SOF: topology: Add helper to get/put widget queue id
      commit: c84443db0fddd188838faa9d71ebd6d9aa280068

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
