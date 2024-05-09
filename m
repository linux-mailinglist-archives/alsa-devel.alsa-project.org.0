Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5658C15B0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20394E97;
	Thu,  9 May 2024 21:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20394E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284617;
	bh=yggsdWvGecv9KlZXR7Gn5ZXJpoT8aeY02OM9eHlbgFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mabIyN/TNPRpOEuthN99vB8hvlIWeOLpE0OmZGGeTVAcGCmtScFnm/qvp+vpiqa6p
	 ic39iMFXliuuyZDYaNckijXDigtu600UrCjQ9nOONFX86QQ52U58G7wiSYem+laKsU
	 rHuSknK/cwedS3YXwg6vdWp+xTHELylEc9slMalk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66D7F8049C; Thu,  9 May 2024 21:56:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD2CF80564;
	Thu,  9 May 2024 21:56:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2821FF8049C; Thu,  9 May 2024 21:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54EFFF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54EFFF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HdUPgF1P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284580; x=1746820580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yggsdWvGecv9KlZXR7Gn5ZXJpoT8aeY02OM9eHlbgFI=;
  b=HdUPgF1PecVKfALigX/Gud7/HDOt/esxgUAzOLuNRTjQatccpid2Hhnm
   myws8iVvt6KsHpLmskWduzwYAsqkiAdJvOVekxcnk4P5iS71K0237MFzi
   dUvebEi3hi7fv4iq1okcY+cmRJ1Bwy/b0nk5xB5nmYzrWap0dnu55s8nm
   FqWt9kpJgtR0HMdW7Ie0+ZtRWNqBW6uhxz9m3KaCTBeAGgGQRZPqWypfY
   4cOKkv+GR7JG2uP7LWS0rHkrHHBtnS+xiMRW7Bbjyd5Kninn3BEkr9ArT
   TPN+rKRbwgDESrXWAYVHVZqBChxBhrbRFmYhcfqJC0xziHGLTetp35OJk
   Q==;
X-CSE-ConnectionGUID: M+Nuhb7GRzOLpucJH8sHsg==
X-CSE-MsgGUID: 3D2WyGdoTLCPRyZplbGFLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454252"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:14 -0700
X-CSE-ConnectionGUID: 0hSRX4lDS5GfwWSqiwJzxQ==
X-CSE-MsgGUID: Ld9aKcU1TYSOY0PDBQNl8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213064"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:11 -0700
Message-ID: <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Date: Thu, 9 May 2024 07:54:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
 <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
 <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GPQXNDZV4UNBEMFFAOPINIFPSKYZZFDL
X-Message-ID-Hash: GPQXNDZV4UNBEMFFAOPINIFPSKYZZFDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPQXNDZV4UNBEMFFAOPINIFPSKYZZFDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>> Wait, is this saying you will have exactly one PCM device/FE DAI
>> connected to the USB BE DAI exposed in patch 11?
>>
>>> +    SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>>> +               usb_mixer_controls,
>>> +               ARRAY_SIZE(usb_mixer_controls)),
>>> +
>>
>> And then what is the role of the USB mixer if you only have one input?
>>
>> I must be missing something.
>>
> 
> Not sure if this is a QCOM specific implementation, but the way the DT
> is defined for the USB offload path is as follows:
> 
>     usb-dai-link {
>         link-name = "USB Playback";
> 
>         cpu {
>             sound-dai = <&q6afedai USB_RX>;
>         };
> 
>         codec {
>             sound-dai = <&usbdai USB_RX>;
>         };
> 
>         platform {
>             sound-dai = <&q6routing>;
>         };
>     };
> 
> Based on our DT parser helper API (qcom_snd_parse_of()) this isn't going
> to create a PCM device.  The PCM devices are created for nodes that
> don't have a codec and platform defined:
> 
>     mm1-dai-link {
>         link-name = "MultiMedia1";
>         cpu {
>             sound-dai = <&q6asmdai      MSM_FRONTEND_DAI_MULTIMEDIA1>;
>         };
>     };
> 
> The ASM path is the entity that defines the number of PCM devices that
> is created for the QC ASoC platform card, and is where the actual PCM
> data is sent over to the DSP.  So there could be several PCM devices
> that can use the USB BE DAI.

ok, but then how would this work with the ALSA controls reporting which
PCM device can be used? I didn't see a mechanism allowing for more than
one offloaded device, IIRC the control reported just ONE PCM device number.
