Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AFB534C89
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 11:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C159016BE;
	Thu, 26 May 2022 11:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C159016BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653557473;
	bh=gSd7/wzF7MTHYFHxYAP0/uPyv1YzBIo5Ctv8auElU+0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYpSrWE6LToscIcbAqsCXnIicf5RelkmibMcCaEudiKEDqCID9PZtYn8ruknjWB3y
	 5Ez9rIIDQbKnv7JgqsUdan40Cf9st8Az1lvLKeAMlYUGqL00z/6Wq81ARo0GctVeEo
	 nhtIP/jnUk64RfkaAwyk17qVddgpXdoc5ZxEDsCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2EFF80171;
	Thu, 26 May 2022 11:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2100BF8014B; Thu, 26 May 2022 11:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B01F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 11:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B01F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FJiMzA14"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24Q57RkV023806;
 Thu, 26 May 2022 04:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9DDM0LbKfQSEqDIFkf3GZzb8S7Law86ajiZdUKL0XkU=;
 b=FJiMzA14ax0FiPf+dSDqIx7taXmdNRn4XnZ6Ce0RQZ6OzANRl7o0GTCtXKmzVUb/H+1+
 oremJbrI3I0YUXCQ7i9/sMxUeTa0hZ21kWOrupDE+4Awv+3YnwK91lt+jJ043bN1xZ90
 4+qwyYXoeUJ8HLfh/ke1jJLQk7FC38DHffCD9HbS7sNElVxjHPEkNn+1psU4PUFn1KEi
 oIlP/jCWPnlV3JoFkuORhvTxDF/4O/rOEv++5C/ir2SDlRHeCzN1tpQoGs5V+xmwO4gO
 3FbKu/3DmgXhrY2qUS9EFVYEgu/FlEu7owI+30w3/ILUIhe+E6hRZr4Hm1RMme20Fkfb FQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u4j0re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 May 2022 04:30:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 10:30:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 26 May 2022 10:30:01 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9FB8846C;
 Thu, 26 May 2022 09:30:01 +0000 (UTC)
Date: Thu, 26 May 2022 09:30:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH v4 01/17] ALSA: hda: hda_cs_dsp_ctl: Add Library to
 support CS_DSP ALSA controls
Message-ID: <20220526093001.GP38351@ediswmail.ad.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <20220525131638.5512-2-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220525131638.5512-2-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 8M0CM57Ixi5VEf7HnAbkmInPiHTY1NYg
X-Proofpoint-GUID: 8M0CM57Ixi5VEf7HnAbkmInPiHTY1NYg
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, May 25, 2022 at 02:16:22PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> The cs35l41 part contains a DSP which is able to run firmware.
> The cs_dsp library can be used to control the DSP.
> These controls can be exposed to userspace using ALSA controls.
> This library adds apis to be able to interface between
> cs_dsp and hda drivers and expose the relevant controls as
> ALSA controls.
> 
> The apis to add and remove the controls start new threads when
> adding/removing controls since it is possible that setting an ALSA
> control would end up calling this api, which would then deadlock.
> 
> In the future, it will be necessary to load/unload firmware (and
> firmware ALSA controls) using a separate ALSA control, which means
> that the ability to call these apis from another ALSA control is
> required.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
>  
> Changes since v2:
>  - Updated commit message to describe reasons
>    for adding/removing controls asynchronously
>  - Removed unnecessary code which handled unused
>    tlv or acked controls.
>  - Removed code which handled outdate firmware
>    versions when adding controls
>  
> +static unsigned int wmfw_convert_flags(unsigned int in, unsigned int len)
> +{
> +	unsigned int out, rd, wr, vol;
> +
> +	if (len > ADSP_MAX_STD_CTRL_SIZE) {
> +		rd = SNDRV_CTL_ELEM_ACCESS_TLV_READ;
> +		wr = SNDRV_CTL_ELEM_ACCESS_TLV_WRITE;
> +		vol = SNDRV_CTL_ELEM_ACCESS_VOLATILE;
> +
> +		out = SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
> +	} else {
> +		rd = SNDRV_CTL_ELEM_ACCESS_READ;
> +		wr = SNDRV_CTL_ELEM_ACCESS_WRITE;
> +		vol = SNDRV_CTL_ELEM_ACCESS_VOLATILE;
> +
> +		out = 0;
> +	}

This if should be changed if we are no longer supporting the TLV
controls, you want to report an error if we exceed the max
control size not switch to the TLV access flags.

> +static void hda_cs_dsp_ctl_add_work(struct work_struct *work)
> +{
> +	struct hda_cs_dsp_coeff_ctl *ctl = container_of(work,
> +							struct hda_cs_dsp_coeff_ctl,
> +							add_work);
> +	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
> +	struct snd_kcontrol_new *kcontrol;
> +
> +	kcontrol = kzalloc(sizeof(*kcontrol), GFP_KERNEL);
> +	if (!kcontrol)
> +		return;
> +
> +	kcontrol->name = ctl->name;
> +	kcontrol->info = hda_cs_dsp_coeff_info;
> +	kcontrol->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
> +	kcontrol->tlv.c = snd_soc_bytes_tlv_callback;
> +	kcontrol->private_value = (unsigned long)&ctl->bytes_ext;

Don't need to set tlv.c or the private_value for bytes_ext if we
are not using TLVs.

> +struct hda_cs_dsp_ctl_info {
> +	struct snd_card *card;
> +	enum hda_cs_dsp_fw_id fw_type;
> +	const char *amp_name;

Might be better to call this something slightly more generic than
amp_name. Just incase this stuff gets used with a CODEC or
something in the future.

Thanks,
Charles
