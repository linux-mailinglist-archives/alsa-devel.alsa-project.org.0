Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780D7BB39E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5991E9;
	Fri,  6 Oct 2023 10:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5991E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582626;
	bh=RCEmQDo0jJMrlfHFy9lfA5eAYuDdhpLhxPDkvGgRZkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sqq9FRq/q1TcB3za/z0V82gbX1sZTF9U8qhFHBYVCUVyWo8N0Y/qElG/aH6cngY0o
	 O5LY45K370+EB/vLk7WL1lsfPlAN3Y4IQEkJvt+eKcVjxkzdtgqEG/rrspuhvBJD6J
	 hrK7Wv2cbCxdi6A18e2FQeYWPmJL3FtE4Nsev1Bk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B75F8047D; Fri,  6 Oct 2023 10:55:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B74CF80310;
	Fri,  6 Oct 2023 10:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A704AF8047D; Fri,  6 Oct 2023 10:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFE1BF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFE1BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tjUnSY/4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qBRSMiiX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FA521F895;
	Fri,  6 Oct 2023 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696582549;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kCmsw5W7gqX1wRObfoBHyJsQifa0dbl8J7a0tTb8nF4=;
	b=tjUnSY/4U71/HmrF2X8QRrA/aCFCFEmNrHpNyiNwNOJcHBp1QdG24c98rPPMsf7fillQHP
	CLGtnsK5jqXD0UJ/QbqRsZ/HBHZt72q735GyfTYfNF7dDfhPIiSKXPmt5eD8HNM895DssT
	rMiEdSo2qWX3sDw0M8GqZVStAztQfYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696582549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kCmsw5W7gqX1wRObfoBHyJsQifa0dbl8J7a0tTb8nF4=;
	b=qBRSMiiXOcTfLGcdluzzvwL1pn3qQGmMo0bbY96qzB+YFYLCLnQAf613cgvUI6g6GP9V5l
	lkZM0GS1LrHiI0BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A84C13A2E;
	Fri,  6 Oct 2023 08:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id e8VJDZXLH2WzJQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 08:55:49 +0000
Date: Fri, 06 Oct 2023 10:55:48 +0200
Message-ID: <87r0m8w2nf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Wang <michael-mw.wang@broadcom.com>
Cc: alsa-devel@alsa-project.org,
	Abdul Khan <abdul.khan@broadcom.com>,
	Yuming Wen <yuming.wen@broadcom.com>
Subject: Re: time to remove COPYING.GPL from alsa-plugins? (issue #45)
In-Reply-To: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
References: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: UECBHXDTYQD6CCTZE6CI6I5CBU5AB47Y
X-Message-ID-Hash: UECBHXDTYQD6CCTZE6CI6I5CBU5AB47Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UECBHXDTYQD6CCTZE6CI6I5CBU5AB47Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Sep 2023 20:26:31 +0200,
Michael Wang wrote:
> 
> Hi Alsa-devs and Mr Iwai,
> 
> Sorry for the spam, I am resending this in plain text mode this time.
> 
> It seems the only thing in alsa-plugins that has a GPL license is
> rate/rate_samplerate.c, and that is due to the license of
> libsamplerate.  But in 2016, libsamplerate dropped the commercial/GPL
> part of its license and was released with the 2-Clause BSD license.
> So I was wondering if the license for rate_samplerate.c can be updated
> to remove the GPL license, which means the COPYING.GPL file can also
> be removed from the alsa-plugins package?
> 
> I have created issue #54 in github.com/alsa-project/alsa-plugins, but
> so far, no action.
> 
> Should I submit a pull request?

The code allows LGPL, too.  What's the problem with it?


thanks,

Takashi
