Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E78C15C3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 21:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FC81931;
	Thu,  9 May 2024 21:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FC81931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715284672;
	bh=3epbr7u3CfAFndEOsNu4jNNDKiPVR3FkG4nsSdqrrb0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TjOK1xMauezRlqURFe/LevROOWzHqUivfEC1BMk03orP0ZsZMBGVT1Qp+OZGAmIq+
	 +trPZs01xAft+DXznVjSLrYz10HhelIYZK9cE8UhuzIpGJVb1/jgjuJ3BeLkUz107H
	 otWtXAAsrsRZpw9KxOzBhzeddSaO1JJc5eT6H7HU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7728F80621; Thu,  9 May 2024 21:56:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B26FF8061E;
	Thu,  9 May 2024 21:56:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E995F805B0; Thu,  9 May 2024 21:56:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94E20F80580
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 21:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E20F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lKTGyPso
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715284586; x=1746820586;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3epbr7u3CfAFndEOsNu4jNNDKiPVR3FkG4nsSdqrrb0=;
  b=lKTGyPsooEX2k20SxwSjtcU+p1BLwE+ku1tHGac7WZ/FNd0MVFuuSx5F
   50RWvjpmauP8HzkJ/vD3Xum52YPNJO6p9Rixem3eSKS+BX+yDOCA8uo2c
   apv2qFHXxNzhXbHzRdVwcL+OAG20aH14YM1IWEm0c8ZYJd1QYmqljEg0p
   RP+n24vRrhZe8nWgKJH84XqxVbUoY2j4D+FrfLYmKxOuYnpFUTlHTU/0G
   /XcpwScw5n8Xp6UueUfTOi4n273YfkDzeL8IhvNLk25MEuwmh4FLDRtsa
   wNAnV/Nup7M8AwhbaQQFJ9HL7ToCVm+POYGLgw6eOEjwwDwHSPwNx1Xcz
   Q==;
X-CSE-ConnectionGUID: Rd2l6olJTamnVlgaltOJ+Q==
X-CSE-MsgGUID: yM7YgivUS7iKkWMiVAy2Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11454285"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11454285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:23 -0700
X-CSE-ConnectionGUID: mB+YzDLqRz6/iJpx7j2KHg==
X-CSE-MsgGUID: J9w1UCm6QO6uAg+td9Am0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="34213110"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:56:20 -0700
Message-ID: <f1368be7-fea5-450c-a61c-f289ba61f150@linux.intel.com>
Date: Thu, 9 May 2024 08:07:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 27/39] ASoC: Introduce SND kcontrols to select sound
 card and PCM device
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
 <20240507195116.9464-28-quic_wcheng@quicinc.com>
 <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
 <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7ITVALERHKKAXVTZNLZHYSTO4WWFAQA
X-Message-ID-Hash: P7ITVALERHKKAXVTZNLZHYSTO4WWFAQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7ITVALERHKKAXVTZNLZHYSTO4WWFAQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/8/24 19:10, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 5/7/2024 2:26 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/7/24 14:51, Wesley Cheng wrote:
>>> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
>>> which USB card number and PCM device to offload.  This allows for
>>> userspace
>>> to potentially tag an alternate path for a specific USB SND card and PCM
>>> device.  Previously, control was absent, and the offload path would be
>>> enabled on the last USB SND device which was connected.  This logic will
>>> continue to be applicable if no mixer input is received for specific
>>> device
>>> selection.
>>>
>>> An example to configure the offload device using tinymix:
>>> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
>>>
>>> The above command will configure the offload path to utilize card#1
>>> and PCM
>>> stream#0.
>>
>> I don't know how this is usable in practice. Using card indices is
>> really hard to do, it depends on the order in which devices are
>> plugged-in...
> 
> How are the existing mechanisms handling USB audio devices, or what is
> the identifier being used?

Well it's a mess, that's why I asked.

There are configuration work-arounds to make sure that 'local'
accessories are handled first and get repeatable card indices.

But between USB devices I guess the rule is 'anything goes'. Even if
there are two devices connected at boot, the index allocation will
depend on probe order. The card names are not necessarily super-useful
either, i.e. yesterday I was confused by an USB card named "CODEC"
without any details.
