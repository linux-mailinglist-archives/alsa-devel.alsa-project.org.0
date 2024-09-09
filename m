Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD481972416
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 23:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D911EB;
	Mon,  9 Sep 2024 23:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D911EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725915749;
	bh=gxpWwUlAxibrNDTItu3pZrMMyq790BK/xTGjxMPNjSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoE3S6sDxEeWBl6yPnGjnySyYBzt9ZjEwujWdI67sMjVxR9ijQXVAHT8Q1oddperg
	 VbCeN9cGLfoPOp6JW6Np8+WMATVEqy0GC7gSHo1Q713Z+KKw2pacCiUEmNBlKjqCzo
	 kX6tRuuVuhqaupXRFr1Ya5f67473h7fxbns4KPiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26BD4F805B2; Mon,  9 Sep 2024 23:01:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AD3EF805B2;
	Mon,  9 Sep 2024 23:01:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6D12F801F5; Mon,  9 Sep 2024 23:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB238F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 23:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB238F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nPMy7l+L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7FF35C0617;
	Mon,  9 Sep 2024 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FFC4CEC6;
	Mon,  9 Sep 2024 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915708;
	bh=gxpWwUlAxibrNDTItu3pZrMMyq790BK/xTGjxMPNjSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nPMy7l+L6WYCWGVQKxQKHLjLqXT8/BCh/FuCF2mBHpNHTRnaxu5seKmImEg2ziE70
	 dJV4Xby/qBTMkF8Iwr12lhphfLorktn7JBo2m35SNnopkQbvQ9cm253Xw2DagDvwG+
	 KsTFR99gH1yCrD/YV1WNJl/2M8bGjyWg1yx0Z0ysTBqp5pknfK5i54kXnQkn/EYuub
	 8qlwc4xEt08vHUvoiW4A7AmZhGj0fhKe3iC/k26cGSUxUUFJXVgkAjwZSPiasqS389
	 aI6MW3Q0wZk7kV9uAPazZRAFzEUE6IvMFG641gxJFUHXhgaGbyQbEtslvArKthbKtu
	 lSMX6b1cChiKQ==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240909083530.14695-1-andrei.simion@microchip.com>
References: <20240909083530.14695-1-andrei.simion@microchip.com>
Subject: Re: (subset) [PATCH 0/2] Adjust Stream Name and DT Bindings
 Updates
Message-Id: <172591570513.136248.18212360068719293673.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: WFFMAFLWP5CEWMRN4SQFQ5DQ4QBDWVJU
X-Message-ID-Hash: WFFMAFLWP5CEWMRN4SQFQ5DQ4QBDWVJU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFFMAFLWP5CEWMRN4SQFQ5DQ4QBDWVJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Sep 2024 11:35:28 +0300, Andrei Simion wrote:
> This patch set proposes the following changes to improve the flexibility
> and configurability of the mchp-i2s-mcc driver by allowing the interface
> name to be set through the device tree and by introducing a new property to
> better manage multiple interfaces.
> 
> Codrin Ciubotariu (2):
>   ASoC: atmel: mchp-i2s-mcc: Remove interface name from stream_name
>   ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add 'sound-name-prefix'
>     property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: atmel: mchp-i2s-mcc: Remove interface name from stream_name
      commit: b09c71f3e8413ac0a9749f9d0d06f6f0d0b2cc65

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

