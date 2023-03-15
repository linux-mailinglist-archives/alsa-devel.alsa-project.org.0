Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E16BB613
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 15:32:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A66820B;
	Wed, 15 Mar 2023 15:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A66820B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678890742;
	bh=z2C/BkfaVtAyVUV8tLuReKIAo/iPls0ApsKzq+thVY0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BXHDsS/ljlveSIcb/sVSJEYjFhplUD+laXuXONbbenuKrWRvAxXDzVLDozQX/KleR
	 YmO1r2AS0WVskfveIYI4nRWrVtEtsF1ivlTf3pANn6/MQv3J136ic8CwCKsXdzrI9q
	 oQVUe8OrOXrXo2rfN71ISy7/xSRQ2YQfG4sKxLUc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0107F8032D;
	Wed, 15 Mar 2023 15:31:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 815F0F80423; Wed, 15 Mar 2023 15:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39478F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 15:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39478F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cFj4BJ8W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678890676; x=1710426676;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z2C/BkfaVtAyVUV8tLuReKIAo/iPls0ApsKzq+thVY0=;
  b=cFj4BJ8WiG7/8OVSyMlWgUIZNxPgXgBcy4pKKUJrjasoJIao7EnDzhUK
   RJB82gE3ibu/7nt23OEpCCVS5URA5d4OJ/WahCSi/QQLr9CrJ08La/ndd
   ahWwmpXkzAYF+/bPBZ+32NKXg49ovIghspwEEXcLbKhbFfg/Wet2Hbm4P
   GIdbYYZBDqyIVo0v0ne/SSMvgoF0wpb1rzG5zT7qN3wB04EfGqOOuHGAF
   5rgD+OsyQBIOiYF2bkXWGMLfVUX4G0I0BFhqqmPLogFvLdIrnjH61l90z
   PuKiEfP63wwrZE68Eo78oThmr/eqYRs8UZ6Nyxzba5CH+dZnD9etHC6ii
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423987756"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="423987756"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 07:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="748450293"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="748450293"
Received: from rperez12-mobl.amr.corp.intel.com (HELO [10.255.35.81])
 ([10.255.35.81])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 07:30:59 -0700
Message-ID: <6b811766-cd2a-54c0-d090-640812686a45@linux.intel.com>
Date: Wed, 15 Mar 2023 09:30:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/28] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <4f8a66c0-398f-5655-3aa7-a59bc9ba56cc@linux.intel.com>
 <8b2f3ce7-3e0c-bdf0-8d9f-9aeabba09a15@quicinc.com>
 <a211f26d-a045-0729-871f-248d5fce3f3f@linux.intel.com>
 <684daf86-6c3f-7310-eebf-4ebfc3c480ca@quicinc.com>
 <8a37ccd3-f19e-b30d-d736-04e81b49f3a0@linux.intel.com>
 <0810f951-f4a6-a51d-97e3-43691b05f702@quicinc.com>
 <b671e263-5cb8-18e5-dc28-648ab1133c6c@linux.intel.com>
 <14d726a7-6ffc-705c-b012-0c08d7dd7b9b@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <14d726a7-6ffc-705c-b012-0c08d7dd7b9b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X7QSXFWHXAK3K2DJKJA5M4KNAFD5RXZR
X-Message-ID-Hash: X7QSXFWHXAK3K2DJKJA5M4KNAFD5RXZR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7QSXFWHXAK3K2DJKJA5M4KNAFD5RXZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Wesley,

> Sorry made a mistake on the diagram.  There is no connection from
> SOC-USB to the APR/GLINK.  The Q6USB driver will be the one that is
> going to configure some of the Q6AFE ports along withe the Q6AFE DAI
> driver.
> 
> |            ASoC
> ----------------------------------
> |  _________________________
> | |sm8250 platform card     |
> | |_________________________|
> |         |           |
> |      ___V____   ____V____
> |     |Q6USB   | |Q6AFE    |  #5
> |     |"codec" | |"cpu"    |
> |     |________| |_________|
> |         ^  ^        ^
> |      #6 |  |________|
> |      ___V____     |
> |     |SOC-USB |    |
> #7    |        |    |
> ----->|________|    |
> ---                 |
> | |                 |
> | |    _____________V________
> | |   |APR/GLINK             |
> | |   |______________________|
> | |              ^
> | | #8           |
> | |   ___________V___________
> | |->|audio DSP              |
> |    |_______________________|
> |
> |
> 
>>>

Makes sense now, thank you for the clarification.

I'll have to dig more in this 'soc-usb' block, it's clearly a key
component that will have to maintain a consistent state across two
different parts of the stack and deal with probe/remove/shutdown.

>> My initial thought was to add a 'DSP offload' PCM to the USB card, you
>> added a "USB offload" PCM to the DSP card. Nice logical swap!
>>
>> Your proposal might be easier in practice since there's typically a
>> vendor-specific configuration file (UCM or custom) file for the DSP,
>> where USB information can be added.
>>
>> It's more problematic to change a generic USB card as we know it today
>> and bolt vendor-specific DSP information on top.
>>
>> The only open I have with your option is that there are still two
>> control paths to e.g. set the volume. It would be so much easier for
>> userspace if there was a single volume control no matter what path is
>> used for data, or make sure the kcontrols are 'mirrored' somehow. If we
>> found a way to address this issue that would be ideal.
>>
> 
> Got it.  Let me look to see if that is something we can address/add.  I
> think the current implementation is that USB SND will expose some mixer
> controls based on the UAC descriptor parsing.  Then when they want to
> change the volume (for example) it will result in a USB SETUP transaction.
> 
> So USB SND will eventually be the entity controlling these changes.

That's probably ok then, am I getting this right that the the DSP card
would not expose any USB-related kcontrols then, i.e. the ONLY path to
change volumes, etc.,  would through the regular USB card kcontrols?

That would limit the changes in the platform sound card to the addition
of a PCM USB device.
