Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C88612C8
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 14:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E770793A;
	Fri, 23 Feb 2024 14:34:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E770793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708695288;
	bh=oUxqSzZqQBYpocUGl1L/RrfzZGEAqSdrli9rsNXnAEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rfVW0StJBi9aNmc9CZIksZre5gNz6r3+cWBHZ/LE4HgzT4Wi6vTPoYGHuG7bIJoll
	 8Jj+Q5oAG+93xdKTVApvVzpVKNHMN0WApoPmnIMDl0qLB2U7S0ujHns2vzLBAyouzf
	 w8+qYaKi8g2F8JQBB/MnrTbHnXsOoM/4OmCc1Xfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 984C1F8059F; Fri, 23 Feb 2024 14:34:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6761DF805A1;
	Fri, 23 Feb 2024 14:34:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34259F80496; Fri, 23 Feb 2024 14:34:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB2C3F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 14:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2C3F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sQOGblkp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=//qkOW96;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=sQOGblkp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=//qkOW96
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99DB51F7AF;
	Fri, 23 Feb 2024 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708695222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy9QEdTXAj64w03PMB8hpvq3C4fgdJIvBJUiHqeCNKs=;
	b=sQOGblkpudeS/4GVdYO+y0hfRHjGaS7DtI/EnNv/KSA+SCT57X8lkNvhpsFlkURQoIT1PX
	TCuKiNYMXBzPNwu02XHUOozDQKVkFIlpAHfNAYfZGFFEQNPlFgHfBZ7SZXzpLXREQ5mxwD
	onad0O8k+eR7QwMQsAKRNe3pdENv040=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708695222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy9QEdTXAj64w03PMB8hpvq3C4fgdJIvBJUiHqeCNKs=;
	b=//qkOW966GRBJzkU2tmypU/yzAVNh+/8vKquYBxXQvmyVVCFoh/4fnprfPCKNObLLjmP/A
	w/oFQsoXgYc0d5DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708695222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy9QEdTXAj64w03PMB8hpvq3C4fgdJIvBJUiHqeCNKs=;
	b=sQOGblkpudeS/4GVdYO+y0hfRHjGaS7DtI/EnNv/KSA+SCT57X8lkNvhpsFlkURQoIT1PX
	TCuKiNYMXBzPNwu02XHUOozDQKVkFIlpAHfNAYfZGFFEQNPlFgHfBZ7SZXzpLXREQ5mxwD
	onad0O8k+eR7QwMQsAKRNe3pdENv040=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708695222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy9QEdTXAj64w03PMB8hpvq3C4fgdJIvBJUiHqeCNKs=;
	b=//qkOW966GRBJzkU2tmypU/yzAVNh+/8vKquYBxXQvmyVVCFoh/4fnprfPCKNObLLjmP/A
	w/oFQsoXgYc0d5DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5756A132C7;
	Fri, 23 Feb 2024 13:33:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9TTVE7ae2GXyBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 13:33:42 +0000
Date: Fri, 23 Feb 2024 14:33:41 +0100
Message-ID: <87v86f2tl6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: tas2781: enable subwoofer volume
 control
In-Reply-To: 
 <7ffae10ebba58601d25fe2ff8381a6ae3a926e62.1708687813.git.soyer@irl.hu>
References: 
 <7ffae10ebba58601d25fe2ff8381a6ae3a926e62.1708687813.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.27 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.97)[99.87%]
Message-ID-Hash: W673J2DTVPSRIILFRCXDGSXG5VZDMVY3
X-Message-ID-Hash: W673J2DTVPSRIILFRCXDGSXG5VZDMVY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W673J2DTVPSRIILFRCXDGSXG5VZDMVY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 12:34:30 +0100,
Gergo Koteles wrote:
> 
> The volume of subwoofer channels is always at maximum with the
> ALC269_FIXUP_THINKPAD_ACPI chain.
> 
> Use ALC285_FIXUP_THINKPAD_HEADSET_JACK to align it to the master volume.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=208555#c827
> 
> Fixes: 3babae915f4c ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied.


Takashi
