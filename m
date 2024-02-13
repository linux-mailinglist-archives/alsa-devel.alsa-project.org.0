Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD3853912
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 18:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0133614E0;
	Tue, 13 Feb 2024 18:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0133614E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707846940;
	bh=Fpat39sCKC0M/T0N7Xrv5bT2WB5EUj8Z2VGFq0l5oCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sw3O/3bzF94TARfR5X8KGp5ypVyOX46/oz4l66wsBgrF4yxf35PefbOpHorraLkwn
	 GJqfJGU2qVzRzDzWsMZgoSA+KilTEdMQTjSBPr4A2mSXzn4EMLusQmexD53UxHUQSk
	 Ib9AyPunc7zdokWlxSPIctt7C6zo3xTmvfATzxjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F195DF805C2; Tue, 13 Feb 2024 18:55:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33E6FF805C7;
	Tue, 13 Feb 2024 18:55:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10795F805B0; Tue, 13 Feb 2024 18:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64630F8025A
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 18:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64630F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xgifEv1b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19219CE1D7F;
	Tue, 13 Feb 2024 17:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC359C433F1;
	Tue, 13 Feb 2024 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707846889;
	bh=Fpat39sCKC0M/T0N7Xrv5bT2WB5EUj8Z2VGFq0l5oCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgifEv1bwXhoJlsctQxA8caAXj3U4+DtQHuKl0JYKmd/aTZz2EvuJ3k8HCoW9G7Bz
	 /h6aM8+2qOzCAHxef1tzTqxSmegsBM8wEhnZxPZkpV6w0i0blKHabVQVCUDQvOdO2D
	 jPLgAwanDvHOt29LWBfF00E0Lmjf0dVRO9odef4E=
Date: Tue, 13 Feb 2024 18:29:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: core: make slimbus_bus const
Message-ID: <2024021326-swimwear-onshore-e3f4@gregkh>
References: <20240213-bus_cleanup-slimbus-v1-1-34f06d82de6e@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-bus_cleanup-slimbus-v1-1-34f06d82de6e@marliere.net>
Message-ID-Hash: 7FPP24SSDRLWM463M7JRJ5YR7OQFA3Q6
X-Message-ID-Hash: 7FPP24SSDRLWM463M7JRJ5YR7OQFA3Q6
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FPP24SSDRLWM463M7JRJ5YR7OQFA3Q6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024 at 11:40:35AM -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the slimbus_bus variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
