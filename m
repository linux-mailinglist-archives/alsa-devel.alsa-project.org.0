Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8F7EB4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 17:22:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE4093A;
	Tue, 14 Nov 2023 17:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE4093A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699978929;
	bh=oJ3L70+WCz5hA1RyBMC0XAHjP86uMYTYzqH9F010sFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N7k8HqMo5ib8tZDboIQiuPLeThdZZ48WIndD3HKMNDfdxWMIePPawqdaQUDtUWctY
	 aOumQJq0A26RZzZv74s8L2anUcsUGXfc2BeeMwVDJBVFm+stn7VdZv0LJzoFbfOJ/y
	 W3fhw3NNxRsgRD/S8fdXEsl50ndOAjzfMtnMj3/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29302F80588; Tue, 14 Nov 2023 17:20:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E88EF8057B;
	Tue, 14 Nov 2023 17:20:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09051F801D5; Tue, 14 Nov 2023 16:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94664F80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 16:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94664F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l7tCDxXO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699977215; x=1731513215;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oJ3L70+WCz5hA1RyBMC0XAHjP86uMYTYzqH9F010sFQ=;
  b=l7tCDxXOhL7NBm8RIVX51F+SnKR9Qb+2BiPLDJI46NWenxd7owavJXgW
   6Nlj0VnFXqUdZbeKJaF4x4A9Cx+sIc5EEJlnC+4Fi+Xkj2up5KNhp8pYD
   kLMgfpsp/NTQjH4HYv5Ojbk35QsOzQUrHJcdX10KrGuskqqz3mmLi+i/v
   v18yiCb6pbIp9Fw5cstpRbd+RIeB0zYB7gCd688nrqNT0CFKQeZO+OBUX
   MhSXLkx+0E6m/keNYejIkObIPbA59WcDNSf3r0JMlpuafWZS2iG0u6zHK
   O5cdESTo4dBIDikrpySZJq1sfyIKvVCOcwj/asS1ZvmPLnizFMgQF7Zx0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457174746"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="457174746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="908417609"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="908417609"
Received: from hoffbaue-mobl1.ger.corp.intel.com (HELO [10.249.43.206])
 ([10.249.43.206])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:52:54 -0800
Message-ID: <265607f1-debc-410e-add3-198af804f37c@linux.intel.com>
Date: Tue, 14 Nov 2023 16:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alsa-devel@alsa-project.org,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
 <ZVN4rQjLxROOjTE-@intel.com>
 <f72ce7ff-19a4-4a12-9ede-615a964e7228@linux.intel.com>
 <87ttpopc5i.wl-tiwai@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87ttpopc5i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CVU42G73SYQJE4ATIE7O3WSF3MYYTWMW
X-Message-ID-Hash: CVU42G73SYQJE4ATIE7O3WSF3MYYTWMW
X-Mailman-Approved-At: Tue, 14 Nov 2023 16:20:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVU42G73SYQJE4ATIE7O3WSF3MYYTWMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-11-14 kl. 16:50, skrev Takashi Iwai:
> On Tue, 14 Nov 2023 15:39:16 +0100,
> Maarten Lankhorst wrote:
>>
>> Hey,
>>
>> Den 2023-11-14 kl. 14:39, skrev Ville Syrjälä:
>>
>>      On Tue, Nov 14, 2023 at 02:35:10PM +0200, Jani Nikula wrote:
>>      
>>          On Tue, 14 Nov 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>          
>>              On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.com wrote:
>>              
>>                  From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>                  
>>                  Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>>                  the snd_hdac_i915_init into a workqueue.
>>                  
>>                  Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>>                  probe function.
>>                  
>>              This completely broke i915 audio!
>>              
>>              I also can't see any trace of this stuff ever being posted to
>>              intel-gfx so it never went through the CI.
>>              
>>              Please fix or revert ASAP.
>>              
>>          Cc: Jani, Suresh
>>          
>>          Ville, please file a bug at gitlab so we can track this, thanks.
>>          
>>      https://gitlab.freedesktop.org/drm/intel/-/issues/9671
>>      
>> Looks like a simple patch should be enough, can you test below?
> Seems that we reached to the same conclusion :)
>
> I took a quick look at other code paths, and sound/pci/hda/hda_intel.c
> is the only place that needs the correction.  Other (ASoC) drivers are
> either simply always returning the error or dealing only with -ENODEV
> case for skipping the HDMI codec.

Yeah, the original comment in the code confused me and led me to not 
handle -EPROBE_DEFER in the first place there.

Cheers,

Maarten

> thanks,
>
> Takashi
>
>> ----
>>
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 058f6e6491f9a..946aaa487f200 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -2145,7 +2145,8 @@ static int azx_probe(struct pci_dev *pci,
>>                                                                     * for other chips, still continue probing as other
>>                                                                     * codecs can be on the same link.
>>                                                                     */
>> -                                                                 if (HDA_CONTROLLER_IN_GPU(pci)) {
>> +                                                                 if (HDA_CONTROLLER_IN_GPU(pci) ||
>> +                                                                     err == -EPROBE_DEFER) {
>>                                                                                          goto out_free;
>>                                                                    } else {
>>                                                                                          /* don't bother any longer */
>>
