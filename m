Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EE43BA66
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D4C16FA;
	Tue, 26 Oct 2021 21:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D4C16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635275368;
	bh=rkTbdhJreJu+/Dt15/a4V/IUMovkjM8fHEWaaAzawEs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+/WI0UJMRLnLFNO/HBCHE9KYt+4LjuI4o8ABCEDl++G2Ke/IPXK5fCz0uoAp0RsJ
	 IzlS0sMyqQRx+BBt/Sspw8ub81V4PXPaGoI6O020vXlQKVpB6mAieryT25CF5Zt84l
	 Xvyerw2+YYsp84zMapcUGXQ2OtV1jsZKpqL1CKNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D324F804F1;
	Tue, 26 Oct 2021 21:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00E41F80507; Tue, 26 Oct 2021 21:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 543A4F804F1
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 543A4F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g03LVhSk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4D716103C;
 Tue, 26 Oct 2021 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275218;
 bh=rkTbdhJreJu+/Dt15/a4V/IUMovkjM8fHEWaaAzawEs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g03LVhSkOLB1KkIYNHJUOmyzOY30+NPAZLdiPxvN+7SsfZLG8VF8rRQmnuE1HkMbR
 bMuuOPwrZNm3vzdl8njx68uqEbUCzEpmvvaoyC2IfWObnJyZ4mo45DOGNKFj3OsBTh
 pz9ntNrG1eyLo8AdjqRJk915YVoES7dKDZqDWCsE35WGxuX14w2bTxLDXgtfN8pw6a
 X8SJDxBswYUjwDIgTdZXfzryKjftAFdKXV3y4mgs1WWpRf/ysAOkPR5ELgwH/YuSkQ
 rgr3ZNxoko1GYPHk7X2btX+NkSXEtJ8TlN8tpdpci6tm3Grkvbv0JsJ1s3rGAI+xJp
 IKoyDq6iR4bXg==
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <cover.1635260849.git.geert+renesas@glider.be>
References: <cover.1635260849.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/3] ASoC: amd: acp: Dependency cleanup
Message-Id: <163527521660.2033755.18271571479627858811.b4-ty@kernel.org>
Date: Tue, 26 Oct 2021 20:06:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 26 Oct 2021 17:11:20 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series cleans up the dependencies of the various
> configuration symbols related to AMD Audio-Coprocessor support.
> 
> Feel free to squash into a single patch if you prefer that.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Wrap AMD Audio ACP components in SND_SOC_AMD_ACP_COMMON
      commit: f41d2ece95e1b40a708d2f1d5170ebc594df6ca2
[2/3] ASoC: amd: acp: SND_SOC_AMD_{LEGACY_MACH,SOF_MACH} should depend on X86 && PCI && I2C
      commit: f31c9399738870d0ae8081a65f264f5d103fd180
[3/3] ASoC: amd: acp: SND_SOC_AMD_ACP_COMMON should depend on X86 && PCI
      commit: 4bf74f8e56054cf3521f646313301d19c331ba54

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
