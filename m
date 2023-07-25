Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8A761E88
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 18:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360556C1;
	Tue, 25 Jul 2023 18:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360556C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690302631;
	bh=8V3JU6dJEtGUWklvo/YnWOtYSGFsSMLIx1oBF8E8QBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VMhqUZYlcDkgdos7qWEq2fTRsbTjPuhFjkaOkS9tU/6g3WcjlxStJSciHtVN4o8SD
	 ptl56aUEdcklyYdC+9lG5+2/A+rxGuN1CSGemECcsIA8b6gVlWuFZ/j6JILCESa9Fl
	 ForT69EhH6ree7rtJ1oCjjnSlzeA0JW4sBo5/Q34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5C3F802E8; Tue, 25 Jul 2023 18:29:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FBCF80163;
	Tue, 25 Jul 2023 18:29:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D59F8019B; Tue, 25 Jul 2023 18:29:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C6829F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 18:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6829F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xI9jD8nP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD1B7617B9;
	Tue, 25 Jul 2023 16:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7A2C433C7;
	Tue, 25 Jul 2023 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690302555;
	bh=8V3JU6dJEtGUWklvo/YnWOtYSGFsSMLIx1oBF8E8QBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xI9jD8nPfS4CfSdJJIQFbHgjwL9Yw2WTfzkz9O+8d8Y9G7GVLu5eq0/yHQDCnemYE
	 myFhEYy+2bV3bPmQ4pmvClerAqtdAxo1h4Tuwkg5ECziImuJURePjk0teHaq2dGvti
	 GFoqRC5T/SFiQnEUGCBpYMwGGHObIj3j4obIoCP8=
Date: Tue, 25 Jul 2023 18:29:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: Add USB MIDI 2.0 Gadget Function Driver
Message-ID: <2023072550-refocus-depth-1086@gregkh>
References: <20230725062206.9674-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725062206.9674-1-tiwai@suse.de>
Message-ID-Hash: 5AGKDA6RMZOQO2E4S5L3DGRYVWFOXSJQ
X-Message-ID-Hash: 5AGKDA6RMZOQO2E4S5L3DGRYVWFOXSJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AGKDA6RMZOQO2E4S5L3DGRYVWFOXSJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 25, 2023 at 08:21:59AM +0200, Takashi Iwai wrote:
> Hi,
> 
> This is a patch set for adding a USB gadget function driver for USB
> MIDI 2.0 interface.  The MIDI 2.0 support in the host side was already
> enabled since 6.5 kernel in snd-usb-audio driver.  Now, this provides
> a similar gadget functionality using the existing ALSA UMP helper
> functions.
> 
> The gadget driver provides both MIDI 2.0 and MIDI 1.0 fallback
> interfaces with one or more loopback UMP rawmidi devices.  The
> configfs implementation is flexible enough to allow users to set up
> multiple UMP Endpoints and Function Blocks.
> 
> The first patch adds the bare f_midi2 driver without configfs support,
> followed by the configfs support, MIDI 1.0 interface support and a few
> other extensions and documentation.
> 

Very cool, thanks for doing this!  All now queued up, let's see what the
builders say...

greg k-h
