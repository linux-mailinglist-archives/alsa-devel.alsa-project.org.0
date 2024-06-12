Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB69055A7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 16:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A3EDE5;
	Wed, 12 Jun 2024 16:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A3EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718203712;
	bh=afYKfX5WiT24a7vRcOHvX/frxR+u+IAFVv0AQdtNlWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbMIqW4+Ykg2/hTft5hNjlVx7kMP+C6AuGOG4mz0h6FN/ZI59bjgPl2n8i6+9SKae
	 08fQym+kFPqs436XLlY3eJPgPSxOpcGTucgaeVBhiQ51dARw3gNwAucxt/3PK9YLhY
	 x45BShtOWNuYggndiNoYqmCCPlS/+Bx3uoQiDCn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6739EF805B5; Wed, 12 Jun 2024 16:48:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B85D3F805A1;
	Wed, 12 Jun 2024 16:48:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F00BF8057A; Wed, 12 Jun 2024 16:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7559BF80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 16:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7559BF80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dFq3MUNC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718203670; x=1749739670;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=afYKfX5WiT24a7vRcOHvX/frxR+u+IAFVv0AQdtNlWs=;
  b=dFq3MUNC42tC4SKSPkbFZ/aOMMxTWuiAoUe9bmUNJP3oG1CU3cE8Hmfl
   dbFXisDrcbxFyiRrkt6ez5v/zZbTLXLGYIpIe9p//WrmQlRDFWHHtHUDJ
   NcisSnjAJZX0tHgpFl//SNYxuL1Rwt6TifQ57A9AQGM+zU+hjU6+iZyQc
   gCiDlMshsyy/QW1h2WBl4Qv2pmWE1oGVQvRgSjeBFFb6iGtGVbLgKqLnA
   NLdZBGVEYT3gaLj9vjSCF5Ydzsnv/XeDIa51MPnMZRXubjkzVIrpeuPIH
   1280zC7PLTx34i2Lc98Zr3LZpYccjhP7nUYrNUGM1omRyrXV7+nmrdPwE
   g==;
X-CSE-ConnectionGUID: YfnAzjoOTi27moJUZ0MeOg==
X-CSE-MsgGUID: J4m1dJuqTeOa49UghMoyxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14846476"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="14846476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:47:41 -0700
X-CSE-ConnectionGUID: lXJttGFaTCK21oTjZ4kGZw==
X-CSE-MsgGUID: iGl843MOR66bAy93XUaE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="44375086"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:47:36 -0700
Message-ID: <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
Date: Wed, 12 Jun 2024 16:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240610235808.22173-33-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 67BIZPRM4QBC5DMDA42LBJOUHGA7FSU3
X-Message-ID-Hash: 67BIZPRM4QBC5DMDA42LBJOUHGA7FSU3
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67BIZPRM4QBC5DMDA42LBJOUHGA7FSU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/11/2024 1:58 AM, Wesley Cheng wrote:

(...)

> +In the case where the USB offload driver is unbounded, while USB SND is

unbounded -> unbound

(...)

> +SOC USB and USB Sound Kcontrols
> +===============================
> +Details
> +-------
> +SOC USB and USB sound expose a set of SND kcontrols for applications to select
> +and fetch the current offloading status for the ASoC platform sound card. Kcontrols
> +are split between two layers:
> +
> +	- USB sound - Notifies the sound card number for the ASoC platform sound
> +	  card that it is registered to for supporting audio offload.
> +
> +	- SOC USB - Maintains the current status of the offload path, and device
> +	  (USB sound card and PCM device) information.  This would be the main
> +	  card that applications can read to determine offloading capabilities.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [C320M          ]: USB-Audio - Plantronics C320-M
> +                     Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1, full speed
> +
> +
> +  **Platform Sound Card** - card#0:
> +
> +	::
> +
> +	  USB Offload Playback Route Card Select  1 (range -1->32)
> +	  USB Offload Playback Route PCM Select   0 (range -1->255)
> +	  USB Offload Playback Route Card Status  -1 (range -1->32)
> +	  USB Offload Playback Route PCM Status   -1 (range -1->255)
> +
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Capable Card         0 (range -1->32)
> +
> +
> +The platform sound card(card#0) kcontrols are created as part of adding the SOC
> +USB device using **snd_soc_usb_add_port()**.  The following kcontrols are defined
> +as:
> +
> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound card device index
> +    that defines which USB SND resources are currently offloaded.  If -1 is seen, it
> +    signifies that offload is not active.
> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM device index
> +    that defines which USB SND resources are currently offloaded.  If -1 is seen, it
> +    signifies that offload is not active.
> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound card index which
> +    selects the USB device to initiate offloading on.  If no value is written to the
> +    kcontrol, then the last USB device discovered card index will be chosen.

I see only one kcontrol, what if hardware is capable of offloading on 
more cards, is it possible to do offloading on more than one device?

> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM index which selects
> +    the USB device to initiate offloading on.  If no value is written to the
> +    kcontrol, then the last USB device discovered PCM zero index will be chosen.
> +
> +The USB sound card(card#1) kcontrols are created as USB audio devices are plugged
> +into the physical USB port and enumerated.  The kcontrols are defined as:
> +
> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the sound card
> +    number/index that supports USB offloading.  Further/follow up queries about
> +    the current offload state can be handled by reading the offload status
> +    kcontrol exposed by the platform card.
> +


Why do we need to some magic between cards? I feel like whole kcontrol 
thing is overengineered a bit - I'm not sure I understand the need to do 
linking between cards. It would feel a lot simpler if USB card exposed 
one "USB Offload" kcontrol on USB card if USB controller supports 
offloading and allowed to set it to true/false to allow user to choose 
if they want to do offloading on device.

(...)
> +Mixer Examples
> +--------------
> +
> +	::
> +
> +	  tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
> +	  tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
> +
> +
> +	::
> +
> +	  tinymix -D 0 get 'USB Offload Playback Route Card Select'
> +	  --> 2 (range -1->32)
> +	  tinymix -D 0 get 'USB Offload Playback Route PCM Select'
> +	  --> 0 (range -1->255)
> +
> +	::
> +
> +	  tinymix -D 0 get 'USB Offload Playback Route Card Status'
> +	  --> 2 (range -1->32)   [OFFLD active]
> +	  --> -1 (range -1->32) [OFFLD idle]
> +	  tinymix -D 0 get 'USB Offload Playback Route PCM Status'
> +	  --> 0 (range -1->255)   [OFFLD active]
> +	  --> -1 (range -1->255) [OFFLD idle]
> +
> +	::
> +
> +	  tinymix -D 1 get 'USB Offload Playback Capable Card'
> +	  --> 0 (range -1->32)
> 

Yes, looking at examples again, I'm still not sure I understand. There 
are two cards and you do linking between them, this feels broken by 
design. From my point of view USB Offload should be property of USB card 
and not involve any other card in a system.

