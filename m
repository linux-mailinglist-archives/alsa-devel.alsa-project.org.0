Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712D8178B0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0600C843;
	Mon, 18 Dec 2023 18:28:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0600C843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702920548;
	bh=BwWLjWBOPW4u2jx0dHRvkSUVQlMbXSzwnRbz6jImvxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F/Vun5FNXBY5NGlYCbkjsxZStAzTHHolvMUDh14WyW6Z9B1Dc+O4yeEacNfhbXHV1
	 7/+CqfHCnTIcsQVA1o1yqGqlsw2wOqgcE/+SJCVimB/17x27qEDrXFnAZG0p69Oplv
	 DAV66Cw/P498td2ifhrIb2XNH2ghW45ktA1D0KXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04D80F80571; Mon, 18 Dec 2023 18:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC72F80578;
	Mon, 18 Dec 2023 18:28:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CC7F80431; Mon, 18 Dec 2023 18:28:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CEEFF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 18:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CEEFF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oz6bp6e6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B6A561148;
	Mon, 18 Dec 2023 17:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57042C433C9;
	Mon, 18 Dec 2023 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702920498;
	bh=BwWLjWBOPW4u2jx0dHRvkSUVQlMbXSzwnRbz6jImvxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oz6bp6e6cpAfbiAQRa/VnRD/neVdCXOBwk/XYA3lqfFpgOsIQKJUwf2fn9L+jy9a7
	 wgCFqah8ZPjTAJqJA5gYpECYTYcw43eJM8CgyuLDO3jiA2v0mO0OiFRoeqi4xGuWL6
	 DbW0GuX1eD80F00M1QIsK2TXl+GyvFT7pa8LgxJS1r3DHOIJZRWiSuX/dDaizP+LcN
	 RCJTQ5P9GEZgYd7/TPcLyYKDlFXwn9JN4ztad67Hnrh1sdFps+8HT8cinVy2u6gryr
	 wl7ozIgL+e78/HV3krvtX04195kM8u0EQfXHpb9rE54xJ4lXyDifgXc3wAXTO6u/8H
	 Ga4oa2vKa3vSQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Gergo Koteles <soyer@irl.hu>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
In-Reply-To: 
 <98d4ee4e01e834af72a1a0bea6736facf43582e0.1702513517.git.soyer@irl.hu>
References: 
 <98d4ee4e01e834af72a1a0bea6736facf43582e0.1702513517.git.soyer@irl.hu>
Subject: Re: [PATCH] ASoC: tas2781: add support for FW version 0x0503
Message-Id: <170292049608.89121.12171534337983645112.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 17:28:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: BL22Z3X6LIH6VKKX44DM75C25HYQXZI6
X-Message-ID-Hash: BL22Z3X6LIH6VKKX44DM75C25HYQXZI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BL22Z3X6LIH6VKKX44DM75C25HYQXZI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 01:25:39 +0100, Gergo Koteles wrote:
> Layout of FW version 0x0503 is compatible with 0x0502.
> Already supported by TI's tas2781-linux-driver tree.
> https://git.ti.com/cgit/tas2781-linux-drivers/tas2781-linux-driver/
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: add support for FW version 0x0503
      commit: ee00330a5b78e2acf4b3aac32913da43e2c12a26

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

