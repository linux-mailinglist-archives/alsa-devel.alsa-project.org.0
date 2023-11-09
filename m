Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8F7E6C50
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 15:16:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C954E;
	Thu,  9 Nov 2023 15:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C954E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699539386;
	bh=j1NrFzj55sSseuIyd1ibUADRrvDcJXcSKtr6KzpXc58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTd+V+SJ4QFDfaRRey6NF8/gtRB7zBKFzHaE4+KFtvzDd8lJuWErC08zFmYOoxEvy
	 AyCkhbD4LtpmnulcHF4CQARTcX7YVCfscCQ15KgHBABWGbJN+oWVzhiNYPAKodS7fm
	 R2KQcokg3vGrLn7cGq+XKPwZ01avHW4DCWk98+pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 489C9F8055A; Thu,  9 Nov 2023 15:15:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D12A6F80152;
	Thu,  9 Nov 2023 15:15:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB096F80166; Thu,  9 Nov 2023 15:15:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF2FAF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 15:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2FAF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cwrjPSWX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1CFJe/Tg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 248AC1F8B3;
	Thu,  9 Nov 2023 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699539319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyhyYBOHSk1hZkpg7K+eSMnpxRmFxG1oooMFRaAs2DM=;
	b=cwrjPSWXp+xQ9HMjP/5ALXo9+oSmUr5a8h4Gl0tBpdf+rK3PI8m0s7HhoZSsICaWcC7LWC
	nehOHtzF8qFahOUNyvpjpxNWXpu8X5VGCu4zd78PxY2kotyKMfR8PWuUngcK+4fffMMIGk
	zABD8QhJUGokGnY/xjSIMr9grSdUhvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699539319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyhyYBOHSk1hZkpg7K+eSMnpxRmFxG1oooMFRaAs2DM=;
	b=1CFJe/TgoLz8ICR7WKevzmz5r9sWNWxUUwCx2eTU22/eG8J2htJ+tTPfrwnnLGZ7z+2HbJ
	4AjbxwtiiB2KR2Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04F73138E5;
	Thu,  9 Nov 2023 14:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rdMiAHfpTGVpaAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 09 Nov 2023 14:15:19 +0000
Date: Thu, 09 Nov 2023 15:15:18 +0100
Message-ID: <87pm0jrp1l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/1] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
In-Reply-To: 
 <CAHiQ-bA-vhk4vhxUGRVk7dLrDECmjqA38C=jSj7iYHr=RL+0TQ@mail.gmail.com>
References: 
 <CAHiQ-bDGx89vWjtqrnH4FtO-JF9XUWMgwCpR4nusC9Zvw=bN7Q@mail.gmail.com>
	<87sf5fpe7j.wl-tiwai@suse.de>
	<CAHiQ-bA-vhk4vhxUGRVk7dLrDECmjqA38C=jSj7iYHr=RL+0TQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DHMC6GYV4ZCYK6QBKVJGSF6BA5MZVL3I
X-Message-ID-Hash: DHMC6GYV4ZCYK6QBKVJGSF6BA5MZVL3I
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHMC6GYV4ZCYK6QBKVJGSF6BA5MZVL3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Nov 2023 14:33:21 +0100,
vitaly.torshyn@gmail.com wrote:
> 
> 
> Dear Takashi,
> 
> Thanks a lot for the quick review.
> My idea was to keep "similar" devices' quirks close to each other but I do
> agree that using PCI SSID makes more sense.
> 
> Please find the updated version of the patch attached.

Could you rather resubmit properly as v2 patch?


thanks,

Takashi
