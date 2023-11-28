Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6187FBAD0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 14:02:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72E783E;
	Tue, 28 Nov 2023 14:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72E783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701176569;
	bh=QS5QiPZI8/WIHc8f6uskSMx/U8OB7NijGrDwJ7c/Xqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cHGcJwjuBFasjTbceWebyBqB+iYb4VmQZI2jMR2POqs3pcieGzzV9N0VOuO7lw8Fh
	 Y+cSpi0rhAoT0pGKqIAuNoifpsTAY4itc69xS6yfd9RrowbmoEPe1u+zwRj29RqE9/
	 +yAAO6L81oT5+3JshcGTja7C3zrp6B21SxZ7oH54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048E9F8025A; Tue, 28 Nov 2023 14:02:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97ECAF80567;
	Tue, 28 Nov 2023 14:02:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80106F8016E; Tue, 28 Nov 2023 14:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51E79F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 14:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E79F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1rudhrvN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VVYXnKC7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C50FD1F74B;
	Tue, 28 Nov 2023 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701176536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+aOH1vjhftccOjryN6nHJxLvAMbv1vOstfbooADBQA=;
	b=1rudhrvNMqM0dM0pEoSvU7/x8Aepf94cDnjI/5sEZU3IFXpRNQSpswrTQbQQwU3M7de/k1
	2tDUHsmz1pFspSnEoLXs4bNY/K9BVuW0XxKHQaAPPdjf8kEuEo8qo+r7Nvzjulwmg0T5tO
	w50ngI6i+gV5uW7oWhcG+23dB/GWCro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701176536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+aOH1vjhftccOjryN6nHJxLvAMbv1vOstfbooADBQA=;
	b=VVYXnKC7Y3j5mMaTQ/lxA8WYf1/Q7648aRAhSZNoQ8WqHX0c83/JxpD/q/5+A+uSUcgK34
	c5HMJkbf4+r3UlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75ECC13763;
	Tue, 28 Nov 2023 13:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1FRJG9jkZWXuIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Nov 2023 13:02:16 +0000
Date: Tue, 28 Nov 2023 14:02:16 +0100
Message-ID: <87il5mm3on.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
In-Reply-To: <30f05de0-f431-4972-9315-6b377cf43cf4@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
	<20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
	<87jzq3pc6r.wl-tiwai@suse.de>
	<d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
	<87cyvvp8t6.wl-tiwai@suse.de>
	<8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
	<878r6jp6jd.wl-tiwai@suse.de>
	<b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
	<875y1np5g2.wl-tiwai@suse.de>
	<be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
	<87y1eimd23.wl-tiwai@suse.de>
	<e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
	<87ttp6mc04.wl-tiwai@suse.de>
	<96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
	<87plzum9w4.wl-tiwai@suse.de>
	<6710fd66-2a70-4948-aafb-2fcf3d6d2b25@linux.intel.com>
	<30f05de0-f431-4972-9315-6b377cf43cf4@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.74 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 REPLY(-4.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[34.65%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(2.36)[0.787];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: EBK5MWORID24IH73VOXTIP7ODQWDOF6Y
X-Message-ID-Hash: EBK5MWORID24IH73VOXTIP7ODQWDOF6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBK5MWORID24IH73VOXTIP7ODQWDOF6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Nov 2023 13:16:29 +0100,
Péter Ujfalusi wrote:
> 
> 
> 
> On 28/11/2023 13:58, Péter Ujfalusi wrote:
> > 
> > 
> > On 28/11/2023 12:48, Takashi Iwai wrote:
> >>> Well, it is a bit more 'interesting' from that angle.
> >>> for patch two we needed:
> >>> https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/
> >>
> >> Ouch, this kind of information has to be mentioned in the patch
> >> description.  Otherwise one would take only this series and face a
> >> problem easily.  I can imagine such a problem on the stable tree.
> > 
> > OK, I will update the commit message
> > 
> >>> I would rather not risk to move the hdac_hda as Intel only using address
> >>> 2 as HDMI indication - which I'm still not sure if it is Intel only or
> >>> generic HDA convention.
> >>
> >> Sure, it doesn't sound right, either.
> >>
> >> Can we then add DAPM widgets and routes later conditionally instead of
> >> having it in component driver definition?
> > 
> > The issue is with the DAIs. If I remove the dai registering from
> > hdac_hda_dev_probe() to be done in hdac_hda_codec_probe() then the probe
> > will not happen since we do not have the needed components/DAIs to probe
> > the card.
> > 
> > If we don't have HDMI then the machine driver will substitute it with
> > dummy-dai, but if we have HDMI then we are not going to probe at all.
> > 
> > It is a sort of chicken and egg situation, right?
> 
> I think I have found a workaround without the need to export a function,
> it is going to be a single patch and should be OK for non Intel
> platforms in the future.
> 
> struct hdac_hda_priv *hda_pvt = dev_get_drvdata(&hdev->dev);
> ..
> if (hda_pvt->need_display_power)
> 	/* HDMI/DP */
> else
> 	/* Non HDMI */

Looks like a saner approach, yeah.


thanks,

Takashi
