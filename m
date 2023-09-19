Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C47A5CAE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 342BCA4E;
	Tue, 19 Sep 2023 10:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 342BCA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695112512;
	bh=GjUd5JrPVUTZ+uXOPJyhDhqF0PGaayXuvljzgD4jIT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=przQGsszv99m0GXO04tyg6qZKE3NAaI8Wyr8msryrOIYHeQuN4PEcRDmbrDIRLkIy
	 xcccRgyXjxG5veLH9oI9Gub/ThYZSXZSuGem1SBUle9CGmegUwLF7oWu1ZpEyPwvex
	 snr7eYXW3IwJ2mZYlj/0YoeOk4kj1X1nFTJZxMeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADFF5F80124; Tue, 19 Sep 2023 10:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D8D1F80125;
	Tue, 19 Sep 2023 10:34:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AA6BF801F5; Tue, 19 Sep 2023 10:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC4CBF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC4CBF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=AtiGWzxA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22F266150B;
	Tue, 19 Sep 2023 08:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC501C433C8;
	Tue, 19 Sep 2023 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695112452;
	bh=GjUd5JrPVUTZ+uXOPJyhDhqF0PGaayXuvljzgD4jIT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AtiGWzxAv4yxncx/+5wXNovuRsCQi+rJ17Kf++2HQ1/8ECj4pQLL7tZve/THkefpk
	 qhgWsqNNJXs22cGByYLHp0hUwPLl8bJqdQnidn3+jh9IVkLuzQeRV0sJPmxFvzLEtI
	 d46W8WsykEAMxJxacbzi5cnRJTm/aEilZUhCHTM8=
Date: Tue, 19 Sep 2023 10:04:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
	alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Message-ID: <2023091955-dried-popsicle-f3d8@gregkh>
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918181044.7257-2-ivan.orlov0322@gmail.com>
Message-ID-Hash: JUOA2VBBZFRGOAQDOFVTTSK4DRSNZCHW
X-Message-ID-Hash: JUOA2VBBZFRGOAQDOFVTTSK4DRSNZCHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUOA2VBBZFRGOAQDOFVTTSK4DRSNZCHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 10:10:44PM +0400, Ivan Orlov wrote:
> +
> +#define DEBUG

Do you mean to have DEBUG enabled at all times?  Shouldn't this be a
runtime issue with the normal dynamic debug infrastructure?

thanks,

greg k-h
