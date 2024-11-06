Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5719BE480
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 11:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED74A10BE;
	Wed,  6 Nov 2024 11:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED74A10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730889807;
	bh=va2r5fP+7Fzh0b/uBhAyLj4tamsES4F99tp95aSz8zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qPPT+49rXRiWOikowGUzHEpw93PnHuCsMvcJGALj8gc+lKIKzFaz28+ASKvyOcF51
	 iuS7YOl+7Ef1letJNvGaQiMf/v01hUubuoYQnx7JJvSlPOYUrrhvqV25LTWrVsWwsP
	 xk7UhNZ4QxCr1198rjqs3GDxhZXsQq9XbSiqWWhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 168AAF805B4; Wed,  6 Nov 2024 11:42:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2AE1F805B2;
	Wed,  6 Nov 2024 11:42:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0BDDF8013D; Wed,  6 Nov 2024 11:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEAD1F800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 11:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAD1F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=bqc1LXIx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFA695C0599;
	Wed,  6 Nov 2024 10:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52BEC4CECD;
	Wed,  6 Nov 2024 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730889762;
	bh=va2r5fP+7Fzh0b/uBhAyLj4tamsES4F99tp95aSz8zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqc1LXIxEXjyhn4vHZm90Npd3Kixa4u4JFIpZnz/kgJFbfu/El4NNHFARGRQsT0cO
	 nTfU7dyJTmrVXWnyxJ0RJuMdNYAn5N+xPj/kpvRSHVzgBt61iPa0RyB8rO2TZyc6fm
	 aq+r8yQErrqdpg6tFNXP7D8L8UrZnpnxOXmyHK8E=
Date: Wed, 6 Nov 2024 11:42:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Christoffer Sandberg <cs@tuxedo.de>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] ALSA: hda/realtek: Fix headset mic on TUXEDO
 Gemini 17 Gen3
Message-ID: <2024110606-expansion-probing-862b@gregkh>
References: <20241106021124.182205-1-sashal>
 <20241106094920.239972-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106094920.239972-1-wse@tuxedocomputers.com>
Message-ID-Hash: YSPNRALPDFPB57SMAYPTK7MWRBNR2HXQ
X-Message-ID-Hash: YSPNRALPDFPB57SMAYPTK7MWRBNR2HXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSPNRALPDFPB57SMAYPTK7MWRBNR2HXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 06, 2024 at 10:49:04AM +0100, Werner Sembach wrote:
> From: Christoffer Sandberg <cs@tuxedo.de>
> 
> Quirk is needed to enable headset microphone on missing pin 0x19.
> 
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>
> Link: https://patch.msgid.link/20241029151653.80726-1-wse@tuxedocomputers.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)

What is the git commit id of this in Linus's tree?

thanks,

greg k-h
