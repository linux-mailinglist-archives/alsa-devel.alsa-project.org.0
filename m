Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A377C2BA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 23:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38EF1827;
	Mon, 14 Aug 2023 23:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38EF1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692049630;
	bh=Z5vMIw8DJMsrloH2u0r4CfAufO0NQJmDEE/VNvMeWT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PqLsWh1+gyv85gCsTYVfCC5xj4l3pXe/yduF5mNPmSq1vH3DnB5WdRL6TTZNwB4Wb
	 hbz4syDW1biPVG3OpMePU/1SPK/mobyD5CSmzj7emwUYDIJGGU/lqqkFWFpcVX8zvH
	 +sruFHlqVf+IQ49UwtL8ZniDCbSoyjpnKfxa/rT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D967F80552; Mon, 14 Aug 2023 23:45:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE7FF801EB;
	Mon, 14 Aug 2023 23:45:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC006F8025F; Mon, 14 Aug 2023 23:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-109.mta1.migadu.com (out-109.mta1.migadu.com
 [95.215.58.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F6B4F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 23:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6B4F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=JSl24lyi
Date: Tue, 15 Aug 2023 07:44:09 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1692049538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5vMIw8DJMsrloH2u0r4CfAufO0NQJmDEE/VNvMeWT8=;
	b=JSl24lyiL62b32aQBcJyKIwpfARIEA7P/At0FHiQtsneU8Lr5NeVTQrAUbdw/4Uxdb99bS
	bF0szz1Z/4Jh7n9II9AAUPZvsdEcBhjgYBIWSy8u9GwBSOz9Cvf6FgmRE9gMpLi0Af7dE1
	E/7JPGtvJY2Vv2FYvDKFgDCZ9P9psgjF4lbjERxr74jkZGMTt0cosEASDHb35sqH+QN+iG
	sfRfl2i8xHwBOwuTFcNbOAv7zH5BYkDTLt2btYuzLtXJNXINmipegA9z7IQVTseAQohGjH
	XrWkT0DiExUaP0euM7pGc1KtVZJIzlwBHdTycKUID5Z4Nzi07l+EPq8srAoB8w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
Message-ID: <ZNqgKW3TZBVF8ggo@titan>
References: <20230810224930.3216717-1-contact@jookia.org>
 <20230810224930.3216717-4-contact@jookia.org>
 <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk>
 <ZNZFB2-kBrpnMSn1@titan>
 <a7db4653-cb12-4f90-891c-5cf7270598bd@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7db4653-cb12-4f90-891c-5cf7270598bd@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: XP4RN6TNAAXF4QBYKYZN2WXOE4JKTSU2
X-Message-ID-Hash: XP4RN6TNAAXF4QBYKYZN2WXOE4JKTSU2
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XP4RN6TNAAXF4QBYKYZN2WXOE4JKTSU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 07:27:04PM +0100, Mark Brown wrote:
> You'd have to define an enum for that but it does still feel like it
> might be easier to work with since it's more direct.

Alright, I'll give it a go in the next version. Thanks for the feedback!

John.
