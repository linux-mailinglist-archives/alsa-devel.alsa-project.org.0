Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85079A974
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5E99F6;
	Mon, 11 Sep 2023 17:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5E99F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694444983;
	bh=FOXH5MCoM5x87hoLLPlH8q1Q55oeK6cK8lfaCRHbG5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvyjRL4B3I1iKWyOMLtFotL+SrPqyJDS7JMbjIP3SXD+enrNfxmg2jU/eVNaBRDcL
	 Ua43aJxEs5KMNvlxYRokcOwuWvldAe7jNS7b1uYb8B71OGmgVmUOm76+DpxT0YUDl/
	 fc9LmZodftAKzsYZQQgUKlE/2un6wZWX1xBoDknU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60384F8057B; Mon, 11 Sep 2023 17:08:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93431F8056F;
	Mon, 11 Sep 2023 17:08:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C052F80549; Mon, 11 Sep 2023 17:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FA0BF8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA0BF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nNNwkTW/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6749BCE13FD;
	Mon, 11 Sep 2023 15:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FF5C433C8;
	Mon, 11 Sep 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444866;
	bh=FOXH5MCoM5x87hoLLPlH8q1Q55oeK6cK8lfaCRHbG5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nNNwkTW/WwpOEqj2qzoKpW6dQhQ+ec1Qr21jX9ibYAuFOA3flQzcqA4Rg/dGlIQ9Y
	 pAca9OfB/71zRFpk4RO5LLRrIiCuw7OYIJzWtniE9aQnYfwxC6g5Kq/fXN+nNIh33p
	 0TPNFLMHGcRnlQEP8Kab70KZr9eMmFgTj3+bahtj+hYxdMppqW1BVMA4kFrt/DR4lX
	 e6A4DjvfaJGCS2WXnMhL5lO2FkBqfsMCIfyEVBhJFR6dVDcQClf7kHuFbWMUy9Ak02
	 gxYw1mFNaSxo/vXJr/W3Ac0XMYSXmN6vGNG+2dBBfIof6e4E1zQThvZ1VVOD6V8pe+
	 bDtoIRnNxYfsw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20230908085920.2906359-1-ckeepax@opensource.cirrus.com>
References: <20230908085920.2906359-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: Shrink stack frame for
 __soc_pcm_hw_params
Message-Id: <169444486240.1851820.14310534133265981509.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:07:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: U5Z3QUV3FFGIQ776WBFHJVBRT33CYNYY
X-Message-ID-Hash: U5Z3QUV3FFGIQ776WBFHJVBRT33CYNYY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5Z3QUV3FFGIQ776WBFHJVBRT33CYNYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Sep 2023 09:59:20 +0100, Charles Keepax wrote:
> Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
> added an additional local params in __soc_pcm_hw_params, for the CPU
> side of the DAI. The snd_pcm_hw_params struct is pretty large (604
> bytes) and keeping two local copies of it can make the stack frame
> really large.
> 
> It is worth noting the variables are in separate code blocks so for
> some optimisation levels in the compiler these will get automatically
> combined keeping the stack frame reasonable. But better to manually
> combine them to cover all cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
      commit: 396b907919e028d89bac912e49de014485deb8dc

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

