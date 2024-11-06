Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78619BEF8F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 14:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9B110BE;
	Wed,  6 Nov 2024 14:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9B110BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730901365;
	bh=AVIvph9mJZGEATPf56rqGStyyTSb/L8LohsnTsrbixQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qDlzkt3dWNhqCuo0J7vhME2lOQOskU3oFM27QW4npJZ53qEmSXfwhLjCXWB1MECPH
	 kGvsCiYE4W/rDY8FrH5HDnDJcGCmOCac7Mi2bFA3/Q4O8X90EzDpKyngrMSSs4lddY
	 LkmDn9urEBs9tijogB3xxn13e4vYLrsgSJljK5P0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 579E0F8059F; Wed,  6 Nov 2024 14:55:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D96D4F805AA;
	Wed,  6 Nov 2024 14:55:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3C86F8013D; Wed,  6 Nov 2024 14:55:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7B4BF800C8
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 14:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B4BF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SFG0OwY2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61960A43D24;
	Wed,  6 Nov 2024 13:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557E0C4CEC6;
	Wed,  6 Nov 2024 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901325;
	bh=AVIvph9mJZGEATPf56rqGStyyTSb/L8LohsnTsrbixQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFG0OwY2lizYvqYNBBAtxFpqa4fzTj5vNKZ7XmTGCYSRgCeIX/b7WFN8Y8WR/kRq8
	 yfjP0dEAlCnj5mRw/UUq+akLW28dlEzq0yfMYXnKUWmpfV/lMJdhBw4I55aQr14UOn
	 rNJFgxiSH9DJP4Eu7fFsEeKElUgzJhrQ9BPraOLaU2yVFkTG3louTZ6h1bXIBh7/CB
	 qHm/k5uHSzoFcHiC7rSh+Bhao+lbOXjm+MNQb9JikOxVhWaOtdlVFtcENfEq9iH53r
	 2CrItMX0CvPnWiUT8whijMVCLM0alPiuKTtIX9rlP9uND5GV+AJujlfgXUxc2zPs4p
	 Pgmej3woBMTDg==
Date: Wed, 6 Nov 2024 14:55:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT
Message-ID: <kspk7qajv7r5glbcawmecbup36cv4wi3hjrgyfyyejjectwwt5@u5nx5y5zirsa>
References: <20241106005800.7520-1-kiseok.jo@irondevice.com>
 <20241106005800.7520-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106005800.7520-2-kiseok.jo@irondevice.com>
Message-ID-Hash: MEK4KMS2GJONT5VLRNRWEWYRM4UI2E5O
X-Message-ID-Hash: MEK4KMS2GJONT5VLRNRWEWYRM4UI2E5O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEK4KMS2GJONT5VLRNRWEWYRM4UI2E5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 06, 2024 at 09:57:59AM +0900, Kiseok Jo wrote:
> This adds the schema binding for the Iron Device SMA1307 Amp
> 

That's a v5. RESEND means you send exactly the same or the same plus
tags.

If you change patch, then it is v5, so the tools know how to handle it
and we do no waste time at reviewing things twice.

> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

