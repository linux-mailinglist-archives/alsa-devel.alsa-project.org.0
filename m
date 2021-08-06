Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD73E2045
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB3ED1732;
	Fri,  6 Aug 2021 02:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB3ED1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211017;
	bh=XCKCjF9rtbkSXxfMIlWo2vEd1fgxQl2IfyYBjvxa+hI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBJLI8oLuc7pBTvwY//fw1jo/k1nDETUw6SYuhbL6ijIfoh+qnxdTSNR/gQASgMG0
	 pIU5HTu4uFJm7R8k2jmx09amIA1V3CXh1AE3q29A0FjH1+ZDV/KDdeD74JSqYzLJGz
	 3WkWyZtFF7UWmpok+OrgSko7CWiPZKYT5psqcBr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 020FDF804AC;
	Fri,  6 Aug 2021 02:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D009FF8014D; Fri,  6 Aug 2021 02:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BC61F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BC61F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FPIx9KWH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D492E61179;
 Fri,  6 Aug 2021 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210905;
 bh=XCKCjF9rtbkSXxfMIlWo2vEd1fgxQl2IfyYBjvxa+hI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FPIx9KWHxyQ0k/Peet1kxIcywpTFGpHpIV515+nYyAD0Kqvt3ynOafhk6gcYR6E5n
 nmrG80vYOvyXuyzhR141OV9ryDGDEwLP39QfZk1rbI5yGDcTbRCPHmJtKgZOuarVA0
 9Deq/0fUPzN3b002dkawayfW4384ju7DpErkWzh8CQGtLvwF7jNO1md2q1aRKCQ9CS
 TR71FkLNuY8mogaJwNuIfOb/a5zuD57cOY69kSGEHtt2Uvxxk24YrqNERjIEsyFCpc
 +5TYikblKmXSohpJgNsAJLFDEorXDyjGv8997VyvqrHoKdguDElzmaeYQ9nNLH1mZE
 GgS5K9cccWuuA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Osipenko <digetx@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1] ASoC: rt5640: Silence warning message about missing
 interrupt
Date: Fri,  6 Aug 2021 01:47:49 +0100
Message-Id: <162821054282.18754.14831223964648226804.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802185258.1881-1-digetx@gmail.com>
References: <20210802185258.1881-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Mon, 2 Aug 2021 21:52:58 +0300, Dmitry Osipenko wrote:
> Interrupt is optional for the RT5640 codec. Nexus 7 doesn't use interrupt,
> this results in a noisy warning message that looks like a error condition.
> Make interrupt explicitly optional to silence the message, use modern
> IRQF_NO_AUTOEN flag and correct the reg[q]uest typo in the message.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Silence warning message about missing interrupt
      commit: 585fb31c2c3aad38a5add009171d7e3277b76d45

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
