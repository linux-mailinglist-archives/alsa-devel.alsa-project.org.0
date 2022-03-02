Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B14CAB12
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:03:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9411D1F58;
	Wed,  2 Mar 2022 18:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9411D1F58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240583;
	bh=MfDFBAyKZO8R+BnzZBCZPZLZ/sz34eRmK3kYoi78u3o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJsipWaHjdMZXCC5v9QCj4eR1bf031tES2J3bi45i/ispPklKx3Vk+4dtipLoRd9G
	 rzewwloYOGC2lfmH+6tq1qXpcdcEG5wPJGnX4389W4X5109/cOsHbrb1Mqa+NjIbU9
	 UoQCzMDHiGuNY/vXKXxTSo3aHE5oCOKtmT3ofI/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC328F80518;
	Wed,  2 Mar 2022 18:01:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 269E2F80519; Wed,  2 Mar 2022 18:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94976F80508
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94976F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BJEjh3bL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4638761920;
 Wed,  2 Mar 2022 17:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48857C004E1;
 Wed,  2 Mar 2022 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240458;
 bh=MfDFBAyKZO8R+BnzZBCZPZLZ/sz34eRmK3kYoi78u3o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BJEjh3bLaS0dc3swhCdMxhIdLYODlOvGEs+1zBqVQ66qi9Mm/2WTNmeQzSPNrhFSr
 AeTlcYCPQ8RNTiSosUZC1IMQo7OmBGx1kF/tsPql49/54EDMrqy8wvsUcsZetY6GWV
 J9e+NqS0KMk7Ay52HsWjIISnnET1ESiSUNKdt8FExVSTcDoZCEQ1Un0qiYMgTZXSYn
 JqDrP34bw5nqSR15kdNT3WwShZHLPjTWBQ71RAtiuvBNWKravnJ5jTPYWdikHuHlFI
 emsY10enmP7yUxRTuyEwsr8D3EKoiJOVUw6I3zRGgy6iOd7O78o2Pe5tntsg0E9v/9
 JcdklurEh2jOg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, vkoul@kernel.org
In-Reply-To: <1634285633-529368-1-git-send-email-jiasheng@iscas.ac.cn>
References: <1634285633-529368-1-git-send-email-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: soc-compress: prevent the potentially use of
 null pointer
Message-Id: <164624045702.1145067.14385834637074739247.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:57 +0000
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

On Fri, 15 Oct 2021 08:13:53 +0000, Jiasheng Jiang wrote:
> There is one call trace that snd_soc_register_card()
> ->snd_soc_bind_card()->soc_init_pcm_runtime()
> ->snd_soc_dai_compress_new()->snd_soc_new_compress().
> In the trace the 'codec_dai' transfers from card->dai_link,
> and we can see from the snd_soc_add_pcm_runtime() in
> snd_soc_bind_card() that, if value of card->dai_link->num_codecs
> is 0, then 'codec_dai' could be null pointer caused
> by index out of bound in 'asoc_rtd_to_codec(rtd, 0)'.
> And snd_soc_register_card() is called by various platforms.
> Therefore, it is better to add the check in the case of misusing.
> And because 'cpu_dai' has already checked in soc_init_pcm_runtime(),
> there is no need to check again.
> Adding the check as follow, then if 'codec_dai' is null,
> snd_soc_new_compress() will not pass through the check
> 'if (playback + capture != 1)', avoiding the leftover use of
> 'codec_dai'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: prevent the potentially use of null pointer
      commit: de2c6f98817fa5decb9b7d3b3a8a3ab864c10588

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
