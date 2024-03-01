Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EDC86DF91
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 11:46:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8485384D;
	Fri,  1 Mar 2024 11:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8485384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709290005;
	bh=zszUyF266ng/hXxyr5+07mO2Ql+JnoLnNmnKe3SVoLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tm7Slu7ObvzVwtCHrQMKXkWiQNw/BjOj8vmlggKFt8IKRMiNK1wmRovgRW843arBX
	 ArJnSQXpMqGX7CFDjfUUEdInavwQr2R2BsLQyNltSV+2MegLwNqr7z6fcFFAie2gFd
	 oO4K3JanFsnoCEPWWzpsHII8fxFHZcEwPa0eceMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6B5EF805AF; Fri,  1 Mar 2024 11:46:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C35F8059F;
	Fri,  1 Mar 2024 11:46:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FB9FF801C0; Fri,  1 Mar 2024 11:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2A2AF80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 11:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A2AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SHwkx1D4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KIkI49Y3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=SHwkx1D4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KIkI49Y3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD87720195;
	Fri,  1 Mar 2024 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709289960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP4v+yYn5B2sX6zhnZPFDxmJi0F3whO2cXQf85vWvFo=;
	b=SHwkx1D4yops0Bm9AHJl/aa5fQC1GkVNfjfy4tyzgfjCxgwbdqadTimoEcuQIDmFFUFZIv
	UvKDGdmyWv2bLL7SMmfHzinLRnSpymIKj1VNweYNw4zqPTwrTfLe0AiJ4wDUXrNXA3tTiL
	ahWVhvluBoqGE03J4rWpWGe+ksWS83c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709289960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP4v+yYn5B2sX6zhnZPFDxmJi0F3whO2cXQf85vWvFo=;
	b=KIkI49Y3Kep5aACTJRqRYropEQ3VzPoUjO8psClVmM4eqjrsdaoZw7xrzNiK1quRBSnC0W
	ls4NO2IjqSTQApBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709289960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP4v+yYn5B2sX6zhnZPFDxmJi0F3whO2cXQf85vWvFo=;
	b=SHwkx1D4yops0Bm9AHJl/aa5fQC1GkVNfjfy4tyzgfjCxgwbdqadTimoEcuQIDmFFUFZIv
	UvKDGdmyWv2bLL7SMmfHzinLRnSpymIKj1VNweYNw4zqPTwrTfLe0AiJ4wDUXrNXA3tTiL
	ahWVhvluBoqGE03J4rWpWGe+ksWS83c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709289960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DP4v+yYn5B2sX6zhnZPFDxmJi0F3whO2cXQf85vWvFo=;
	b=KIkI49Y3Kep5aACTJRqRYropEQ3VzPoUjO8psClVmM4eqjrsdaoZw7xrzNiK1quRBSnC0W
	ls4NO2IjqSTQApBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA46C13A59;
	Fri,  1 Mar 2024 10:46:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L9FTKOix4WVRMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Mar 2024 10:46:00 +0000
Date: Fri, 01 Mar 2024 11:46:00 +0100
Message-ID: <87cyse5ixj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Headset Mic no show at resume back
In-Reply-To: <4713d48a372e47f98bba0c6120fd8254@realtek.com>
References: <4713d48a372e47f98bba0c6120fd8254@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.93 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.83)[99.26%]
Message-ID-Hash: 43VHGLAEOBYA6W5PQYRKHMHRHPPXUYBT
X-Message-ID-Hash: 43VHGLAEOBYA6W5PQYRKHMHRHPPXUYBT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43VHGLAEOBYA6W5PQYRKHMHRHPPXUYBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Mar 2024 09:12:41 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will fix headset Mic no show issue.

Thanks, applied now.


Takashi
