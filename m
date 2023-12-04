Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BD80366A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 15:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5DCADEB;
	Mon,  4 Dec 2023 15:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5DCADEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701699826;
	bh=SVGAxWVVePJlUC+cYHKsluKofP5g0jDJm69WZhbbJSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZzLc//6orlVs1bzNOTT3Fgcd/iq9UWnOW2ApOhzRpJ/AWJXPdplz2L6OpsDcMIcDA
	 XTw0ozzO6ysl639NOKPQDA3oSdMTMDyvVWwSi/f+EQtaRKcejS4B1VnopfhkXr/9zB
	 HprFE071I0qmThycGoKOUq/XS6NUCI0BXRy4gHrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB62F80563; Mon,  4 Dec 2023 15:23:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34386F80557;
	Mon,  4 Dec 2023 15:23:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF18FF8025F; Mon,  4 Dec 2023 15:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15FADF800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 15:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FADF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bRS/rmqU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5AaLFg+j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E72C1FD50;
	Mon,  4 Dec 2023 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701699808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8U2AIg58z9ZmlkzVFYnzhlncDZKBMFYAg8sEj1uPRs=;
	b=bRS/rmqUH9rBjPfKLaLauWOKlbhNKTEagFrD3e9RBGzXHenAlS5SdOo60wYYJLGRYacjaL
	UNFJ8K505rZdDKge6HG2MjjRL6NEuXPcCIwMoDGM6MCwXeaAIePWeiOJ26AmR7WBdga5Ak
	jbc0iQhoXNphYVf9E5ADcbfq/wupXl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701699808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d8U2AIg58z9ZmlkzVFYnzhlncDZKBMFYAg8sEj1uPRs=;
	b=5AaLFg+jLF9ZSLWTjdnun18vrmZmxOqFPZ4RZQHTQET4c0o5N4AZw8rHahDDxDbSgAMWCB
	ZB4oDv+4AnU5qKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32515139AA;
	Mon,  4 Dec 2023 14:23:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yYqdCuDgbWXbNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Dec 2023 14:23:28 +0000
Date: Mon, 04 Dec 2023 15:23:27 +0100
Message-ID: <87plzm82sg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	vitalyr@opensource.cirrus.com,
	kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix speakers on XPS 9530 (2023)
In-Reply-To: <20231203233006.100558-1-alex.vinarskis@gmail.com>
References: <20231203233006.100558-1-alex.vinarskis@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.65 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-0.75)[84.03%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: BBEKX5AYULTEEON4O7DVWXVMKTLQDIR2
X-Message-ID-Hash: BBEKX5AYULTEEON4O7DVWXVMKTLQDIR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBEKX5AYULTEEON4O7DVWXVMKTLQDIR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Dec 2023 00:30:06 +0100,
Aleksandrs Vinarskis wrote:
> 
> XPS 9530 has 2 tweeters and 2 subwoofers powered by CS35L41 amplifier, SPI
> connected. For subwoofers to work, it requires both to enable amplifier
> support, and to enable output to subwoofers via 0x17 quirk (similalry to
> XPS 9510/9520).
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Thanks, applied now.


Takashi
