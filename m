Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823E70DBA6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 13:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926D6206;
	Tue, 23 May 2023 13:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926D6206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684842219;
	bh=hwHs07BiTZnYpqt0tPj5th7TG2D+v99HfWRycFlfxZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/Fyzd2uIAa7crygPPfdni7PwxwrBmgqrk6+7uDSTf4cl0xrlccGOXQnVm/ljzszB
	 urUg4nXGLikwbEnFx7x90afQmm29sFABLaMsDhbdXH9bOlkdjzYiei6xQspgqUa+XF
	 RuzV6nj8xq/TqukOzaVfv1vsK/y4WSE/Cr9HS7W8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E24FF80086; Tue, 23 May 2023 13:42:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2B9F80249;
	Tue, 23 May 2023 13:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DC07F8024E; Tue, 23 May 2023 13:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 699FDF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 13:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699FDF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=woqqhvTE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZkvCZau2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8197B229AD;
	Tue, 23 May 2023 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684842155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5OsFTJQlT1HP4PZ2CxU3TzCtEIcI+DtJ1ZvdSvwdV8=;
	b=woqqhvTEeKGw14U0e+mSdFr7+Xm5nkc7Vq/PMqB96PXoXs4riCpEY7i21rIyCnQ9kYIN83
	U/lUQTWG6RvI0W+6tzfFu/eZ256WR+J8/oexJpyhj8HvYtwigCFxCcDgD8NPQH1kTEEKkb
	YOLS2pRDXw8cTZJObz7BWypBem4aDho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684842155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5OsFTJQlT1HP4PZ2CxU3TzCtEIcI+DtJ1ZvdSvwdV8=;
	b=ZkvCZau2Mms91EZ20b1cE7FhxReUJxXFJtR6iJagHk/Bjm4ALKeBdRluxvKqdxtfnUDHvL
	hWmso+f7JNUs6nDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0435213588;
	Tue, 23 May 2023 11:42:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YT0YAKumbGTJFAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 11:42:34 +0000
Date: Tue, 23 May 2023 13:42:34 +0200
Message-ID: <87353ngtp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: Shenghao Ding <13916275206@139.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
	"robh+dt@kernel.org"
	<robh+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
	"Lu, Kevin" <kevin-lu@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Xu, Baojun"
	<x1077012@ti.com>,
	"Gupta, Peeyush" <peeyush@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"gentuser@gmail.com" <gentuser@gmail.com>,
	"Ryan_Chu@wistron.com" <Ryan_Chu@wistron.com>,
	"Sam_Wu@wistron.com"
	<Sam_Wu@wistron.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3 4/5] ALSA: hda/tas2781: Add tas2781 HDA
 driver
In-Reply-To: <9daf95da47b540329aa9fbbd2df5e504@ti.com>
References: <20230519080227.20224-1-13916275206@139.com>
	<871qjayuvv.wl-tiwai@suse.de>
	<9daf95da47b540329aa9fbbd2df5e504@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BRIN3UFEIZTWRT7EUW5OPIPNZIXP4BIL
X-Message-ID-Hash: BRIN3UFEIZTWRT7EUW5OPIPNZIXP4BIL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRIN3UFEIZTWRT7EUW5OPIPNZIXP4BIL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 13:22:03 +0200,
Ding, Shenghao wrote:
> 
> > +	[ALC287_FIXUP_TAS2781_I2C_2] = {
> > +		.type = HDA_FIXUP_FUNC,
> > +		.v.func = tas2781_fixup_i2c,
> > +		.chained = true,
> > +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
> > +	},
> > +	[ALC287_FIXUP_TAS2781_I2C_4] = {
> > +		.type = HDA_FIXUP_FUNC,
> > +		.v.func = tas2781_fixup_i2c,
> > +		.chained = true,
> > +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
> > +	},
> 
> What's a difference between *_2 and *_4?
> Combine them into ALC287_FIXUP_TAS2781_I2C

Hm, so there is no difference in stereo and quad speakers?

> > +static int tas2781_save_calibration(struct tasdevice_priv *tas_priv) 
> > +{
> > +	efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d,
> > +		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
> > +	static efi_char16_t efi_name[] = L"CALI_DATA";
> > +	struct hda_codec *codec = tas_priv->codec;
> > +	unsigned int subid = codec->core.subsystem_id & 0xFFFF;
> > +	struct tm *tm = &tas_priv->tm;
> > +	unsigned int attr, crc;
> > +	unsigned int *tmp_val;
> > +	efi_status_t status;
> > +	int ret = 0;
> > +
> > +	//Lenovo devices
> > +	if ((subid == 0x387d) || (subid == 0x387e) || (subid == 0x3881)
> > +		|| (subid == 0x3884) || (subid == 0x3886) || (subid == 0x38a7)
> > +		|| (subid == 0x38a8) || (subid == 0x38ba) || (subid == 0x38bb)
> > +		|| (subid == 0x38be) || (subid == 0x38bf) || (subid == 0x38c3)
> > +		|| (subid == 0x38cb) || (subid == 0x38cd))
> > +		efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, 0x09,
> > +			0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
> 
> Here can be a problem: the device ID is embedded here, and it's hard to find out.  You'd better to make it some quirk flag that is set in a common place and check the flag here instead of checking ID at each place.
> 
> Do you have example of the solution? I found some quirk flag is static in the patch_realtek.c, can't be accessed outside that file.

You may store some values in struct hda_component, I suppose?

BTW, please try to fix your mailer to do citation more correctly...


thanks,

Takashi
