Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E618C8221E8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:20:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981C5EA2;
	Tue,  2 Jan 2024 20:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981C5EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704223235;
	bh=x9ZNq+8m5LyQ2HoLwKmU+pzVjBOFJBHnToS+5FwGVCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fNiN9kKI2gAqE0BOp7oiTHWxGhC0x673mFN3aPUXe+G9pvDeEm0k9yKWW5N3wNdBI
	 msRRp7IxLTXZW1RdzzoVyoK/b6RUEr1Q5Zn3s8xLejamsJSVSPPSFdX+bJCvmoDhtf
	 j8nLORFAztlSSUQ+SSpFIEEF2Mg4oIZOgI/CBQhc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02ACBF80558; Tue,  2 Jan 2024 20:20:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 944C3F8055B;
	Tue,  2 Jan 2024 20:20:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25164F80424; Tue,  2 Jan 2024 20:19:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50ACFF80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50ACFF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=S/eGzVmA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rD9XuYYr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=S/eGzVmA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rD9XuYYr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B323821CF2;
	Fri, 29 Dec 2023 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703869904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZehKtOidM/ksrl2T81jqfsSZp7GZn6XIl7nNRgrGng=;
	b=S/eGzVmAA6Ap3PuXn45nqNlTdrP2TIxrszu9GDoIwfM/hIItuegORKSbqkl4g7x9vrZyWg
	6vojizgLs7Ep0wNvKj6ITcUGUsGovOJGRM+zd3Jlw82s4BlM8BO5vwnJZbvpFYvPFtS2+6
	YX6Xns0fJC3ftU54pV11SuW8bM5UZls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703869904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZehKtOidM/ksrl2T81jqfsSZp7GZn6XIl7nNRgrGng=;
	b=rD9XuYYrGWY+QjCpAVprJTrwz2N7yEqzQxaPnNIWB/zCeDtfIY7h13wWZsT+SjIdzu4hQ2
	meSBlXwAe3zLE+CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703869904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZehKtOidM/ksrl2T81jqfsSZp7GZn6XIl7nNRgrGng=;
	b=S/eGzVmAA6Ap3PuXn45nqNlTdrP2TIxrszu9GDoIwfM/hIItuegORKSbqkl4g7x9vrZyWg
	6vojizgLs7Ep0wNvKj6ITcUGUsGovOJGRM+zd3Jlw82s4BlM8BO5vwnJZbvpFYvPFtS2+6
	YX6Xns0fJC3ftU54pV11SuW8bM5UZls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703869904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZehKtOidM/ksrl2T81jqfsSZp7GZn6XIl7nNRgrGng=;
	b=rD9XuYYrGWY+QjCpAVprJTrwz2N7yEqzQxaPnNIWB/zCeDtfIY7h13wWZsT+SjIdzu4hQ2
	meSBlXwAe3zLE+CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42738133E5;
	Fri, 29 Dec 2023 17:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIFiDtD9jmVDFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 17:11:44 +0000
Date: Fri, 29 Dec 2023 18:11:43 +0100
Message-ID: <874jg1x7ao.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
In-Reply-To: <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
	<87sf3lxiet.wl-tiwai@suse.de>
	<ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,lists.linux.dev];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: 33IJVOL667SKZY3UYTZUKCZWBOQXMATR
X-Message-ID-Hash: 33IJVOL667SKZY3UYTZUKCZWBOQXMATR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33IJVOL667SKZY3UYTZUKCZWBOQXMATR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Dec 2023 16:24:18 +0100,
Dominik Brodowski wrote:
> 
> Hi Takashi,
> 
> many thanks for your response. Your patch helps half-way: the oops goes
> away, but so does the sound... With your patch, the decisive lines in dmesg
> are:
> 
> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> 	platform sof_sdw: deferred probe pending
> 
> With a revert of the a0575b4add21, it is:
> 
> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
> 	sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
> 	sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> 	input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
> 	input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
> 	input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
> 
> Maybe this helps a bit further?

Thanks for quick testing.
It shows at least that my guess wasn't wrong.

The problem could be the initialization order in the caller side.
Can the patch below work instead?


Takashi

-- 8< --
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -113,7 +113,9 @@ EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 #define is_generic_config(x)	0
 #endif
 
-static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, int type)
+static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr,
+					       int type,
+					       struct hdac_hda_priv *hda_priv)
 {
 	struct hda_codec *codec;
 	int ret;
@@ -126,6 +128,10 @@ static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, i
 
 	codec->core.type = type;
 
+	hda_priv->codec = codec;
+	hda_priv->dev_index = addr;
+	dev_set_drvdata(&codec->core.dev, hda_priv);
+
 	ret = snd_hdac_device_register(&codec->core);
 	if (ret) {
 		dev_err(bus->dev, "failed to register hdac device\n");
@@ -163,15 +169,12 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (!hda_priv)
 		return -ENOMEM;
 
-	codec = hda_codec_device_init(&hbus->core, address, HDA_DEV_LEGACY);
+	codec = hda_codec_device_init(&hbus->core, address, HDA_DEV_LEGACY,
+				      hda_priv);
 	ret = PTR_ERR_OR_ZERO(codec);
 	if (ret < 0)
 		return ret;
 
-	hda_priv->codec = codec;
-	hda_priv->dev_index = address;
-	dev_set_drvdata(&codec->core.dev, hda_priv);
-
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
 		if (!hbus->core.audio_component) {
 			dev_dbg(sdev->dev,
