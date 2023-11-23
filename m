Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 842227F5C7E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:37:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF58DEF;
	Thu, 23 Nov 2023 11:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF58DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700735873;
	bh=4dmsnW8n/XjV2pWjQ3e6EAynUS9oshGR0xvSmcM0C2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WfoOmDHx8FNFOg45+BUKB7KXtormw6n4BdPe1jtZZ5wZY9BVLvhJjTxVAQoUQf+/7
	 aiWQIuQt9B6OyZkWbgI+gXcdmJRyG4PAdTU+kZXAgNSn0o8GRcEHoVutUilcNMb1H9
	 ehXqwsLX1jkW6Zr/ySpP1+zU9mk8Ym2IrUb2JVYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7780BF805AC; Thu, 23 Nov 2023 11:37:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 240B1F80093;
	Thu, 23 Nov 2023 11:37:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 328FEF80310; Thu, 23 Nov 2023 11:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33A0CF80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A0CF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AT6RS1h9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2EF261E43;
	Thu, 23 Nov 2023 10:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD88CC433C7;
	Thu, 23 Nov 2023 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735818;
	bh=4dmsnW8n/XjV2pWjQ3e6EAynUS9oshGR0xvSmcM0C2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AT6RS1h9x1xwa7aCxBWu2wxOkjWIPYoMsQEtiKU2zn0vTg/1g1A1r9ImGI8DTQnBc
	 WFoiB6qavyFyiO7sfDNQQBngL86AVI94usw2kQL1Vz0G8Ngw+JEHVYfsLKY0KDy/aC
	 tei5DSbVuFm6RCvZPT2tGmaa6aAxw6yBy3CaNe2epFet+cxfFhBUxN7Ozo9aro7H22
	 hI0HIo0yjZNXv0FokHFApBnRMqLd0mkLAu/EtLLbBKiXPCm8HnmWAeP6JdiU7iUjpw
	 CcimKNW5DS5QYt4uXnWok/6g//ymn35UM2NCnlqa14nvqUvI+7pihbAM1J9j/fJqOT
	 MF6LoXQv5oH/A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 yuhsuan@google.com
In-Reply-To: <20231122100123.2831753-1-shumingf@realtek.com>
References: <20231122100123.2831753-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5650: add mutex to avoid the jack detection
 failure
Message-Id: <170073581557.2204618.12375091602746452027.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:36:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JKTV7YFEN4GAROIJ3L42ZK3M4VVTGMXV
X-Message-ID-Hash: JKTV7YFEN4GAROIJ3L42ZK3M4VVTGMXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKTV7YFEN4GAROIJ3L42ZK3M4VVTGMXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Nov 2023 18:01:23 +0800, shumingf@realtek.com wrote:
> This patch adds the jd_mutex to protect the jack detection control flow.
> And only the headset type could check the button status.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5650: add mutex to avoid the jack detection failure
      commit: cdba4301adda7c60a2064bf808e48fccd352aaa9

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

