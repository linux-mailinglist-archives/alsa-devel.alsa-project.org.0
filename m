Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62BF9AD351
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 19:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FC0AE64;
	Wed, 23 Oct 2024 19:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FC0AE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729705918;
	bh=8r/O1HmDTz+nPdfGKkbI7nNeijD5lk5Okl3fAADNg7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=umZMhYmomvkgPNmcXPrzrCfmSHLn5IOodavmxzz4I5WpMLxckRh1B8kNj93SsT1fk
	 gF/kF2sj/wPZFIQO+Q6dOCeeaKDVynKfYZWCLViEc1er04r4ybbckKmIvGWXfIpeJZ
	 ArWxp8bUrhOyHoTkMCWMayTtQ+c8fKzPLgxla2NI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D671CF805E6; Wed, 23 Oct 2024 19:51:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7DFF805E0;
	Wed, 23 Oct 2024 19:51:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E49F8016C; Wed, 23 Oct 2024 19:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94755F80104
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 19:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94755F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UPDMKBDT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E74BAA439D7;
	Wed, 23 Oct 2024 17:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A8BC4CEC7;
	Wed, 23 Oct 2024 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729705863;
	bh=8r/O1HmDTz+nPdfGKkbI7nNeijD5lk5Okl3fAADNg7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UPDMKBDTmTZyrAzga12Q8QXzpN6C1a4nYr8ZdYN7kqarC86rMbRIg/CBvqQBp7Zqg
	 5O+gQ/vB2IkthkfkNigQ1e6lrMM+gmztyW9odzVxp3Nacifcsmb6/6oBowypp+OXPH
	 FoTvmJD8kR6X3QICFfwnWcMDP7fabn/2ln+PG4R+6OVdJebnnaC3peV5vzQiJnaKQN
	 ZnX33WYHIJlL+bxNHxsFye5+my8JUMqsiOSyDwUlFT3VDG6GKbYCwti91UgC13u3X+
	 F24pEObNggXSdpcww/fLDmmMn4KjxN2Y7gfoTZNjE8BbzphV34wZkezKW/QS4ZG+rp
	 PyUYBBrBlPxyg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 00/13] ASoC: remove dpcm_xxx flags
Message-Id: <172970586286.110994.11698115661977770053.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 18:51:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: 4EIG4QFEHLHYJPMCPNKL2CFWZBWWMLD6
X-Message-ID-Hash: 4EIG4QFEHLHYJPMCPNKL2CFWZBWWMLD6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EIG4QFEHLHYJPMCPNKL2CFWZBWWMLD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 20 Oct 2024 23:58:13 +0000, Kuninori Morimoto wrote:
> I got kernel-test report that v4 had compile warning.
> This is v5 patch-set
> 
> Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
> and thus we can use playback/capture_only flags instead too for DPCM,
> which is same as non-DPCM.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: amd: remove dpcm_xxx flags
        commit: 12c61265e5b687b155d08e052c2b6d78eaee4849
[02/13] ASoC: fsl: remove dpcm_xxx flags
        commit: efa527f984a110944d9640b81ff94d0a5401b3fb
[03/13] ASoC: sof: remove dpcm_xxx flags
        commit: 90bbbf612f9e5e4548b27b213b1866b4feb670bd
[04/13] ASoC: intel: remove dpcm_xxx flags
        commit: d26aed5eba16bf5a4aa86bc717edf0b5ed192b93
[05/13] ASoC: samsung: remove dpcm_xxx flags
        commit: fa9c4b46fb76e2cb36bd8f94a096e61ebdb8b7f9
[06/13] ASoC: mediatek: remove dpcm_xxx flags
        commit: ec15e5043d0bedcb93a2653725fb50d5b358b06b
[07/13] ASoC: soc-core: remove dpcm_xxx flags
        commit: b6b8caf6470b9793ae4b66a95c742a1c97ece748
[08/13] ASoC: soc-compress: remove dpcm_xxx flags
        commit: 0f77c88f0e3a3945c328bbb9a9e3c4b5826e8fe0
[09/13] ASoC: soc-topology: remove dpcm_xxx flags
        commit: 44b6f24018317f6096007d9d397e6f3dfb0131ae
[10/13] ASoC: intel: boards: remove dpcm_xxx flags
        commit: ae0967da4bbfadc7156ba1deeb16fb31495ea359
[11/13] ASoC: soc-pcm: remove dpcm_xxx flags
        commit: c7ae6551533e7c7bf903a2d259044778f4b103ce
[12/13] ASoC: doc: remove dpcm_xxx flags
        commit: 0e3dc8e4bd4a739401ada1541452fe1499254680
[13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation check
        commit: a6ff8572fd3fafe3f0f39e94ad8d4b6c88de7e03

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

