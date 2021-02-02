Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49F30C3F7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 16:38:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14923175F;
	Tue,  2 Feb 2021 16:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14923175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612280290;
	bh=61OSH6SWU0lYBUbE0pDZMo2/h5w6ena7+vI/x3t3UoA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzGTjBqmvm1fiwbDhYLibem4U5GjR1EfI/Cx81JhKYX3oZ18DJj4PcaneveHXNvKC
	 MWrc80wFqAVfVSUT7CIxguVTZXNOqeOkFH4vf0xr1D+fL7mMuXLM9GrWgw70K6Ud7i
	 RdUOsPhay1dt5EVfCzI7yx0WfvBIhwcvVsOBeSCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F80FF8023E;
	Tue,  2 Feb 2021 16:35:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97DD3F8013C; Tue,  2 Feb 2021 16:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1573DF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 16:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1573DF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HyXiZg32"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F91964F5E;
 Tue,  2 Feb 2021 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612280131;
 bh=61OSH6SWU0lYBUbE0pDZMo2/h5w6ena7+vI/x3t3UoA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HyXiZg32jajTiD+ZWWuev5Icof1Ke+kNzW83ZdydbAt7K3AYnVI86NOOJPymTdhy5
 4EZejwLsL9wahVCjJGvJmJNcEhqrc/v5Ps65j8a3V8zMeoXgBZdRy+q4iRz5SJOVfJ
 8ve4Roi1SDNhrWxDC2Ul3O1PLTDGjzGFVtgAAiUNdmjYdcoSOmTDSAKpr44vnN4VSs
 LpRaTSd+vr26nwN0q276jrV12tZTHwa32V7lUzmo1+n3v25+0r31IGoFxuM5o0R3s6
 izY01W0GBGm0vOsPhWPyQu2i6nKQZWtQfyzLUO5YG9L+j+82AFPE9lnYkhFYjX1BaP
 EdtStFFP072Uw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210201092345.1214232-1-kai.vehmanen@linux.intel.com>
References: <20210201092345.1214232-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: add be_hw_params_fixup() for ALH
Message-Id: <161228008449.11888.14410364863363132220.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 15:34:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Rander Wang <rander.wang@intel.com>, daniel.baluta@nxp.com
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

On Mon, 1 Feb 2021 11:23:45 +0200, Kai Vehmanen wrote:
> Fixup BE DAI links channel count to match topology settings. Normally the
> channel count of BE is equal to FE's so we don't have any issue. For some
> cases like DSM with 2-channel FE and 4-channel BE the mismatch of BE and
> topology will result in audio issues.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: add be_hw_params_fixup() for ALH
      commit: e1711b1f9dfb712aa72ea25e03e0a3f6ef16c4fb

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
