Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DB79E4C3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 12:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B189F6;
	Wed, 13 Sep 2023 12:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B189F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694600567;
	bh=YtXym9ufdTEPnk3tMhtUy30JIX8Buh8mcealiUrrDME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g10omm2Vc5CZzrgpAu45q2OnN1fhZMx+k0UqEguhonaM/kBFn1HKmlqyjtSVMWWRV
	 6eqk4IgoR9VCgCrgGDODpTUec3xDV5kvVNxVTsY2f7y/t7evHPLlHnqCwyAdSOuOB/
	 INb7I+GMMh7COA55eHWE2ve+4tMe4WL60/Oobxcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 043F6F80551; Wed, 13 Sep 2023 12:21:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4BA3F80246;
	Wed, 13 Sep 2023 12:21:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B4AF80425; Wed, 13 Sep 2023 12:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2023CF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 12:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2023CF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sIlLC2RI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=clIClBwZ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95B2E218DF;
	Wed, 13 Sep 2023 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694600507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMvt8YhFOsGC5oPhl5vhZwMZHMmUIcMLTPIDo6/nEvQ=;
	b=sIlLC2RIyXHsQdQPFT1KdLuPEdOrDERzG0lb+LvHksG4sFUiXEt5d5Pxl6AJrmkwK0055w
	0tYbkDybCnXi+UAMEcnZXxacglDQ+Vei2TH6p0MTCeRSBNRPqd18bOGfd7OAB5rpMsFZWy
	hit464w7HkxqdQI19SfoJr1EchrLMo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694600507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMvt8YhFOsGC5oPhl5vhZwMZHMmUIcMLTPIDo6/nEvQ=;
	b=clIClBwZbIvc/W0T4kJS8eaZGo6t8oQfjjZhdeWsFwKjHS4gJQKGkaugWDdt0j5WwDj0D4
	5kQVkGIrdfqFr5Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 611C513440;
	Wed, 13 Sep 2023 10:21:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id T9nVFjuNAWUGYgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 13 Sep 2023 10:21:47 +0000
Date: Wed, 13 Sep 2023 12:21:46 +0200
Message-ID: <87cyym4blx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	arnd@arndb.de,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	maciej.szmigiero@oracle.com
Subject: Re: [PATCH] ALSA: usb-audio: mixer: Remove temporary string use in
 parse_clock_source_unit
In-Reply-To: <20230913093933.24564-1-peter.ujfalusi@linux.intel.com>
References: <20230913093933.24564-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2RAGNV5J3LT43N6SBEMJBDRZPWB3WWW3
X-Message-ID-Hash: 2RAGNV5J3LT43N6SBEMJBDRZPWB3WWW3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RAGNV5J3LT43N6SBEMJBDRZPWB3WWW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 11:39:33 +0200,
Peter Ujfalusi wrote:
> 
> The kctl->id.name can be directly passed to snd_usb_copy_string_desc() and
> if the string has been fetched the suffix can be appended with the
> append_ctl_name() call.
> The temporary name string becomes redundant and can be removed.
> 
> This change will also fixes the following compiler warning/error (W=1):
> 
> sound/usb/mixer.c: In function ¡parse_audio_unit¢:
> sound/usb/mixer.c:1972:29: error: ¡ Validity¢ directive output may be truncated writing 9 bytes into a region of size between 1 and 44 [-Werror=format-truncation=]
>  1972 |                          "%s Validity", name);
>       |                             ^~~~~~~~~
> In function ¡parse_clock_source_unit¢,
>     inlined from ¡parse_audio_unit¢ at sound/usb/mixer.c:2892:10:
> sound/usb/mixer.c:1971:17: note: ¡snprintf¢ output between 10 and 53 bytes into a destination of size 44
>  1971 |                 snprintf(kctl->id.name, sizeof(kctl->id.name),
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1972 |                          "%s Validity", name);
>       |                          ~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> The warnings got brought to light by a recent patch upstream:
> commit 6d4ab2e97dcf ("extrawarn: enable format and stringop overflow warnings in W=1")
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks, applied now.


Takashi
