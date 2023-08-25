Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215B78813F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 09:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28420847;
	Fri, 25 Aug 2023 09:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28420847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692949841;
	bh=K0s1mQ22HBoR+HxsldnBo62cOYqsvU2XBSi8kw+1o+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pGvT1irJVaNe8YwBK/+8Wqz3MxIHSBFhYoTSBQBj40nmtZGHFB5emkb3c4RQenqX9
	 wp5r0C7Zoe37wZWetLvP4Mz6D4bv0szPh7vxTtp8RsGpyeXHo9vT01n4urc/gWog4H
	 gkE7X/9VU9BRO1pF0wzlzadvqkFVd7oY2eE76YtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9301BF800D1; Fri, 25 Aug 2023 09:49:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DCE1F800D1;
	Fri, 25 Aug 2023 09:49:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACE23F800F5; Fri, 25 Aug 2023 09:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DAD4F800BF
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 09:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DAD4F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zwXWUoG+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hZUWIjwj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEE341F8B2;
	Fri, 25 Aug 2023 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692949688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mYpRgKkqPnZRHXbdkwIwj/vSbyT7RcD8xYt4PaeABDU=;
	b=zwXWUoG+oI1n1JCYPZkhcklkmNUNOTGoNyN1sHWOJimdhyaTjDvIYnXAC0inRU20E0Mi4k
	6+BqgWGf1IUOqPYAX6VlBL5VjFhK8OmcgGJoORlWvANypiqpeLbzjwmRlcfTxkS0mNiyK0
	7EU7tkFNNlmZHr40mrC/ss9N5JqY2Vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692949688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mYpRgKkqPnZRHXbdkwIwj/vSbyT7RcD8xYt4PaeABDU=;
	b=hZUWIjwjINKZ5e6ttlkKPJjGoVkxu4+Lg78g5wlJ63BG5ENx1bG9WKPyET3wwo5zElAt5Y
	nhPfAJCfNgEDyqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22E731340A;
	Fri, 25 Aug 2023 07:48:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SK2jB7hc6GQdUQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 07:48:08 +0000
Date: Fri, 25 Aug 2023 09:48:07 +0200
Message-ID: <87edjr8sw8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Fred Oh <fred.oh@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 2/5] ALSA: hda/intel: Use pci_get_base_class() to reduce
 duplicated code
In-Reply-To: <20230825062714.6325-3-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
	<20230825062714.6325-3-sui.jingfeng@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 64P2RR3U5UOQZIRVFKGLAKPPN5WSR3I5
X-Message-ID-Hash: 64P2RR3U5UOQZIRVFKGLAKPPN5WSR3I5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64P2RR3U5UOQZIRVFKGLAKPPN5WSR3I5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Aug 2023 08:27:11 +0200,
Sui Jingfeng wrote:
> 
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Should be no functional change
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Fred Oh <fred.oh@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  sound/pci/hda/hda_intel.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index a21b61ad08d1..811a149584f2 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1429,17 +1429,11 @@ static bool atpx_present(void)
>  	acpi_handle dhandle, atpx_handle;
>  	acpi_status status;
>  
> -	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
> -		dhandle = ACPI_HANDLE(&pdev->dev);
> -		if (dhandle) {
> -			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);
> -			if (ACPI_SUCCESS(status)) {
> -				pci_dev_put(pdev);
> -				return true;
> -			}
> -		}
> -	}
> -	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_OTHER << 8, pdev)) != NULL) {
> +	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
> +		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
> +		    (pdev->class != PCI_CLASS_DISPLAY_OTHER << 8))
> +			continue;
> +
>  		dhandle = ACPI_HANDLE(&pdev->dev);
>  		if (dhandle) {
>  			status = acpi_get_handle(dhandle, "ATPX", &atpx_handle);

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
