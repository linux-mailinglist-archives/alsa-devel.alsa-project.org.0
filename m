Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916108614BB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 15:52:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970847F1;
	Fri, 23 Feb 2024 15:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970847F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708699976;
	bh=J/Kh4UtVtXhc+bajthUcdKyuEGYlvN5+uE4K/npxcHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csK9PxJ0LuCAa/ebwPFRME7lOcbrSEAtOekVpPi1Dhp/6gKCbMcx/AfdsWGQmHvvN
	 3zl1wkaHC5MfPMHeDc+NrvfdGulhDr2c74HqWOZniEhYl8MVqhtmSHH40GleLYACR9
	 GAGRXHzMiVAuzg1LS4iLREz53og5XXaKHPMQOPH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0098DF805AD; Fri, 23 Feb 2024 15:52:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3650DF805A1;
	Fri, 23 Feb 2024 15:52:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02977F80496; Fri, 23 Feb 2024 15:52:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C11CBF80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 15:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11CBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u8l4nPsX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bNg3bM7f;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=u8l4nPsX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bNg3bM7f
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE68F1FC0C;
	Fri, 23 Feb 2024 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=u8l4nPsXSUxQi0togr1G0vcR7BGbtD6RecSZFUjjyK+cYXaE4dFMjESzaSUOwtCyEnujOb
	0EdaT0y563YN6d9gbXEKsYGAnd99JrowQEVu4nPF8mHMiA4qGnap11v34k++A+DudqSmIO
	6QnBrQFRWV7+jMje0OC1DtSzVn3WIiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=bNg3bM7fyhdXDLMLTpu8njqSDICXubLniwi/oMxjdXL6pu68eYkVKc4MtC8LNAz74NG3zX
	PgKygM2gD8Q/kvDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=u8l4nPsXSUxQi0togr1G0vcR7BGbtD6RecSZFUjjyK+cYXaE4dFMjESzaSUOwtCyEnujOb
	0EdaT0y563YN6d9gbXEKsYGAnd99JrowQEVu4nPF8mHMiA4qGnap11v34k++A+DudqSmIO
	6QnBrQFRWV7+jMje0OC1DtSzVn3WIiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAQRbMU5f4T82x1S4nkbfaux8n+LSQ2VUTwamqQhVZk=;
	b=bNg3bM7fyhdXDLMLTpu8njqSDICXubLniwi/oMxjdXL6pu68eYkVKc4MtC8LNAz74NG3zX
	PgKygM2gD8Q/kvDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B578B133DC;
	Fri, 23 Feb 2024 14:52:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FjsgKyGx2GWmGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 14:52:17 +0000
Date: Fri, 23 Feb 2024 15:52:17 +0100
Message-ID: <87le7b2py6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Willian Wang <kernel@willian.wang>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	soyer@irl.hu
Subject: Re: PCI SSID and Codec SSID collision?
In-Reply-To: <170869932581.7.612391552809015627.273152461@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.05)[87.73%]
Message-ID-Hash: G27CUOHSGX6M4RLAOOUO22TW53N4EMIE
X-Message-ID-Hash: G27CUOHSGX6M4RLAOOUO22TW53N4EMIE
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G27CUOHSGX6M4RLAOOUO22TW53N4EMIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 15:41:26 +0100,
Willian Wang wrote:
> 
> Hi, I'm curious about the reasons for the fixup table to be the same
> for PCI and Codec SSIDs and if the PCI SSID is usually more important
> for it to be checked before the Codec.

Sometimes the manufacturers are lazy and didn't check the conflict in
their own products :-<

> Anyway, would a simple
> conditional statement to match these exact PCI and Codec SSID to set
> the fixup manually be enough? There seems to already exist a manual
> fix for TX300 and ROG Strix G17 there (not the same kind of fix and
> with a FIXME comment, though). I have this exact laptop model and
> would like to try to contribute to the code if it's not too
> complicated.

Yes, that's my suggestion.  I don't have the data of the other
17aa:3802, but I guess it should have a different codec SSID.


thanks,

Takashi
