Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252B9BEF79
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 14:52:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A93BAE7D;
	Wed,  6 Nov 2024 14:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A93BAE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730901148;
	bh=0Vk788ZZKXNB38TEaQ2/NFObChD6O7+6oKGX1QBRcBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P8Srk6bkEoJLYDBdbgVJaR5OMjzYPwak4+w1OGhDVE3s5NROINCCSOPk4ZeUj2Eps
	 sNHCs+ONbmyBbuiW+ggCWTUK94k0161Lv8NEVfO/JPNekdsdksipvQGhlaagql7noW
	 Mdji9yEwPJjulErZ5Ea5d5OFPNRx7LL2QUFkV8G4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FBF9F805BB; Wed,  6 Nov 2024 14:51:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E857F80134;
	Wed,  6 Nov 2024 14:51:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77513F8013D; Wed,  6 Nov 2024 14:51:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19904F800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 14:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19904F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TMhpwrQX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 326AAA43D04;
	Wed,  6 Nov 2024 13:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A77C4CEC6;
	Wed,  6 Nov 2024 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901103;
	bh=0Vk788ZZKXNB38TEaQ2/NFObChD6O7+6oKGX1QBRcBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMhpwrQXr0qbUqr7dg/U4WJirNO0XZf1/26P95vZDOdS8dCAFup8gu5zP3Nmz7gna
	 6hicyj5Ps52RCkBEE01wigSpU6qu6YLjjxbXvzONmy91HC+92F5eFnmHM3WjfjR9gu
	 UooJ/sUpEGenL8bLgiBz1TFtxH9W3jH6dZ1kwwHMeVPM7bFTFtYgIiq6f3hCLbOEo5
	 JtRme90fSWrM94fAj6XnogC50If2SBA7KulUJ0XCcnowjAWNitg+3vd2GblSwdHb84
	 3xXQm0UqnnvdE8QAz11L+kMwe0RXbhmCdlONld379CXi51UF2qKThxEom4WL61kpFH
	 AWRzX7cLtKLrQ==
Date: Wed, 6 Nov 2024 14:51:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] This adds the schema binding for the Iron Device
 SMA1307 Amp
Message-ID: <a2cmjydyryfm3fgqgyun4e352cbg654yba7ggzavatrq4dvrd7@f35gxk4cgi3g>
References: <20241106004621.7069-1-kiseok.jo@irondevice.com>
 <20241106004621.7069-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106004621.7069-2-kiseok.jo@irondevice.com>
Message-ID-Hash: IBX7WSN7SEKL2UAPLJIMMZ6DXTT3FIJR
X-Message-ID-Hash: IBX7WSN7SEKL2UAPLJIMMZ6DXTT3FIJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBX7WSN7SEKL2UAPLJIMMZ6DXTT3FIJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 06, 2024 at 09:46:20AM +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---

Missing commit msg, missing subject (so commit msg went there).

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.


> v3 -> v4
>  - Modify to fit the character-per-line format


Best regards,
Krzysztof

