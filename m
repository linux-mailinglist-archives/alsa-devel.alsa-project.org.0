Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71B7A5C96
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F11DEC;
	Tue, 19 Sep 2023 10:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F11DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695112379;
	bh=5ZQxCL05xgbLE+Hqu9vgbWaedv9zDSuUhLTMmtFM1uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hkhvUDlmDOe0RFYvVlAzCUfrQjcRUS4vwP+kKr7gs5tYkSUdCQ+kJHJ4ObQjjE1jM
	 1VA3xz7wDS0WyDYM8zjVICfVCLqCzO1dPQx7+aoIyBfDPzW4L0G/6Lzysj06f3w7tP
	 rz7cq8tMyZhU+we3ygt5SGYgS6WkSm1mbkIRWQ5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C3A4F80125; Tue, 19 Sep 2023 10:31:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB01F80125;
	Tue, 19 Sep 2023 10:31:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8626FF801F5; Tue, 19 Sep 2023 10:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF2C3F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF2C3F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=2a5mY6//
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8D6BDCE117C;
	Tue, 19 Sep 2023 08:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EE0C433C8;
	Tue, 19 Sep 2023 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695112281;
	bh=5ZQxCL05xgbLE+Hqu9vgbWaedv9zDSuUhLTMmtFM1uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2a5mY6//2a+36b6b3fKJ6tdg/hf75MoC6RGeUzk+NcaezDnH0wGRO02zk1ru2sDtC
	 m1cuoSDmJW/dWsgxlvB1KJZvYBD/ULW2jXVFwQkdYjCTTHsleWNHLcgy0hNHMsQ1Dk
	 GpPmONhtiufiCCx9Si0NM1mukcA1qxnJjDU6tJqs=
Date: Tue, 19 Sep 2023 10:03:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
	alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ALSA: docs: Add Marian M2 driver documentation
Message-ID: <2023091924-snowfield-armchair-47d3@gregkh>
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
Message-ID-Hash: L7DONWD7KWNZFNM6GHSTP4AMRXIWDITX
X-Message-ID-Hash: L7DONWD7KWNZFNM6GHSTP4AMRXIWDITX
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7DONWD7KWNZFNM6GHSTP4AMRXIWDITX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 10:10:43PM +0400, Ivan Orlov wrote:
> Add documentation for the new MARIAN Seraph M2 sound card. It covers
> current development status, available controls of the card and
> information about the integrated loopback.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2:
> - Remove redundant documentation fix from the next patch in the series
> 
>  Documentation/sound/cards/index.rst     |   1 +
>  Documentation/sound/cards/marian-m2.rst | 104 ++++++++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/sound/cards/marian-m2.rst
> 
> diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
> index e68bbb13c384..e873592d8d00 100644
> --- a/Documentation/sound/cards/index.rst
> +++ b/Documentation/sound/cards/index.rst
> @@ -19,3 +19,4 @@ Card-Specific Information
>     serial-u16550
>     img-spdif-in
>     pcmtest
> +   marian-m2
> diff --git a/Documentation/sound/cards/marian-m2.rst b/Documentation/sound/cards/marian-m2.rst
> new file mode 100644
> index 000000000000..bf12445e20d7
> --- /dev/null
> +++ b/Documentation/sound/cards/marian-m2.rst
> @@ -0,0 +1,104 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=======================
> +MARIAN Seraph M2 Driver
> +=======================
> +
> +Sep 18, 2023
> +
> +Ivan Orlov <ivan.orlov0322@gmail.com>
> +
> +STATE OF DEVELOPMENT
> +====================
> +
> +This driver is based on the driver written by Florian Faber in 2012, which seemed to work fine.
> +However, the initial code contained multiple issues, which had to be solved before sending the
> +driver upstream.

Minor nit, shouldn't these lines be wrapped a bit shorter as it's a text
file?  80 columns?  The other files in this directory seem to all do
that so maybe do the same here as well?

thanks,

greg k-h
