Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B57EF3BA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 14:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E1693A;
	Fri, 17 Nov 2023 14:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E1693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700228013;
	bh=7HxttN5iW1sVz431pUc244qDVisZYk+oJivYZl6+Ix4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OrzkdpMz1Xga/1Q8WvsSpOZdfvN1ISIpD1UDpH5caPRVjIbs06A5tpRdhd1zTN0gd
	 9zoRAjyQ3sMM0GFutnxqKzOxqbqyTRgwz0GowVBTUN6zdPT22pRC3O4xGTjo5WBdLv
	 lCCEiAshjpLuPSrUoFHWEg5hX+axvpHJP4zDnaZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C81A6F80093; Fri, 17 Nov 2023 14:32:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 573DAF8016E;
	Fri, 17 Nov 2023 14:32:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66044F801D5; Fri, 17 Nov 2023 14:32:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3C69F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 14:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3C69F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CB6G0qkD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TX4Q8KFN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF30C1F38D;
	Fri, 17 Nov 2023 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700227934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9hbRLCFAF0MFU6V5KRjF2Qo9Ot751dxw2RqL6OaPeA=;
	b=CB6G0qkDUwa00UbK3T+SjtyL7Lhu1yBHD3ws2DlrFL0KNhirbUaANdS3hP6AaxTjN+mKsj
	5SH45CWTehWYkqMr92BXWXkvWGctxvo6w7VgZJkmHlXZ+uahkw4uxMuczexFisD8NGXVpt
	/kJGaJCjkXsPiReKs+eu+WqgoGNNaHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700227934;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9hbRLCFAF0MFU6V5KRjF2Qo9Ot751dxw2RqL6OaPeA=;
	b=TX4Q8KFNL7ErbepzZMrKkeXSdejFmjVv0FnhTiJicd47aMqqQ0WFVnd7bLW2h4GY2v3Mlt
	yADE7BR0lhkFjoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 788A51341F;
	Fri, 17 Nov 2023 13:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OVWBHF5rV2WKWAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 17 Nov 2023 13:32:14 +0000
Date: Fri, 17 Nov 2023 14:32:14 +0100
Message-ID: <87sf54jyjl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oliver Sieber <ollisieber@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Linux ALSA Development <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7
 PRO 5850U
In-Reply-To: <78149e00-12b5-459b-8754-a17dd974916d@gmail.com>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
	<251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
	<a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
	<78149e00-12b5-459b-8754-a17dd974916d@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-7.23 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-0.13)[-0.628];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org,kernel.org,perex.cz,suse.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: RATFVYJWCCI4RFK4KEZMQICDQUOT73OM
X-Message-ID-Hash: RATFVYJWCCI4RFK4KEZMQICDQUOT73OM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RATFVYJWCCI4RFK4KEZMQICDQUOT73OM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Nov 2023 08:17:48 +0100,
Oliver Sieber wrote:
> 
> 
> Hi,
> 
> in the following I provide my proposed patch for the bug report on Bugzilla
> [1]. Let me quote from it:
> 
>     Hey,sound/soc/amd/renoir/rn-pci-acp3x.c has a hard-coded list of quirks. It seems like some product IDs may be missing. In my case, I am using a Lenovo Thinkpad t14s gen2 with an AMD Ryzen 7 PRO 5850U. 
>     My audio output is fine but my internal microphone cannot be found.
>     
>     Running `dmidecode` yields:
>     
>     Handle 0x000F, DMI type 1, 27 bytes
>     System Information
>                   Manufacturer: LENOVO
>                   Product Name: 20XGS1KT02
>                   Version: ThinkPad T14s Gen 2a
>     
>     Could it be that one may have to add the product ID "20XGS1KT02" to the hard-coded list of quirks in rn-pci-acp3x.c?
> 
>     It seems as there have been similar problems in the past, e.g. https://bugzilla.kernel.org/show_bug.cgi?id=216270.
> 
> My proposed diff looks as follows:
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/
> rn-pci-acp3x.c
> index b3812b70f5f9..754e24d55e6f 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -199,6 +199,13 @@ static const struct dmi_system_id rn_acp_quirk_table[] =
> {
>              DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
>          }
>      },
> +    {
> +        /* Lenovo ThinkPad T14s Gen 2 */
> +        .matches = {
> +            DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "20XGS1KT02"),
> +        }
> +    },
>      {}
>  };
> 
> Please have in mind that this is my first patch for the kernel.

The kernel patch should be in a proper format, so that it can be
merged to the upstream.  e.g. The Subject line should have a brief
description with the proper prefix for the corresponding subsystem (in
your case, something like "ASoC: amd:").  It'll follow the patch
description, as well as your proper Signed-off-by tag.

The details are found in 
  https://docs.kernel.org/process/submitting-patches.html

Could you resubmit the patch in a proper format?


thanks,

Takashi
