Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2D86145C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 15:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE55846;
	Fri, 23 Feb 2024 15:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE55846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708699494;
	bh=eLIZMSmb78LEmjc5VF/D6H8+JyXyX3cmzx+s5/uKAgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nto3RHODkWaPwKyQB986IAhYUoaLOV5ZQmzImkmy3ETcOvbyiceMhhhpyEYDCpCXJ
	 2EWCOVRiU3Dhmv3G5O6bvG1whx18FZ9Aq2WkDaNpBIntvSWBwwPGx1otc4cw8oAAAj
	 ClIx34gs3JGe8iRLPeDy7H3KeUJLjoRdv3W1sBkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F57F805AB; Fri, 23 Feb 2024 15:44:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E6CF80579;
	Fri, 23 Feb 2024 15:44:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EAEFF80496; Fri, 23 Feb 2024 15:44:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B7642F800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 15:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7642F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=l0o9Jkmc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LyGQFEpO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PkQ3Anw9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FjVryfBp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8974C1F7D8;
	Fri, 23 Feb 2024 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bekkROyc9jCxC/hG+OjjJDl52Tue9nWVCqadQ0CbuUA=;
	b=l0o9JkmcjPWz+TspxIY7y91vYaCkO78LZGEQhAbx9vZnaPucFokWrgynUVqnlJqecgj9VD
	KcgthjazzafowINBktvm5EEZDZOnh4G+w74+JDRExKsyttCEbm0F1x53jw3P6v9CaqwTvO
	gRCGh0e8oTcMyZQLpUJFXdasOS3zjNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bekkROyc9jCxC/hG+OjjJDl52Tue9nWVCqadQ0CbuUA=;
	b=LyGQFEpOeu9eo+L2HBMrdVmc9s6V+ydirrJWwArDdIsNu39rPZze94uBr4pmzRe7es3xrl
	EbI6PZEHjt/PAmDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708699448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bekkROyc9jCxC/hG+OjjJDl52Tue9nWVCqadQ0CbuUA=;
	b=PkQ3Anw9IQjoNG7w1bgsYskuN+LDGpUPM8DSdmR80pQ7wscVzCjqhL9wm6PVKAoIUIrOcP
	oOaGBS82JAYdsN5ItxTZKB5hNQGDrruC2r1Kz/pRW1JAjxcKD6bioijpoIsyKYfK0Xfac2
	wCU/7/D0lBWcOyLl7Z3S1x/iF7pYpm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708699448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bekkROyc9jCxC/hG+OjjJDl52Tue9nWVCqadQ0CbuUA=;
	b=FjVryfBpXWgff0ItEuZIPm9mny4nPbnMAC3YOHu4ADa/4RKIdNHhcNXSM1ADnL9HI3mnir
	VgnvVZFa1+c3Z8BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 207F9133DC;
	Fri, 23 Feb 2024 14:44:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ck2BBjiv2GWfFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 14:44:08 +0000
Date: Fri, 23 Feb 2024 15:44:07 +0100
Message-ID: <87plwn2qbs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH v2 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if
 i915 is missing
In-Reply-To: <20240223114626.1052784-3-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
	<20240223114626.1052784-3-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.60 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.30)[90.11%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: 2SNVUESWMBMYS6R5PN5IVEL6XLF6TP4Y
X-Message-ID-Hash: 2SNVUESWMBMYS6R5PN5IVEL6XLF6TP4Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SNVUESWMBMYS6R5PN5IVEL6XLF6TP4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 12:46:24 +0100,
Cezary Rojewski wrote:
> 
> If i915 does not support given platform but the hardware i.e.: HDAudio
> codec is still there, the codec-probing procedure will succeed for such
> device but the follow up initialization will always end up with -ENODEV.
> 
> While bus could filter out address '2' which Intel's HDMI/DP codecs
> always enumerate on, more robust approach is to check for i915 presence
> before registering display codecs.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/codecs/hda.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
> index d2117e36ddd1..d9e7cd8aada2 100644
> --- a/sound/soc/codecs/hda.c
> +++ b/sound/soc/codecs/hda.c
> @@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
>  	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
>  	struct snd_soc_component_driver *comp_drv;
>  
> +	if (hda_codec_is_display(codec) && !hdev->bus->audio_component) {
> +		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
> +		return 0;

Should we return success here, or would it better with -ENODEV?
IIUC, the code path is from the early hda_codec_driver_probe() hook,
so returning an error can work.


Takashi
