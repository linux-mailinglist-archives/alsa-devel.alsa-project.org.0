Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786848287D6
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 15:14:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A47EAB;
	Tue,  9 Jan 2024 15:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A47EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704809675;
	bh=6xFPYih35/poGcTQx3G0DEOkKlYzmCrwNB66jo1gvp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bJgaZn5kDVlRl/iVQwynOfVi7J+puYlqs3swPf4fKjYSPWn1pVoJa59Ej4gqN3l5U
	 zefO9AH1IumT7UhMep7bmuV1u6HFeKSuBVcj3r7CoF/EtYIoj34Q6Q7S+hN57kLt65
	 KU+ovWkR36/jPelbghtWmAXGXZtChE03loy55FIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 781CCF8058C; Tue,  9 Jan 2024 15:14:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFA5F8057F;
	Tue,  9 Jan 2024 15:14:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 905AEF80254; Tue,  9 Jan 2024 15:13:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C1D6DF8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 15:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D6DF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zgE6ROAX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rdyqfgWD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=uG//rdsp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jF1thjI2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF13E1F806;
	Tue,  9 Jan 2024 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704809631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpa4DDcUFck9COiGV1cpqENWfAxZcIO+P3YbLq2DPTw=;
	b=zgE6ROAXhe1eVKpqJ/3aZCJA6gAP1+Kxc20TSW/MT50LImr2L+IiYf2cyoUm8tp5QHB1b5
	QZZOrF7ELRAsR5/upPaJMT3yGrU/dpVAHmy/QyjbIdDLfZ9zF0ZFg+whTf1Z9JO9t7qbT/
	OL/JueVdw0c8uGDjlRafp6J28fPqz2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704809631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpa4DDcUFck9COiGV1cpqENWfAxZcIO+P3YbLq2DPTw=;
	b=rdyqfgWDCE5RrzbTRi8gIyVf9Ue48YTLO8q7piNDOk9EN3lIAJSlS2j5k3j7YORWnWblr2
	M+IGh3O3uZ096kCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704809630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpa4DDcUFck9COiGV1cpqENWfAxZcIO+P3YbLq2DPTw=;
	b=uG//rdspZ85/CJGw21d6Q7HcwBQosT8Glqofv25l10s2Qy6uDVv1LC8nN9KH0Zn0B4vozh
	Gp0WmLHkAR9kz2Ff+QSBQm7N1OtKykIO27x9iB3LGoNh1VQ3GCdNc5IlCuZLtOYn8hWxVw
	L81rjbYOH/9pR5ui1p1J+F/RVR7nxyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704809630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpa4DDcUFck9COiGV1cpqENWfAxZcIO+P3YbLq2DPTw=;
	b=jF1thjI2BpYUw5JwyFDwsEHARJqmxWsXkayV8Fq/SvexUTuFlWJea227wKJny9vNAdyCAv
	MzUQBq8XLEHYJLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C476134E8;
	Tue,  9 Jan 2024 14:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tPq4IJ5UnWU6BgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jan 2024 14:13:50 +0000
Date: Tue, 09 Jan 2024 15:13:50 +0100
Message-ID: <87mster3vl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: annotate calibration data endianness
In-Reply-To: 
 <3852ff28ea7d5d8f2086d8dd78aeff8d1d984991.1704748435.git.soyer@irl.hu>
References: 
 <3852ff28ea7d5d8f2086d8dd78aeff8d1d984991.1704748435.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.46 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.74)[98.87%]
Message-ID-Hash: NGK47GQSXK4HE5XAZSGAV3FJZLAUIWCS
X-Message-ID-Hash: NGK47GQSXK4HE5XAZSGAV3FJZLAUIWCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGK47GQSXK4HE5XAZSGAV3FJZLAUIWCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Jan 2024 22:16:46 +0100,
Gergo Koteles wrote:
> 
> Sparse reports an endian mismatch.
> The amplifier expects the calibration data as big-endian.
> Use the __be32 type to express endianness better.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401072137.Oc7pQgRW-lkp@intel.com/
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied with the additional Fixes tag to the commit.


Takashi
