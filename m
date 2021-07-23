Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B83D3E1D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 19:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55A21749;
	Fri, 23 Jul 2021 19:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55A21749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627059813;
	bh=s/BHG12tgApqgvctm7zwp9zN19QNZZdnL+jeha8tQ4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+vEaG5wVv2md1wlbPdhUizyV4Swilp1SC2JlrA7RsM+VtSZr71wJmokqly9QKpY4
	 x+efq6mE2lZDoRxaociaBlQbo5Br6R8b+aKHHdArRGnliqX+z80Xfn4j/YDFZybNfb
	 rarxCJ1iK+tG/xDSVPqThwT/qK7QZZFUwqBOakWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD61F80086;
	Fri, 23 Jul 2021 19:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A69FF804AC; Fri, 23 Jul 2021 19:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85BEF80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 19:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85BEF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KmGPOxeX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 506DD60EAF;
 Fri, 23 Jul 2021 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627059719;
 bh=s/BHG12tgApqgvctm7zwp9zN19QNZZdnL+jeha8tQ4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KmGPOxeXPGzlvOFhqckW50tj9xuuxJoTMPjuVpT0WPDtcIPJMU1yLOD0OEnuGgQV8
 B6iMQ1iOUbwyBTts5+eeyl6XZnlWD4yC+iOppPMdDP4wZGgfDEq4eSMflU3+M/tzAk
 t0H6vOOlO5/nOiTDCs2a80trWjLoHU1VfRVPmGE9/U0E+YhpI9bWFTvi+nFhasjueE
 vvXHArxD8B19lN4jARW1vvz/KfibjrIRju72TeVRu6cAnqtHZeLjWMTHWVKDHDMvZc
 Co5CeujziRhR0bfjIe468Fpv6nM3anFePsck5ROUL+asE+l4N5q8S57viiwwxezu8l
 jl/0kH76zSc6A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred
 probing by default
Date: Fri, 23 Jul 2021 18:01:51 +0100
Message-Id: <162705877778.18788.10167377888396986791.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722132731.13264-1-mario.limonciello@amd.com>
References: <20210722132731.13264-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, markpearson@lenovo.com
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

On Thu, 22 Jul 2021 08:27:27 -0500, Mario Limonciello wrote:
> Nearly every boot with a Lenovo P14s is showing
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
> 
> This isn't useful to a user, especially as probing will run again.
> Use the dev_err_probe helper to hide the deferrerd probing messages.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Don't show messages about deferred probing by default
      commit: af7dc6f194a866cb3e991ef5248ffdeb3ef5c46a
[2/2] ASoC: amd: Use dev_probe_err helper
      commit: 718693352d8bcea65276615f4f8c8d531246b644

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
