Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63608B1CE9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 10:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5776A4A;
	Thu, 25 Apr 2024 10:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5776A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714034309;
	bh=0dIh4LHgUbJuCJF+8DoH/DJlCPUPndY1t3Z95Mcsx0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LRW2OHdwYg3Cr/4MEYVfLr588pPQNftGMY8WsWVO37jYhoc8ScbPtIjb9i5lfSgtc
	 H0tRnp/TYXq+0Q0RhhAXoNG/87b1H19BM2I3tnbgEJaeu3eKv/V6nk7mpQp8xGj2Rk
	 EVfj0Yc20+gNdbDAkNyfL7PLJMHvWS2mDrTC0P/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD80BF80578; Thu, 25 Apr 2024 10:37:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F8BF802E8;
	Thu, 25 Apr 2024 10:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F06D3F80423; Thu, 25 Apr 2024 10:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A67E2F800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 10:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67E2F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cPMyMMNB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pP97c+74;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cPMyMMNB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pP97c+74
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BF2E223F5;
	Thu, 25 Apr 2024 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714034163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf88i74i2+qTbNAAy8w1XykSSgUoUDBY5wMNzPfpBFQ=;
	b=cPMyMMNBCZMSJTfVgSN8ghwjp22r2+AB+ja7YRhKDQffLfyi3/r64OXKxw4V2F7s+IRoqI
	PyawQAndLXigMEhvEY8GN2T2z+yIynCIG+1LBz9TS6+Z36dmlSFSa/iYpwevnXWfeiFnIu
	ihxLmOjhr0bjmdZI0o8IBCdmUx3s6pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf88i74i2+qTbNAAy8w1XykSSgUoUDBY5wMNzPfpBFQ=;
	b=pP97c+74fuKTcAxRZ+jU1wX/cnoBK5Ib8LuwPJgHujf+0aUZD2O4QW3Ah7xBmfr4bhGHJt
	qs7dym2ons4XwACA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714034163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf88i74i2+qTbNAAy8w1XykSSgUoUDBY5wMNzPfpBFQ=;
	b=cPMyMMNBCZMSJTfVgSN8ghwjp22r2+AB+ja7YRhKDQffLfyi3/r64OXKxw4V2F7s+IRoqI
	PyawQAndLXigMEhvEY8GN2T2z+yIynCIG+1LBz9TS6+Z36dmlSFSa/iYpwevnXWfeiFnIu
	ihxLmOjhr0bjmdZI0o8IBCdmUx3s6pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714034163;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf88i74i2+qTbNAAy8w1XykSSgUoUDBY5wMNzPfpBFQ=;
	b=pP97c+74fuKTcAxRZ+jU1wX/cnoBK5Ib8LuwPJgHujf+0aUZD2O4QW3Ah7xBmfr4bhGHJt
	qs7dym2ons4XwACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D9E613991;
	Thu, 25 Apr 2024 08:36:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h/0LHvMVKmZHHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 08:36:03 +0000
Date: Thu, 25 Apr 2024 10:36:14 +0200
Message-ID: <87edatc001.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
In-Reply-To: <3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
References: <20240425072000.22284-1-aaron.ma@canonical.com>
	<87h6fpc21p.wl-tiwai@suse.de>
	<3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 5GSHHNEPBCE27Z5OQQWMOQ2SNVAGHGEI
X-Message-ID-Hash: 5GSHHNEPBCE27Z5OQQWMOQ2SNVAGHGEI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GSHHNEPBCE27Z5OQQWMOQ2SNVAGHGEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Apr 2024 09:54:17 +0200,
Aaron Ma wrote:
> 
> 
> On 4/25/24 15:52, Takashi Iwai wrote:
> 
>     On Thu, 25 Apr 2024 09:20:00 +0200,
>     Aaron Ma wrote:
>     
>         TI upstream the files in ti/tas2781 for linux-firmware.
>         Make the driver find the correct files.
>         
>     Note that the upstream linux-firmware provides symlinks to
>     ti/tas2781/* files, so it's not "incorrect", so far :)
> 
> $ find . -iname TIAS2781RCA2.bin
> ./ti/tas2781/TIAS2781RCA2.bin
> 
> Only one bin file found.
> Could you point it out clearly?

See WHENCE file.  It has "Link:" entries, and copy-firmware.sh creates
corresponding symlinks.


HTH,

Takashi

> 
> Thanks,
> Aaron
> 
>     thanks,
>     
>     Takashi
> 
>         Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>         ---
>          include/sound/tas2781.h           | 1 +
>          sound/pci/hda/tas2781_hda_i2c.c   | 2 +-
>          sound/soc/codecs/tas2781-comlib.c | 2 +-
>          3 files changed, 3 insertions(+), 2 deletions(-)
>         
>         diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
>         index 99ca3e401fd1..72119cc32c0f 100644
>         --- a/include/sound/tas2781.h
>         +++ b/include/sound/tas2781.h
>         @@ -21,6 +21,7 @@
>          /* version number */
>          #define TAS2781_DRV_VER                                                1
>          #define SMARTAMP_MODULE_NAME                                           "tas2781"
>         +#define TAS2781_FIRMWARE_ROOT                                          "ti/tas2781/"
>          #define TAS2781_GLOBAL_ADDR                      0x40
>          #define TAS2563_GLOBAL_ADDR                      0x48
>          #define TASDEVICE_RATES                                                (SNDRV_PCM_RATE_44100 |\
>         diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
>         index 75f7674c66ee..72dc1469655f 100644
>         --- a/sound/pci/hda/tas2781_hda_i2c.c
>         +++ b/sound/pci/hda/tas2781_hda_i2c.c
>         @@ -649,7 +649,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>               tasdevice_dsp_remove(tas_priv);
>          
>               tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
>         -     scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
>         +     scnprintf(tas_priv->coef_binaryname, 64, "%sTAS2XXX%04X.bin", TAS2781_FIRMWARE_ROOT,
>                                     codec->core.subsystem_id & 0xffff);
>               ret = tasdevice_dsp_parser(tas_priv);
>               if (ret) {
>         diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
>         index 3aa81514dad7..96fe1b855ec9 100644
>         --- a/sound/soc/codecs/tas2781-comlib.c
>         +++ b/sound/soc/codecs/tas2781-comlib.c
>         @@ -277,7 +277,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
>                */
>               mutex_lock(&tas_priv->codec_lock);
>          
>         -     scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
>         +     scnprintf(tas_priv->rca_binaryname, 64, "%s%sRCA%d.bin", TAS2781_FIRMWARE_ROOT,
>                                     tas_priv->dev_name, tas_priv->ndev);
>               crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
>               tas_priv->codec = codec;
>         -- 
>         2.34.1
> 
