Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAC19A1AD4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 08:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD525847;
	Thu, 17 Oct 2024 08:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD525847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729147269;
	bh=Q3YK1YytJHA4b0L4yocqevQZD3SkUiTtzwE9kUxDuBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+kiWx+6j6E+tsFx243seq6rEnv1BGzno6v6O8x6M05aIP0wo25+HgbeLibKblGCy
	 3dFef0ncHxoEZGkPp6GZT1HoqTq0DJwTT1JVvZeLbSN+IX7iGAfU/vyzuUUSk+1Lht
	 gz55fkGlz92gPZa8bqvts2AU4NaA421TzAHJe3EY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 137C3F805AD; Thu, 17 Oct 2024 08:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 844CFF805A9;
	Thu, 17 Oct 2024 08:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD474F80448; Thu, 17 Oct 2024 08:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 105B4F800ED
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 08:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105B4F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=qL1dy/+S
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F81B5C5830;
	Thu, 17 Oct 2024 06:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8F3C4CEC3;
	Thu, 17 Oct 2024 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729147222;
	bh=Q3YK1YytJHA4b0L4yocqevQZD3SkUiTtzwE9kUxDuBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL1dy/+SiO5IHzdVF2yCqHnZHdolQ6tyRxX+MU5LSoT3iEkA8qdNuM4z/ywhAcId9
	 U9vv61Hha1JlFE5EFH1L5zCcLCLg6hbvXqbxDwerRvz9Hqm3OiOdRYe5tl+16JfuqS
	 DjjK7Q9a7gzIEbD7bVNjJS64a4NYJJHZ6P/0tQ9g=
Date: Thu, 17 Oct 2024 08:40:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation
 IMOD for secondary interrupters
Message-ID: <2024101747-defog-squiggly-ef54@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015212915.1206789-2-quic_wcheng@quicinc.com>
Message-ID-Hash: JPQVG7TF5BOWJMXB5ESTLUYQMW7YSRID
X-Message-ID-Hash: JPQVG7TF5BOWJMXB5ESTLUYQMW7YSRID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPQVG7TF5BOWJMXB5ESTLUYQMW7YSRID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Allow creators of xHCI secondary interrupters to specify the interrupt
> moderation interval value in nanoseconds when creating the interrupter.
> 
> If not sure what value to use then use the xhci driver default
> xhci->imod_interval
> 
> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/host/xhci-mem.c | 8 +++++++-
>  drivers/usb/host/xhci.c     | 4 ++--
>  drivers/usb/host/xhci.h     | 5 ++++-
>  3 files changed, 13 insertions(+), 4 deletions(-)

This is already in 6.12-rc1, which makes me confused as to what tree you
made this series against.

thanks,

greg k-h
