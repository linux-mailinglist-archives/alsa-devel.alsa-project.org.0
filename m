Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96A8672AC
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 12:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 543C4839;
	Mon, 26 Feb 2024 12:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 543C4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708945790;
	bh=JFrZhl2s3V6bOgunbNihfw2Wulvq2LTqnSZ68Jgu+qI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s1jfdoLwEYKo7f4TzeLjSk9H1b3EzTNSNypLrvZYx3QyT1Tel8KfQELdnjc9VzijD
	 HuK+i9b0jrrq1TjAv3k2D7PH/8JyjW6EBmm91O6hcfclRu6WhiWXjyq+ydjufxhybQ
	 73HtwC41jpHY1VmQ0A3tP6jdZO1VWrkSSkBKhfrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B453BF8057E; Mon, 26 Feb 2024 12:09:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A39FF8058C;
	Mon, 26 Feb 2024 12:09:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F56F80246; Mon, 26 Feb 2024 12:09:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E5ACF8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 12:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5ACF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HGsddNa7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jJPg1PXR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HGsddNa7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jJPg1PXR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2CB611FB44;
	Mon, 26 Feb 2024 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708945753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=HGsddNa7xLzNxUZOW7rRXy7XngEoi0MgpG/zXSjVI1CYPZeeg3lPQGAyzHFIv4lB8ye4p4
	cOA9twm2j7ooWbb0d5DuAuWc6y9Wv2R0p/T+/0uxPmrLfyaBud+XI5WI8w2LaBVGihoy66
	Lbx1NCgkOqW++DXkdTsjSx06zOhETsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708945753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=jJPg1PXRU9rVvPYtxO9HROlq1Rso1Pka0pQQ4BZpApvcc31wa8/QlhQjZjJtegBRVQEuIK
	HKrSd1sfZeBGhPDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708945753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=HGsddNa7xLzNxUZOW7rRXy7XngEoi0MgpG/zXSjVI1CYPZeeg3lPQGAyzHFIv4lB8ye4p4
	cOA9twm2j7ooWbb0d5DuAuWc6y9Wv2R0p/T+/0uxPmrLfyaBud+XI5WI8w2LaBVGihoy66
	Lbx1NCgkOqW++DXkdTsjSx06zOhETsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708945753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=te11WaeX7OAf02qoJP3VKHEWOzFi52BKV+snlTsoDhA=;
	b=jJPg1PXRU9rVvPYtxO9HROlq1Rso1Pka0pQQ4BZpApvcc31wa8/QlhQjZjJtegBRVQEuIK
	HKrSd1sfZeBGhPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1D3213A58;
	Mon, 26 Feb 2024 11:09:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ebAALlhx3GVYOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Feb 2024 11:09:12 +0000
Date: Mon, 26 Feb 2024 12:09:12 +0100
Message-ID: <87o7c3zdlz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<jani.nikula@linux.intel.com>,
	<joonas.lahtinen@linux.intel.com>,
	<rodrigo.vivi@intel.com>,
	<tvrtko.ursulin@linux.intel.com>,
	<intel-gfx@lists.freedesktop.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if
 i915 is missing
In-Reply-To: <19f57fc4-ae64-4054-a85c-38ff37c1bded@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
	<20240223114626.1052784-3-cezary.rojewski@intel.com>
	<87plwn2qbs.wl-tiwai@suse.de>
	<19f57fc4-ae64-4054-a85c-38ff37c1bded@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: 3BNMWRRWAZS63GSSAS52XM6DE47YW7OF
X-Message-ID-Hash: 3BNMWRRWAZS63GSSAS52XM6DE47YW7OF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BNMWRRWAZS63GSSAS52XM6DE47YW7OF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 18:09:59 +0100,
Cezary Rojewski wrote:
> 
> On 2024-02-23 3:44 PM, Takashi Iwai wrote:
> > On Fri, 23 Feb 2024 12:46:24 +0100,
> > Cezary Rojewski wrote:
> >> 
> >> If i915 does not support given platform but the hardware i.e.: HDAudio
> >> codec is still there, the codec-probing procedure will succeed for such
> >> device but the follow up initialization will always end up with -ENODEV.
> >> 
> >> While bus could filter out address '2' which Intel's HDMI/DP codecs
> >> always enumerate on, more robust approach is to check for i915 presence
> >> before registering display codecs.
> >> 
> >> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >> ---
> >>   sound/soc/codecs/hda.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >> 
> >> diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
> >> index d2117e36ddd1..d9e7cd8aada2 100644
> >> --- a/sound/soc/codecs/hda.c
> >> +++ b/sound/soc/codecs/hda.c
> >> @@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
> >>   	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
> >>   	struct snd_soc_component_driver *comp_drv;
> >>   +	if (hda_codec_is_display(codec) &&
> >> !hdev->bus->audio_component) {
> >> +		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
> >> +		return 0;
> > 
> > Should we return success here, or would it better with -ENODEV?
> > IIUC, the code path is from the early hda_codec_driver_probe() hook,
> > so returning an error can work.
> 
> Good suggestion. Indeed attach() is called by probe() which treats
> -ENODEV just fine.
> 
> There is a consequence to that though. Logs from LKF show:
> 
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_hdmi hdaudioB0D2: no
> i915, skip registration for 0x80862811
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
> no i915, skip registration for 0x80862811
> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
> no i915, skip registration for 0x80862811
> snd_hda_codec:snd_hda_codec_configure: hdaudio hdaudioB0D2: Unable to
> bind the codec
> snd_soc_avs 0000:00:1f.3: failed to config codec -19
> snd_soc_avs 0000:00:1f.3: Codec #2 probe error; disabling it...

Yeah the latter two are basically fallbacks, and I guess we can
disable them for ASoC case?  An additional patch like below.


thanks,

Takashi

--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -279,6 +279,10 @@ static int codec_bind_generic(struct hda_codec *codec)
 	if (codec->probe_id)
 		return -ENODEV;
 
+	/* no generic fallback for ASoC binding */
+	if (codec->bus->core.ext_ops)
+		return -ENODEV;
+
 	if (is_likely_hdmi_codec(codec)) {
 		codec->probe_id = HDA_CODEC_ID_GENERIC_HDMI;
 		request_codec_module(codec);
