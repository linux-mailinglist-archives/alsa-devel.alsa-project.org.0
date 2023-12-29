Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE9822227
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A289EA6;
	Tue,  2 Jan 2024 20:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A289EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704224223;
	bh=wl4puxqyz2XJQv2hHw0yuQgJKUwlVwM17ay8xFkk0bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N/8Ye7cfaiMsf3Bncxt5OYTnnVRGSu1joHQa3r8o80TSeHglmtBdI6HhNvG4PmKcl
	 fW1JYBBGLtzUJmkvA9vutv70htGmsQy02hdxImuzok0UoMO/D0f7EvHShsh3XozvHk
	 9Qq14Qi6TETP9hOZvJlUXgtl2zhCGOnBqL2HK1Js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D065F80687; Tue,  2 Jan 2024 20:35:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5B4F80674;
	Tue,  2 Jan 2024 20:35:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E276F805C7; Tue,  2 Jan 2024 20:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C6B4F80424
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6B4F80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m95tDeGX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ch8mrKZJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=m95tDeGX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ch8mrKZJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2936721D37;
	Fri, 29 Dec 2023 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HwqCMucPmtHkjlFCwX+R+cA/MRClkUNqcPlGH8pUACg=;
	b=m95tDeGXpJ9nuqsH+YRKr7DYydUZyh4z2VaZ7AkiKyouBHkdr5w/NHIZ5Jt0/Y3MsJWAvN
	FMYdzyQJ8EKCZtwtXOwO5UKjrg5H3jIOi3gn0BwSvN4lZgKKsf92iexcEbg5ANuHLoGGLr
	4CcV7ke0CCccE506+F2pTrQ+8JyoJsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HwqCMucPmtHkjlFCwX+R+cA/MRClkUNqcPlGH8pUACg=;
	b=Ch8mrKZJLmbeIeDNpMlDXKoSqjw3l+dNigfug7w2Zdxaq0o0L61Jpy84sfeZ/Q3a2TLAfp
	MET4q2DtcxaQNdBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703862367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HwqCMucPmtHkjlFCwX+R+cA/MRClkUNqcPlGH8pUACg=;
	b=m95tDeGXpJ9nuqsH+YRKr7DYydUZyh4z2VaZ7AkiKyouBHkdr5w/NHIZ5Jt0/Y3MsJWAvN
	FMYdzyQJ8EKCZtwtXOwO5UKjrg5H3jIOi3gn0BwSvN4lZgKKsf92iexcEbg5ANuHLoGGLr
	4CcV7ke0CCccE506+F2pTrQ+8JyoJsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703862367;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HwqCMucPmtHkjlFCwX+R+cA/MRClkUNqcPlGH8pUACg=;
	b=Ch8mrKZJLmbeIeDNpMlDXKoSqjw3l+dNigfug7w2Zdxaq0o0L61Jpy84sfeZ/Q3a2TLAfp
	MET4q2DtcxaQNdBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB025133E5;
	Fri, 29 Dec 2023 15:06:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IInjL17gjmUGAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 15:06:06 +0000
Date: Fri, 29 Dec 2023 16:06:06 +0100
Message-ID: <87frzlxd41.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/23] ALSA: scarlett2: Refactor in preparation for gen4
In-Reply-To: <cover.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.00)[87.16%]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m95tDeGX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ch8mrKZJ
X-Rspamd-Queue-Id: 2936721D37
Message-ID-Hash: NNOVWTQLGWRAE2OCHDNB2RRFJTOP5EC5
X-Message-ID-Hash: NNOVWTQLGWRAE2OCHDNB2RRFJTOP5EC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNOVWTQLGWRAE2OCHDNB2RRFJTOP5EC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 24 Dec 2023 20:18:35 +0100,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This series is preparation for adding support for the Focusrite
> Scarlett 4th Gen devices. It applies on top of the previous series
> https://lore.kernel.org/linux-sound/cover.1703001053.git.g@b4.vu/
> "ALSA: scarlett2: Firmware Upgrade and Error Handling Improvements".
> 
> There should be no notable functional changes in this series, just
> refactoring/restructuring/renaming/reformatting.
> 
> Regards,
> Geoffrey.
> 
> Geoffrey D. Bennett (23):
>   ALSA: scarlett2: Simplify enums by removing explicit values
>   ALSA: scarlett2: Infer has_msd_mode from config items
>   ALSA: scarlett2: Infer standalone switch from config items
>   ALSA: scarlett2: Check for phantom persistence config item
>   ALSA: scarlett2: Check presence of mixer using mux_assignment
>   ALSA: scarlett2: Add config set struct
>   ALSA: scarlett2: Remove scarlett2_config_sets array
>   ALSA: scarlett2: Add check for config_item presence
>   ALSA: scarlett2: Refactor scarlett2_usb_set_config()
>   ALSA: scarlett2: Refactor scarlett2_config_save()
>   ALSA: scarlett2: Formatting fixes
>   ALSA: scarlett2: Parameterise notifications
>   ALSA: scarlett2: Change num_mux_* from int to u8
>   ALSA: scarlett2: Refactor common port_count lookups
>   ALSA: scarlett2: Remove struct scarlett2_usb_volume_status
>   ALSA: scarlett2: Split dim_mute_update from vol_updated
>   ALSA: scarlett2: Remove line_out_hw_vol device info entry
>   ALSA: scarlett2: Allow for interfaces without per-channel volume
>   ALSA: scarlett2: Add scarlett2_mixer_value_to_db()
>   ALSA: scarlett2: Add #define for SCARLETT2_MIX_MAX
>   ALSA: scarlett2: Rename db_scale_scarlett2_gain to volume
>   ALSA: scarlett2: Split input_other into level/pad/air/phantom
>   ALSA: scarlett2: Split direct_monitor out from monitor_other

Now applied all patches to topic/scarlett2 branch, which is merged to
for-next branch.

There was a wrong sha id reference in some fixes tag and I corrected
manually.


thanks,

Takashi
