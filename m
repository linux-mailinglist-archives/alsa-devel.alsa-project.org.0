Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55E19C01D1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 11:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 996DAEC7;
	Thu,  7 Nov 2024 11:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 996DAEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730973787;
	bh=eYH2ACgbRqffR/sv/0uuECjlgyo1XRetpJbSYf2Khb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r05i57i06+kwEFwCaDoXX5K3xj1SQHlw0oQ906xjWd16n0SibC759+NTBNOKlSqpy
	 AJPw6gmQB6KLsGERJegvALy//yDW5w0F35VpS7GnL27aEUJtnfxLgQXQvOfq9NW+cO
	 TB67vapOPacqc9JRq60nE7vSbNPihhM0ju4achMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2979F80134; Thu,  7 Nov 2024 11:02:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DABCDF805B0;
	Thu,  7 Nov 2024 11:02:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E580F8013D; Thu,  7 Nov 2024 11:02:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8915F800C8
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 11:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8915F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ls+pTpqK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DDA25C4767;
	Thu,  7 Nov 2024 10:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9111EC4CECC;
	Thu,  7 Nov 2024 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730973738;
	bh=eYH2ACgbRqffR/sv/0uuECjlgyo1XRetpJbSYf2Khb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls+pTpqKEVFBnjSler0aLSN7NjB7FCMguWmgezFpnazhMTTmT+zdNwoSPyeWZ4geE
	 /E/4bW9ZVWubuCw8uzmb0OKRJ+Hg8AEz3JX1h5M9yct2/0AH/7gru09Rp8MRXXJSNz
	 Bla2G6XeEfYocOo0gX6FlRrG24nGsQVGg2gTkC0sxssM1ubKv6vhv/ozXxswt42vIu
	 cdEnYxCci4D6GiVNSYK7RoTWQcdlpC+r2ww6TqFgITVLRHXQNS6KCHTo11BZ+eBxCx
	 CWIAPBhT63Ku2OjWvmmUonjYI5kpaZ87vC0FUHRdk33dxmV06cyP2248FUX+l7sGGm
	 stpvNEjMt5l+Q==
Date: Thu, 7 Nov 2024 11:02:13 +0100
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
Message-ID: <butx33avx7zainw6im72kwdxj6jfvfbdlzugxadu6rfn3uszdx@oxgvrnfl5t5h>
References: <20241106233144.9283-1-kiseok.jo@irondevice.com>
 <20241106233144.9283-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106233144.9283-2-kiseok.jo@irondevice.com>
Message-ID-Hash: YCA2RBNGWZD2X5F5BK6PABK7HZABO23J
X-Message-ID-Hash: YCA2RBNGWZD2X5F5BK6PABK7HZABO23J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCA2RBNGWZD2X5F5BK6PABK7HZABO23J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Nov 07, 2024 at 08:31:44AM +0900, Kiseok Jo wrote:
> This adds the schema binding for the Iron Device SMA1307 Amp
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
> v3 -> v4
>  - Modify to fit the character-per-line format

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

