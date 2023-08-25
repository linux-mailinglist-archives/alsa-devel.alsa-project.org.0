Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890B7886BD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 14:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EBE839;
	Fri, 25 Aug 2023 14:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EBE839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692965680;
	bh=5rodQbQETBG9WvCgSjGtBR3VsyvnmHlQ/Oack11qjN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B7lj5q1e7GylhYnHOsn8tI1l0fFVU3jveqHDHFqi/wldgEEs/ZBV44H8v3KYVlueG
	 NSr1VmdwX7uNaVtzCXSQmQ18WAF7dtoAzTSJfudtAJW3c19gnArTmizkqxQUs2+hDB
	 pZ/8XFV+KH3bULwaiKi0++sEF2xqF4wKAULRkQlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81EC4F80158; Fri, 25 Aug 2023 14:13:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41F41F800D1;
	Fri, 25 Aug 2023 14:13:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AE0DF800F5; Fri, 25 Aug 2023 14:13:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F7FDF80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 14:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7FDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZBEG6oHW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iDWVzr7H
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87B4C21F79;
	Fri, 25 Aug 2023 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692965620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=waTHs/xGdI39CUp8hAdGCPY+e7prbzmO/TDCt0liJAo=;
	b=ZBEG6oHW8Q964QMnfqoDuNE9lELCvuQSGSnDKvVeN/2c7kmcrdHGCoJ/bEUwgC8an7wpWn
	f/ZIus5K5mbGA8Hi9YlHkbWJXEO1SthGGbsuHmacFB9JwZq1Y+/kSKfYJB0OCUMgpIlcBQ
	8rrpTD1GNQMmlGp5TNMSRiPXcj43mCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692965620;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=waTHs/xGdI39CUp8hAdGCPY+e7prbzmO/TDCt0liJAo=;
	b=iDWVzr7HxI2tbWxzN8PBPTn/knDCiQy2WZ1SL8ZluLTnD2rklsQjvV4+ofQnok/2Y/DKk5
	fRhRN66RMDEXrqBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 570DE138F9;
	Fri, 25 Aug 2023 12:13:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4N+7EvSa6GSrUgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 12:13:40 +0000
Date: Fri, 25 Aug 2023 14:13:39 +0200
Message-ID: <87edjr7218.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
In-Reply-To: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LTUF47Z5KLTKNF645QY4VN4GDWC6KQES
X-Message-ID-Hash: LTUF47Z5KLTKNF645QY4VN4GDWC6KQES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTUF47Z5KLTKNF645QY4VN4GDWC6KQES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Aug 2023 14:05:25 +0200,
Stefan Binding wrote:
> 
> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> 
> Some laptops require a hardware based mute system, where when a hotkey
> is pressed, it forces the amp to be muted.
> 
> For CS35L41, when the hotkey is pressed, an acpi notification is sent
> to the CS35L41 Device Node. The driver needs to handle this notification
> and call a _DSM function to retrieve the mute state.
> 
> Since the amp is only muted during playback, the driver will only mute
> or unmute if playback is occurring, otherwise it will save the mute
> state for when playback starts.
> 
> Only one handler can be registered for the acpi notification, but all
> amps need to receive that notification, we can register a single handler
> inside the Realtek HDA driver, so that it can then notify through the
> component framework.
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

We don't do normally in this way.  The ACPI hot key handling is done
via user-space, and user-space daemon triggers the mute of the
system.

Can't the ACPI notify the key event on those machines?


thanks,

Takashi

