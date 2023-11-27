Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6F7FA2C1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 15:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3739C828;
	Mon, 27 Nov 2023 15:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3739C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701095511;
	bh=InRTcrjcsCOwA0Pq5ax7Dh8wtLp454aY9gvz+EYcg5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dLimMWkK8Oq80xzu9xdKXQyYP1qvaZgLWPyMPa34wGCM3931h4DR88ikSF5dv6TSv
	 wiR4ht67Qn+BAzYSCEBYewCMKndeE4+XBrIdImXBdmc84uxnqMg7rP4JiMF1QOBJpN
	 IF7rtVP6xYGNlNLRDube2M37FFVh2l2ayHcFob9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA78F80568; Mon, 27 Nov 2023 15:31:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E3B3F801D5;
	Mon, 27 Nov 2023 15:31:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DC9EF801D5; Mon, 27 Nov 2023 15:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE844F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 15:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE844F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KoKPCTdn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rwFxD9lM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23C481FCFD;
	Mon, 27 Nov 2023 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701095462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NocL7OSjyA4hwu4QV7cayvv/T/SxQnegCg72Am6XPC4=;
	b=KoKPCTdnUiZEtJs6suOlfaZGQnH3FhZXT8tL8qPt4gzRZvc7cxexYR+qxR5THxQogP4ALt
	yrWtrq/wXKa0Z9Uqj0fcNk0uiBEMYnncu/runFcJtIuj28V4wsghPuicqHepIY6Ot1m9w4
	ukhU1F1zykRSAW1nYAOeyM9KR/OGtR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701095462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NocL7OSjyA4hwu4QV7cayvv/T/SxQnegCg72Am6XPC4=;
	b=rwFxD9lMmPtR7xZHMtILr+NWy8siYmyyt9FbJdG1docvCd+lC14Aj16y/2MRReer8kNfn2
	BsfrDMEZCIuGQkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1EF51379A;
	Mon, 27 Nov 2023 14:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DTXVLSWoZGVfLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Nov 2023 14:31:01 +0000
Date: Mon, 27 Nov 2023 15:31:01 +0100
Message-ID: <87cyvvp8t6.wl-tiwai@suse.de>
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
In-Reply-To: <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
	<20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
	<87jzq3pc6r.wl-tiwai@suse.de>
	<d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-5.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.19)[89.08%]
Message-ID-Hash: HWJ7REVTN3NQBUI457YMUWOHBTABCTWW
X-Message-ID-Hash: HWJ7REVTN3NQBUI457YMUWOHBTABCTWW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWJ7REVTN3NQBUI457YMUWOHBTABCTWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 15:12:51 +0100,
Péter Ujfalusi wrote:
> 
> 
> 
> On 27/11/2023 15:18, Takashi Iwai wrote:
> >> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
> >> +{
> >> +	int i;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
> >> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
> >> +			return true;
> >> +	}
> >> +
> >> +	return false;
> >> +}
> >> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
> > 
> > I'm afraid that this will bring unnecessary dependency on HDMI codec
> > driver.
> 
> For HDMI support we anyways need HDMI code?

But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
thought?

With your patch, now it becomes a hard-dependency.  It'll be even
build failure when HDMI codec driver isn't enabled in Kconfig.


Takashi
