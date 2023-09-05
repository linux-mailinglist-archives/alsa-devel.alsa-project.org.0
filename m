Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF79792094
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E81825;
	Tue,  5 Sep 2023 08:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E81825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693896151;
	bh=tLxnY+wM3le5BMY58FdVirsSFSG8JDxBOgq2/FHLVYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KMtJXBaIc2sKK4L4TeNOJK7ktLSuBkDvfwkiCaLRAcA8PfBEWpdOr0QgqXOsPTO8p
	 KT5ucQvdPPQfw5W86BvfMvnwMDJmrFDFvgyvyvFssX/dqzW5VWy90WQ91KaRfQjNoB
	 mD3iEQPcooRH+H/qdMYqUM7orfyuXO4hjss6aVTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43304F804F3; Tue,  5 Sep 2023 08:41:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A667F80431;
	Tue,  5 Sep 2023 08:41:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B002CF8047D; Tue,  5 Sep 2023 08:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45A0BF80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A0BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LkJxQHb6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X91vtaxe
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEF942183F;
	Tue,  5 Sep 2023 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693896092;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PE0NRYqcaoH1xgDyVw88dT71TtOVhXgZWR8hgT6OzE=;
	b=LkJxQHb6jn5LOwuwEu74/yTfHIGTWB8eji7Ohia6RbR4gcF13Il/X1MGU2gztCAjk/eCiL
	trTV/3+fRMPBftpYp3rx2H8iOAqU2U6sx1DPVzvP5iNqJq/dsw9FYKsyyBlQnkyPfYaIBK
	NzmaFd113syKLx4Vy+4J1ciEYd7bFBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693896092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PE0NRYqcaoH1xgDyVw88dT71TtOVhXgZWR8hgT6OzE=;
	b=X91vtaxe+XGuE15NMuLjmH6TFq8M5dQ8A3IUslNTIVsYxfhUT3meW0uNkSvFNZHYVGW7JQ
	nh7afi3IlLJh5pCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4930413499;
	Tue,  5 Sep 2023 06:41:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fw7FEJzN9mQLUwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 05 Sep 2023 06:41:32 +0000
Date: Tue, 05 Sep 2023 08:41:31 +0200
Message-ID: <875y4pi0kk.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v3] ALSA: hda/tas2781: Revert structure name back to
 cs35l41_dev_name
In-Reply-To: <20230905041331.834-1-shenghao-ding@ti.com>
References: <20230905041331.834-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WCRVDH2Z4LWP5MP3PD7DL73TYYFE7FF4
X-Message-ID-Hash: WCRVDH2Z4LWP5MP3PD7DL73TYYFE7FF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCRVDH2Z4LWP5MP3PD7DL73TYYFE7FF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Sep 2023 06:13:30 +0200,
Shenghao Ding wrote:
> 
> Revert structure name back to cs35l41_dev_name, this structure won't be
> used any more in tas25781 driver code, the "bus" name can be passed by
> tas2781_generic_fixup, hid is actually "TIAS2781", can be hardcode and
> become an unneeded argument passed from tas2781_generic_fixup, as to
> "index", it is a redundant member in tas2781 driver, and have never been
> used in tas2781 hda driver before. And redefine tas2781_generic_fixup.

OK, now it's clearer.

So the purpose of this patch is rather to simplify the code.  The
revert of struct name is merely a side-effect.

That said, you can split even more, two logical changes: one is to
just simplify the code by the fixed name string, and another is the
rename back to struct cs35l41_dev_name.

But honestly speaking, I don't see the need for rename again; the
struct may be used by other codecs, and it's fine to keep a generic
struct name like the current one.  Leaving the struct name as is will
make the patch only as a cleanup (and you should correct the patch
subject accordingly).

And, I believe a more sensible improvement would be the use of the
standard acpi_*_match*() API as Andy already suggested.  It can be
folded into this cleanup or create a new patch on top of the cleanup.


thanks,

Takashi


> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> Changes in v3:
>  - Redefine tas2781_generic_fixup, remove hid argument, and do not use
>    structure scodec_dev_name any more in tas2781_generic_fixup.
>  - remove cs35l41_dev_name from comp_match_tas2781_dev_name, which is
>    useless in tas2781 driver. bus name is passed by tas2781_generic_fixup,
>    hid is actually "TIAS2781", can be hardcode and unneeded argument
>    passed from tas2781_generic_fixup. Index is a redundant member, and
>    never used in tas2781 hda driver.
>  - revert from scodec_dev_name back to cs35l41_dev_name, tas2781 pass only
>    bus name instead of cs35l41_dev_name, so it seemed unnecessary for
>    tas2781.
>  - revert from scodec_dev_name back to cs35l41_dev_name in
>    cs35l41_generic_fixup
> ---
>  sound/pci/hda/patch_realtek.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a07df6f929..c3e410152b 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6745,7 +6745,7 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
>  	}
>  }
>  
> -struct scodec_dev_name {
> +struct cs35l41_dev_name {
>  	const char *bus;
>  	const char *hid;
>  	int index;
> @@ -6754,7 +6754,7 @@ struct scodec_dev_name {
>  /* match the device name in a slightly relaxed manner */
>  static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  {
> -	struct scodec_dev_name *p = data;
> +	struct cs35l41_dev_name *p = data;
>  	const char *d = dev_name(dev);
>  	int n = strlen(p->bus);
>  	char tmp[32];
> @@ -6773,19 +6773,19 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  static int comp_match_tas2781_dev_name(struct device *dev,
>  	void *data)
>  {
> -	struct scodec_dev_name *p = data;
> +	const char *bus = data;
>  	const char *d = dev_name(dev);
> -	int n = strlen(p->bus);
> +	int n = strlen(bus);
>  	char tmp[32];
>  
>  	/* check the bus name */
> -	if (strncmp(d, p->bus, n))
> +	if (strncmp(d, bus, n))
>  		return 0;
>  	/* skip the bus number */
>  	if (isdigit(d[n]))
>  		n++;
>  	/* the rest must be exact matching */
> -	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> +	snprintf(tmp, sizeof(tmp), "-%s:00", "TIAS2781");
>  
>  	return !strcmp(d + n, tmp);
>  }
> @@ -6795,7 +6795,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
>  {
>  	struct device *dev = hda_codec_dev(cdc);
>  	struct alc_spec *spec = cdc->spec;
> -	struct scodec_dev_name *rec;
> +	struct cs35l41_dev_name *rec;
>  	int ret, i;
>  
>  	switch (action) {
> @@ -6824,24 +6824,17 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
>  }
>  
>  static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
> -	const char *bus, const char *hid)
> +	const char *bus)
>  {
>  	struct device *dev = hda_codec_dev(cdc);
>  	struct alc_spec *spec = cdc->spec;
> -	struct scodec_dev_name *rec;
>  	int ret;
>  
>  	switch (action) {
>  	case HDA_FIXUP_ACT_PRE_PROBE:
> -		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
> -		if (!rec)
> -			return;
> -		rec->bus = bus;
> -		rec->hid = hid;
> -		rec->index = 0;
>  		spec->comps[0].codec = cdc;
>  		component_match_add(dev, &spec->match,
> -			comp_match_tas2781_dev_name, rec);
> +			comp_match_tas2781_dev_name, (void *)bus);
>  		ret = component_master_add_with_match(dev, &comp_master_ops,
>  			spec->match);
>  		if (ret)
> @@ -6888,7 +6881,7 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
>  static void tas2781_fixup_i2c(struct hda_codec *cdc,
>  	const struct hda_fixup *fix, int action)
>  {
> -	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> +	 tas2781_generic_fixup(cdc, action, "i2c");
>  }
>  
>  /* for alc295_fixup_hp_top_speakers */
> -- 
> 2.34.1
> 
