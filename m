Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 818057093FA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C0E9F6;
	Fri, 19 May 2023 11:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C0E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489658;
	bh=vISZVnoLhJQ8QsHDaywxxs4iOAAD/wIDiLAYiuafXF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZRRq9yu8rSkNlgFdJ5UD3jIp/qqBRTdR+63aI3ZHg8FiGxzXGNVgPLbZyr8Y4lw6
	 VRKxMMfP6ixbdTJ+1RM5JX4QtVlFti7c8MoOnEpSYQ00sYKl9Rg5ScyAPOWL9NcddY
	 G3psrFpYx95yJKVId6A8pxfxgZfvItbHSs6H9mRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F8FF8055B; Fri, 19 May 2023 11:46:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F856F80542;
	Fri, 19 May 2023 11:46:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E06F80548; Fri, 19 May 2023 11:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82A8BF802E8
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A8BF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=nCf13aFs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 04DF960AE3;
	Fri, 19 May 2023 09:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1300EC433EF;
	Fri, 19 May 2023 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684489598;
	bh=vISZVnoLhJQ8QsHDaywxxs4iOAAD/wIDiLAYiuafXF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCf13aFsJknvmSm+taCIVIZoxHEz7gnejXjyuoixvTlzkxWVkyDaZB1vWSW8Z2jUb
	 Sq8B1M0AvO8BFZgj7ovtJqHLN/2knAKpvwUXZXiGcBVGkYbiBpE0oZ0XtXfb+i4jKm
	 sCc/4IjT3ww6NT3QZmFiHwI3yDXjjX1yHJQbbc7o=
Date: Fri, 19 May 2023 10:46:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 07/36] ALSA: usb-audio: Define USB MIDI 2.0 specs
Message-ID: <2023051916-python-small-9431@gregkh>
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-8-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519093114.28813-8-tiwai@suse.de>
Message-ID-Hash: ZEKNVD7H7P3XQ6VO6ISCFHDAZPUCYSGO
X-Message-ID-Hash: ZEKNVD7H7P3XQ6VO6ISCFHDAZPUCYSGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEKNVD7H7P3XQ6VO6ISCFHDAZPUCYSGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 19, 2023 at 11:30:45AM +0200, Takashi Iwai wrote:
> Define new structs and constants from USB MIDI 2.0 specification,
> to be used in the upcoming MIDI 2.0 support in USB-audio driver.
> 
> A new class-specific endpoint descriptor and group terminal block
> descriptors are defined.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-usb@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
