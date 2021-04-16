Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0323627D6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 20:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85F516E2;
	Fri, 16 Apr 2021 20:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85F516E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618598258;
	bh=xzFQWr3GHUCkLcTFnvtPe0lXb2d9F9cekwg4SyrI2L4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YedHvLM4Aac+56kWkZ+4+od+uMOa3Nxvco4+4DFdu0X1wLRusFA8uglqTbGd3vyMt
	 /NqYIrbbXJA6l5Pyd+bjlvqDg4lkecBaUQyKLtXJaeZlWjTMRchCArgy32AqMR8GiP
	 cMYAdmbSABH3VFp7SwXVfNwIfVYmxDk6N9EtjbOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 269FDF80423;
	Fri, 16 Apr 2021 20:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5DD4F8032C; Fri, 16 Apr 2021 20:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FCB8F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 20:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FCB8F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pm3mB6BJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E745610FC;
 Fri, 16 Apr 2021 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618598102;
 bh=xzFQWr3GHUCkLcTFnvtPe0lXb2d9F9cekwg4SyrI2L4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pm3mB6BJZMAxqlpDRw1yIMVssEs6RROrTAQJ2EIH6rYw9QkoAJwpcHzMyeoDqeqUA
 y4cGL+uYH35Y2dmolvBNqEfq0vC6RFjTMae1fj7+kvDa1dr/G7AURuvjpziNGq5PLJ
 Qo/D47A+rJm4KouN2yyc9gSpLy+PkaXaA6z5haOrda7K6iJS9oACY4aYRT6/5lMH5J
 TsuXo2AlpfbBdLchyBy/fdXFrnc7xmjD1OqNZKnr4BYWBafy+Bopyx/ElySNsCQpF2
 UGe8V+Kejwy/8GfKMVhIK5nwSGSdI8zRDTciSZLIuODwF5J++WOEwaW8R/pKP2KeVJ
 y+U/pH3VQNjrg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH v2 1/3] ASoC: rt715: add main capture switch and main
 capture volume
Date: Fri, 16 Apr 2021 19:34:32 +0100
Message-Id: <161859792865.33058.12955492794472446951.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <dfd43a8db04e4d52a889d6f5c1262173@realtek.com>
References: <dfd43a8db04e4d52a889d6f5c1262173@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Derek=20=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?q?Shuming=20=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
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

On Mon, 29 Mar 2021 06:53:54 +0000, Jack Yu wrote:
> Add main capture switch and main capture volume control.
> Main capture control has its own channel value respectivelly.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt715: add main capture switch and main capture volume
      commit: dcca646c4977d885af3466b454df97b9cb0e0d26

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
