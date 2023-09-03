Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC1C790CED
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 18:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E882200;
	Sun,  3 Sep 2023 18:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E882200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693759529;
	bh=MLX9MW8ljPzsrJb23tlrRG/jbb0SSD1AkCKU9DxrI54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CPN8/XTSDx6+SRTDYwAOc7anovsvJohsZqZrOMiveh8TJcTc5L9nWvGGC+OSJr2cK
	 CxSQoM8NmAOOglQTNLm7mlLEH99oTexdNzw1pqYPMZnOLSYtC7Z5/DTHNwiBcdDHMJ
	 Mv+fL9RlqMzcbiqzCbp2fWRSKbMSjKxrWesdqdFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39334F8047D; Sun,  3 Sep 2023 18:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C50E4F80431;
	Sun,  3 Sep 2023 18:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E392F8047D; Sun,  3 Sep 2023 18:44:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FC7AF80236
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 18:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC7AF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BKTHXS+k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tuwYKUWk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBCB11F38D;
	Sun,  3 Sep 2023 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693759471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+63eST4xeBRfHafIZ/k1ar2D/0FlzMp6mIqdRaQyls=;
	b=BKTHXS+kl7meGkm3of2iqV4eEfYo4U5YfysbP3RgAQR8+MWPKghOCvvX1lC3CG8IV/Puma
	oVgc0PUisqeb48rR+hrKOWI1LJNNP0v3JZSo5K9OrFM/IECnbAWu0nQYxR8fQXqcMi19Ub
	MQG0KBjCSZhRUoSzd1sbzUarVzHmtl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693759471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+63eST4xeBRfHafIZ/k1ar2D/0FlzMp6mIqdRaQyls=;
	b=tuwYKUWk5XZLT82iL6fjW+upLOwSwlB+caRUCG6ywFwKXIUxf0LQq+i2I7D1Fzc5PM/jPA
	Nz4ukFbooUsykWDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7977013583;
	Sun,  3 Sep 2023 16:44:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SBDQHO+39GTiIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 03 Sep 2023 16:44:31 +0000
Date: Sun, 03 Sep 2023 18:44:30 +0200
Message-ID: <87pm2zkxzl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<mengdong.lin@intel.com>,
	<baojun.xu@ti.com>,
	<thomas.gfeller@q-drop.com>,
	<peeyush@ti.com>,
	<navada@ti.com>,
	<broonie@kernel.org>,
	<gentuser@gmail.com>
Subject: Re: [PATCH v1 2/2] ALSA: hda/tas2781: Update tas2781 HDA driver
In-Reply-To: <87ttsbkyht.wl-tiwai@suse.de>
References: <20230903143759.92-1-shenghao-ding@ti.com>
	<20230903143759.92-2-shenghao-ding@ti.com>
	<87ttsbkyht.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: XWF5IN5R6GZDCOWNRAO7JJCBMXQNJOIL
X-Message-ID-Hash: XWF5IN5R6GZDCOWNRAO7JJCBMXQNJOIL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWF5IN5R6GZDCOWNRAO7JJCBMXQNJOIL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 18:33:34 +0200,
Takashi Iwai wrote:
> 
> On Sun, 03 Sep 2023 16:37:58 +0200,
> Shenghao Ding wrote:
> > 
> > Support ACPI_ID both TXNW2781 and TIAS2781, update dsp/bypass mode
> > switching in tasdevice_program_put.
> 
> Again, if you change multiple things, split to individual patches.

Also, the support of two IDs can be unified to a single patch for
changing both files.

A patch isn't necessarily split per file; instead, it's split per
logic.  If applying the changes to multiple files at the same time
makes more sense, those should be put in the same patch.


thanks,

Takashi


> 
> 
> thanks,
> 
> Takashi
> 
> 
> > 
> > Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> > 
> > ---
> > Changes in v1:
> >  - Add comment on dsp/bypass mode in tasdevice_program_put and
> >    tasdevice_info_programs
> >  - TIAS2781 has been used by our customers, see following dstd.dsl. We
> >    have discussed this with them, they requested TIAS2781 must be
> >    supported for the laptops already released to market, their new laptop
> >    can switch to TXNW2781
> >    Name (_HID, "TIAS2781")  // _HID: Hardware ID
> >    Name (_UID, Zero)  // _UID: Unique ID
> >    Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
> >    {
> >        If ((SPID == Zero))
> >        {
> >           Return ("17AA3886")
> >        }
> > 
> >        If ((SPID == One))
> >        {
> >            Return ("17AA3884")
> >        }
> >    }
> > ---
> >  sound/pci/hda/tas2781_hda_i2c.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> > index fb80280293..5250d300a2 100644
> > --- a/sound/pci/hda/tas2781_hda_i2c.c
> > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > @@ -199,8 +199,11 @@ static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
> >  
> >  	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> >  	uinfo->count = 1;
> > +	/* 0:			dsp mode
> > +	 * non-zero:	bypass mode
> > +	 */
> >  	uinfo->value.integer.min = 0;
> > -	uinfo->value.integer.max = tas_fw->nr_programs - 1;
> > +	uinfo->value.integer.max = tas_fw->nr_programs;
> >  
> >  	return 0;
> >  }
> > @@ -238,7 +241,10 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
> >  	int max = tas_fw->nr_programs - 1;
> >  	int val, ret = 0;
> >  
> > -	val = clamp(nr_program, 0, max);
> > +	/* 0:			dsp mode
> > +	 * non-zero:	bypass mode
> > +	 */
> > +	val = (nr_program) ? max : 0;
> >  
> >  	if (tas_priv->cur_prog != val) {
> >  		tas_priv->cur_prog = val;
> > @@ -647,7 +653,9 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
> >  	const char *device_name;
> >  	int ret;
> >  
> > -	if (strstr(dev_name(&clt->dev), "TIAS2781"))
> > +	if (strstr(dev_name(&clt->dev), "TXNW2781"))
> > +		device_name = "TXNW2781";
> > +	else if (strstr(dev_name(&clt->dev), "TIAS2781"))
> >  		device_name = "TIAS2781";
> >  	else
> >  		return -ENODEV;
> > @@ -824,6 +832,7 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
> >  
> >  static const struct acpi_device_id tas2781_acpi_hda_match[] = {
> >  	{"TIAS2781", 0 },
> > +	{"TXNW2781", 1 },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
> > -- 
> > 2.34.1
> > 
