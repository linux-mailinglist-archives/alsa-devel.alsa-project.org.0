Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD23AA1B3
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 18:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D218416EC;
	Wed, 16 Jun 2021 18:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D218416EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623861817;
	bh=ioeAO168Yh6yhhdj/iontbxxZY/BFU+tAk8S1ZGsojo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDe6eV+6Lfcyqp13Om2BYXlB2H69m/5LD1VdEyWQuJEyZ+Coh70yg6USekP3saBup
	 EEOUfTAmDUUpXDjfrN93l65N4YPW78d2EpfdxN4zM8q++fpn3AZtF5cyLYHGYud5nI
	 /qOLqNyskSOVoyAZay/cWw87aVLTciknapgRUlks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3226DF804CA;
	Wed, 16 Jun 2021 18:41:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F7BFF80423; Wed, 16 Jun 2021 18:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7221DF8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 18:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7221DF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pAbPyUBT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9E4F60E0C;
 Wed, 16 Jun 2021 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623861708;
 bh=ioeAO168Yh6yhhdj/iontbxxZY/BFU+tAk8S1ZGsojo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pAbPyUBT3w9VRggAuQ/oknuxZC3/YWErAeRWyU1RX7UKKVz6nxZOVjZG91roWdL5O
 uRqt//NuLdPmE9b05fBdATZqNGcvFDcYZ9niacqhafmavWzoWSwsmtQlhXJM9dWFSZ
 gIEiBCr+w4sR3zzvDsqhQtrzsbCabvcp/XYL2EZxKfD1wORsLMO4bwzFqAXYZKWsJg
 7gwAP7Yva8pz3WCTWSGidPQl4K61KzqVy/1IChDJ3hbzqRBP0feaM2C3zMF05WR8SL
 g2D8Hv/yfzA3F1NnsNjZ8ugTOPp6SHCPsu1htqSeQU1pcb3g23WlCqTH5H/I5BPVEV
 iCpjGjK6EV59A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: make hdmi_codec_controls static
Date: Wed, 16 Jun 2021 17:41:14 +0100
Message-Id: <162386001971.25644.6831890415877174309.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1623822941-3077-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1623822941-3077-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Wed, 16 Jun 2021 13:55:41 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of hdmi-codec.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> sound/soc/codecs/hdmi-codec.c:750:25: warning: symbol
> 'hdmi_codec_controls' was not declared. Should it be static?

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: make hdmi_codec_controls static
      commit: e99d7c69fd4c18e7319f8aab8e252b12130796bf

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
