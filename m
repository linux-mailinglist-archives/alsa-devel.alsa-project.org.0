Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F82C7CCF1
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Nov 2025 11:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9AD560177;
	Sat, 22 Nov 2025 11:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9AD560177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763809013;
	bh=HZ8SGt5LpiDkeDZ5QijPEVOSKtKXHqPpxLl4Uc4UGAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BbiBCgZkRfJahRuCdzjitagW/ghGR+rORhaD+Y5D7Bw7MASqpnZ8EXsnLyTTLb3fV
	 SfuBAcwCCA26ZtSURYo1DYtYUOSk5usa3fDTZJ9Ib6UI6hNIvt7wea7XR03OZ0r1Z+
	 Ony88TWHJveJbsW28Tonnb2Uti5zaFEu3mAtNKCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8436DF805C6; Sat, 22 Nov 2025 11:56:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 217DCF805C4;
	Sat, 22 Nov 2025 11:56:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 900EDF80254; Sat, 22 Nov 2025 11:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0BE0F801F7
	for <alsa-devel@alsa-project.org>; Sat, 22 Nov 2025 11:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0BE0F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bKJs7hoQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2DE16013B;
	Sat, 22 Nov 2025 10:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0A9C4CEF5;
	Sat, 22 Nov 2025 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763808948;
	bh=HZ8SGt5LpiDkeDZ5QijPEVOSKtKXHqPpxLl4Uc4UGAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKJs7hoQS5m+r84Y+XABoTGy2qFyJgiWiRUlDYERtz93ayMAZGly7zY9Nh5/6p6Rs
	 ojYO+7pRD1vmZlFkl8RF6dJJUZusYpzfwumZDu3Z+aO1pBf26bJj0NRMbr3MehU/fY
	 l5NhAKBb7mcbln0d255n2kB8e04quWaz0qFWzjViTdfPU5FAFBSeU9cKgrW+IAlD8/
	 oaVl5uYCe6q/+vUt78Za7uTgwEGNAaAxPlNedDFjCdbnvCqx6p1NwazLcL1FtDQvJQ
	 YN0H+BT4kAdOndM2W+dBr5B9z8PTkpktel9GIkhiNEebhHItN7I3TXE6JWMHBsAZuP
	 dCmfKPNkgyskw==
Date: Sat, 22 Nov 2025 11:55:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v7 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Message-ID: <20251122-prudent-ancient-puffin-63f54c@kuoka>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
 <20251121084112.743518-2-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121084112.743518-2-oder_chiou@realtek.com>
Message-ID-Hash: NGQS754GBOETJSG4GTSJMWXHQCJMKENH
X-Message-ID-Hash: NGQS754GBOETJSG4GTSJMWXHQCJMKENH
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGQS754GBOETJSG4GTSJMWXHQCJMKENH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Nov 21, 2025 at 04:41:12PM +0800, Oder Chiou wrote:
> Realtek ALC5575 is a highly advanced DSP and microphone CODEC that has
> been designed for AI audio technology. Its impressive features include
> an advanced HiFi-5 DSP core, a Neural Network Processing Unit (NPU)
> owned by Realtek, and embedded 4MB memory, which enables it to operate
> highly advanced AI audio algorithms. The ALC5575 supports 4xA-mic input
> and 8xD-mic input, as well as a rich set of interfaces such as I2S, I2C,
> SPI, and UART.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---

You still did not respond to my comments from v5. You did not
implemented some of them and I already asked for improvements.

I will not review this and I mark it as changes requested in patchwork.

Best regards,
Krzysztof

