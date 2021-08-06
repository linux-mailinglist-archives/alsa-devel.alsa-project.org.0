Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5C3E204A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:50:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170FD1734;
	Fri,  6 Aug 2021 02:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170FD1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211052;
	bh=PuoSKwWba2q14kCvF9wgMs3wQm2RFCkMqbxGrxeuKhY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rERrusfqca0S2KXdt2YunT5InPuMC+QymwrSSeYpfTBavoggSDULPYtMpQnLKnnsE
	 QSJn6mWLw9rwf6eb1NKTycBFyjHX8T7ThGWCWCXoYIEHy84lCPrOpSIGYE3oCAfa/n
	 fTCMXRGI/9G7rTXejHvQbOqOmn+bdEqKXUiLCDbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E361AF804E2;
	Fri,  6 Aug 2021 02:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7039F8014D; Fri,  6 Aug 2021 02:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1014F8014D
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1014F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aacwzecV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87414611AD;
 Fri,  6 Aug 2021 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210908;
 bh=PuoSKwWba2q14kCvF9wgMs3wQm2RFCkMqbxGrxeuKhY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aacwzecVK0YMaeWouE8Iu/QjKz28Y3aSWQVt31Xar6EEaZdqpCGvUkvonYnLMSLFI
 nvSHouKPpW9VimrmUHioHUFMXCCIhSiLzyhIQYZTOayL4TkexDmHyNvBPaVVWwtSxT
 5Qvin2jrmrXLe9l9XMaK19p3/h8+yqKQkyy3puKuJI8VLqoxP+wGjYh7qfjRTsw/oc
 yPrGv/yTjkdDCMzOTJPTUMPgj7u/b7I+3a+uOkN57dlH28UlIEIzixLVcchio7aO1d
 S2PIJT+FASr4hy4BHpM7jt58C1sfvswKMxmQ4EilnnndyL2NF1BwP3dSTtyUeZ6Bug
 ZptJSOJua+uoQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/12] ASoC: soc-dapm: cleanup cppcheck warning
Date: Fri,  6 Aug 2021 01:47:50 +0100
Message-Id: <162821054282.18754.6194915205697835599.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87zgtwu25w.wl-kuninori.morimoto.gx@renesas.com>
References: <87zgtwu25w.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 05 Aug 2021 10:10:35 +0900, Kuninori Morimoto wrote:
> Now I'm posting audio-graph-card2 patch-set, but it seems it needs longer
> discussion. Thus I want to post more easy patch first, and reduce my
> local patches.
> 
> These are cppcheck warning cleanup patches for soc-dapm.
> 
> Kuninori Morimoto (12):
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_wcache_lookup()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_connect_mux()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_set_mixer_path_status()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_pga()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_dai_link()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_check_event()
>   ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_run()
>   ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_del_route()
>   ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_add_routes()
>   ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_weak_routes()
>   ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_new_controls()
>   ASoC: soc-dapm: cleanup cppcheck warning at soc_dapm_dai_stream_event()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_wcache_lookup()
        commit: 7453d6d45d5587d3d4d4fdaec746db74ac5f7429
[02/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_connect_mux()
        commit: af6b57ab7fdd88e1b251376ee92fd335abd2241e
[03/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_set_mixer_path_status()
        commit: 29155bba18182daf46e0c4c784a2344d44ef082a
[04/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_pga()
        commit: a16cfb1bee80e3a3f7cab59a58580258b6d1efcf
[05/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_new_dai_link()
        commit: 5c52e48fb1c2ae68b997d81a781ce0104dbbb91a
[06/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_check_event()
        commit: 65f7316d18f2b447931eef00c04253859bdbe142
[07/12] ASoC: soc-dapm: cleanup cppcheck warning at dapm_seq_run()
        commit: a71657947d74fbc9e0184079f9e1941d70ccb52c
[08/12] ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_del_route()
        commit: fd5ad2346148373890b4e7e7e0b1d7b208772a68
[09/12] ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_add_routes()
        commit: fcb3f196f808f2d53d3a8f0a728ffd61f9d44e11
[10/12] ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_weak_routes()
        commit: fd136fdbf4a66add171eb0cedf40f430bda9c139
[11/12] ASoC: soc-dapm: cleanup cppcheck warning at snd_soc_dapm_new_controls()
        commit: 3dc72e4251d7ccd90517433b84f133d4a18179c3
[12/12] ASoC: soc-dapm: cleanup cppcheck warning at soc_dapm_dai_stream_event()
        commit: f2ff5fbe343d08e880fb1d10dbbdc335a3ceca4b

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