> ---
>  sound/pci/hda/cs35l41_hda.c   | 92 ++++++++++++++++++++++++++++++-----
>  sound/pci/hda/cs35l41_hda.h   |  3 ++
>  sound/pci/hda/hda_component.h |  3 ++
>  sound/pci/hda/patch_realtek.c | 48 +++++++++++++++++-
>  4 files changed, 132 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index f9b77353c266..609e63b34d6d 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -33,6 +33,9 @@
>  #define CAL_AMBIENT_DSP_CTL_NAME	"CAL_AMBIENT"
>  #define CAL_DSP_CTL_TYPE		5
>  #define CAL_DSP_CTL_ALG			205
> +#define CS35L41_UUID			"50d90cdc-3de4-4f18-b528-c7fe3b71f40d"
> +#define CS35L41_DSM_GET_MUTE		5
> +#define CS35L41_NOTIFY_EVENT		0x91
>  
>  static bool firmware_autostart = 1;
>  module_param(firmware_autostart, bool, 0444);
> @@ -520,6 +523,31 @@ static void cs35l41_hda_play_start(struct device *dev)
>  
>  }
>  
> +static void cs35l41_mute(struct device *dev, bool mute)
> +{
> +	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
> +	struct regmap *reg = cs35l41->regmap;
> +
> +	dev_dbg(dev, "Mute(%d:%d) Playback Started: %d\n", mute, cs35l41->mute_override,
> +		cs35l41->playback_started);
> +
> +	if (cs35l41->playback_started) {
> +		if (mute || cs35l41->mute_override) {
> +			dev_dbg(dev, "Muting\n");
> +			regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
> +		} else {
> +			dev_dbg(dev, "Unmuting\n");
> +			if (cs35l41->firmware_running) {
> +				regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
> +						ARRAY_SIZE(cs35l41_hda_unmute_dsp));
> +			} else {
> +				regmap_multi_reg_write(reg, cs35l41_hda_unmute,
> +						ARRAY_SIZE(cs35l41_hda_unmute));
> +			}
> +		}
> +	}
> +}
> +
>  static void cs35l41_hda_play_done(struct device *dev)
>  {
>  	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
> @@ -529,13 +557,7 @@ static void cs35l41_hda_play_done(struct device *dev)
>  
>  	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1, NULL,
>  			      cs35l41->firmware_running);
> -	if (cs35l41->firmware_running) {
> -		regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
> -				       ARRAY_SIZE(cs35l41_hda_unmute_dsp));
> -	} else {
> -		regmap_multi_reg_write(reg, cs35l41_hda_unmute,
> -				       ARRAY_SIZE(cs35l41_hda_unmute));
> -	}
> +	cs35l41_mute(dev, false);
>  }
>  
>  static void cs35l41_hda_pause_start(struct device *dev)
> @@ -545,7 +567,7 @@ static void cs35l41_hda_pause_start(struct device *dev)
>  
>  	dev_dbg(dev, "Pause (Start)\n");
>  
> -	regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
> +	cs35l41_mute(dev, true);
>  	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0, NULL,
>  			      cs35l41->firmware_running);
>  }
> @@ -1073,6 +1095,44 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
>  	return 0;
>  }
>  
> +static int cs35l41_get_acpi_mute_state(struct cs35l41_hda *cs35l41, acpi_handle handle)
> +{
> +	guid_t guid;
> +	union acpi_object *ret;
> +	int mute = -ENODEV;
> +
> +	guid_parse(CS35L41_UUID, &guid);
> +
> +	if (acpi_check_dsm(handle, &guid, 0, BIT(CS35L41_DSM_GET_MUTE))) {
> +		ret = acpi_evaluate_dsm(handle, &guid, 0, CS35L41_DSM_GET_MUTE, NULL);
> +		mute = *ret->buffer.pointer;
> +		dev_dbg(cs35l41->dev, "CS35L41_DSM_GET_MUTE: %d\n", mute);
> +	}
> +
> +	dev_dbg(cs35l41->dev, "%s: %d\n", __func__, mute);
> +
> +	return mute;
> +}
> +
> +static void cs35l41_acpi_device_notify(acpi_handle handle, u32 event, struct device *dev)
> +{
> +	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
> +	int mute;
> +
> +	if (event != CS35L41_NOTIFY_EVENT)
> +		return;
> +
> +	mute = cs35l41_get_acpi_mute_state(cs35l41, handle);
> +	if (mute < 0) {
> +		dev_warn(cs35l41->dev, "Unable to retrieve mute state: %d\n", mute);
> +		return;
> +	}
> +
> +	dev_dbg(cs35l41->dev, "Requesting mute value: %d\n", mute);
> +	cs35l41->mute_override = (mute > 0);
> +	cs35l41_mute(cs35l41->dev, cs35l41->mute_override);
> +}
> +
>  static int cs35l41_hda_bind(struct device *dev, struct device *master, void *master_data)
>  {
>  	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
> @@ -1114,6 +1174,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>  	comps->playback_hook = cs35l41_hda_playback_hook;
>  	comps->pre_playback_hook = cs35l41_hda_pre_playback_hook;
>  	comps->post_playback_hook = cs35l41_hda_post_playback_hook;
> +	comps->acpi_notify = cs35l41_acpi_device_notify;
> +	comps->adev = cs35l41->dacpi;
> +
> +	cs35l41->mute_override = cs35l41_get_acpi_mute_state(cs35l41,
> +						acpi_device_handle(cs35l41->dacpi)) > 0;
>  
>  	mutex_unlock(&cs35l41->fw_mutex);
>  
> @@ -1387,8 +1452,8 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  		return -ENODEV;
>  	}
>  
> +	cs35l41->dacpi = adev;
>  	physdev = get_device(acpi_get_first_physical_node(adev));
> -	acpi_dev_put(adev);
>  
>  	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
>  	if (IS_ERR(sub))
> @@ -1498,6 +1563,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  	hw_cfg->valid = false;
>  	hw_cfg->gpio1.valid = false;
>  	hw_cfg->gpio2.valid = false;
> +	acpi_dev_put(cs35l41->dacpi);
>  put_physdev:
>  	put_device(physdev);
>  
> @@ -1601,10 +1667,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>  	if (ret)
>  		goto err;
>  
> -	ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
> -				     ARRAY_SIZE(cs35l41_hda_mute));
> -	if (ret)
> -		goto err;
> +	cs35l41_mute(cs35l41->dev, true);
>  
>  	INIT_WORK(&cs35l41->fw_load_work, cs35l41_fw_load_work);
>  	mutex_init(&cs35l41->fw_mutex);
> @@ -1641,6 +1704,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
>  	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
>  		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
>  	gpiod_put(cs35l41->reset_gpio);
> +	acpi_dev_put(cs35l41->dacpi);
>  	kfree(cs35l41->acpi_subsystem_id);
>  
>  	return ret;
> @@ -1659,6 +1723,8 @@ void cs35l41_hda_remove(struct device *dev)
>  
>  	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
>  
> +	acpi_dev_put(cs35l41->dacpi);
> +
>  	pm_runtime_put_noidle(cs35l41->dev);
>  
>  	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
> diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
> index b93bf762976e..ce3f2bb6ffd0 100644
> --- a/sound/pci/hda/cs35l41_hda.h
> +++ b/sound/pci/hda/cs35l41_hda.h
> @@ -10,6 +10,7 @@
>  #ifndef __CS35L41_HDA_H__
>  #define __CS35L41_HDA_H__
>  
> +#include <linux/acpi.h>
>  #include <linux/efi.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/gpio/consumer.h>
> @@ -70,6 +71,8 @@ struct cs35l41_hda {
>  	bool halo_initialized;
>  	bool playback_started;
>  	struct cs_dsp cs_dsp;
> +	struct acpi_device *dacpi;
> +	bool mute_override;
>  };
>  
>  enum halo_state {
> diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
> index f170aec967c1..c7a9b6a660e5 100644
> --- a/sound/pci/hda/hda_component.h
> +++ b/sound/pci/hda/hda_component.h
> @@ -6,6 +6,7 @@
>   *                    Cirrus Logic International Semiconductor Ltd.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/component.h>
>  
>  #define HDA_MAX_COMPONENTS	4
> @@ -15,6 +16,8 @@ struct hda_component {
>  	struct device *dev;
>  	char name[HDA_MAX_NAME_SIZE];
>  	struct hda_codec *codec;
> +	struct acpi_device *adev;
> +	void (*acpi_notify)(acpi_handle handle, u32 event, struct device *dev);
>  	void (*pre_playback_hook)(struct device *dev, int action);
>  	void (*playback_hook)(struct device *dev, int action);
>  	void (*post_playback_hook)(struct device *dev, int action);
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index a07df6f92960..fd3768e73c15 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6704,19 +6704,65 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
>  	}
>  }
>  
> +static void comp_acpi_device_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct hda_codec *cdc = data;
> +	struct alc_spec *spec = cdc->spec;
> +	int i;
> +
> +	codec_info(cdc, "ACPI Notification %d\n", event);
> +
> +	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
> +		if (spec->comps[i].dev && spec->comps[i].acpi_notify)
> +			spec->comps[i].acpi_notify(acpi_device_handle(spec->comps[i].adev), event,
> +						   spec->comps[i].dev);
> +	}
> +}
> +
>  static int comp_bind(struct device *dev)
>  {
>  	struct hda_codec *cdc = dev_to_hda_codec(dev);
>  	struct alc_spec *spec = cdc->spec;
> +	struct acpi_device *adev;
> +	int ret;
> +
> +	ret = component_bind_all(dev, spec->comps);
> +	if (ret)
> +		return ret;
>  
> -	return component_bind_all(dev, spec->comps);
> +	adev = spec->comps[0].adev;
> +	if (!acpi_device_handle(adev))
> +		return 0;
> +
> +	ret = acpi_install_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
> +					  comp_acpi_device_notify, cdc);
> +	if (ret < 0) {
> +		codec_warn(cdc, "Failed to install notify handler: %d\n", ret);
> +		return 0;
> +	}
> +
> +	codec_dbg(cdc, "Notify handler installed\n");
> +
> +	return 0;
>  }
>  
>  static void comp_unbind(struct device *dev)
>  {
>  	struct hda_codec *cdc = dev_to_hda_codec(dev);
>  	struct alc_spec *spec = cdc->spec;
> +	struct acpi_device *adev;
> +	int ret;
> +
> +	adev = spec->comps[0].adev;
> +	if (!acpi_device_handle(adev))
> +		goto unbind;
> +
> +	ret = acpi_remove_notify_handler(adev->handle, ACPI_DEVICE_NOTIFY,
> +					 comp_acpi_device_notify);
> +	if (ret < 0)
> +		codec_warn(cdc, "Failed to uninstall notify handler: %d\n", ret);
>  
> +unbind:
>  	component_unbind_all(dev, spec->comps);
>  }
>  
> -- 
> 2.34.1
> 
