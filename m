Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C616FAB7F8B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:01:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7AF620FD;
	Thu, 15 May 2025 09:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7AF620FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295356;
	bh=FWkVhd1e+rN1MkOzu4aHGcRnovRlUpyoL9e1RjZDZbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eEHgsiI4+U3fbt+lAnewbdmYEkN83Vr9sut31p9SHuOi4OCUTbqn4FnsHPcSIjtkk
	 nPfeL9icryc1LWkudHhNIeciYfkuXwrSUuPYohmVA2eydO9WMThWbEZfVtmZa4ASGh
	 6q8P/LNrCkeLll+CAHjEdcr3FlclB4S7ScOcgkl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16DC0F80542; Thu, 15 May 2025 09:35:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D415EF80542;
	Thu, 15 May 2025 09:35:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B74AF80185; Thu, 15 May 2025 09:35:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66D8CF80100
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 09:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D8CF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J8qWiIPT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A44EEA4C9DB;
	Thu, 15 May 2025 07:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD8AC4CEE7;
	Thu, 15 May 2025 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294521;
	bh=FWkVhd1e+rN1MkOzu4aHGcRnovRlUpyoL9e1RjZDZbg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J8qWiIPT+mHZPT7AQqadSn3+1bTsSwvYK+GOq65vtvFxh+8MH1YJi0Fg9oNJsCEKe
	 qLdtYtdBaREPQGp0jt/Bl8a7fx9Q5HamMw806/KxqOIDZwUeUTyM99WcRWNef/AL/7
	 XRTnFF4FOrQ+lwKpjxsUsD4uA1yJXST0UL1C5gbszowYVoNORFejwoAhWu36lrNukp
	 lu4ybryflzhexW2nBsWpleLr4gHHR30q0racZnMoEiyn826YPSAw6U3Ru9PYRROhCe
	 8nf4ujYfmUGpWs7Vqcn/+llkiGuG4x5cYDLqEnZqEr4sSFV0AMNhurm+sZBnSkEknY
	 ZWVxtD6W3/VoQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brady Norander <bradynorander@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250330130844.37870-2-bradynorander@gmail.com>
References: <20250330130844.37870-2-bradynorander@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: use new ACP dev names for DAI links
Message-Id: <174729451754.272498.3315820407847091647.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: LQAXJEGLKZUUYO2XQWZLHUYPQNIXNJZB
X-Message-ID-Hash: LQAXJEGLKZUUYO2XQWZLHUYPQNIXNJZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQAXJEGLKZUUYO2XQWZLHUYPQNIXNJZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Mar 2025 09:08:45 -0400, Brady Norander wrote:
> On AMD SoC platforms with an ACP2x gpu ip block (such as stoneyridge),
> the amdgpu driver will create several platform devices for the ACP ASoC
> driver to communicate with the ACP hardware block on the gpu. These
> platform devices include dma for audio and one or multiple i2s
> interfaces. The amdgpu driver has always created these platform devices
> with automatic ids. The ASoC machine drives hardcode the platform device
> name. This creates an issue where if the ACP platform devices are not
> the first to be created, the ids can be different to what the machine
> drivers expect, causing them to not find the ACP platform devices and
> failing to load. Switch to using static ids for these ACP platform
> devices so that the names never change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: use new ACP dev names for DAI links
      commit: 51590571433e32cacce10b11051c6ff056bf0aa8

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

