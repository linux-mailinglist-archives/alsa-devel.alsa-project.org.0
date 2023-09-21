Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B37A9A7C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 20:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213FEA4B;
	Thu, 21 Sep 2023 20:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213FEA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695321680;
	bh=Wr2cv8QCwxAryDvxcwX4UC8nEWWMWGBn+9Iohg5X4X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bE0d2WzxvjfMjXMPruv669OMmVsnnMeCkZZ/0PUMibsM1a07/IPewDg+oRY2V2XbX
	 3+Xj9XhX90+ZfTm6NYRnDmTU6A4nzY9Jue96xHQEMR1rzAMaOO+jmVPWppyBgchtDC
	 yWxJBHYeZJqCpVY2hBIVZbAkbdnIl2Gbft6wc/a4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B2DBF8047D; Thu, 21 Sep 2023 20:40:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D755F801F5;
	Thu, 21 Sep 2023 20:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBEE4F8025A; Thu, 21 Sep 2023 20:40:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56F45F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 20:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F45F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fRaqzNRC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 163B66200E;
	Thu, 21 Sep 2023 18:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30966C433CB;
	Thu, 21 Sep 2023 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695321616;
	bh=Wr2cv8QCwxAryDvxcwX4UC8nEWWMWGBn+9Iohg5X4X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fRaqzNRC6y8wuOy/xNgzt3w7HwUN/UHBiSiN3EaCUd6gomEl6oRQ0PDNLMQttdA2v
	 LuOCU6o7NQ4uxrjr/hfoYYevkLOLGYMjk9BzzP6AIihHBqt8SmqwAYsDevyhfED+P/
	 iiPkxqqqbLtebgWenOzpi+tzHZjE+ZMQohN1bJYw6eYj4ZykkijbDpvWXXWVfCw/rj
	 +iMefCNoEKulywlB2m7JuP0J6W7GiquwVfaOqdWMcF3jeNODBbQh3YGersXOpqxEcy
	 wGDGDLxXB3/wU9qbHJgBBkVoPhpYAu0v8w8tnAoVDmf0TGJXTjS10J/OAcELrIliuw
	 7Mc1/MusSyiVw==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cy_huang@richtek.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1695181834-5809-1-git-send-email-cy_huang@richtek.com>
References: <1695181834-5809-1-git-send-email-cy_huang@richtek.com>
Subject: Re: [PATCH v3 0/2] ASoC: Add rtq9128 audio amplifier
Message-Id: <169532161380.157918.6015807992333109867.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 19:40:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: M4EJDTHQ57YC4IOISMTOJA24UNX7UNE6
X-Message-ID-Hash: M4EJDTHQ57YC4IOISMTOJA24UNX7UNE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4EJDTHQ57YC4IOISMTOJA24UNX7UNE6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 11:50:32 +0800, cy_huang@richtek.com wrote:
> This patch series adds Richtek rtq9128 automotive audio amplifier
> support. It can deliver up to 4x75W into 4Ohm speaker from a 25V
> supply in automotive applications.
> 
> Change log
> v3
> - Add Reviewed-by tag for dt binding patch
> - Refine the source code by reviewer's comments
>   detail changes listed in the patch
> - Add DVDD undervoltage threshold selection from HW guy's suggestion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add Richtek rtq9128 audio amplifier
      commit: 0339eadb871ab1ebf249932fecb75ab13cc3c565
[2/2] ASoC: codecs: Add Richtek rtq9128 audio amplifier support
      commit: 736064c64cf3fc51c6090884a9f4efe047f9f616

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

