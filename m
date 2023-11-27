Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC237FA0C0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CDCFA4A;
	Mon, 27 Nov 2023 14:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CDCFA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701091131;
	bh=sENAWL6rT5DHZ4dQSYoN4ADP6xIAgD52nsKqQ7kyAmY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xoa69vNt3yMUXAdTMW51gkU4YgmRUJkF6wjOVPSeZkK6cHJEGJstDCXEkheAV1m5n
	 mgy5Ne7zgRSCeQltt3K0hE7YJnIm04UsPbaHdaZj7a42WDa2jJstDEz1sWNOR2ulCP
	 d+FRM9K1wr+lErirlaO9fHLNz+unw2S77nFo5x5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BC9F80588; Mon, 27 Nov 2023 14:18:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE04F80236;
	Mon, 27 Nov 2023 14:18:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31ECEF801D5; Mon, 27 Nov 2023 14:18:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D20C7F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20C7F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E7ojhr6R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=37w/QVEZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67C4E2027F;
	Mon, 27 Nov 2023 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701091085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNAJXSbZ4ceZnIjZKwsZNQsE83LDGnpsIJXwI12ogJ4=;
	b=E7ojhr6R+D3vSMl3Ljsv4Rs8qFcuRidujxJvG6CrpV9qLaCB+iS4Dfgsmds7tOkYpCpPCe
	v91RrCrTpg4JrGtWynGGnSPv4/EtPoQF7smhIquOcUjV2edDPw26mQOVupGEQMStb6VCFT
	oSLPkMnuoFznyQQ7ubPBMXdff6Fm/Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701091085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNAJXSbZ4ceZnIjZKwsZNQsE83LDGnpsIJXwI12ogJ4=;
	b=37w/QVEZ8hrwiuf/z7xQO77uKZDrAtq7uon2ECNAu0BEKxs+zjJC513bj/Y8Ohf8l3T2KI
	WOlurM/YN9dZKKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16DB91367B;
	Mon, 27 Nov 2023 13:18:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6LL4Aw2XZGXgDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Nov 2023 13:18:05 +0000
Date: Mon, 27 Nov 2023 14:18:04 +0100
Message-ID: <87jzq3pc6r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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
In-Reply-To: <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
	<20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.30 / 50.00];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: MX74WNLPYVDHVKVEOW3CPYTNYU6F3RVC
X-Message-ID-Hash: MX74WNLPYVDHVKVEOW3CPYTNYU6F3RVC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MX74WNLPYVDHVKVEOW3CPYTNYU6F3RVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 14:02:44 +0100,
Peter Ujfalusi wrote:
> 
> The snd_hda_device_is_hdmi() can be used in drivers to check if the hdev
> belongs to a display audio device.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  include/sound/hdaudio.h    | 10 ++++++++++
>  sound/pci/hda/patch_hdmi.c | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index dd7c87bbc613..cf5483d6b5b7 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -158,6 +158,16 @@ bool snd_hdac_check_power_state(struct hdac_device *hdac,
>  		hda_nid_t nid, unsigned int target_state);
>  unsigned int snd_hdac_sync_power_state(struct hdac_device *hdac,
>  		      hda_nid_t nid, unsigned int target_state);
> +
> +#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev);
> +#else
> +static inline bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
> +{
> +	return false;
> +}
> +#endif
> +
>  /**
>   * snd_hdac_read_parm - read a codec parameter
>   * @codec: the codec object
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 1cde2a69bdb4..d6943575c8c7 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -4645,6 +4645,19 @@ HDA_CODEC_ENTRY(HDA_CODEC_ID_GENERIC_HDMI, "Generic HDMI", patch_generic_hdmi),
>  };
>  MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_hdmi);
>  
> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);

I'm afraid that this will bring unnecessary dependency on HDMI codec
driver.

IMO, it's better to add a bool flag is_hdmi to struct hdac_device, and
let the HDMI codec driver setting it at the probe, instead.  Then we
can save an extra exported symbol, too.


thanks,

Takashi
