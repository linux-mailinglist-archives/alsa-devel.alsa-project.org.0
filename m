Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D37777905
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 781DD86F;
	Thu, 10 Aug 2023 15:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 781DD86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672597;
	bh=irAw8C1RbIzipfSt1MnqWhrjlxxoQRCkAeMq+VcRA7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1P+eIYDwyAfKqmrHL3eDD5OFahsj0+4s6qX1J0jtXYj8e0KiOBuALH2uP/T5rJul
	 Fuioh+T+gAyEZ0uO/IpbBOzmBdURF5ZjYFaheB3u72krtbRzf3NulIH9vNhFuJwMz7
	 S07jUiEbhPwsGUISxORKeLCkeEdmm1Nu3znPzBlU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE36F8057A; Thu, 10 Aug 2023 15:01:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55DE9F8057A;
	Thu, 10 Aug 2023 15:01:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9EDEF8016E; Thu, 10 Aug 2023 11:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 531ACF800F4
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 11:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 531ACF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aYS9XZ2g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1557656B2;
	Thu, 10 Aug 2023 09:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395A1C433C9;
	Thu, 10 Aug 2023 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691661557;
	bh=irAw8C1RbIzipfSt1MnqWhrjlxxoQRCkAeMq+VcRA7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYS9XZ2gch8tOZFweR+abCikrsOTVWRnN3vXDIbjcrUfrDUWu96X3Eev55KVFElOY
	 7kajLAH9n+49UZj2rxzfpHxngpCglRAWIx1j40PAF4HRI36aYeapTKiq5pbKvk5UVi
	 mintMg9N1d+7ODhGW1WpIdTw8lL8Z5tXY58vIbac6YWgh35WZL5O26D29I8cz5+9V4
	 i7aqSBpi8nF6Xtj0xjpAUEiVVGlPzX2HMg3Rhp8E1yHiShqJk3sxjidgxQH4ckRLAq
	 aLonGSxc7+fch0bMq8UBUq990+t+gCGpSRXQmd0c8djyr7NNKXm6OqyQvIjOTItWho
	 c79/k6XLLFc8A==
Date: Thu, 10 Aug 2023 11:59:11 +0200
From: Simon Horman <horms@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, nicolas.ferre@microchip.com,
	conor.dooley@microchip.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, maz@kernel.org, srinivas.kandagatla@linaro.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	sre@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
	alsa-devel@alsa-project.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
Message-ID: <ZNS0708cDAt7H7ul@vergenet.net>
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
 <ZM0Be8S8zII8wV4l@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM0Be8S8zII8wV4l@nanopsycho>
X-MailFrom: horms@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UQMMXCICV5RCRKYYXUZQDZAB5QGXPMS2
X-Message-ID-Hash: UQMMXCICV5RCRKYYXUZQDZAB5QGXPMS2
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQMMXCICV5RCRKYYXUZQDZAB5QGXPMS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 04, 2023 at 03:47:39PM +0200, Jiri Pirko wrote:
> Fri, Aug 04, 2023 at 07:00:07AM CEST, claudiu.beznea@tuxon.dev wrote:
> >Update MAINTAINERS entries with a valid email address as the Microchip
> >one is no longer valid.
> >
> >Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> >Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> >---
> >
> >Changes in v2:
> >- collected tags
> >- extended the recipients list to include individual subsystem
> >  maintainers and lists instead using only linux-kernel@vger.kernel.org
> >  as suggested initially by get_maintainers.pl
> 
> Consider adding entry in .mailmap as well please.

Hi Claudiu,

I'd like to echo Jiri's suggestion of adding .mailmap entry
to reflect this change.
