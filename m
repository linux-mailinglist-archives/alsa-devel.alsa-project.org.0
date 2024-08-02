Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05F945DB7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC61409A;
	Fri,  2 Aug 2024 14:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC61409A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722600813;
	bh=KEYXx/jAB3vyQ6OMi4gTqUazWDOQK45pIkjybNC7SuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B1bn4CkUIsunv5bpIT1f/os2N1+A7EozsLvG/DGHqyjwlHXlb+7TGj9FB8ra0c3M+
	 wipWyl6U826NnJ7O9CMKadyLqD3RzPsgoYbOxBetPmdD0NmGQECAtGqwf53IyhUN1P
	 s9KuMXctwRCsmn1k5EItKyXjlrQWpseEbDr3k+Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEB18F80588; Fri,  2 Aug 2024 14:13:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22AEDF805AC;
	Fri,  2 Aug 2024 14:13:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEBD1F8026A; Fri,  2 Aug 2024 14:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78395F8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78395F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U4I50ePU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722600654; x=1754136654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KEYXx/jAB3vyQ6OMi4gTqUazWDOQK45pIkjybNC7SuQ=;
  b=U4I50ePUyzDDIxUwt5C0CwZntvlyMbDR7e036NIotH/+o3LSxPPYS139
   tPCfqBdzXYyZSdQ4pgQ9nCpohrId/ICfMYChN9cPoyV3MLjKxW+5KrdSN
   6IVEkHNTuUZb3XcZAXwMSJHGlQJVeKn+nYbXUXAKYnG1To+JORMOgTlcM
   growXZnB7cbBRpNVINMQOweCzImDjZftr7/1vgrIdv/+zCnVH4Le0qcyG
   QJ8wnp1jJtG0uhHTa/Qe+M/rlruTAkokTbeMBHReIAlGPT377yazroFKu
   tUL65GYI8KYd9lDDN4wZgx+YYiF7Mnon8Un45P6YSBA15cihQNlCfzNHl
   Q==;
X-CSE-ConnectionGUID: qprGbDEdSXqW0emFAY1L5g==
X-CSE-MsgGUID: Yjht/CzhTJ+kuNz+vJyxGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24484214"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24484214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:10:53 -0700
X-CSE-ConnectionGUID: eze3z9pvRdWNf/nfC0oIGw==
X-CSE-MsgGUID: nX2dhYZKTa2IYxh8hBSGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55978928"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.89])
 ([10.245.246.89])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:10:48 -0700
Message-ID: <1a2d0962-405d-4ccf-a0da-00a624c0f3e8@linux.intel.com>
Date: Fri, 2 Aug 2024 08:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 17/34] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-18-quic_wcheng@quicinc.com>
 <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
 <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZTLRQ3AB7AH2TTILWQ5RSFBF4EBPD54L
X-Message-ID-Hash: ZTLRQ3AB7AH2TTILWQ5RSFBF4EBPD54L
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTLRQ3AB7AH2TTILWQ5RSFBF4EBPD54L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/2/24 01:10, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 8/1/2024 1:40 AM, Pierre-Louis Bossart wrote:
>>
>>
>>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>>> +			   struct snd_pcm_hw_params *params,
>>> +			   struct snd_soc_dai *dai)
>>> +{
>>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>> +	struct q6afe_port *q6usb_afe;
>>> +	struct snd_soc_usb_device *sdev;
>>> +	int ret;
>>> +
>>> +	/* No active chip index */
>>> +	if (list_empty(&data->devices))
>>> +		return -EINVAL;
>>> +
>>> +	mutex_lock(&data->mutex);
>>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>>> +
>>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>>> +	if (IS_ERR(q6usb_afe))
>>> +		goto out;
>>> +
>>> +	/* Notify audio DSP about the devices being offloaded */
>>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>>> +						sdev->pcm_idx);
>>> +
>>> +out:
>>> +	mutex_unlock(&data->mutex);
>>> +
>>> +	return ret;
>>> +}
>> Humm, multiple questions here
>>
>> a) is this intentional that the params are not used in a hw_params routine?
> Think this was answered in patch#34.

yes, but that really begs the question if the format check shouldn't be
added here.

>> b) if yes, could this be replaced by a .prepare callback
>>
>> c) along the same lines as b), is suspend-resume during playback
>> supported? Usually this is handled with a .prepare callback to restore
>> connections.
> 
> I don't see us supporting that throughout any of the QC based DAI drivers, so this probably isn't implemented yet.  In terms of supporting system PM suspend for this USB offload path, we're going to explicitly stop the audio stream from the USB offload driver (qc_audio_offload) before we suspend the usb device. (refer to qc_usb_audio_offload_suspend()

The system suspend-resume during playback is not enabled in all
platforms indeed, it mostly depends on what userspace does. IIRC this is
required for Chrome/CRAS and it's supported by aplay.
