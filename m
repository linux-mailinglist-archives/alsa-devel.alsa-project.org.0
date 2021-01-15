Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E112F8424
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013871835;
	Fri, 15 Jan 2021 19:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013871835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610734886;
	bh=IYih6HK5bywhQPCe8+Ubp9rfmDXcS5Y7rKssma+9IVE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FomjOrtBwBAPbrIDcBeCeoKaf6bW1t6yBa92RH0SQXA/ZCIubAJGyTbIX3bLHJdMb
	 6n9EeuVzgzy9mcS/Q1k855kwd9LC0k3AIcNIpr+PSwrlnkvihvwjBg8GPuMO6bVjWD
	 FUGE5oTEeU+CYRugbVF/OLGOgKpkijeRL/dUZuwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A46F8029B;
	Fri, 15 Jan 2021 19:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF18F80254; Fri, 15 Jan 2021 19:19:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A988F8016D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 19:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A988F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOIS6Ji+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4412723A59;
 Fri, 15 Jan 2021 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734776;
 bh=IYih6HK5bywhQPCe8+Ubp9rfmDXcS5Y7rKssma+9IVE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BOIS6Ji++V0fQAyQSsHFJYaaqiy7HWX1p+ZVER5G37YtaClPJVR1Fk06bS+x+Y6pR
 56dVep3mubKlDlGRJineKYsLuryVFj+ePsFznyx2QYOwkTbXW/D6b+qU0Gl7Q9VTCl
 sZADmEi85HkKNDEvgMQhagcksWfXJmIV97t7hBl6LNTptVj1d7KY7uT9TGHIinzOw8
 vepRKpLkYWGJ8gChzIVjfRcVFRlhpVFdU//qGdF7rdKQR613rxxf/Zx17rliEBgpVa
 hrsdQZ6vTixx2QaCjAIVPJZAdBASQNKRW2arsov734Z+u2qI4tAyJXvyFNQ20rCXY9
 VcvTdSykkwxjA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 vkoul@kernel.org
In-Reply-To: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
References: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
Subject: Re: (subset) [PATCH 0/2] ASoC/SoundWire: fix timeout values
Message-Id: <161073473698.12268.1646614149546970077.b4-ty@kernel.org>
Date: Fri, 15 Jan 2021 18:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On Fri, 15 Jan 2021 14:16:49 +0800, Bard Liao wrote:
> The timeout for an individual transaction w/ the Cadence IP is the same as
> the entire resume operation for codecs.
> This doesn't make sense, we need to have at least one order of magnitude
> between individual transactions and the entire resume operation.
> 
> Set the timeout on the Cadence side to 500ms and 5s for the codec resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: soundwire: increase resume timeout
      commit: 7ef8c9edc86cff0881b2eb9a3274796258fbd872

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
