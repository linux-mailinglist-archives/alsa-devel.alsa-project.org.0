Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFB790CE5
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 18:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C7C74C;
	Sun,  3 Sep 2023 18:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C7C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693758873;
	bh=9FpJAxf3DDVwil7qi+VUGix26CLuLCl1VJofdB5/1k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TLa56k+jhEyThicYWc87B2ZyXliYSV1AHG3CV0AO+RjCCgsJ91/h1VpVkVE2NowhX
	 NMtm4DD4CHicexRIEMU0Hj/SBmhoXQmBf2Z7PQ9cZJvhM2RhI7blzPPd0B9fLCi5Zo
	 64g0rBBrU2jGdGjUe/AdY8DKjPItDyzLoGYFfr5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 024F9F80564; Sun,  3 Sep 2023 18:33:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7001F80494;
	Sun,  3 Sep 2023 18:33:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34476F80494; Sun,  3 Sep 2023 18:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A23F804F3
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 18:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A23F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0T658nTz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s4ZAbqWY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC7781F460;
	Sun,  3 Sep 2023 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693758815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xp8Sb/watMz7Zi6Q0dpAgx4sfErZ6UCjyhXrUUImxQI=;
	b=0T658nTztdR9ro4nQ3ldvbvr+5Icla6FqyP6kXZX1X1qWq9fztqQLpKHid40GsuFJRUYGG
	epOuKTaYtWKyi7rqiw9RN/oSnM/b/q138tC1wwn1hnhkxEwh0gvwvWcGhUg676onCLjhX5
	RyzD72hPS8SzrYoYicUaCLsCy/af0Q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693758815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xp8Sb/watMz7Zi6Q0dpAgx4sfErZ6UCjyhXrUUImxQI=;
	b=s4ZAbqWYqjz3lZWsmSL2GyWhjTCSkGIR8Vg2JmF/9Q9WRi7IWz2aO3W9kRV77mwlahpJqE
	y6Em5Vw3S7V3hJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35C6B13583;
	Sun,  3 Sep 2023 16:33:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ftsaDF+19GQvHwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 03 Sep 2023 16:33:35 +0000
Date: Sun, 03 Sep 2023 18:33:34 +0200
Message-ID: <87ttsbkyht.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1 2/2] ALSA: hda/tas2781: Update tas2781 HDA driver
In-Reply-To: <20230903143759.92-2-shenghao-ding@ti.com>
References: <20230903143759.92-1-shenghao-ding@ti.com>
	<20230903143759.92-2-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZRYK4JPONVX2CG23YZAKWIAZLXSELDYO
X-Message-ID-Hash: ZRYK4JPONVX2CG23YZAKWIAZLXSELDYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRYK4JPONVX2CG23YZAKWIAZLXSELDYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 16:37:58 +0200,
Shenghao Ding wrote:
> 
> Support ACPI_ID both TXNW2781 and TIAS2781, update dsp/bypass mode
> switching in tasdevice_program_put.

Again, if you change multiple things, split to individual patches.


thanks,

Takashi


> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> Changes in v1:
>  - Add comment on dsp/bypass mode in tasdevice_program_put and
>    tasdevice_info_programs
>  - TIAS2781 has been used by our customers, see following dstd.dsl. We
>    have discussed this with them, they requested TIAS2781 must be
>    supported for the laptops already released to market, their new laptop
>    can switch to TXNW2781
>    Name (_HID, "TIAS2781")  // _HID: Hardware ID
>    Name (_UID, Zero)  // _UID: Unique ID
>    Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
>    {
>        If ((SPID == Zero))
>        {
>           Return ("17AA3886")
>        }
> 
>        If ((SPID == One))
>        {
>            Return ("17AA3884")
>        }
>    }
> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index fb80280293..5250d300a2 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -199,8 +199,11 @@ static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
>  
>  	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>  	uinfo->count = 1;
> +	/* 0:			dsp mode
> +	 * non-zero:	bypass mode
> +	 */
>  	uinfo->value.integer.min = 0;
> -	uinfo->value.integer.max = tas_fw->nr_programs - 1;
> +	uinfo->value.integer.max = tas_fw->nr_programs;
>  
>  	return 0;
>  }
> @@ -238,7 +241,10 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
>  	int max = tas_fw->nr_programs - 1;
>  	int val, ret = 0;
>  
> -	val = clamp(nr_program, 0, max);
> +	/* 0:			dsp mode
> +	 * non-zero:	bypass mode
> +	 */
> +	val = (nr_program) ? max : 0;
>  
>  	if (tas_priv->cur_prog != val) {
>  		tas_priv->cur_prog = val;
> @@ -647,7 +653,9 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
>  	const char *device_name;
>  	int ret;
>  
> -	if (strstr(dev_name(&clt->dev), "TIAS2781"))
> +	if (strstr(dev_name(&clt->dev), "TXNW2781"))
> +		device_name = "TXNW2781";
> +	else if (strstr(dev_name(&clt->dev), "TIAS2781"))
>  		device_name = "TIAS2781";
>  	else
>  		return -ENODEV;
> @@ -824,6 +832,7 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
>  
>  static const struct acpi_device_id tas2781_acpi_hda_match[] = {
>  	{"TIAS2781", 0 },
> +	{"TXNW2781", 1 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
> -- 
> 2.34.1
> 
