Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1697CBC80
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 09:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D933591;
	Tue, 17 Oct 2023 09:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D933591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697528624;
	bh=hdE/np0BUad6r26x/ANSm/odkdFKoeb20ioyIcm9MFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FpynCc2vfOGCHCPFcuepfGUiy31x+rsA4dy4zo/t5kpsWYqXse7x7npepML8GIqyt
	 o2X0uGGe13JQoFNHx2x2lNN7vPihnbwrE7Mlghs2ypOTqiZk7HIyY6/wCZsexA0mrz
	 FGp1kDNjIJUTYkhQSl3pVzSOLBA3C8INPTyFkHyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5239DF80236; Tue, 17 Oct 2023 09:42:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14233F8024E;
	Tue, 17 Oct 2023 09:42:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6FFAF8025F; Tue, 17 Oct 2023 09:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60EA4F80236
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 09:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EA4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=M4FYJHew;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NtW7asO1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C2542185C;
	Tue, 17 Oct 2023 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697528414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jVLyiSP4s0bF9z2akj2px9JdCkwQeGZRvv/rc1Rk7A=;
	b=M4FYJHewy/s14EGvq89jm3OxkcFAnchhYQDDnu3gDoKd2FvofAlqpa4XL818+SB1ooGsNj
	zA0HoljmhOVTFYFYA87lOMTFTJ3Fn9lX1ORUv4SkmMRCoR2g/3zj0M4NhMjL8V0jaup4yE
	weyt5T8BZLmQYGfWRAqToRd8aO0c83A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697528414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jVLyiSP4s0bF9z2akj2px9JdCkwQeGZRvv/rc1Rk7A=;
	b=NtW7asO1zD5ngygR3W5/J6uAKRwDa5QEXJUSpGIe0hb9PlTFvdnD5hMbNkROOezRc28MmA
	MQGTvvXMrS2a7fDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44C5E13597;
	Tue, 17 Oct 2023 07:40:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NBPfD146LmUVMQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 17 Oct 2023 07:40:14 +0000
Date: Tue, 17 Oct 2023 09:40:13 +0200
Message-ID: <87il75n1cy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Artem Borisov <dedsa2002@gmail.com>
Cc: perex@perex.cz,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for ASUS ROG GU603ZV
In-Reply-To: <20231014075044.17474-1-dedsa2002@gmail.com>
References: <20231014063458.13474-1-dedsa2002@gmail.com>
	<20231014075044.17474-1-dedsa2002@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.39)[77.39%]
Message-ID-Hash: VHSMAZAXSPUA7XLIMP7JEMA22WHIGWI3
X-Message-ID-Hash: VHSMAZAXSPUA7XLIMP7JEMA22WHIGWI3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHSMAZAXSPUA7XLIMP7JEMA22WHIGWI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 14 Oct 2023 09:50:42 +0200,
Artem Borisov wrote:
> 
> Enables the SPI-connected Cirrus amp and the required pins
> for headset mic detection.
> 
> As of BIOS version 313 it is still necessary to modify the
> ACPI table to add the related _DSD properties:
>   https://gist.github.com/Flex1911/1bce378645fc95a5743671bd5deabfc8
> 
> Signed-off-by: Artem Borisov <dedsa2002@gmail.com>

Thanks, applied now.


Takashi
