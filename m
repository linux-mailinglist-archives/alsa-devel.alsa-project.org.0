Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778D642ECA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 18:30:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67BC81887;
	Mon,  5 Dec 2022 18:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67BC81887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670261455;
	bh=9o+sSMrq9KvnPjqoO20e62XLRYjEsVjPF5T8c8sl2AI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zkt2GPtKsWJo909NCS+UF3v/SnCV+jtqbtXGV0AJVIMpncz0OtSQ6Q4qTZ9lXOYgA
	 jzD9WSUCDPpMDhZ1lRo+PyFSJoiOPp5QFD1RH3WEbInSutzQG1GJ0oVKaUx4f36AVj
	 QmGMcmi0M0nUjKI5SBVQEM7WI3Jvlw3Cbggi0fVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B84AEF80566;
	Mon,  5 Dec 2022 18:29:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 516B2F804C2; Mon,  5 Dec 2022 18:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A91F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 18:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A91F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egNrSPlA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C12C6125F;
 Mon,  5 Dec 2022 17:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E8AC433C1;
 Mon,  5 Dec 2022 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670261343;
 bh=9o+sSMrq9KvnPjqoO20e62XLRYjEsVjPF5T8c8sl2AI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=egNrSPlAOL93I5JG/09Vuxnvw/YqWVYDq/oPwabaIgp8v+aTD1IqwlYTLtPZMzne2
 Nz4Xg82e6fiCIDhnCRhW01AVV3+gFdLB6z6FmKanPng7yMX794lup0NKNGVpUWOjnG
 l4zB8nYBmiNSzui2ZaMkE93Uw2FPmhFIb9tDVMNw7DrQh7lmtJBvHrSdF3X0ZfCOtE
 Z7ou2C57xHlPaspol+EeeAqaH1huH46yIOH6E7VQPq3AwYp67Y0Oza6TdTnNX667WK
 Lim3mOueKiIrh1mzRIk6i5U92ROURHdrob/POMNcYROTlgCE5qeXnh6ziJSAaA9X6w
 +CvREZ0dKxe4g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Colin Ian King <colin.i.king@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20221202171450.1815346-1-colin.i.king@gmail.com>
References: <20221202171450.1815346-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: rt715: Make read-only arrays capture_reg_H
 and capture_reg_L static const
Message-Id: <167026134182.536379.4326237833077091583.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 17:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 2 Dec 2022 17:14:50 +0000, Colin Ian King wrote:
> Don't populate the read-only arrays capture_reg_H and capture_reg_L
> on the stack but instead make them static const. Also makes the
> object code a little smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715: Make read-only arrays capture_reg_H and capture_reg_L static const
      commit: b5d5051971b44c9952b62f261509cf837b9d21ba

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
