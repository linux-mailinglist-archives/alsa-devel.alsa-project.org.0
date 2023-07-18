Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085D757BA3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C69FAE8;
	Tue, 18 Jul 2023 14:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C69FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682744;
	bh=fMRSVg/Lxjchh257ZeJ6r5vcPqTs5Cbp/lHd/4v9vlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VqSXG+6/VIt0VZBFpugipP0v+KpBz8wmrDn0xBRStiaeMAnUOdRGytzbqDgvMc1Bx
	 xraiHU83G3fuWnDuEFTTjWI+SLRozdInoIpIQhbDK74z7BA++LalrOv2e+d86QDEv0
	 VybjH9qOUZtcKIAWXuGWgqfS8IfQ8ifosVDprESA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EC4BF8032D; Tue, 18 Jul 2023 14:17:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D65F8F8027B;
	Tue, 18 Jul 2023 14:17:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A096F8032D; Tue, 18 Jul 2023 14:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D350F800D2;
	Tue, 18 Jul 2023 14:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D350F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xynSjjn5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6vItAQ41
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1345221954;
	Tue, 18 Jul 2023 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689682656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4TdEhciiSwsv5vinAbnDrmrQzodZb9a+RU42WAAQt0M=;
	b=xynSjjn5vO58svXXYtRPzXTmqfuY8J/pBE2ZwCwpX6QGrZsy64IEF81aYnFjt8ghkcL1I2
	8nVyxCoz1z+tHbV4Tx/r2p4j1ZihUw244OmvgBT7HvA9Fdjy9GHF/dm76wrUedFQc0CvWA
	6bdeul9ncCG8FKuQnj7GzkBMPot/VxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689682656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4TdEhciiSwsv5vinAbnDrmrQzodZb9a+RU42WAAQt0M=;
	b=6vItAQ41n5VLJt25wmWVdXqagnbDSsn7dzfymZpluHCe/p20Cnhrn/aFlX86UgESy2LzkJ
	ZDrcARvCW4EKOlAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7127134B0;
	Tue, 18 Jul 2023 12:17:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FhivK9+CtmTnQAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 12:17:35 +0000
Date: Tue, 18 Jul 2023 14:17:35 +0200
Message-ID: <877cqxo1ls.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown
 <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [v2 PATCH 1/2] ALSA: hda/intel: Fix error handling in azx_probe()
In-Reply-To: <2a727311-46d8-e999-1461-2ed2f1b704e0@linux.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-6-maarten.lankhorst@linux.intel.com>
	<87h6q1o82l.wl-tiwai@suse.de>
	<2a727311-46d8-e999-1461-2ed2f1b704e0@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ITXQZ2NTZJUENETCJEAAD4SBXRG7WQ37
X-Message-ID-Hash: ITXQZ2NTZJUENETCJEAAD4SBXRG7WQ37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITXQZ2NTZJUENETCJEAAD4SBXRG7WQ37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 13:57:33 +0200,
Maarten Lankhorst wrote:
> 
> 
> Make sure azx is freed after azx_create() succeeded and an error was
> encountered.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 5af1138e745bc..196ca76ac43ad 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2150,7 +2150,7 @@ static int azx_probe(struct pci_dev *pci,
>                       err = register_vga_switcheroo(chip);
>                       if (err < 0) {
>                                             dev_err(card->dev, "Error registering vga_switcheroo client\n");
> -                                           goto out_free;
> +                                           goto out_azx_free;
>                       }
>  
>                       if (check_hdmi_disabled(pci)) {
> @@ -2169,7 +2169,7 @@ static int azx_probe(struct pci_dev *pci,
>                                                                                                                     &pci->dev, GFP_KERNEL, card,
>                                                                                                                     azx_firmware_cb);
>                                             if (err < 0)
> -                                                                 goto out_free;
> +                                                                 goto out_azx_free;
>                                             schedule_probe = false; /* continued in azx_firmware_cb() */
>                       }
>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
> @@ -2187,6 +2187,9 @@ static int azx_probe(struct pci_dev *pci,
>                                             complete_all(&hda->probe_wait);
>                       return 0;
>  
> +out_azx_free:
> +                     azx_free(chip);

This is superfluous.  Once when azx_create() succeeds, azx_free() is
called from snd_card_free().  That is...

> +                     pci_set_drvdata(pci, NULL);

... only this call was missing.  And this can be put under out_free 
label, as this is safe to call at any exit path.  So, it'll be a
oneliner patch.


thanks,

Takashi

>  out_free:
>                       snd_card_free(card);
>                       return err;
> -- 
> 2.39.2
> 
