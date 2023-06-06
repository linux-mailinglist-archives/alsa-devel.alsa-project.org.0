Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED672488A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 18:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CF76C0;
	Tue,  6 Jun 2023 18:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CF76C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686067804;
	bh=fg9grFN03T96RMAQ3uDRwXV58lQ8uRbjPOYDIdaProo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRLK+P9jcomW3X/AnRU17CwYspjPAIG1i2WaopLHerRjccfRjZ/PSlJfp1bg7Bs+K
	 BHkSMHrqAJ3dbH8qUAd84AKGdidghMzhcOqzo67/XDJspRVLsRohe6NuWIbxmY+MTh
	 oBjqOzarjHXNRaVQoe6UM1u8mCiefSJrkG4fqVoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE0FF80155; Tue,  6 Jun 2023 18:09:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA92F8016C;
	Tue,  6 Jun 2023 18:09:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4421EF80199; Tue,  6 Jun 2023 18:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D01BF80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 18:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D01BF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=i9BCozyp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+SDfGjWg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E808E1FD76;
	Tue,  6 Jun 2023 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686067731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PycypA7axz39mXLYMtchHaSe+zTrMDNXV0DpGEAJ6eo=;
	b=i9BCozypUOlltIztiAskCoWbpUnhNoaCi5acVAA2XIBrN4UbHD5/qgyOUL/JTIlMeAdkTs
	QGuetlDnzGEsMhLeBWjiiY0K1qqb1VSyLVkOaFKAeyE4XxX2W5Qu0+ubYMY6Qkg2Sc9fUx
	83IcmIHFWM7NFTJ12tO2+8an4mVhZ7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686067731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PycypA7axz39mXLYMtchHaSe+zTrMDNXV0DpGEAJ6eo=;
	b=+SDfGjWgX7jB7waRcQF20tEk4MtOeVGwWSnOSpRHeJ19X4v+eybtodlqkwwY4lP2QT9cKd
	SAYttEWqdKIsLFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9136C13776;
	Tue,  6 Jun 2023 16:08:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nNCDIhNaf2SNMwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 16:08:51 +0000
Date: Tue, 06 Jun 2023 18:08:51 +0200
Message-ID: <874jnkfu98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <13916275206@139.com>
Cc: broonie@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com,
	gentuser@gmail.com,
	Ryan_Chu@wistron.com,
	Sam_Wu@wistron.com
Subject: Re: [PATCH v4 5/6] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230527223613.11106-1-13916275206@139.com>
References: <20230527223613.11106-1-13916275206@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VSLF3DPXWVBBPPP5UY6OEGASCHTF3TM7
X-Message-ID-Hash: VSLF3DPXWVBBPPP5UY6OEGASCHTF3TM7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSLF3DPXWVBBPPP5UY6OEGASCHTF3TM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 28 May 2023 00:36:13 +0200,
Shenghao Ding wrote:
> 
> Create tas2781 HDA driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>

You still give too short text for this kind of largish and intensive
changes.  Please write more about what the patch does, caveats,
whatever worth to mention.

> --- /dev/null
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> +static int tas2781_acpi_get_i2c_resource(struct acpi_resource
> +	*ares, void *data)

The line break there looks weird...

> +{
> +	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)data;

Superfluous cast.

