Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FE62F5C4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 14:17:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB8E16A3;
	Fri, 18 Nov 2022 14:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB8E16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668777429;
	bh=9MMUYFRRKaYwzeCf2Np6fZLnC44Y0lXhfJrXHsvnKlQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWaFTyG8FSgGoRBubWIeUUkLwwic99qmTbBxEX0id1y/S49e4uzyI969eJS1e0njX
	 lMrtsUADEVRrsYPYjzUfGX9hCPAFY32vRQW14LxIoYIUeW4pW5Fn+1QBJ3fgEgvfbl
	 MRU1yoQNX/vjJMifxlUu74HbAwRWcn34lhZlNhRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97067F804AC;
	Fri, 18 Nov 2022 14:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A12F4F8020D; Fri, 18 Nov 2022 14:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18AE7F800FD;
 Fri, 18 Nov 2022 14:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18AE7F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HlDoAlfn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC80E624F8;
 Fri, 18 Nov 2022 13:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DB8C433D6;
 Fri, 18 Nov 2022 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668777364;
 bh=9MMUYFRRKaYwzeCf2Np6fZLnC44Y0lXhfJrXHsvnKlQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HlDoAlfnJaE46Uk0mfb7ULFZFmHe+TcyKaIpQhvgmFbTQdDOp8ugO11tAt0k51M26
 1vHmIsSHZo2lI93MymrnGELeA03nVwa57gJWUG+L3q8yvWtbZ7vGu/+HuhKHb/oxjR
 N2go4QXrDy20QLaM0uquXSzBF0IVNJhDVAOK5W8DLL1ZCfA2YMVaVvrMscvY9HKs3+
 8QaFXwyAUidYT5PaumVF+oZXT5CFMr0jfhjunI8C0noohE8FmK8Bj5CcLJ5hZkp7ve
 cHbtfVAsIDNaM+0vAEc3vWS6rbS32avWrsfPUXQT0aHEImnMJSfh5gcfNOiz7pw/tL
 gmTGqbJA9MCzQ==
From: Mark Brown <broonie@kernel.org>
To: Jyri Sarha <jyri.sarha@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, 
 linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221117103223.74425-1-andriy.shevchenko@linux.intel.com>
References: <20221117103223.74425-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: SOF: probes: Check ops before memory
 allocation
Message-Id: <166877736036.779720.17364328796759988809.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 13:16:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

On Thu, 17 Nov 2022 12:32:23 +0200, Andy Shevchenko wrote:
> We may check ops before spending resources on memory allocation.
> While at it, utilize dev_get_platdata() helper.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: probes: Check ops before memory allocation
      commit: 82b21ca1912723a53534086864ee0daceb604cb5

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
