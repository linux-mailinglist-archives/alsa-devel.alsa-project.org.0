Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC05351352
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874EC168D;
	Thu,  1 Apr 2021 12:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874EC168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272520;
	bh=AmB1o+YWSRbCC5rBIMr9eV2iGuWSsMgF97x7uR85EQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0E7xSzEwfiwKqet1Kji3dOfqbAeQXSzoWsrAcNAUUL+K2yLHqSFJem5Sy2Ajctmv
	 SVAx9zarotC0l9U5x//ekf7otii70VbZR4OaQYbN8QX/5vYXjCbBJOw3yXr70JArt0
	 s5I0nn5deuoLGyhFfDl5k72fF4TiD5lhwBevi2yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2CA6F804E2;
	Thu,  1 Apr 2021 12:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A83F804DF; Thu,  1 Apr 2021 12:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E079F804B4
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E079F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dsoj+rrd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FB92610A5;
 Thu,  1 Apr 2021 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272247;
 bh=AmB1o+YWSRbCC5rBIMr9eV2iGuWSsMgF97x7uR85EQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dsoj+rrdJF9ppMxZKT5232A20cdMkd46EL2qtMSxBhdBw9NWPY9s8HSC2sifjxauR
 uIKBdzztLdpFG40jz41n1xUoG0ZbwZbvMNlsijP8/fNio48c5LmHsQD9XLY+n7vSFZ
 GNiJ8+xRnv8w9Gd6Mxd8l1yQn0eis1u+PqaIUu741DnJEXGqA0srKOH6qGFCgj+PZC
 v/Jvv1moItfAPqWrPtvu/5C8nT33LdW3EtBXw5Wgl2A1tUoqilwlK4PmLs+0hVFY/+
 OVO6909QoTdw+wIj8HbfBqZP4gXiOoLlicHo4OfpSF+I+t9tR36COiAqhj6iuh+UjB
 /W+Fp/Gg0J/gg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [RFC PATCH 0/2] ASoC: remove cppchecks warnings on lm49453 and
 da732x
Date: Thu,  1 Apr 2021 11:16:27 +0100
Message-Id: <161726938995.2219.309801757681001460.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Fri, 26 Mar 2021 17:16:17 -0500, Pierre-Louis Bossart wrote:
> There are the last two patches in the cleanups, this time I am not
> sure what the code does and what the proper fix might be. Feedback
> welcome.
> 
> Pierre-Louis Bossart (2):
>   ASoC: lm49453: fix useless assignment before return
>   ASoC: da732x: simplify code
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: lm49453: fix useless assignment before return
      commit: 458c23c509f66c5950da7e5496ea952ad15128f7
[2/2] ASoC: da732x: simplify code
      commit: 945b0b58c5d7c6640f9aad2096e4675bc7f5371c

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
