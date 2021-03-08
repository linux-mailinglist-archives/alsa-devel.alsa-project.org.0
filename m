Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF233130B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14CEA1760;
	Mon,  8 Mar 2021 17:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14CEA1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219907;
	bh=JV7A9FCjhMwuMmlXCfqQxddIGS3wPZPZjwAOeGbs15c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGj2LK7gSkVAgAdGcGjuTxUQJbbobsS2VlR9gkZJpC6ELguMRKBEnt0+1qbz6L58j
	 4cxkATOEfzkiRBm+uFAUmN9MPbs8LT6RCXXtgAcEfkTpDVtyAlj+GG4n9zL7bHBYQ1
	 BUMfxizr/5rw0s58/7DTCRXwEwWTdNZ05L0I5sF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F3FF80139;
	Mon,  8 Mar 2021 17:08:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE9BEF804AB; Mon,  8 Mar 2021 17:08:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17926F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17926F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FKYEhmyF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8858A65224;
 Mon,  8 Mar 2021 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219713;
 bh=JV7A9FCjhMwuMmlXCfqQxddIGS3wPZPZjwAOeGbs15c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FKYEhmyFIhBnWq40vKwL8LkMzD7lhL06vlE+F4doSaAHlbKFgmbnOTwZw42eJgMNr
 LI5++EEs/xtrn/Xa3NGw6SJlaysLL/ivJbLtGtTRZQCQGCdtc4RYJS4cuLXxgQ+048
 3DObcknD4u57IocmCMDNuS6gYMMWckk+aCBDn3t4QQG0paiybjuvO4FyQEsvAJRcRU
 57RQWzPhQZtwDfG795/26r3Aj/fBE/FMNRBipVjpHzwiJDbvDK/Xjl41CVKpkAVaNg
 opDZxNG2+8oSRQjGWMs13tmMIFHdTF1TJbxc1PYBtB8NQUdHIhaB6irnVw92N8CHvU
 Qk2JSAxZ1Oimw==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20210304215646.17956-1-jonathan@marek.ca>
References: <20210304215646.17956-1-jonathan@marek.ca>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active
 decimators
Message-Id: <161521960848.9621.4204009948012215992.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:QCOM AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Thu, 4 Mar 2021 16:56:46 -0500, Jonathan Marek wrote:
> An interface can have multiple decimators enabled, so loop over all active
> decimators. Otherwise only one channel will be unmuted, and other channels
> will be zero. This fixes recording from dual DMIC as a single two channel
> stream.
> 
> Also remove the now unused "active_decimator" field.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: mute/unmute all active decimators
      commit: adda199c1ea2bfb02e73829e6f1d374075958c1f

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
