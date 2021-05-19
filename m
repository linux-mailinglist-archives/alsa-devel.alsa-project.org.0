Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CC389368
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 18:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B506169D;
	Wed, 19 May 2021 18:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B506169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621440837;
	bh=Pr6JLn/3y1HPQM3VlxColhh6Ox2yJoLwxCL4AlIJjI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jtZFTcdnEkhAXkCaWixkh17AdbC3FHVCYnjw24uwN0morxfqF+cDr8VXTwD3DPF9X
	 1NChRsp/xIqJ0KEGJXfdOzXXdjOFSsi2zFCBt/CV1D+mh3/ianni2S/2hZq4vK5KOU
	 2id2oBMhiEu5GXCBXncR+6Yr8ryDQT19XbAJccEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4094F8042F;
	Wed, 19 May 2021 18:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38DBEF80259; Wed, 19 May 2021 18:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF26F802A0
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 18:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF26F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Whn5QgLD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 885E1611C2;
 Wed, 19 May 2021 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621440679;
 bh=Pr6JLn/3y1HPQM3VlxColhh6Ox2yJoLwxCL4AlIJjI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Whn5QgLDKn6iNsqW3uUIDwzc4zzHvXNk+2jsOq3ZMckjCl26ZKzfHCXUrVxjckDb3
 cfAXf/dYXXBTToFOUSS6ne+VMAT2mIT4UT98OSA0Pb7epplqu+h9m3ITVUaFdYC2lj
 P4pRswMm2Gmout+C/Pyd5+6YtgGF6WPjZ2hXF+cRnud3znb8hBc0p4NY0jlKtFrbbY
 EjxAC9H/fRoWrC2B9wuU3Q+z1F1GtQTeu2wo8qj900/dLNUZYrai4ds5cz/qRM2w9/
 JhbBZ+jgSL52Kl4BkP/RhaE5m8UZnvKkvZ4JMJ+xUrVPZWcwNIHcR4ZgxOauY4YgWi
 4Td0HyPtTDyow==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: don't send DAI_CONFIG IPC for
 older firmware
Date: Wed, 19 May 2021 17:10:16 +0100
Message-Id: <162144027323.37060.5998146040074058715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518174121.151601-1-ranjani.sridharan@linux.intel.com>
References: <20210518174121.151601-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Tue, 18 May 2021 10:41:21 -0700, Ranjani Sridharan wrote:
> BE hw_params op was recently added for SSP type DAIs.
> But sending the DAI_CONFIG IPC during hw_params
> is not supported with older firmware. So add an ABI check
> to avoid sending the IPC if the firmware ABI is older than
> 3.18.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: don't send DAI_CONFIG IPC for older firmware
      commit: 8c08652614cb7468620a6328b37ca2965cd48283

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
