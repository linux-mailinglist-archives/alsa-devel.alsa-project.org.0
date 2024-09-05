Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E285296DFAF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 18:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6576A4A;
	Thu,  5 Sep 2024 18:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6576A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725553843;
	bh=xWDZEJKCAOe9ljWrApkLr4zWbHZ3imYeYtkkE7/qmow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HVsfRYo8PvIGWS6LC18UdGCggmWzrbxE12rfn+XPHXYSEu40KpIhORRf6eEZBjWqP
	 GpVfnbQGfiQD26pSO9er98BoLVlv2YSWs28qGjnhvviIBcWigfJZgM2Q69kZxMj1AH
	 l9SxmRPfyTJ0Gn9ZxYlVDus7RnO6kNRVELT0UcZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1F60F805B2; Thu,  5 Sep 2024 18:30:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D114F805B1;
	Thu,  5 Sep 2024 18:30:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF22F8016C; Thu,  5 Sep 2024 18:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47957F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 18:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47957F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=OpoWgOQC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E3605C4C3D;
	Thu,  5 Sep 2024 16:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C97BC4CEC9;
	Thu,  5 Sep 2024 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725553802;
	bh=xWDZEJKCAOe9ljWrApkLr4zWbHZ3imYeYtkkE7/qmow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpoWgOQCa16Xdi7mKlJQjlw0p5ax0qvKQkA2p9M4w+Xyy7nUPXp8i4UDzSzRwCK1d
	 PpPJg3Qc7zy4cNm5ZNLhXCUeLj1L12OhTItLO3nvPJHrAj9yZyp2EG6a+K9d/itTC8
	 q1tFL1PkzWvjQoy+1XaqGra3OQYWOlZ1FygIPfPI=
Date: Thu, 5 Sep 2024 18:29:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2 4.19.y] ALSA: usb-audio: Sanity checks for each pipe
 and EP types
Message-ID: <2024090535-drinking-unsocial-6170@gregkh>
References: <76c0ef6b-f4bf-41f7-ad36-55f5b4b3180a@stanley.mountain>
 <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
 <2adfa671-cb11-4463-8840-a175caf0d210@stanley.mountain>
 <2024090557-hurry-armful-dbe0@gregkh>
 <747a6089-b63d-4d14-b524-55a76f58d724@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747a6089-b63d-4d14-b524-55a76f58d724@stanley.mountain>
Message-ID-Hash: IDL7RF44OFRYI524NMHRW4W4JK2YMVRJ
X-Message-ID-Hash: IDL7RF44OFRYI524NMHRW4W4JK2YMVRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDL7RF44OFRYI524NMHRW4W4JK2YMVRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 06:11:49PM +0300, Dan Carpenter wrote:
> On Thu, Sep 05, 2024 at 03:49:14PM +0200, Greg KH wrote:
> > On Thu, Sep 05, 2024 at 04:34:45PM +0300, Dan Carpenter wrote:
> > > Sorry,
> > > 
> > > I completely messed these emails up.  It has Takashi Iwai and Hillf Danton's
> > > names instead of mine in the From header.  It still has my email address, but
> > > just the names are wrong.
> > > 
> > > Also I should have used a From header in the body of the email.
> > > 
> > > Also the threading is messed up.
> > > 
> > > Will try again tomorrow.
> > 
> > It looks good to me, now queued up.
> > 
> 
> The code is okay but the Author header is messed up.  It has my email address.
> 
> From: Hillf Danton <dan.carpenter@linaro.org>
> 
> From: Takashi Iwai <dan.carpenter@linaro.org>

Ah that's really odd, how did you do that?  :)

Now fixed up in the patches, don't worry about it.

greg k-h
