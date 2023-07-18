Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A675840B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 20:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1ECD210;
	Tue, 18 Jul 2023 20:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1ECD210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689703333;
	bh=8Nc0AmKrxIqr1+QDD400fQ9xkwfGBHpruR2Z8cAV67g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lB9dz57g+P2YgPzl/NLcfRYwO0uL772F1Xuwj8KcIvMjgqUxZSHYyZ+30Y5SjD61+
	 2flgnD70bRy56pu08giJSiyjLFiUzasc5fZ/31teJ1lBDus7+D1FkfDwg07GN9iwHb
	 ZPyg0xPUWz9jz4/0AP2RQhmNYCSAvABi00n5yl7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD48F80558; Tue, 18 Jul 2023 20:00:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B853AF80535;
	Tue, 18 Jul 2023 20:00:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07AB8F8032D; Tue, 18 Jul 2023 20:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57127F800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 20:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57127F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=P2mCUpvS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBB28616A6;
	Tue, 18 Jul 2023 18:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01702C433C8;
	Tue, 18 Jul 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689703220;
	bh=8Nc0AmKrxIqr1+QDD400fQ9xkwfGBHpruR2Z8cAV67g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2mCUpvS/+Wl+2vYFPyuGluo1unmosycKTb0zw++AA5xwPQ7NuNbXcA0ckxey4z/U
	 K1Odv6L0gg2WyH/BKD52aUFVS4Up6NRxEiXkKjoP19U0VC5Uikux+Gx2F5YwBEApHF
	 QTsgQ8OJhcb3Ueh9gV65zoL16MGv4azEznbf3xkE=
Date: Tue, 18 Jul 2023 20:00:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH 07/11] staging: greybus: Avoid abusing controls_rwsem
Message-ID: <2023071812-craving-droplet-5df7@gregkh>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-8-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718141304.1032-8-tiwai@suse.de>
Message-ID-Hash: HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB
X-Message-ID-Hash: HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 18, 2023 at 04:13:00PM +0200, Takashi Iwai wrote:
> The controls_rwsem of snd_card object is rather an internal lock, and
> not really meant to be used by others for its data protection.
> 
> This patch addresses it by replacing the controls_rwsem usages with
> the own (new) mutex.
> 
> Note that the up_write() and down_write() calls around
> gbaudio_remove_component_controls() are simply dropped without
> replacement.  These temporary up/down were a workaround since
> gbaudio_remove_component_controls() itself took the rwsem.  Now it was
> also gone, we can clean up the workaround, too.
> 
> Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
> Cc: Mark Greer <mgreer@animalcreek.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/staging/greybus/audio_codec.c | 18 +++++++-----------
>  drivers/staging/greybus/audio_codec.h |  1 +
>  2 files changed, 8 insertions(+), 11 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
