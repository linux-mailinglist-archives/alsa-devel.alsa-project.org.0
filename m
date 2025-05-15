Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D8AB89BF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 16:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F9E56019B;
	Thu, 15 May 2025 16:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F9E56019B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747320395;
	bh=74Qh971M8DwHkjXGGRmVi5/RnEWzv5yFthlZZLCJHwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g3j2UVzbinmCgoudd76YRa1mk4HZZ3YknA749gLg7Pn5DIrVx7j+yKi1sCNL/sF0l
	 +EUvTfkn+GvT+Biu3utcRkrT6fNmrdrdAFUZoqu4TUpyvt9S5WvzhEC+XE5Brf6uKQ
	 1TuqVbNz9hZQhi/HmviBoIFSJ/+ST49UAV1gz3L0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55CE0F8003A; Thu, 15 May 2025 16:45:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B22AF80212;
	Thu, 15 May 2025 16:45:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D27F80075; Thu, 15 May 2025 16:45:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCB2BF8003C
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 16:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB2BF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Bf7/zhSO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hILGhTvO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Bf7/zhSO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hILGhTvO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B035B211AB;
	Thu, 15 May 2025 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747320352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk78gU1t1zN6RjxYrmRyssnBvygGFgLVXcN51a6/X8w=;
	b=Bf7/zhSOyK5+ncv0WY8tazcUzZQgQXjHlCz2hZ7UK8Mfg7F/Mwv2vCT827Wm6b8k+BeL/Q
	TNggIiGSzMsWaU9EGmLL0jGQASLzApV6GuzdWeJdCvpPeqHKuwML6Ma5XIcBuGhF9sZH8a
	T1v37GJZgvm4t3cJ0aAFiqqzBeAvus8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747320352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk78gU1t1zN6RjxYrmRyssnBvygGFgLVXcN51a6/X8w=;
	b=hILGhTvOhDUvA0bEoYNyjTV/rVZcW8YnxR3gPMwGcxkmP04zqzdX3jQ4WvB23ikBxJebyW
	1oRRETvYQI65l0DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Bf7/zhSO";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hILGhTvO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747320352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk78gU1t1zN6RjxYrmRyssnBvygGFgLVXcN51a6/X8w=;
	b=Bf7/zhSOyK5+ncv0WY8tazcUzZQgQXjHlCz2hZ7UK8Mfg7F/Mwv2vCT827Wm6b8k+BeL/Q
	TNggIiGSzMsWaU9EGmLL0jGQASLzApV6GuzdWeJdCvpPeqHKuwML6Ma5XIcBuGhF9sZH8a
	T1v37GJZgvm4t3cJ0aAFiqqzBeAvus8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747320352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk78gU1t1zN6RjxYrmRyssnBvygGFgLVXcN51a6/X8w=;
	b=hILGhTvOhDUvA0bEoYNyjTV/rVZcW8YnxR3gPMwGcxkmP04zqzdX3jQ4WvB23ikBxJebyW
	1oRRETvYQI65l0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F1AA13A3E;
	Thu, 15 May 2025 14:45:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qYSGISD+JWgZOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 May 2025 14:45:52 +0000
Date: Thu, 15 May 2025 16:45:52 +0200
Message-ID: <87r00qx78f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda - Add new driver for HDA controllers listed via
 ACPI
In-Reply-To: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B035B211AB
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,nvidia.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
Message-ID-Hash: D2I3LFPTV5L3AP6HK332JIWUNTHF4P6D
X-Message-ID-Hash: D2I3LFPTV5L3AP6HK332JIWUNTHF4P6D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2I3LFPTV5L3AP6HK332JIWUNTHF4P6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 May 2025 15:31:46 +0200,
Daniel Dadap wrote:
> 
> Some systems expose HD-Audio controllers via objects in the ACPI tables
> which encapsulate the controller's interrupt and the base address for the
> HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> table dump excerpt:
> 
>         Device (HDA0)
>         {
>             Name (_HID, "NVDA2014")  // _HID: Hardware ID
>             ...
>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>             {
>                 Memory32Fixed (ReadWrite,
>                     0x36078000,         // Address Base
>                     0x00008000,         // Address Length
>                     )
>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>                 {
>                     0x0000021E,
>                 }
>             })
>         }
> 
> Add support for HDA controllers discovered through ACPI, including support
> for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> is done with a new driver which uses existing infrastructure for extracting
> resource information from _CRS objects and plumbs the parsed resource
> information through to the existing HDA infrastructure to enable HD-Audio
> functionality on such devices.
> 
> Although this driver is in the sound/pci/hda/ directory, it targets devices
> which are not actually enumerated on the PCI bus. This is because it depends
> upon the Intel "Azalia" infrastructure which has traditionally been used for
> PCI-based devices.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>

Thanks for the patch.
The code looks fine.  Just a nitpicking:

> +static int __maybe_unused hda_acpi_suspend(struct device *dev)
....
> +static int __maybe_unused hda_acpi_resume(struct device *dev)

The __maybe_unused is superfluous when you set up
SYSTEM_SLEEP_PM_OPS() macro instead in the below:

> +static const struct dev_pm_ops hda_acpi_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)


thanks,

Takashi
