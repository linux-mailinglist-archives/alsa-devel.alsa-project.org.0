Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE87335C9
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 18:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838F8843;
	Fri, 16 Jun 2023 18:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838F8843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686932332;
	bh=A9dVxzPM4+M/LW7dRokXamx4CMKnxAHX0prWOssGKe8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nniLA8IpmKq7GG5I7cHABEahBoLPkQz01ylYp5gZFbp2lCimGhlIcgfUU7UBonOcK
	 BNab6aXIK1lPsq2+Hlh0fIZ1D+9Ueqh7sFrsyb30aY/DZoFe5A0DHoPuxSiJhxfUva
	 G+GlNGm2QQBV2kWd5QJ5fUW95T8r3xujVjAWMyEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868DAF8055B; Fri, 16 Jun 2023 18:17:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FFDF80551;
	Fri, 16 Jun 2023 18:17:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6AD4F80246; Fri, 16 Jun 2023 18:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73F71F80149
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 18:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F71F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eUdJTbVW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4377363B4E;
	Fri, 16 Jun 2023 16:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D71C433C8;
	Fri, 16 Jun 2023 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686932222;
	bh=A9dVxzPM4+M/LW7dRokXamx4CMKnxAHX0prWOssGKe8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eUdJTbVWTJLBumVi1LLoxtOd7p+BeND7e5aQ3hlkbMUUcYMWTdYdq0rKAzvRf7ctJ
	 38LFfRh4Q7t/KWnT9vEfhg8YrGs9Ac0xD6DjaqFcrnYarR9Oo35IDNohoF1qKZVm4C
	 13TZ35bYOpKL65CxW3QIhv3cPFQqszNBiBMOLYg3fI7yxdW2K3iO9JWu30z4/Eby6c
	 RSvRpiiaCYAgZBhRikALAviHI6bNtiGvlj5f6V2aWEIGjck2B8SyGzGMA4xYfVML5b
	 pQQx5yDe6RAti+XfSrEBfytDfAYJLXDUN5s1lLObdgWzmv7RcmdPWk9AxkZIHkEn8i
	 x/QNTUcTloJcA==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20230616115549.1011903-1-juerg.haefliger@canonical.com>
References: <20230616115549.1011903-1-juerg.haefliger@canonical.com>
Subject: Re: [PATCH] ASoC: rt5677: Add MODULE_FIRMWARE macro
Message-Id: <168693222059.298269.16346280609105415774.b4-ty@kernel.org>
Date: Fri, 16 Jun 2023 17:17:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: AI3B5E2KAL4WTIIJHEPCKVTS5PW5R7M3
X-Message-ID-Hash: AI3B5E2KAL4WTIIJHEPCKVTS5PW5R7M3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AI3B5E2KAL4WTIIJHEPCKVTS5PW5R7M3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Jun 2023 13:55:49 +0200, Juerg Haefliger wrote:
> The module loads firmware so add a MODULE_FIRMWARE macro to provide that
> information via modinfo.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5677: Add MODULE_FIRMWARE macro
      commit: 0f9c14e57818d077ceca060b8a0d0ee5ed3abd95

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

