Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687F75CAEC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187071F6;
	Fri, 21 Jul 2023 17:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187071F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689951999;
	bh=O86D9qWX4fj6OF+4HTLNl7+5ZBUltxqkilpPBKzUWkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/ZMYJ3uE8n+ME+nWjSN7ZqqDF2CHBIXL2Trlmo42Xo1k/FElH/fljspB5gRn5SUJ
	 90uhN5G86LfXuCv8JudZNzlfwpTbMHClMbQHNmzjOe7IvN3qzg0kR1mBGBj3yvXUVd
	 DYaCQ22+TFpxzZV5sKOhN3bN/X9Fl2J2tUEXOfc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC6A1F8007E; Fri, 21 Jul 2023 17:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAC7F8047D;
	Fri, 21 Jul 2023 17:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 635E4F80494; Fri, 21 Jul 2023 17:05:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 06B5FF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B5FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t4gEHRUn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=w6JhbvP0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE4BE218B0;
	Fri, 21 Jul 2023 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689951942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNa2Ga/vdBWuEamymR1djSQjbjCUdeP1tyXN5hm2If8=;
	b=t4gEHRUn/4R1W1nvw16UePnaCr7czzXy/iJLYd2r+M3+434Q0UFdraRXzjH8hTOP6DE+oH
	WPeuxmi61S3jX50XqOk28s0nZfZUoqzC7seehhRj6HZyk+KjIBK1Rj/8PvWo8ADZy1BdZK
	mMqSV7HQMLxnGGdzkmtnVepqnUXrlbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689951942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FNa2Ga/vdBWuEamymR1djSQjbjCUdeP1tyXN5hm2If8=;
	b=w6JhbvP0+FjcIugs7BlpcG0tVg43PKwHZg8p7vEm8rkRhu+vgkf29KvGOvwHqpCUemJF74
	9F2WxABiH/6v9+Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79021134BA;
	Fri, 21 Jul 2023 15:05:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZSWVHMaeumQ2IQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 15:05:42 +0000
Date: Fri, 21 Jul 2023 17:05:42 +0200
Message-ID: <875y6dz4mx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 10/11] ALSA: hda: cs35l41: Add device_link between HDA
 and cs35l41_hda
In-Reply-To: <bf6b5496-bcf9-771d-5921-fe137fa3bec0@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
	<20230720133147.1294337-11-sbinding@opensource.cirrus.com>
	<87v8eeiryp.wl-tiwai@suse.de>
	<bf6b5496-bcf9-771d-5921-fe137fa3bec0@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GFMENYZSPUKZPO6UUGHAL3MXKF4MM6DP
X-Message-ID-Hash: GFMENYZSPUKZPO6UUGHAL3MXKF4MM6DP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFMENYZSPUKZPO6UUGHAL3MXKF4MM6DP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 16:55:43 +0200,
Stefan Binding wrote:
> 
> 
> On 20/07/2023 15:21, Takashi Iwai wrote:
> > On Thu, 20 Jul 2023 15:31:46 +0200,
> > Stefan Binding wrote:
> >> To ensure consistency between the HDA core and the CS35L41 HDA
> >> driver, add a device_link between them. This ensures that the
> >> HDA core will suspend first, and resume second, meaning the
> >> amp driver will not miss any events from the playback hook from
> >> the HDA core during system suspend and resume.
> >> 
> >> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> >> ---
> >>   sound/pci/hda/cs35l41_hda.c | 13 ++++++++++++-
> >>   1 file changed, 12 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> >> index 70aa819cfbd64..175378cdf9dfa 100644
> >> --- a/sound/pci/hda/cs35l41_hda.c
> >> +++ b/sound/pci/hda/cs35l41_hda.c
> >> @@ -1063,6 +1063,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
> >>   {
> >>   	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
> >>   	struct hda_component *comps = master_data;
> >> +	unsigned int sleep_flags;
> >>   	int ret = 0;
> >>     	if (!comps || cs35l41->index < 0 || cs35l41->index >=
> >> HDA_MAX_COMPONENTS)
> >> @@ -1102,6 +1103,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
> >>     	mutex_unlock(&cs35l41->fw_mutex);
> >>   +	sleep_flags = lock_system_sleep();
> >> +	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
> >> +		dev_warn(dev, "Unable to create device link\n");
> >> +	unlock_system_sleep(sleep_flags);
> > Is lock_system_sleep() mandatory for device_link_add()?  The function
> > takes its rw lock for the race, I suppose.
> 
> I believe this is mandatory, to ensure we don't try to add the device
> link during a suspend/resume transition.
> Its probably unlikely that that would occur during the component bind,
> but just in case.

OK, it seems needed in this case.  I found the description in
device_link.rst, too.


thanks,

Takashi
