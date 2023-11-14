Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C57EAFE9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 13:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F90D7F4;
	Tue, 14 Nov 2023 13:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F90D7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699965389;
	bh=rgBX+6BNPPignD2WXoRNHkw+DgIpZgv7ToDXL12eqIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYF8/l8CuhDleE9luu2tP7amqnySETNRQGImsKBcdCLlyn/bssuWP7As8+C4BeMt9
	 BDaGz2OlwD6kTIXNzAY++7PiFzzhh6OakX3yBZIQhdferXDvf3tMo1BefAFi6zLnDy
	 GIBq35s71FYVcVxUuwQ22E+5trguqqgewyA10KSc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45189F80549; Tue, 14 Nov 2023 13:35:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDAF3F8016E;
	Tue, 14 Nov 2023 13:35:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E7AF801D5; Tue, 14 Nov 2023 13:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A137F80152
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 13:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A137F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BgtlmDvn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699965323; x=1731501323;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=rgBX+6BNPPignD2WXoRNHkw+DgIpZgv7ToDXL12eqIQ=;
  b=BgtlmDvnY81DCrfydbNU736AvYkyB/avhj+vA6gJx6JcW5YDhrcqUIsj
   IOdyr2gKG1xaH45kyYHRfhw4jfrFOrZiYH7rh9gtau+h1OD22CliBLgF9
   watk/LsOlXxkFK5hr4jovG9tK1Jg3Oi9GPKrKYLMyIvbzeWXkILIlCfX2
   BMQjYulx9JFzd+1QuLGXGf0y4FppT8SG/Q5nHvk8slgR6TX5W9p/Dd9ZO
   Vhq6Gq1Qr0wrNMsJvCrdRiCfKM14hwK6lcdNjo9ISG1neJ+nPxKxUN52o
   dE5uZXNyxG2hMPWS840IodU/Pv5Dwu7E/i+argi9FId1HGdZCmW405qHy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421743946"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="421743946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 04:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="5792560"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 04:35:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 maarten.lankhorst@linux.intel.com
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alsa-devel@alsa-project.org, "Saarinen,
 Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move
 snd_hdac_i915_init to before probe_work.
In-Reply-To: <ZVNUxZzCGcxQzqJX@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com>
Date: Tue, 14 Nov 2023 14:35:10 +0200
Message-ID: <87bkbwsebl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SQLNABIKWVJEI2GQ5OCVITLYT3PEKYWV
X-Message-ID-Hash: SQLNABIKWVJEI2GQ5OCVITLYT3PEKYWV
X-MailFrom: jani.nikula@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQLNABIKWVJEI2GQ5OCVITLYT3PEKYWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Nov 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.c=
om wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>=20
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>> the snd_hdac_i915_init into a workqueue.
>>=20
>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>> probe function.
>
> This completely broke i915 audio!
>
> I also can't see any trace of this stuff ever being posted to=20
> intel-gfx so it never went through the CI.
>
> Please fix or revert ASAP.

Cc: Jani, Suresh

Ville, please file a bug at gitlab so we can track this, thanks.

BR,
Jani.



>
>>=20
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  sound/pci/hda/hda_intel.c | 54 +++++++++++++++++++--------------------
>>  1 file changed, 27 insertions(+), 27 deletions(-)
>>=20
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index e42ad0e816e1..9dad3607596a 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -2135,6 +2135,33 @@ static int azx_probe(struct pci_dev *pci,
>>=20=20
>>  	pci_set_drvdata(pci, card);
>>=20=20
>> +#ifdef CONFIG_SND_HDA_I915
>> +	/* bind with i915 if needed */
>> +	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>> +		err =3D snd_hdac_i915_init(azx_bus(chip), false);
>> +		if (err < 0) {
>> +			/* if the controller is bound only with HDMI/DP
>> +			 * (for HSW and BDW), we need to abort the probe;
>> +			 * for other chips, still continue probing as other
>> +			 * codecs can be on the same link.
>> +			 */
>> +			if (HDA_CONTROLLER_IN_GPU(pci)) {
>> +				goto out_free;
>> +			} else {
>> +				/* don't bother any longer */
>> +				chip->driver_caps &=3D ~AZX_DCAPS_I915_COMPONENT;
>> +			}
>> +		}
>> +
>> +		/* HSW/BDW controllers need this power */
>> +		if (HDA_CONTROLLER_IN_GPU(pci))
>> +			hda->need_i915_power =3D true;
>> +	}
>> +#else
>> +	if (HDA_CONTROLLER_IN_GPU(pci))
>> +		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SN=
D_HDA_I915\n");
>> +#endif
>> +
>>  	err =3D register_vga_switcheroo(chip);
>>  	if (err < 0) {
>>  		dev_err(card->dev, "Error registering vga_switcheroo client\n");
>> @@ -2162,11 +2189,6 @@ static int azx_probe(struct pci_dev *pci,
>>  	}
>>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>>=20=20
>> -#ifndef CONFIG_SND_HDA_I915
>> -	if (HDA_CONTROLLER_IN_GPU(pci))
>> -		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SN=
D_HDA_I915\n");
>> -#endif
>> -
>>  	if (schedule_probe)
>>  		schedule_delayed_work(&hda->probe_work, 0);
>>=20=20
>> @@ -2264,28 +2286,6 @@ static int azx_probe_continue(struct azx *chip)
>>  	to_hda_bus(bus)->bus_probing =3D 1;
>>  	hda->probe_continued =3D 1;
>>=20=20
>> -	/* bind with i915 if needed */
>> -	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>> -		err =3D snd_hdac_i915_init(bus, true);
>> -		if (err < 0) {
>> -			/* if the controller is bound only with HDMI/DP
>> -			 * (for HSW and BDW), we need to abort the probe;
>> -			 * for other chips, still continue probing as other
>> -			 * codecs can be on the same link.
>> -			 */
>> -			if (HDA_CONTROLLER_IN_GPU(pci)) {
>> -				goto out_free;
>> -			} else {
>> -				/* don't bother any longer */
>> -				chip->driver_caps &=3D ~AZX_DCAPS_I915_COMPONENT;
>> -			}
>> -		}
>> -
>> -		/* HSW/BDW controllers need this power */
>> -		if (HDA_CONTROLLER_IN_GPU(pci))
>> -			hda->need_i915_power =3D true;
>> -	}
>> -
>>  	/* Request display power well for the HDA controller or codec. For
>>  	 * Haswell/Broadwell, both the display HDA controller and codec need
>>  	 * this power. For other platforms, like Baytrail/Braswell, only the
>> --=20
>> 2.40.1

--=20
Jani Nikula, Intel