> +static int tas2781_hda_read_acpi(struct tasdevice_priv *tas_priv,
> +	const char *hid)
> +{
> +	struct acpi_device *adev;
> +	struct device *physdev;
> +	LIST_HEAD(resources);
> +	const char *sub;
> +	int ret;
> +
> +	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
> +	if (!adev) {
> +		dev_err(tas_priv->dev,
> +			"Failed to find an ACPI device for %s\n", hid);
> +		return -ENODEV;
> +	}
> +	strcpy(tas_priv->dev_name, hid);

Safer to use strscpy().

> +	physdev = get_device(acpi_get_first_physical_node(adev));
> +	acpi_dev_put(adev);
> +
> +	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
> +	if (IS_ERR(sub))
> +		sub = NULL;
> +	dev_info(tas_priv->dev, "subid = %s\n", sub);
> +
> +	tas_priv->acpi_subsystem_id = sub;
> +
> +	ret = acpi_dev_get_resources(adev, &resources,
> +		tas2781_acpi_get_i2c_resource, tas_priv);

Referencing adev after acpi_dev_put() doesn't sound good.
acpi_dev_put() should be done later instead.

> +static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	int ret = 0;
> +
> +	if (tas_priv->rcabin.profile_cfg_id !=
> +		ucontrol->value.integer.value[0]) {
> +		tas_priv->rcabin.profile_cfg_id =
> +			ucontrol->value.integer.value[0];
> +		ret = 0;

Should be ret=1 when the value changes.

Also, you should check the given value.  It's not checked in the core
side, so any random value can be passed by user-space.
(Ditto for other *_put() functions.)

> +static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
> +{
> +	char prof_ctrl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> +	struct hda_codec *codec = tas_priv->codec;
> +	struct snd_kcontrol_new prof_ctrl = {
> +		.name = prof_ctrl_name,
> +		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +		.info = tasdevice_info_profile,
> +		.get = tasdevice_get_profile_id,
> +		.put = tasdevice_set_profile_id,
> +	};
> +	int ret;
> +
> +	/* Create a mixer item for selecting the active profile */
> +	scnprintf(prof_ctrl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
> +		"spk-profile-id");

The control name is way too ugly.  It's not understandable for human.
Please use a more descriptive name.

Also, you need no temporary name buffer.  Just pass the constant
string to the name field.

> +static int tasdevice_dsp_create_ctrls(struct tasdevice_priv
> +	*tas_priv)
> +{
....
> +	scnprintf(prog_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "spk-prog-id");
> +	scnprintf(conf_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "spk-conf-id");

Again, too ugly names.  Be more descriptive.

> +static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
> +{
> +	efi_guid_t efi_guid = EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d,
> +		0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
> +	static efi_char16_t efi_name[] = L"CALI_DATA";
> +	struct tm *tm = &tas_priv->tm;
> +	unsigned int attr, crc;
> +	unsigned int *tmp_val;
> +	efi_status_t status;
> +	int ret = 0;
> +
> +	//Lenovo devices
> +	if (tas_priv->catlog_id == LENOVO)
> +		efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, 0x09,
> +			0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
> +
> +	tas_priv->cali_data.total_sz = 0;
> +	/* Get real size of UEFI variable */
> +	status = efi.get_variable(efi_name, &efi_guid, &attr,
> +		&tas_priv->cali_data.total_sz, tas_priv->cali_data.data);
> +	if (status == EFI_BUFFER_TOO_SMALL) {
> +		ret = -ENODEV;
> +		/* Allocate data buffer of data_size bytes */
> +		tas_priv->cali_data.data = devm_kzalloc(tas_priv->dev,
> +			tas_priv->cali_data.total_sz, GFP_KERNEL);
> +		if (!tas_priv->cali_data.data)
> +			return -ENOMEM;
> +		/* Get variable contents into buffer */
> +		status = efi.get_variable(efi_name, &efi_guid, &attr,
> +			&tas_priv->cali_data.total_sz,
> +			tas_priv->cali_data.data);
> +		if (status != EFI_SUCCESS) {
> +			ret = -EINVAL;
> +			goto out;
> +		}

... so at this point, the function still keeps ret=-ENODEV, and it
ends up with the final error code to be returned?  It's not clear from
the code whether it's the intended flow.

> +static void tasdevice_fw_ready(const struct firmware *fmw,
> +	void *context)
> +{
> +	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;

Superfluous cast.

> +	struct hda_codec *codec = tas_priv->codec;
> +	int i, ret = 0;

Superfluous initialization.

> +static int tas2781_hda_bind(struct device *dev, struct device *master,
> +	void *master_data)
> +{
> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> +	struct hda_component *comps = master_data;
> +	struct hda_codec *codec;
> +	unsigned int subid;
> +	int ret;
> +
> +	if (!comps || tas_priv->index < 0 ||
> +		tas_priv->index >= HDA_MAX_COMPONENTS)
> +		return -EINVAL;
> +
> +	comps = &comps[tas_priv->index];
> +	if (comps->dev)
> +		return -EBUSY;
> +
> +	codec = comps->codec;
> +	subid = codec->core.subsystem_id & 0xFFFF;
> +
> +	//Lenovo devices
> +	if ((subid == 0x387d) || (subid == 0x387e) || (subid == 0x3881)
> +		|| (subid == 0x3884) || (subid == 0x3886) || (subid == 0x38a7)
> +		|| (subid == 0x38a8) || (subid == 0x38ba) || (subid == 0x38bb)
> +		|| (subid == 0x38be) || (subid == 0x38bf) || (subid == 0x38c3)
> +		|| (subid == 0x38cb) || (subid == 0x38cd))
> +		tas_priv->catlog_id = LENOVO;
> +	else
> +		tas_priv->catlog_id = OTHERS;

Hmm, I don't like checking subid here, but we can live with it for
now...

> +static int tas2781_runtime_suspend(struct device *dev)
> +{
> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	dev_info(tas_priv->dev, "Runtime Suspend\n");

Don't spew at each runtime suspend/resume.  It'll be way too much.
It should be dev_dbg(), if any.


thanks,

Takashi
