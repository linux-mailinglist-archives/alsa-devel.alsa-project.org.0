Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3B7EB323
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 16:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29AEC74C;
	Tue, 14 Nov 2023 16:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29AEC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699974677;
	bh=GJW7gAEyAGuYDPOHzqlGgjzZJjQeo/HjjP37+L2JB6A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d4IQKNuxZK8LYW3lpJDC80VOTqOd9m4N2Y9/39OBDBg1NfZpFv/Ip2N63Ipz89xG0
	 3zM/rsigoRbJaqvFwrM1KbHUtx7CauOs1Bc3zCGunTr/CaRIMcfzTHBaZo5b4jYnk/
	 d7z4MLH4HhXhcNlkrmOgkWSmjbwHDfeghfkbnXVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B36F8055B; Tue, 14 Nov 2023 16:10:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E86CF8016E;
	Tue, 14 Nov 2023 16:10:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4581DF801D5; Tue, 14 Nov 2023 16:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31AE9F80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 16:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AE9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OFCyOkNK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CM4KCWHq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BCC0F20430;
	Tue, 14 Nov 2023 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699974595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quyE9yUIXAcU/iXITKjwH9nyqmZqpL/xBc8qDwQ46Y=;
	b=OFCyOkNKgRqvb8OGy2b0+9G391OCFf/Mm0bg5Qr2sQTLGBzgfMJfdNWfFInyD8KA63Xdo0
	PI7fqCw2InkFs5yM+7MrBpOVbDS+ESjtLLfC4razjlONVJyDXrHyy5WgtIEtPJM4vAyz0v
	LCXKZ4sBRg3vee6cySWEGNn0hc7rKeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699974595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quyE9yUIXAcU/iXITKjwH9nyqmZqpL/xBc8qDwQ46Y=;
	b=CM4KCWHqYSBVTunKLrNqqBpPVoVP1q6sU15IT1RB3mD+OoIMXtshMCtGC5x84PCcEZMNZL
	5aFkd/obAopX/5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96B2F13416;
	Tue, 14 Nov 2023 15:09:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8tb0I8ONU2UcRgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 14 Nov 2023 15:09:55 +0000
Date: Tue, 14 Nov 2023 16:09:55 +0100
Message-ID: <871qcsqsl8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	alsa-devel@alsa-project.org
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
In-Reply-To: <ZVNUxZzCGcxQzqJX@intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
	<20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
	<ZVNUxZzCGcxQzqJX@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-9.61 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.51)[97.78%]
Message-ID-Hash: LWOMYBXJOO7NO5DLCSRKYTIX5BTNZYVV
X-Message-ID-Hash: LWOMYBXJOO7NO5DLCSRKYTIX5BTNZYVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWOMYBXJOO7NO5DLCSRKYTIX5BTNZYVV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Nov 2023 12:06:45 +0100,
Ville Syrjälä wrote:
> 
> On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.com wrote:
> > From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > 
> > Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> > the snd_hdac_i915_init into a workqueue.
> > 
> > Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> > probe function.
> 
> This completely broke i915 audio!
> 
> I also can't see any trace of this stuff ever being posted to 
> intel-gfx so it never went through the CI.
> 
> Please fix or revert ASAP.

It's hard to judge without any log nor h/w details (as a typical bug
report from a developer :)

As a blind shot, does the patch below fix your case?


thanks,

Takashi

-- 8< --
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2141,6 +2141,9 @@ static int azx_probe(struct pci_dev *pci,
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
 		err = snd_hdac_i915_init(azx_bus(chip));
 		if (err < 0) {
+			if (err == -EPROBE_DEFER)
+				goto out_free;
+
 			/* if the controller is bound only with HDMI/DP
 			 * (for HSW and BDW), we need to abort the probe;
 			 * for other chips, still continue probing as other
