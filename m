Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481559D9709
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 13:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7D02119;
	Tue, 26 Nov 2024 13:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7D02119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732623043;
	bh=/1y83Td9M4tOTKdDsyGfpNHFzq+PMl1SjVdW+T+HxxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMsjRokReBbg/XVFB4Q2+CK76N16YXFpT3J1aSr5KO8xmmpFZEPfeCOg1XQrQh+0R
	 +lrG3RM65/poyKquFSR9gFPFmvL8cgV8PMtBV8Zpa/JVCudS/lQmJ/16BpXEWPB1QW
	 dTqTKqslyMAELXFKdXGLJP9cRn3lLevb0+gd5pd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29286F805BB; Tue, 26 Nov 2024 13:10:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB4EF805C1;
	Tue, 26 Nov 2024 13:10:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25816F80496; Tue, 26 Nov 2024 13:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40352F80073
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 13:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40352F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lkMRD1q4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9OlZlmbw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W6XmP89C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NEFWzymq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 060F621170;
	Tue, 26 Nov 2024 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732623012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlYEY0YG2Almte6alCF7P+MUnOsSIhlVQ+0gyLFnUZ4=;
	b=lkMRD1q4JOQNDK2orcOLvVyw1KcKHmpqxldLrJZRTC16JSAv01mGoWGFu6j0RP4pZ3Iq9i
	4+te/K8H4zfnJRc1cm0wvcJPvo9aANnpu3XPDkMzpcW+ozUFCYnuFNcipDL3gJ5iBAclRh
	Iea1TipZhpRNxDRaWQj2ZvD/8rmilTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732623012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlYEY0YG2Almte6alCF7P+MUnOsSIhlVQ+0gyLFnUZ4=;
	b=9OlZlmbwgE/eId209Q2QzN2DvBMhzAPKotNSdoiKnBtaEENMbnRh/+u52yH9dxa1DSOeQd
	Ex739QYd8SrOoVBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W6XmP89C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NEFWzymq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732623011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlYEY0YG2Almte6alCF7P+MUnOsSIhlVQ+0gyLFnUZ4=;
	b=W6XmP89CFLlgWpeEZubMS+BHwsEWDnrnHdFAUeS5j2yLJCub3to+2Mz2qLW836gEcFaOB8
	iYNF95asqinUFZjcKTFkhO9/5a5I44E5UUG1ZStDDS7B3u4KgAVdOxlkp/3BjPqFJrPRIh
	eVVVBrM6NWQKkqC2qc7g+Tf3w8ZXihw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732623011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NlYEY0YG2Almte6alCF7P+MUnOsSIhlVQ+0gyLFnUZ4=;
	b=NEFWzymqOevqaIKKhPCzbXo/UJ1o1ZRTpkW79iQ+WDpfy7cB7LAjfGx1w59uSPWrLFxVB1
	AiGE6/9NS1BQfWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED68E139AA;
	Tue, 26 Nov 2024 12:10:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qw1jOaK6RWeMSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 12:10:10 +0000
Date: Tue, 26 Nov 2024 13:10:10 +0100
Message-ID: <87mshmjivx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lentczner <mark@glyphic.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: kernel snd seq bugs: SND_SEQ_EVENT_CLIENT_CHANGE &
 SND_SEQ_EVENT_PORT_CHANGE
In-Reply-To: 
 <CAPnksqRAciV=ihW4e7mT=HY6VzpsAjn4GFx-_YOfPWXfu26JTg@mail.gmail.com>
References: 
 <CAPnksqRok7xGa4bxq9WWimVV=28-7_j628OmrWLS=S0=hzaTHQ@mail.gmail.com>
	<87bjy3zmaz.wl-tiwai@suse.de>
	<CAPnksqRAciV=ihW4e7mT=HY6VzpsAjn4GFx-_YOfPWXfu26JTg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 060F621170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: S6GIRVFA242SZM7RX2GPXHSD5TQXQKS4
X-Message-ID-Hash: S6GIRVFA242SZM7RX2GPXHSD5TQXQKS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6GIRVFA242SZM7RX2GPXHSD5TQXQKS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Nov 2024 19:55:00 +0100,
Mark Lentczner wrote:
> 
> 
> Looking at the items that can be changed with client info, or port info, I
> think there is little likelihood that applications are going to be changing
> this information more than once in the lifetime of a client, or a port.
> 
> So far, my application hasn't detected any changes to port information after
> it starts tracking a port (though it doesn't track everything about a port.)
> This is certainly because the port info is given at the time of port creation.
> Of the several DAWs that I tested, when you change their MIDI configuration -
> rather than change the port info of their existing ports, they simply delete
> them all, and recreate the ports as needed, which is broadcasting PORT_EXIT
> and PORT_START events anyway.   In either case, this isn't a broadcast concern
> as these events are relatively rare.
> 
> Client info is a bit different, as you must create your client first, then set
> info. So the CLIENT_START event would be followed by one or more CLIENT_CHANGE
> events. This is exacerbated because the helper functions for setting client
> name, event filter, etc... which each get the client info, set one field, and
> set the info back. So true, this change would cause a broadcast of a few
> events each time a client is created... But again, in the scheme of things,
> client creation is a relatively rare occurrence.
> 
> In the absence of these events, applications like mine, have to periodically
> poll every client info and every port info to see if anything that they care
> about (like client name or port name) has changed. For now, since port info
> changes (at least of name or capabilities) is essentially non-existent, my
> application doesn't bother to poll ports. And for clients, since the changes
> only happen right after client start, my application simply sleeps a short
> interval after getting CLIENT_START, before reading the client info, giving
> the client process time to set the info up. Clearly this isn't optimal or
> infalible - but in practice it works, and polling info frequently seems too
> high a cost.

Actually it's only the deliveries per subscription, hence the message
transmissions aren't too high.  We can optimize a bit in the case
where no subscription is done to the announcement port, but that's
another story.

> Lastly, there IS one place in the code where PORT_CHANGE is sent. In
> seq_ump_client.c in the function update_port_infos(). In that case,
> interestingly, a port_info change is only considered if and only if the name
> or the capability fields are changed. That logic could be applied to your
> patch - but given how infrequent I suspect port (or client) changes are, it
> seems presumptive to be limiting what field changes an application would be
> interested in.

Yes, that's possible, but I don't think it's worth for complication;
the call patterns of client and port info ioctls are usually for
really updating the attributes from applications.  OTOH, in the recent
UMP code, I implemented the check because it may driven by the device
firmware, hence it's not really predictable.

That being said, I'm fine to apply the change, but I hesitate to do so
for the current 6.13 merge window.  I'm going to submit (and likely
merge) the patch for 6.14 once after 6.13 merge window is closed in
the next week.


thanks,

Takashi
