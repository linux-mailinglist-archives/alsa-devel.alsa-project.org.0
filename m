Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23F437AE6D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 20:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46EA518D0;
	Tue, 11 May 2021 20:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46EA518D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620757498;
	bh=D5mDH9l7FbQZwQF2bCf2UhGqe6AvN8dUNJ3eVmIIVMs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQd1eg5x4qExQtsZ/Jxxf9g8R17UaUvgpL64Awjm4iImoLloY2iEpjaHBExSONbwm
	 wiShwQQxnoRHmXJiQ3Bsm/FAxWhjGXSeC7HBeXoJl9GZN46mRj0zhzv0aVRnJ06Ptn
	 dGTw+eu4J3bZlyjpry6NfWxhdvnDwbE/CUp/SQxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96051F8028D;
	Tue, 11 May 2021 20:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DF1F80279; Tue, 11 May 2021 20:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9744DF8016B
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 20:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9744DF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SLdw2num"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C61A61207;
 Tue, 11 May 2021 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620757356;
 bh=D5mDH9l7FbQZwQF2bCf2UhGqe6AvN8dUNJ3eVmIIVMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SLdw2numIYxXSEL3fhHbiQVddlOTO7it7HYtNuw0sEfjkBRuLEtnTQU4gK0N8eYrq
 xPcGyPyc285d89m5C95xMyPJAlVzyKdVnSdPEvKLDTLTgtrMz+MWc5NtMoXSSmL+MV
 vqhTjkAMXhlmXNIE5U9GvpBLipufBL+e4DIid+6gl1sHsmDZZgXLmQqSybxWLL9tnL
 uE3izOqKazh4kjeexls+brpApnTkqj70Ye6R7oQVRxmnd8B/uwNLbz58xwblSR8XUw
 pCY/9pcF5aOwNuMvR+anER6pbNnfyOMrlCorFGsEqO9EzvcLcR1PiKr9z1QgpG0TEN
 XLAXRynIR01/A==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs35l36: Remove unneeded variable initialisation
Date: Tue, 11 May 2021 19:21:31 +0100
Message-Id: <162075713909.17925.4212189860182304030.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
References: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

On Tue, 11 May 2021 11:10:49 +0100, Charles Keepax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs35l36: Remove unneeded variable initialisation
      commit: 634a4be0f9d16428779d60bb40fd852f888f0a34
[2/3] ASoC: cs4265: Minor tidy up of error paths
      commit: fd4e6baa6256b9c5cb6d8d6a020093ee9aee0372
[3/3] ASoC: cs42l52: Minor tidy up of error paths
      commit: 4ac9b48adf4d561d0e33419d548278f205dd70b5

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
