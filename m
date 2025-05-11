Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB30AB7F31
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4099561DFB;
	Thu, 15 May 2025 09:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4099561DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294906;
	bh=HnEqXwiVw3bl51cWovfh2/KIAvoFgFb3RwzAijIzVyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apxsH4cwAW+5ek94za1HBDm1gLi9s/eEFxpASbWN4hl1ccJsmEgrdRMXztfj0xUN+
	 beic3TT+Ioz8hTj5X2nM0Y5csImtPkjktd2XcxBZkMhOIewZU36mDsUhxZvGLlMBm8
	 7QE7Dzd/4WFGRJUt/J9iNK1Soyd+mrM3s90tegdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A23F8085D; Sun, 11 May 2025 16:23:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AAEAF80863;
	Sun, 11 May 2025 16:23:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A841F80845; Sun, 11 May 2025 16:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34430F802BE
	for <alsa-devel@alsa-project.org>; Sun, 11 May 2025 16:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34430F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kjb5Yoil;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oI+5bl0y;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Q+hTH4pN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZNfc/3NB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA9191F390;
	Sun, 11 May 2025 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1746973383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcjOBZCdKl4jR1EgfHphKYtc6Ep5lxvkfCxJXp2aS88=;
	b=kjb5YoilNyUo1jYsW3qMobKNi1k6XIxM6GRiP3qg1wmIrjiLhib32e2VctoABtLoWOV+9X
	gynqODYyiOOIlIrHbZOj/rtPb/o7ZaZfoHTdA3kBFvNCpY+2cMHuR39KP15dbSrRxVREPn
	QYOQnM8RsAnx3Pf6cst3nBRPfceV2ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcjOBZCdKl4jR1EgfHphKYtc6Ep5lxvkfCxJXp2aS88=;
	b=oI+5bl0yWGVhwEDV4CRANFudmlgqzB7FSRhQICaWtbcwgK1L46Ay5KC5Vq+TVn4F/jSxsG
	jBrKc7r7VSYHtpDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q+hTH4pN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ZNfc/3NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1746973382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcjOBZCdKl4jR1EgfHphKYtc6Ep5lxvkfCxJXp2aS88=;
	b=Q+hTH4pNil5gI9bpjmpu5wtWFnq+cBx1SvJxgFKNaME4dF/h3Y0fg0wFW46yRu9wXMeJ80
	9XoKn5CG0JpQuJ4PWUQsHvY85kkGP5aAmdqtJUH8f37EdMGPSsDJQmPLnV5ef9H62tvRUt
	De/CB0Jm6k7YgQGHL+a+DbqixQb2Yro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746973382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcjOBZCdKl4jR1EgfHphKYtc6Ep5lxvkfCxJXp2aS88=;
	b=ZNfc/3NBJjD//QNG7jZWDyGY6w7NCcJpRcmSkuQg9b+4JcN0Yw2tt7J/83J2yRI4wmuJ9z
	6Pi+Ij9lHoNDAZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 886B813690;
	Sun, 11 May 2025 14:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iyi9H8ayIGjDcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 May 2025 14:23:02 +0000
Date: Sun, 11 May 2025 16:23:02 +0200
Message-ID: <87ldr3xm49.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?= <konference@frantovo.cz>
Cc: alsa-devel@alsa-project.org,	=?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?=
 <franta-linux@frantovo.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Rename Pioneer mixer channel controls
In-Reply-To: <87msbjxmew.wl-tiwai@suse.de>
References: <20250508192223.4847-1-konference@frantovo.cz>
	<87msbjxmew.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA9191F390
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: PB3LMNDKTC2RIQXMCZUZAOWEFN4LVMQE
X-Message-ID-Hash: PB3LMNDKTC2RIQXMCZUZAOWEFN4LVMQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PB3LMNDKTC2RIQXMCZUZAOWEFN4LVMQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 11 May 2025 16:16:39 +0200,
Takashi Iwai wrote:
> 
> On Thu, 08 May 2025 21:22:23 +0200,
> Franti¹ek Kuèera wrote:
> > 
> > From: Franti¹ek Kuèera <franta-linux@frantovo.cz>
> > 
> > so alsamixer can show the controls in correct categories: capture/playback
> > 
> > Signed-off-by: Franti¹ek Kuèera <franta-linux@frantovo.cz>
> 
> Applied now.  Thanks.

... on the second thought, I'm not sure whether the proposed new names
are the best choice.  Now we see "Capture" and "Playback" twice for
ChX switches (also for Master switch, too):

+	SND_DJM_CTL("Master Capture Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Capture Ch1 Capture Switch",  250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Capture Ch2 Capture Switch",  250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Capture Ch3 Capture Switch",  250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Playback Ch1 Playback Switch", 250mk2_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Playback Ch2 Playback Switch", 250mk2_pb2, 1, SND_DJM_WINDEX_PB),
....

I guess your intention to make the differences clearer, but still it
leaves me some itch feeling.

And now I noticed that you've submitted to a wrong list.  The kernel
patches should be sent to linux-sound@vger.kernel.org, not alsa-devel.
So I drop the patch for now.

Let me know if you believe this is the best naming, or if you have any
other proposals.  And for the next patch, please submit to linux-sound
ML instead.


thanks,

Takashi
