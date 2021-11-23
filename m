Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A64598ED
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:03:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AFA1681;
	Tue, 23 Nov 2021 01:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AFA1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625827;
	bh=vp3CX1PpWdGrv/SiEwkcurqREoxdodnt5sQwfgnFnQU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K97NChumK8Mqqd1nVrje5XaAQhnXTwxxu/+xL8Eo5MqDA5kTxXwHdANnDHCtHwv/j
	 RNrg0xc7fqXlZK20oY+aYHvLctvWEgz3do9xymtqwG06TRO4MEhRUuki6bTyDKDyGF
	 +6Kyj2uvjxXa33RS7pBrCpN6ClPc12HZPKxY+ANs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D36F8051E;
	Tue, 23 Nov 2021 01:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C5ACF80518; Tue, 23 Nov 2021 01:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 403AEF804F1
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 01:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403AEF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="snZLDi/5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 300506101A;
 Tue, 23 Nov 2021 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625616;
 bh=vp3CX1PpWdGrv/SiEwkcurqREoxdodnt5sQwfgnFnQU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=snZLDi/5EVENXxw9IOmfRIrhtKHp9DeLxQKbszsfdUJNBRpK9gUfG60xx+gcdQOnz
 y6j/gM9qsTTpKyYL/wYk0/zTo1sYkLy/b1VHvUpUxcFkD9ON0u5DaBtkARX/tEb8FW
 o5amb5kt9CEr2GS7wE+5aNzVZFlGxsqgmlnlrxes9GiDS8VM0KDUAPobGpyZDxHpmo
 YbImt1HI05XMkGy8y6Gzx4i0Erlm7CPTw05KRNCoi0lpWUFiylmw3LJyPjjsHEpmpi
 d3R+v9o/JatsFsUoUgUWaO1wCwpLDDKKQyibyejsuLxymx5Ns8K5yLaDvvH/Gqj4eu
 fXG2/2cbdJnHQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20211119231327.211946-1-pierre-louis.bossart@linux.intel.com>
References: <20211119231327.211946-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-pci-dev: use community key on all Up boards
Message-Id: <163762561484.2471742.4478251665420827496.b4-ty@kernel.org>
Date: Tue, 23 Nov 2021 00:00:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Fri, 19 Nov 2021 17:13:27 -0600, Pierre-Louis Bossart wrote:
> There are already 3 versions of the Up boards with support for the SOF
> community key (ApolloLake, WhiskyLake, TigerLake). Rather than
> continue to add quirks for each version, let's add a wildcard.
> 
> For WHL and TGL, the authentication supports both the SOF community
> key and the firmware signed with the Intel production key. Given two
> choices, the community key is the preferred option to allow developers
> to sign their own firmware. The firmware signed with production key
> can still be selected if needed with a kernel module
> option (snd-sof-pci.fw_path="intel/sof")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-pci-dev: use community key on all Up boards
      commit: 405e52f412b85b581899f5e1b82d25a7c8959d89

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
