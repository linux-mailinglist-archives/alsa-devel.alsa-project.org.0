Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1547FB693
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 11:03:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5241F7;
	Tue, 28 Nov 2023 11:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5241F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701165799;
	bh=oulWl6oABKlMnussmmmzGv8GFxhjw0w+SqBM9RYVPFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJGMS2+u12M7r3TO4bI/yW6FpixwcuTOL5o9au2nNvArGGKY/n3f1vdi3FkQpXsb2
	 KVoIEyTAKiEGBRpaUGfxYvTw6loMrpU0Lr6snCi82bG37HB1R/VqfDhne8Dhi4qBFV
	 LaTgAAT6lz26bjWz3qj3GZ2Zk8iuWhiJJL0g5iqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCC42F80570; Tue, 28 Nov 2023 11:02:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D47AF80570;
	Tue, 28 Nov 2023 11:02:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E97F8016E; Tue, 28 Nov 2023 11:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6937EF800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 11:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6937EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XbwfgEbS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eityXx2U
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19DD41F37E;
	Tue, 28 Nov 2023 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701165756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fk6IswEGTuYFQTlLdnBaIn7iN6ORqeUWrQTaQljySv0=;
	b=XbwfgEbSHTKA6ZkQUhpyup06pq+bzSkAxzd07AyKrdcRh0GvnudtRlQQg9LiitPRrMdOaW
	sf3ks7EiEKKJO/F/htyX81mrJpbAEM16bylQs2XVHWLMKD/f8Qod3rs81i2c8rmxfV/NM1
	CzEx+QZQDxTulSr35/SVs8/cVZtiba0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701165756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fk6IswEGTuYFQTlLdnBaIn7iN6ORqeUWrQTaQljySv0=;
	b=eityXx2UApRGVX/DCCniXEw04zxlEjR/55nj2qxItHP1QEC9TNmGjBhmWTUfvZNkcxdwjN
	GnjK8Q3dq6q9InBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6F511343E;
	Tue, 28 Nov 2023 10:02:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PatMJ7u6ZWWTaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Nov 2023 10:02:35 +0000
Date: Tue, 28 Nov 2023 11:02:35 +0100
Message-ID: <87ttp6mc04.wl-tiwai@suse.de>
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
In-Reply-To: <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.04 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 REPLY(-4.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.17)[-0.826];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[38.97%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-0.77)[-0.771];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: J46RE6VBWI3U5Z5SSC6AMAIGE7ZUYURZ
X-Message-ID-Hash: J46RE6VBWI3U5Z5SSC6AMAIGE7ZUYURZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J46RE6VBWI3U5Z5SSC6AMAIGE7ZUYURZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Nov 2023 10:53:56 +0100,
Péter Ujfalusi wrote:
> 
> 
> 
> On 28/11/2023 11:39, Takashi Iwai wrote:
> > Hm...  I still find it's a bad move to use an exported symbol from
> > another codec driver.
> 
> The other option is to check for 0x4 (or address 2), but I'm not sure if
> this is Intel only or universally true for HDMI codecs.
> 
> > And, I wonder what if you have a system that has only one HDMI codec
> > without analog one?  Would it still work with your change? 
> 
> Yes, it works with only HDMI codec (for example on SoundWire laptops) or
> with UP2 board which only have HDMI audio support by default.

Interesting.  With your patch 2, hdac_hda_hdmi_codec is without the
DAPM definitions, and even if that's the only one that is registered,
it will still work?  So it means that it works without DAPM
definitions at all?


Takashi
