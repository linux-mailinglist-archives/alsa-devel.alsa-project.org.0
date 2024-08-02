Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1AE9465F6
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 00:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C531E478F;
	Sat,  3 Aug 2024 00:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C531E478F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722638737;
	bh=+aSlO9zlo6n0Ul95qcd+80nMphawjWrVFENBLzlbUp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKX+Gobw2Ink+BeddKOviuFzmvB9wHcKQzjmGh8gUHJWf6MTmUTaFMHCUw/6XfOpK
	 vx3PTY6qOmKAgJTYp/1Ac3DVjssdyAkkoySwyXTxCU/vWMjDdmLdi7Jgi/9Oke4jXc
	 YulW1D9LP/taKEsrykLPPfV2/kXsNOK48t9z6uTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA796F805C9; Sat,  3 Aug 2024 00:45:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB3BCF805CA;
	Sat,  3 Aug 2024 00:45:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23306F8026A; Sat,  3 Aug 2024 00:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CEFCF8007E
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 00:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CEFCF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KxE7W0sk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11F89CE1BC5;
	Fri,  2 Aug 2024 22:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883FBC4AF0B;
	Fri,  2 Aug 2024 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722637342;
	bh=+aSlO9zlo6n0Ul95qcd+80nMphawjWrVFENBLzlbUp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KxE7W0skz/BBU8KT6UDXUpDEWMoZuGu8QiQoECEJt4HC058KAX25YAJznksxTuc4P
	 ECQSKcT8D7LOrjGhdikLG65x+72CAwPB8B+HSCvfaeNSb0bJt0RSLrA35szpYNdr6D
	 86gHlo6M/HjcbgpaB/me70pTGSW2fHNoBpzw5IF92CJSrw92NQ1+7llRgRD0SG/HjV
	 VC7g+CKHLJDeG80HLuF2KuyoOGO8Mqz9SzS04D0NuXfw5vB2lBq/OaknIoVf2G7bWs
	 UPlmrlI/I8qu8kKq4NW1aVMfFOlO1KNYQID/ru7eeru9Q2LEq/9VOuyz/Hoiqfj6ZY
	 lp0Hw5atzKU6A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: reshuffle and optimize structures
Message-Id: <172263734128.144413.3497995259829988964.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 23:22:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: P662VBYOVJF7BZ64EZ73PZP7H3FNPOFO
X-Message-ID-Hash: P662VBYOVJF7BZ64EZ73PZP7H3FNPOFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P662VBYOVJF7BZ64EZ73PZP7H3FNPOFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Aug 2024 14:46:05 +0200, Pierre-Louis Bossart wrote:
> pahole reports a number of sub-optimal structure definitions with
> holes and cache-line alignment problems, this patchset optimizes a
> couple of structure frequently used.
> 
> No functionality change, only re-ordering of structure members.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
>   ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
>   ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
>   ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
      commit: cac88e96ba0961921b8068326579b26094f37ba4
[2/4] ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
      commit: e9e7eeaf199c7961d634235dbedeb7b682b1dd32
[3/4] ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
      commit: 5a4413d0fa8d0a438246acaf81637d71aab1b6a0
[4/4] ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
      commit: 5821d7b4981f4915ab353f538be38defe9656f81

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

