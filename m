Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C847A738B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 08:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 351EDA4A;
	Wed, 20 Sep 2023 08:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 351EDA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695193157;
	bh=HE+7UDFxiqmiYeY8i4whBcfn8hOn3yhFe9r5DSczc0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XibxRsDrrY0QJiS3JDRuVhrWjuvs1mrEoSUSN2fpVnXPxCnicsChFarY1NVrNSb8g
	 43WOvCwTFQ3cjq611V5Y52a+31khsHjhSk8raYzkRA4pHLBMhVeZB4r2H/JN22tPOY
	 ImJM2UEGHCv0ITGV/4L5fdif2nDX9plbtSIsdoSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71021F8047D; Wed, 20 Sep 2023 08:58:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F21ECF801F5;
	Wed, 20 Sep 2023 08:58:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67FC5F8025A; Wed, 20 Sep 2023 08:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF0FBF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 08:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0FBF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZTvwWH7D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ti67fr5g
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E6231F385;
	Wed, 20 Sep 2023 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695193097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AU/S14PFj+HSKAHNrVMLXPOUtuJzNO4drT/vg2xb5Nk=;
	b=ZTvwWH7DlfDaJyvjkaxKXMcKVrd6Pkjt2zKhadlrRH23fdTulAKDj5GG0pavlHUe48qTqB
	amTYuVEhRtEcKmehvmf7ZkWUnZprqaN0OL/eYbnz3iBsg6wK8JA1K1vPP3ObwktLmRYwVC
	baYwDmwlEUjY+kHC7FmQjVLQ+er3rzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695193097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AU/S14PFj+HSKAHNrVMLXPOUtuJzNO4drT/vg2xb5Nk=;
	b=Ti67fr5ghtbbifLv6sylB2kBYwRiZqotBW0DzMpoa7W9QE4wcIrwdEOJ7CLR/YO/Hb5mti
	e/MEo+RZKbKCQBCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C37E1333E;
	Wed, 20 Sep 2023 06:58:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id g58LCgmYCmUlIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 06:58:17 +0000
Date: Wed, 20 Sep 2023 08:58:16 +0200
Message-ID: <8734z9wctz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
In-Reply-To: <20230919142240.467682-2-sbinding@opensource.cirrus.com>
References: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
	<20230919142240.467682-2-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YOUQBPJRUB6YKNQCKA5Y4INWQCELVETX
X-Message-ID-Hash: YOUQBPJRUB6YKNQCKA5Y4INWQCELVETX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOUQBPJRUB6YKNQCKA5Y4INWQCELVETX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 16:22:39 +0200,
Stefan Binding wrote:
> 
> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> 
> Some laptops require a hardware based mute system, where when a hotkey
> is pressed, it forces the amp to be muted.
> 
> For CS35L41, when the hotkey is pressed, an acpi notification is sent
> to the CS35L41 Device Node. The driver needs to handle this notification
> and call a _DSM function to retrieve the mute state.
> 
> Since the amp is only muted during playback, the driver will only mute
> or unmute if playback is occurring, otherwise it will save the mute
> state for when playback starts.
> 
> Only one handler can be registered for the acpi notification, but all
> amps need to receive that notification, we can register a single handler
> inside the Realtek HDA driver, so that it can then notify through the
> component framework.
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

The patch is a bit lengthy.  I'd split the binding of patch_realtek.c
into another patch.  That part is fairly generic.

> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
(snip)
> +static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct hda_codec *cdc = data;
> +	struct alc_spec *spec = cdc->spec;
> +	int i;
> +
> +	codec_info(cdc, "ACPI Notification %d\n", event);
> +
> +	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
> +		if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> +			spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
> +						   spec->comps[i].dev);
> +	}
> +}

This function should be in #ifdef CONFIG_ACPI, too.


thanks,

Takashi
