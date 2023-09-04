Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C64791996
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8293D886;
	Mon,  4 Sep 2023 16:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8293D886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693837390;
	bh=YftHN36hpd10jH90LvTuveHdQb6jkB39GRykN/wpPR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cxy+Uy2tsrxVvwJGoJDpPrm/16iqy4OYQZbMjTNB/X711PF7jXvsyF5rJgj25F3Fm
	 IBTnxbSxYfibb5iEfhccz7TwuxcPk1KyWWvaHEWvbL+PRslx6YXAhLyZxGsC1Rah5A
	 G/4+s2JcrYG5J7c5EJ+31UgK+QRuPn6BkdX00ogc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF1CF80552; Mon,  4 Sep 2023 16:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C4DBF80552;
	Mon,  4 Sep 2023 16:21:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E7E7F8047D; Mon,  4 Sep 2023 16:19:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 52DA0F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52DA0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ze/PHRCf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EAvTdHE/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6877E1F74B;
	Mon,  4 Sep 2023 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693837166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZyvTQgedaKJiXqYqHMHvZpVK9xDlcrEcgSXeNgH5y7s=;
	b=ze/PHRCf0o+oQqa2PSxUBd/KNP88WPgMgvbSYok7YpnohHajGoxM3Oi4xL3cRirh3WcF49
	XdXsCVkDitUuJNgKdfqf+RWgQeSbYAlU5ZzuBq7hyhhDR6WsLHZ9saVhIQ67Pwt9TjzSex
	S/8lXQOSWdrL3k/4eNxQiJ1DCUh4e/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693837166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZyvTQgedaKJiXqYqHMHvZpVK9xDlcrEcgSXeNgH5y7s=;
	b=EAvTdHE/Fypb+E6WbzgejmmnOZgcep1aME65uCh0FdmSKEYKpdp+TeUsnKQlIkv6S9N7pe
	CcxT81tZ6BZBRhBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B11613425;
	Mon,  4 Sep 2023 14:19:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hCGzAW7n9WRhKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 04 Sep 2023 14:19:26 +0000
Date: Mon, 04 Sep 2023 16:19:25 +0200
Message-ID: <87il8qja1e.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Revert structure name back to
 cs35l41_dev_name
In-Reply-To: <20230904140140.1253-1-shenghao-ding@ti.com>
References: <20230904140140.1253-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MN55KIZGNK34VOANCXV7W7Q5AQTNZ542
X-Message-ID-Hash: MN55KIZGNK34VOANCXV7W7Q5AQTNZ542
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MN55KIZGNK34VOANCXV7W7Q5AQTNZ542/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Sep 2023 16:01:40 +0200,
Shenghao Ding wrote:
> 
> Revert structure name back to cs35l41_dev_name and redefine
> tas2781_generic_fixup.

Again, please describe *why* you need to do this.
That's the most important part.  And, if you write the reason for the
change, you can re-evaluate whether it really makes sense in that
regard.


thanks,

Takashi

> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> Changes in v2:
>  - Add more description on why revert structure name back to
>    cs35l41_dev_name
>  - Redefine tas2781_generic_fixup, remove hid argument, and do not use
>    structure scodec_dev_name any more in tas2781_generic_fixup.
>  - remove cs35l41_dev_name from comp_match_tas2781_dev_name, which is
>    useless. bus name is passed by tas2781_generic_fixup, hid is actually
>    "TIAS2781", can be hardcode and unneeded argument passed from
>    tas2781_generic_fixup.
>    Index is a redundant member, and never used in tas2781 hda driver.
>  - revert from scodec_dev_name back to cs35l41_dev_name, tas2781 pass only
>    bus name instead of cs35l41_dev_name, so it seemed unnecessary for
>    tas2781.
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
