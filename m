Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4397596F6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FD91F6;
	Wed, 19 Jul 2023 15:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FD91F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689773673;
	bh=bRvmDa89F8tiiWEs4W8W25Rz7T9FiMmeQyv4PQo01ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TM8wZ2eC183XtGcmB6hgS6MCSNXou5m2/X3RbngvP7zSKZyrD3v8e27z7M9fdBr3T
	 Omt6D3Ui+j1W4C6TtMLqPTrRIDaJZ2I5+bUv02RX4eqsYEZT9rwF4iJ7NQI7OoZWtf
	 9ZpGpmJDUNRLUeOOtEFrqwk665N5x3hcTT6aJKOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36D19F80494; Wed, 19 Jul 2023 15:33:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B28A9F8032D;
	Wed, 19 Jul 2023 15:33:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C361F8047D; Wed, 19 Jul 2023 15:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58FF9F8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 15:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58FF9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z7UhaFJW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC7536167A;
	Wed, 19 Jul 2023 13:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D842FC433C7;
	Wed, 19 Jul 2023 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689773606;
	bh=bRvmDa89F8tiiWEs4W8W25Rz7T9FiMmeQyv4PQo01ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z7UhaFJWNJTQ+acILXK8LbHJN90m1mM0O9bfhS9NeWy89PpfAR3Pnltqiwx2ZDs7l
	 lK+BPRHAdj+yKqiOzwqL7cKu8W95UjpeiN894kf+pOZheHU230Wc9AUfjtzFLYT5XB
	 bM0nTz2xLjpnUulF5gYZ7Q6V0e8VmwhCLw37bkGpGNACHflzJ5TrPKiBDs1juOeJGm
	 Nkmknf/upBUWdvxQY71zO+VgyJogGm/YazfLE0htRxwEKw54GoeAdZl0qms9skEWCf
	 SakPebAR8hTqJuxAy9eArIuiTfDsYtlqmizJNwjSwGmWTl2YWscXTLiJuxhhm1US+g
	 v3NCj2ip75UYg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
Subject: Re: [PATCH 0/3] regmap: Add interface for checking if a register
 is cached
Message-Id: <168977360558.39760.4789872825823703528.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 14:33:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: HOLAMN43ETIASLLW4JC2YD7IJFN7QGVU
X-Message-ID-Hash: HOLAMN43ETIASLLW4JC2YD7IJFN7QGVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOLAMN43ETIASLLW4JC2YD7IJFN7QGVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 21:33:02 +0100, Mark Brown wrote:
> HDA has a use case for checking if a register is present in the cache
> which it awkwardly open codes with use of _cache_only() and a read,
> provide a direct API for this.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regmap: Let users check if a register is cached
      commit: 78908f45ccf1dc2f4d5fb395c460fdbbf7e9ac3a
[2/3] regmap: Provide test for regcache_reg_present()
      commit: d881ee5a872fd539a8c693e4c8656b9343c9aae0
[3/3] ALSA: hda: Use regcache_reg_cached() rather than open coding
      commit: 99aae70551f99536936438bbcfc562df69eeb79c

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

