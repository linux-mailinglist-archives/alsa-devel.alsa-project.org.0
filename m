Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6F80CB44
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD33E112;
	Mon, 11 Dec 2023 14:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD33E112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702302105;
	bh=nxM3m0fd/Qts426VUxaIvUcMjAL8BjhTWiFbn8gjtHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VqTMkIF2gFHxEiKDi4FMrTrF39ufjHPLCDdpcQ7AtGCAK6SR/7Khf9koVPisW1yuw
	 Vh08slhQHqRhKDmqCPhVTrlNKmTQJ4KwIYjE5wmI3cPoWwBTwXvxSvU/pbz9KfP3Ts
	 uOJmLpRKwr2CrPaQOq1uC61RAoUafqAXXM7yzUi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C007BF8055B; Mon, 11 Dec 2023 14:41:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97965F80578;
	Mon, 11 Dec 2023 14:41:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BD1F80166; Mon, 11 Dec 2023 14:41:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB33BF800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB33BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=EWISpyq8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D709ECE127D;
	Mon, 11 Dec 2023 13:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE03EC433C9;
	Mon, 11 Dec 2023 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702302061;
	bh=nxM3m0fd/Qts426VUxaIvUcMjAL8BjhTWiFbn8gjtHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWISpyq8wNowbv0aYVcvdj3yFg7Rf4k6p1s8hhxK6NY7eiVikxtLg/N67DRry/c6+
	 xCDto1x/dyxRE0i4mxYN1Kyh9Y2z8AtYz4/CsyfjqJ2ltyisaobLefFGXmNNWm7j3/
	 U4r3banV4ANXrkdOJVgt7wqtT/0L9dgO0G01A4n0=
Date: Mon, 11 Dec 2023 14:40:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH stable-6.6 0/2] ASoC: qcom: sc8280xp: Limit speaker
 digital volumes
Message-ID: <2023121154-mule-utter-98cf@gregkh>
References: <20231211132608.27861-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211132608.27861-1-johan+linaro@kernel.org>
Message-ID-Hash: MNPIFOJWPVWIL3XPZHWGQ6F3VSNE5YNM
X-Message-ID-Hash: MNPIFOJWPVWIL3XPZHWGQ6F3VSNE5YNM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNPIFOJWPVWIL3XPZHWGQ6F3VSNE5YNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 11, 2023 at 02:26:06PM +0100, Johan Hovold wrote:
> This is a backport of the following series:
> 
> 	https://lore.kernel.org/lkml/20231204124736.132185-1-srinivas.kandagatla@linaro.org/
> 
> which did not build on 6.6 due a rename of the asoc_rtd_to_cpu()
> interface.
> 
> Johan
> 
> 
> Srinivas Kandagatla (2):
>   ASoC: ops: add correct range check for limiting volume
>   ASoC: qcom: sc8280xp: Limit speaker digital volumes
> 
>  sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
>  sound/soc/soc-ops.c       |  2 +-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> -- 
> 2.41.0
> 
> 

Now queued up, thanks.

greg k-h
