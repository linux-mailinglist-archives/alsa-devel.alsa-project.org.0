Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4398E4E
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 10:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1051679;
	Thu, 22 Aug 2019 10:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1051679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566463726;
	bh=dAiBALvbmK1UbN9wWqTyDlMnG7s6qbifrmAzUGNipHs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTBjNkdOiU/Afa+UbtF/8X6T8lnsswmDOQ2BaDh+AtJaDjPsDLiqdsLnIDro8e9mK
	 pWK8YAhvDO8Ybvcj+qYe3cncOxxAqBrZo8l5GzJUYvqeXO9q0ppxrhZdJMc5m+Wckm
	 NL/8V6q/nVe1N7ISBpwhFKFVAtBAF4Z56OOeiO64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF6EF8036E;
	Thu, 22 Aug 2019 10:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0FCF8036E; Thu, 22 Aug 2019 10:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E64EF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 10:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E64EF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 01:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="196187049"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2019 01:46:48 -0700
Date: Thu, 22 Aug 2019 10:51:18 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190822105118.55e5c134@xxx>
In-Reply-To: <20190822073207.8696-3-tiwai@suse.de>
References: <20190822073207.8696-1-tiwai@suse.de>
 <20190822073207.8696-3-tiwai@suse.de>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/4] ALSA: usb-audio: More validations of
 descriptor units
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 22 Aug 2019 09:32:04 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> Introduce a new helper to validate each audio descriptor unit before
> and check the unit before actually accessing it.  This should harden
> against the OOB access cases with malformed descriptors that have been
> recently frequently reported by fuzzers.
> 
> The existing descriptor checks are still kept although they become
> superfluous after this patch.  They'll be cleaned up eventually
> later.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/Makefile   |   3 +-
>  sound/usb/helper.h   |   4 +
>  sound/usb/mixer.c    |  10 ++
>  sound/usb/power.c    |   2 +
>  sound/usb/quirks.c   |   3 +
>  sound/usb/stream.c   |  25 ++--
>  sound/usb/validate.c | 332 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 366 insertions(+), 13 deletions(-)
>  create mode 100644 sound/usb/validate.c
> 
> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
> index e1ce257ab705..d27a21b0ff9c 100644
> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -16,7 +16,8 @@ snd-usb-audio-objs := 	card.o \
>  			power.o \
>  			proc.o \
>  			quirks.o \
> -			stream.o
> +			stream.o \
> +			validate.o
>  
>  snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>  
> diff --git a/sound/usb/helper.h b/sound/usb/helper.h
> index 6afb70156ec4..5e8a18b4e7b9 100644
> --- a/sound/usb/helper.h
> +++ b/sound/usb/helper.h
> @@ -31,4 +31,8 @@ static inline int snd_usb_ctrl_intf(struct snd_usb_audio *chip)
>  	return get_iface_desc(chip->ctrl_intf)->bInterfaceNumber;
>  }
>  
> +/* in validate.c */
> +bool snd_usb_validate_audio_desc(void *p, int protocol);
> +bool snd_usb_validate_midi_desc(void *p);
> +
>  #endif /* __USBAUDIO_HELPER_H */
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 27ee68a507a2..b4be226e07f3 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -785,6 +785,8 @@ static int __check_input_term(struct mixer_build *state, int id,
>  		p1 = find_audio_control_unit(state, id);
>  		if (!p1)
>  			break;
> +		if (!snd_usb_validate_audio_desc(p1, protocol))
> +			break; /* bad descriptor */
>  
>  		hdr = p1;
>  		term->id = id;
> @@ -2773,6 +2775,11 @@ static int parse_audio_unit(struct mixer_build *state, int unitid)
>  		return -EINVAL;
>  	}
>  
> +	if (!snd_usb_validate_audio_desc(p1, protocol)) {
> +		usb_audio_dbg(state->chip, "invalid unit %d\n", unitid);
> +		return 0; /* skip invalid unit */
> +	}
> +
>  	if (protocol == UAC_VERSION_1 || protocol == UAC_VERSION_2) {
>  		switch (p1[2]) {
>  		case UAC_INPUT_TERMINAL:
> @@ -3143,6 +3150,9 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
>  	while ((p = snd_usb_find_csint_desc(mixer->hostif->extra,
>  					    mixer->hostif->extralen,
>  					    p, UAC_OUTPUT_TERMINAL)) != NULL) {
> +		if (!snd_usb_validate_audio_desc(p, mixer->protocol))
> +			continue; /* skip invalid descriptor */
> +
>  		if (mixer->protocol == UAC_VERSION_1) {
>  			struct uac1_output_terminal_descriptor *desc = p;
>  
> diff --git a/sound/usb/power.c b/sound/usb/power.c
> index bd303a1ba1b7..606a2cb23eab 100644
> --- a/sound/usb/power.c
> +++ b/sound/usb/power.c
> @@ -31,6 +31,8 @@ snd_usb_find_power_domain(struct usb_host_interface *ctrl_iface,
>  		struct uac3_power_domain_descriptor *pd_desc = p;
>  		int i;
>  
> +		if (!snd_usb_validate_audio_desc(p, UAC_VERSION_3))
> +			continue;
>  		for (i = 0; i < pd_desc->bNrEntities; i++) {
>  			if (pd_desc->baEntityID[i] == id) {
>  				pd->pd_id = pd_desc->bPowerDomainID;
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 78858918cbc1..7e9735aa7ac9 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -248,6 +248,9 @@ static int create_yamaha_midi_quirk(struct snd_usb_audio *chip,
>  					NULL, USB_MS_MIDI_OUT_JACK);
>  	if (!injd && !outjd)
>  		return -ENODEV;
> +	if (!snd_usb_validate_midi_desc(injd) ||
> +	    !snd_usb_validate_midi_desc(outjd))
> +		return -ENODEV;
>  	if (injd && (injd->bLength < 5 ||
>  		     (injd->bJackType != USB_MS_EMBEDDED &&
>  		      injd->bJackType != USB_MS_EXTERNAL)))
> diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> index e852c7fd6109..a0649c8ae460 100644
> --- a/sound/usb/stream.c
> +++ b/sound/usb/stream.c
> @@ -627,16 +627,14 @@ static int parse_uac_endpoint_attributes(struct snd_usb_audio *chip,
>   */
>  static void *
>  snd_usb_find_input_terminal_descriptor(struct usb_host_interface *ctrl_iface,
> -				       int terminal_id, bool uac23)
> +				       int terminal_id, int protocol)
>  {
>  	struct uac2_input_terminal_descriptor *term = NULL;
> -	size_t minlen = uac23 ? sizeof(struct uac2_input_terminal_descriptor) :
> -		sizeof(struct uac_input_terminal_descriptor);
>  
>  	while ((term = snd_usb_find_csint_desc(ctrl_iface->extra,
>  					       ctrl_iface->extralen,
>  					       term, UAC_INPUT_TERMINAL))) {
> -		if (term->bLength < minlen)
> +		if (!snd_usb_validate_audio_desc(term, protocol))
>  			continue;
>  		if (term->bTerminalID == terminal_id)
>  			return term;
> @@ -647,7 +645,7 @@ snd_usb_find_input_terminal_descriptor(struct usb_host_interface *ctrl_iface,
>  
>  static void *
>  snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
> -					int terminal_id)
> +					int terminal_id, int protocol)
>  {
>  	/* OK to use with both UAC2 and UAC3 */
>  	struct uac2_output_terminal_descriptor *term = NULL;
> @@ -655,8 +653,9 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
>  	while ((term = snd_usb_find_csint_desc(ctrl_iface->extra,
>  					       ctrl_iface->extralen,
>  					       term, UAC_OUTPUT_TERMINAL))) {
> -		if (term->bLength >= sizeof(*term) &&
> -		    term->bTerminalID == terminal_id)
> +		if (!snd_usb_validate_audio_desc(term, protocol))
> +			continue;
> +		if (term->bTerminalID == terminal_id)
>  			return term;
>  	}
>  
> @@ -731,7 +730,7 @@ snd_usb_get_audioformat_uac12(struct snd_usb_audio *chip,
>  
>  		iterm = snd_usb_find_input_terminal_descriptor(chip->ctrl_intf,
>  							       as->bTerminalLink,
> -							       false);
> +							       protocol);
>  		if (iterm) {
>  			num_channels = iterm->bNrChannels;
>  			chconfig = le16_to_cpu(iterm->wChannelConfig);
> @@ -767,7 +766,7 @@ snd_usb_get_audioformat_uac12(struct snd_usb_audio *chip,
>  		 */
>  		input_term = snd_usb_find_input_terminal_descriptor(chip->ctrl_intf,
>  								    as->bTerminalLink,
> -								    true);
> +								    protocol);
>  		if (input_term) {
>  			clock = input_term->bCSourceID;
>  			if (!chconfig && (num_channels == input_term->bNrChannels))
> @@ -776,7 +775,8 @@ snd_usb_get_audioformat_uac12(struct snd_usb_audio *chip,
>  		}
>  
>  		output_term = snd_usb_find_output_terminal_descriptor(chip->ctrl_intf,
> -								      as->bTerminalLink);
> +								      as->bTerminalLink,
> +								      protocol);
>  		if (output_term) {
>  			clock = output_term->bCSourceID;
>  			goto found_clock;
> @@ -1002,14 +1002,15 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
>  	 */
>  	input_term = snd_usb_find_input_terminal_descriptor(chip->ctrl_intf,
>  							    as->bTerminalLink,
> -							    true);
> +							    UAC_VERSION_3);
>  	if (input_term) {
>  		clock = input_term->bCSourceID;
>  		goto found_clock;
>  	}
>  
>  	output_term = snd_usb_find_output_terminal_descriptor(chip->ctrl_intf,
> -							     as->bTerminalLink);
> +							      as->bTerminalLink,
> +							      UAC_VERSION_3);
>  	if (output_term) {
>  		clock = output_term->bCSourceID;
>  		goto found_clock;
> diff --git a/sound/usb/validate.c b/sound/usb/validate.c
> new file mode 100644
> index 000000000000..3c8f73a0eb12
> --- /dev/null
> +++ b/sound/usb/validate.c
> @@ -0,0 +1,332 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Validation of USB-audio class descriptors
> +//
> +
> +#include <linux/init.h>
> +#include <linux/usb.h>
> +#include <linux/usb/audio.h>
> +#include <linux/usb/audio-v2.h>
> +#include <linux/usb/audio-v3.h>
> +#include <linux/usb/midi.h>
> +#include "usbaudio.h"
> +#include "helper.h"
> +
> +struct usb_desc_validator {
> +	unsigned char protocol;
> +	unsigned char type;
> +	bool (*func)(const void *p, const struct usb_desc_validator *v);
> +	size_t size;
> +};
> +
> +#define UAC_VERSION_ALL		(unsigned char)(-1)
> +
> +/* UAC1 only */
> +static bool validate_uac1_header(const void *p,
> +				 const struct usb_desc_validator *v)
> +{
> +	const struct uac1_ac_header_descriptor *d = p;
> +
> +	return d->bLength >= sizeof(*d) &&
> +		d->bLength >= sizeof(*d) + d->bInCollection;

If my logic is not failing me in the morning, can't this be simplified
to just:
return d->bLength >= sizeof(*d) + d->bInCollection;
?

> +}
> +
> +/* for mixer unit; covering all UACs */
> +static bool validate_mixer_unit(const void *p,
> +				const struct usb_desc_validator *v)
> +{
> +	const struct uac_mixer_unit_descriptor *d = p;
> +	size_t len;
> +
> +	if (d->bLength < sizeof(*d) || !d->bNrInPins)
> +		return false;
> +	len = sizeof(*d) + d->bNrInPins;
> +	/* We can't determine the bitmap size only from this unit descriptor,
> +	 * so just check with the remaining length.
> +	 * The actual bitmap is checked at mixer unit parser.
> +	 */
> +	switch (v->protocol) {
> +	case UAC_VERSION_1:
> +	default:

Implicit fall through?

> +		len += 2 + 1; /* wChannelConfig, iChannelNames */
> +		/* bmControls[n*m] */
> +		len += 1; /* iMixer */
> +		break;
> +	case UAC_VERSION_2:
> +		len += 4 + 1; /* bmChannelConfig, iChannelNames */
> +		/* bmMixerControls[n*m] */
> +		len += 1 + 1; /* bmControls, iMixer */
> +		break;
> +	case UAC_VERSION_3:
> +		len += 2; /* wClusterDescrID */
> +		/* bmMixerControls[n*m] */
> +		break;
> +	}
> +	return d->bLength >= len;
> +}
> +
> +/* both for processing and extension units; covering all UACs */
> +static bool validate_processing_unit(const void *p,
> +				     const struct usb_desc_validator *v)
> +{
> +	const struct uac_processing_unit_descriptor *d = p;
> +	const unsigned char *hdr = p;
> +	size_t len, m;
> +
> +	if (d->bLength < sizeof(*d))
> +		return false;
> +	len = d->bLength < sizeof(*d) + d->bNrInPins;
> +	if (d->bLength < len)
> +		return false;
> +	switch (v->protocol) {
> +	case UAC_VERSION_1:
> +	default:

Implicit fall through?

> +		/* bNrChannels, wChannelConfig, iChannelNames, bControlSize */
> +		len += 1 + 2 + 1 + 1;
> +		if (d->bLength < len) /* bControlSize */
> +			return false;
> +		m = hdr[len];
> +		len += 1 + m + 1; /* bControlSize, bmControls, iProcessing */
> +		break;
> +	case UAC_VERSION_2:
> +		/* bNrChannels, bmChannelConfig, iChannelNames */
> +		len += 1 + 4 + 1;
> +		if (v->type == UAC2_PROCESSING_UNIT_V2)
> +			len += 2; /* bmControls -- 2 bytes for PU */
> +		else
> +			len += 1; /* bmControls -- 1 byte for EU */
> +		len += 1; /* iProcessing */
> +		break;
> +	case UAC_VERSION_3:
> +		/* wProcessingDescrStr, bmControls */
> +		len += 2 + 4;
> +		break;
> +	}
> +	if (d->bLength < len)
> +		return false;
> +
> +	switch (v->protocol) {
> +	case UAC_VERSION_1:
> +	default:

Implicit fall through?

> +		if (v->type == UAC1_EXTENSION_UNIT)
> +			return true; /* OK */
> +		switch (d->wProcessType) {
> +		case UAC_PROCESS_UP_DOWNMIX:
> +		case UAC_PROCESS_DOLBY_PROLOGIC:

Implicit fall through?

> +			if (d->bLength < len + 1) /* bNrModes */
> +				return false;
> +			m = hdr[len];
> +			len += 1 + m * 2; /* bNrModes, waModes(n) */
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case UAC_VERSION_2:
> +		if (v->type == UAC2_EXTENSION_UNIT_V2)
> +			return true; /* OK */
> +		switch (d->wProcessType) {
> +		case UAC2_PROCESS_UP_DOWNMIX:
> +		case UAC2_PROCESS_DOLBY_PROLOCIC: /* SiC! */

Implicit fall through?

> +			if (d->bLength < len + 1) /* bNrModes */
> +				return false;
> +			m = hdr[len];
> +			len += 1 + m * 4; /* bNrModes, daModes(n) */
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case UAC_VERSION_3:
> +		if (v->type == UAC3_EXTENSION_UNIT) {
> +			len += 2; /* wClusterDescrID */
> +			break;
> +		}
> +		switch (d->wProcessType) {
> +		case UAC3_PROCESS_UP_DOWNMIX:
> +			if (d->bLength < len + 1) /* bNrModes */
> +				return false;
> +			m = hdr[len];
> +			len += 1 + m * 2; /* bNrModes, waClusterDescrID(n) */
> +			break;
> +		case UAC3_PROCESS_MULTI_FUNCTION:
> +			len += 2 + 4; /* wClusterDescrID, bmAlgorighms */
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	}
> +	if (d->bLength < len)
> +		return false;
> +
> +	return true;
> +}
> +
> +/* both for selector and clock selector units; covering all UACs */
> +static bool validate_selector_unit(const void *p,
> +				   const struct usb_desc_validator *v)
> +{
> +	const struct uac_selector_unit_descriptor *d = p;
> +	size_t len;
> +
> +	if (d->bLength < sizeof(*d))
> +		return false;
> +	len = sizeof(*d) + d->bNrInPins;
> +	switch (v->protocol) {
> +	case UAC_VERSION_1:
> +	default:

Implicit fall through?

> +		len += 1; /* iSelector */
> +		break;
> +	case UAC_VERSION_2:
> +		len += 1 + 1; /* bmControls, iSelector */
> +		break;
> +	case UAC_VERSION_3:
> +		len += 4 + 2; /* bmControls, wSelectorDescrStr */
> +		break;
> +	}
> +	return d->bLength >= len;
> +}
> +
> +static bool validate_uac1_feature_unit(const void *p,
> +				       const struct usb_desc_validator *v)
> +{
> +	const struct uac_feature_unit_descriptor *d = p;
> +
> +	if (d->bLength < sizeof(*d) || !d->bControlSize)
> +		return false;
> +	/* at least bmaControls(0) for master channel + iFeature */
> +	return d->bLength >= sizeof(*d) + d->bControlSize + 1;
> +}
> +
> +static bool validate_uac2_feature_unit(const void *p,
> +				       const struct usb_desc_validator *v)
> +{
> +	const struct uac2_feature_unit_descriptor *d = p;
> +
> +	if (d->bLength < sizeof(*d))
> +		return false;
> +	/* at least bmaControls(0) for master channel + iFeature */
> +	return d->bLength >= sizeof(*d) + 4 + 1;
> +}
> +
> +static bool validate_uac3_feature_unit(const void *p,
> +				       const struct usb_desc_validator *v)
> +{
> +	const struct uac3_feature_unit_descriptor *d = p;
> +
> +	if (d->bLength < sizeof(*d))
> +		return false;
> +	/* at least bmaControls(0) for master channel + wFeatureDescrStr */
> +	return d->bLength >= sizeof(*d) + 4 + 2;
> +}
> +
> +static bool validate_midi_out_jack(const void *p,
> +				   const struct usb_desc_validator *v)
> +{
> +	const struct usb_midi_out_jack_descriptor *d = p;
> +
> +	return d->bLength >= sizeof(*d) &&
> +		d->bLength >= sizeof(*d) + d->bNrInputPins * 2;

This can also be simplified.

> +}
> +
> +#define FIXED(p, t, s) { .protocol = (p), .type = (t), .size = sizeof(s) }
> +#define FUNC(p, t, f) { .protocol = (p), .type = (t), .func = (f) }
> +
> +static struct usb_desc_validator audio_validators[] = {
> +	/* UAC1 */
> +	FUNC(UAC_VERSION_1, UAC_HEADER, validate_uac1_header),
> +	FIXED(UAC_VERSION_1, UAC_INPUT_TERMINAL,
> +	      struct uac_input_terminal_descriptor),
> +	FIXED(UAC_VERSION_1, UAC_OUTPUT_TERMINAL,
> +	      struct uac1_output_terminal_descriptor),
> +	FUNC(UAC_VERSION_1, UAC_MIXER_UNIT, validate_mixer_unit),
> +	FUNC(UAC_VERSION_1, UAC_SELECTOR_UNIT, validate_selector_unit),
> +	FUNC(UAC_VERSION_1, UAC_FEATURE_UNIT, validate_uac1_feature_unit),
> +	FUNC(UAC_VERSION_1, UAC1_PROCESSING_UNIT, validate_processing_unit),
> +	FUNC(UAC_VERSION_1, UAC1_EXTENSION_UNIT, validate_processing_unit),
> +
> +	/* UAC2 */
> +	FIXED(UAC_VERSION_2, UAC_HEADER, struct uac2_ac_header_descriptor),
> +	FIXED(UAC_VERSION_2, UAC_INPUT_TERMINAL,
> +	      struct uac2_input_terminal_descriptor),
> +	FIXED(UAC_VERSION_2, UAC_OUTPUT_TERMINAL,
> +	      struct uac2_output_terminal_descriptor),
> +	FUNC(UAC_VERSION_2, UAC_MIXER_UNIT, validate_mixer_unit),
> +	FUNC(UAC_VERSION_2, UAC_SELECTOR_UNIT, validate_selector_unit),
> +	FUNC(UAC_VERSION_2, UAC_FEATURE_UNIT, validate_uac2_feature_unit),
> +	/* UAC_VERSION_2, UAC2_EFFECT_UNIT: not implemented yet */
> +	FUNC(UAC_VERSION_2, UAC2_PROCESSING_UNIT_V2, validate_processing_unit),
> +	FUNC(UAC_VERSION_2, UAC2_EXTENSION_UNIT_V2, validate_processing_unit),
> +	FIXED(UAC_VERSION_2, UAC2_CLOCK_SOURCE,
> +	      struct uac_clock_source_descriptor),
> +	FUNC(UAC_VERSION_2, UAC2_CLOCK_SELECTOR, validate_selector_unit),
> +	FIXED(UAC_VERSION_2, UAC2_CLOCK_MULTIPLIER,
> +	      struct uac_clock_multiplier_descriptor),
> +	/* UAC_VERSION_2, UAC2_SAMPLE_RATE_CONVERTER: not implemented yet */
> +
> +	/* UAC3 */
> +	FIXED(UAC_VERSION_2, UAC_HEADER, struct uac3_ac_header_descriptor),
> +	FIXED(UAC_VERSION_3, UAC_INPUT_TERMINAL,
> +	      struct uac3_input_terminal_descriptor),
> +	FIXED(UAC_VERSION_3, UAC_OUTPUT_TERMINAL,
> +	      struct uac3_output_terminal_descriptor),
> +	/* UAC_VERSION_3, UAC3_EXTENDED_TERMINAL: not implemented yet */
> +	FUNC(UAC_VERSION_3, UAC3_MIXER_UNIT, validate_mixer_unit),
> +	FUNC(UAC_VERSION_3, UAC3_SELECTOR_UNIT, validate_selector_unit),
> +	FUNC(UAC_VERSION_3, UAC_FEATURE_UNIT, validate_uac3_feature_unit),
> +	/*  UAC_VERSION_3, UAC3_EFFECT_UNIT: not implemented yet */
> +	FUNC(UAC_VERSION_3, UAC3_PROCESSING_UNIT, validate_processing_unit),
> +	FUNC(UAC_VERSION_3, UAC3_EXTENSION_UNIT, validate_processing_unit),
> +	FIXED(UAC_VERSION_3, UAC3_CLOCK_SOURCE,
> +	      struct uac3_clock_source_descriptor),
> +	FUNC(UAC_VERSION_3, UAC3_CLOCK_SELECTOR, validate_selector_unit),
> +	FIXED(UAC_VERSION_3, UAC3_CLOCK_MULTIPLIER,
> +	      struct uac3_clock_multiplier_descriptor),
> +	/* UAC_VERSION_3, UAC3_SAMPLE_RATE_CONVERTER: not implemented yet */
> +	/* UAC_VERSION_3, UAC3_CONNECTORS: not implemented yet */
> +	{ } /* terminator */
> +};
> +
> +static struct usb_desc_validator midi_validators[] = {
> +	FIXED(UAC_VERSION_ALL, USB_MS_HEADER,
> +	      struct usb_ms_header_descriptor),
> +	FIXED(UAC_VERSION_ALL, USB_MS_MIDI_IN_JACK,
> +	      struct usb_midi_in_jack_descriptor),
> +	FUNC(UAC_VERSION_ALL, USB_MS_MIDI_OUT_JACK,
> +	     validate_midi_out_jack),
> +	{ } /* terminator */
> +};
> +
> +
> +/* Validate the given unit descriptor, return true if it's OK */
> +static bool validate_desc(unsigned char *hdr, int protocol,
> +			  const struct usb_desc_validator *v)
> +{
> +	if (hdr[1] != USB_DT_CS_INTERFACE)
> +		return true; /* don't care */
> +
> +	for (; v->type; v++) {
> +		if (v->type == hdr[2] &&
> +		    (v->protocol == UAC_VERSION_ALL ||
> +		     v->protocol == protocol)) {
> +			if (v->func)
> +				return v->func(hdr, v);
> +			/* check for the fixed size */
> +			return hdr[0] >= v->size;
> +		}
> +	}
> +
> +	return true; /* not matching, skip validation */
> +}
> +
> +bool snd_usb_validate_audio_desc(void *p, int protocol)
> +{
> +	return validate_desc(p, protocol, audio_validators);
> +}
> +
> +bool snd_usb_validate_midi_desc(void *p)
> +{
> +	return validate_desc(p, UAC_VERSION_1, midi_validators);
> +}
> +

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
