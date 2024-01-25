Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6283C515
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 15:46:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D14825;
	Thu, 25 Jan 2024 15:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D14825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706194004;
	bh=bfVt/Qp6nnFYjEv4fNujG3FRQZPxd9dF8Ktl3posgQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ogY2uCJUjIL8ywIIdWEtn8QLK22yPiJEsmrpzh59gYNNrLaadB1sENWJ3h8vHsXge
	 XBp4ILB8o4JnobYdpUjS87VhUFOAsGLT8DhmUbKaBNrBrsNEiuUB2gI7qudpyp/cCy
	 wT0pNIydq0Cwo9XmT2OHY1HX7qq0oR1wd40WsSwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60AAF80587; Thu, 25 Jan 2024 15:46:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F8AF80570;
	Thu, 25 Jan 2024 15:46:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 271F1F8028D; Thu, 25 Jan 2024 15:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A697F800C1
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 15:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A697F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=chmcbZXQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p93GcxoR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=chmcbZXQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p93GcxoR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DD9821F23;
	Thu, 25 Jan 2024 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706193957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DGm5WEZ37sgB5OWaEWo1WkYoug1DC2BQn8LeaNqX+Ao=;
	b=chmcbZXQpKrAJZflIygDobgKzyQAoUQxbISJAjG07DAI8FXXiMmH81sfqiB1jASWRiSSxm
	mmIGcwGJitRIOCTlbWUkP2Y5gWGJBafgtj/2CnU6WL4Lx9JImhu03oTbMvYZKkGs/AhESK
	M4gEsitqcU0zF85s7VFudrWZadSj5F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706193957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DGm5WEZ37sgB5OWaEWo1WkYoug1DC2BQn8LeaNqX+Ao=;
	b=p93GcxoR2gnRAhMlSO4mxOnDD/ATtxJFuWBCY/f8eNTKFuzO/NyeMh4wJsYqAsmLGlOfzD
	hl6hHO8s1ozd4FAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706193957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DGm5WEZ37sgB5OWaEWo1WkYoug1DC2BQn8LeaNqX+Ao=;
	b=chmcbZXQpKrAJZflIygDobgKzyQAoUQxbISJAjG07DAI8FXXiMmH81sfqiB1jASWRiSSxm
	mmIGcwGJitRIOCTlbWUkP2Y5gWGJBafgtj/2CnU6WL4Lx9JImhu03oTbMvYZKkGs/AhESK
	M4gEsitqcU0zF85s7VFudrWZadSj5F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706193957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DGm5WEZ37sgB5OWaEWo1WkYoug1DC2BQn8LeaNqX+Ao=;
	b=p93GcxoR2gnRAhMlSO4mxOnDD/ATtxJFuWBCY/f8eNTKFuzO/NyeMh4wJsYqAsmLGlOfzD
	hl6hHO8s1ozd4FAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D31C134C3;
	Thu, 25 Jan 2024 14:45:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4D6IECV0smV1WQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jan 2024 14:45:57 +0000
Date: Thu, 25 Jan 2024 15:45:56 +0100
Message-ID: <87sf2lii8r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<perex@perex.cz>,
	<linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirks for HP G11 Laptops using
 CS35L56
In-Reply-To: <20240125123301.41692-1-rf@opensource.cirrus.com>
References: <20240125123301.41692-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.79 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.11)[66.18%]
Message-ID-Hash: L4R3RTVOFBI7QO4QVQRBNTTH355I6GBE
X-Message-ID-Hash: L4R3RTVOFBI7QO4QVQRBNTTH355I6GBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4R3RTVOFBI7QO4QVQRBNTTH355I6GBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jan 2024 13:33:01 +0100,
Richard Fitzgerald wrote:
> 
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> Add quirks for two HP G11 laptops that use a Realtek HDA codec combined
> with four CS35L56 amplifiers using SPI.
> 
> The CS35L56 driver uses the component binding interface, so uses the same
> setup code as the CS35L41 quirks.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied.


Takashi
