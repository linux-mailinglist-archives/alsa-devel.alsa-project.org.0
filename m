Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86FAB96F3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 09:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948A9601A1;
	Fri, 16 May 2025 09:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948A9601A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747382216;
	bh=ZRTjwmJw/eZLPcLrmLOjzPFOiZjJLbc0M2yb+OSSGvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5bQK4fr6GsPxn1kuhg/wfiYkPiKahpajanUfmkK9bBNAyDibppW5n9lGHylrvvDe
	 iZc3nlUAdKSDfF1lD5iC0qQ0+xg6FhxNhAqP4xd6GakppCNCghV1O5czLULLHgdFXQ
	 5pfc0xiOd5+lvNn3QFSw1T1XhNDxertIEDLyokmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14E4F802BE; Fri, 16 May 2025 09:56:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0ACDF804CF;
	Fri, 16 May 2025 09:56:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AAAFF80134; Fri, 16 May 2025 09:56:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B0768F80038
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 09:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0768F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Na3gcjbR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=saw9WAAu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Na3gcjbR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=saw9WAAu
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55EB3216E6;
	Fri, 16 May 2025 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747382174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=Na3gcjbR9mHKjyGDlTYRhLQT/yRNIQSNrdpGWpst1pGxsGfhs8WIhYcA4WNvDpzGku5VnT
	mVg7GAhcwnjGF9I9PeMu0RLt1wUaV9uNaOPMo0X4Y9P4avlg6Os1ScBx7T37pBtUrEnyNq
	jPlA8fMWPJblsMal7gfNnZ0v7IrEzlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=saw9WAAud9lNyNFi001js0hc9S2+iji4rBnefIWKX7SNIEfb49J8QJE9WUYeyNPI6YMbqt
	38DgXeMaRsNAfiDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747382174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=Na3gcjbR9mHKjyGDlTYRhLQT/yRNIQSNrdpGWpst1pGxsGfhs8WIhYcA4WNvDpzGku5VnT
	mVg7GAhcwnjGF9I9PeMu0RLt1wUaV9uNaOPMo0X4Y9P4avlg6Os1ScBx7T37pBtUrEnyNq
	jPlA8fMWPJblsMal7gfNnZ0v7IrEzlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=saw9WAAud9lNyNFi001js0hc9S2+iji4rBnefIWKX7SNIEfb49J8QJE9WUYeyNPI6YMbqt
	38DgXeMaRsNAfiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A7CA13977;
	Fri, 16 May 2025 07:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCJ/CJ7vJmjNTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:56:14 +0000
Date: Fri, 16 May 2025 09:56:13 +0200
Message-ID: <87zffdvvj6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
In-Reply-To: <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
	<87r00qx78f.wl-tiwai@suse.de>
	<aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: ZCTMOABKZWW4LZKZ3QXM7EXBTGPADI4V
X-Message-ID-Hash: ZCTMOABKZWW4LZKZ3QXM7EXBTGPADI4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCTMOABKZWW4LZKZ3QXM7EXBTGPADI4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 May 2025 17:47:25 +0200,
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

Thanks.  Now I checked with checkpatch, and it complained a few
things:

WARNING: Block comments use a trailing */ on a separate line
#168: FILE: sound/pci/hda/hda_acpi.c:79:
+	 * devm_platform_get_and_ioremap_resource() */

ERROR: code indent should use tabs where possible
#182: FILE: sound/pci/hda/hda_acpi.c:93:
+^I                       IRQF_SHARED, KBUILD_MODNAME, azx);$

ERROR: code indent should use tabs where possible
#308: FILE: sound/pci/hda/hda_acpi.c:219:
+^I                   THIS_MODULE, 0, &hda->card);$

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure th)
#405: FILE: sound/pci/hda/hda_acpi.c:316:
+MODULE_LICENSE("GPL v2");

Care to address those and resubmit?


thanks,

Takashi
