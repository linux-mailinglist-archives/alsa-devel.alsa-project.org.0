Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F022B805AE4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 18:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B2486E;
	Tue,  5 Dec 2023 18:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B2486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701796321;
	bh=K/1cez5LQnfNiqaIWgtwa3dp1elmRG9QR6P4AviOUTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cGR51GNW/DYfs/6aWWyMw8dfvA2Lq07lK5C07krHWzFvwgveVaBxaOdyWdvr/55fS
	 ejmfIKlkLzixYJ2M477Eqnvzt9AkndCQsV1wSukn1AB1Jr2s0fuX22+ibSBngFHkqC
	 4P43gb/Vc4pKZ1qza8L09K8cyq5/sjwSGoxnbudQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FD57F80579; Tue,  5 Dec 2023 18:11:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E56B3F80494;
	Tue,  5 Dec 2023 18:11:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98437F8025A; Tue,  5 Dec 2023 18:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BE1CF80166
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 18:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE1CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UJsAMeUD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796286; x=1733332286;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K/1cez5LQnfNiqaIWgtwa3dp1elmRG9QR6P4AviOUTc=;
  b=UJsAMeUDzdGNXoURKQNCMLlgmxOFVGUOUX8b0w7V+FGgDOfoQJBZlMZT
   UrTTGNBxWXBVxv+EFuLj8/LH0mkAswzkiJW8EUIPxNv/MVATEco3CgfVB
   BbB/Rw3kLbWepxji685CTEhFUigUaEyfwaKxwFNsr4lbazdqtArqBafpN
   T6ncvX+mKEqxeu7xcXTiKg/30HRdt+3+LT0xJCoPExG85b/b7ZW9A4hMz
   jk/pE1Hj7V+4/U3IuUm8Oyr2j7GbiWrVjHQSJIaxUpNldPPO3ngyBZhaf
   WNn0ls9ttD4CfMm/WLGj7C9RUIB3RDxvtkUt3FcqDQ4hg8vjhrhE1IuvU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7224205"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="7224205"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894445798"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="894445798"
Received: from mbapna-mobl1.amr.corp.intel.com (HELO [10.212.151.198])
 ([10.212.151.198])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:11:03 -0800
Message-ID: <8e3a9bc0-9f79-4419-a677-5f92f9bf04b7@linux.intel.com>
Date: Tue, 5 Dec 2023 11:11:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: perex@perex.cz, bard.liao@intel.com, mengdong.lin@intel.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
 <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
 <20231205162838.GH14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231205162838.GH14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W3TQTMSBYI3F23G4N5FKIW33BEEXKNNG
X-Message-ID-Hash: W3TQTMSBYI3F23G4N5FKIW33BEEXKNNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3TQTMSBYI3F23G4N5FKIW33BEEXKNNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/5/23 10:28, Charles Keepax wrote:
> On Tue, Dec 05, 2023 at 09:25:27AM -0600, Pierre-Louis Bossart wrote:
>> On 12/5/23 08:24, Charles Keepax wrote:
>>> +	EnableSequence [
>>> +		cset "name='AMP1 Speaker Switch' 1"
>>> +		cset "name='AMP2 Speaker Switch' 1"
>>> +		cset "name='AMP3 Speaker Switch' 1"
>>> +		cset "name='AMP4 Speaker Switch' 1"
>>> +	]
>>> +
>>> +	DisableSequence [
>>> +		cset "name='AMP4 Speaker Switch' 0"
>>> +		cset "name='AMP3 Speaker Switch' 0"
>>> +		cset "name='AMP2 Speaker Switch' 0"
>>> +		cset "name='AMP1 Speaker Switch' 0"
>>> +	]
>>
>> If we only need an on/off switch, I wonder if this can be made
>> conditional, i.e. enable/disable a control if it exists. That would
>> scale to various numbers of amplifiers without a need to add a 2-amp, 6
>> or 8-amp configuration.
> 
> I think that is possible, would you lean towards modifying
> HiFi.conf to only include a single file for cs35l56, or would you
> lean more towards having each cs35l56-x.conf file include a
> single base file?

I wasn't referring to partitioning of files, rather the conditional UCM
syntax,

Condition {
	Type ControlExists
	Control "name='AMP4 Speaker Switch'"
}

e.g.

https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Intel/sof-hda-dsp/HiFi.conf#L37

I am not sure however if this can be part of an Enable/Disable sequence,
that was really a question for Jaroslav.
