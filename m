Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C3546CB5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 20:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564291931;
	Fri, 10 Jun 2022 20:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564291931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654887000;
	bh=DtMa55i4y+qK1fL/kFHkrEZTqNbswVMRzQ0Zm1pZOfI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJboOXlHq/AsfZHcMmKDgA/rusMCYy8emQVSgKwJjusQggSFL9HxYmR4PdvyDm3pe
	 p12DncsFn0hMiGnz7E4QGKh2rek4zHLvF8AtZMkwmQHjiQaUAlF0AUZ0jLaEdFJY4d
	 01QIRoHz3+R8/kDrc9kkl4xcGatvvi6HG7U8+w30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B5EF800C7;
	Fri, 10 Jun 2022 20:49:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5D0F804D2; Fri, 10 Jun 2022 20:48:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F75AF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 20:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F75AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BpnbMyXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654886932; x=1686422932;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DtMa55i4y+qK1fL/kFHkrEZTqNbswVMRzQ0Zm1pZOfI=;
 b=BpnbMyXZaGd3ojppz0Ttp46lRuur93FyzmSsRZbTJIF7VF1hDXqlbMqP
 NBEGAxPKeN+z/e71P5vwUqE9fmDuAtu9rAeG5n1IYYUB3eE0LRrEkdTsp
 wGF5lldMaF/u+SOqrp1LnA2rNRdcixoQ4E0CqVqJvRw9AqMKGvP+JiqV2
 YKuVuypUUViVrjxmipWnDqe1Dj2z8pVMBswr8k4aKGwQ266r3R5KGuA8o
 FruYeBmteulW1ojBVM0SvM8E3UEBpl1MJEZowL/RfylozYwcQceiyCfAf
 acuJK7/vQZ/268HoFmsiJilMgpk2p5lLrqui0f0G74290BF9Yp+PnrFQ4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341773314"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="341773314"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 11:48:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="725089794"
Received: from andrewri-mobl.amr.corp.intel.com (HELO [10.212.126.97])
 ([10.212.126.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 11:48:47 -0700
Message-ID: <dae93c48-7fc0-bde0-bcc5-b66dc79ac205@linux.intel.com>
Date: Fri, 10 Jun 2022 13:48:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
 <2634f801-446e-04e0-89d6-5bee25dab109@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2634f801-446e-04e0-89d6-5bee25dab109@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 6/10/22 12:33, Cezary Rojewski wrote:
> On 2022-06-10 2:36 PM, Cezary Rojewski wrote:
>> A number of patches improving overall quality and readability of
>> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
>> Both files are first renamed and only then actual changes are being
>> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
>> to match the pattern found in more recent boards.
>>
>> Most patches bring no functional change - the more impactful patches at
>> are placed the end:
>>
>> Refactor of suspend/resume flow for the bdw_rt286 board by dropping
>> dev->remove() in favour of card->remove() and adjust jack handling to
>> reduce code size slightly by implementing card_set_jack().
>>
>> The last patch is removing of FE DAI ops. Given the existence of
>> platform FE DAI capabilities (either static declaration or through
>> topology file), this code is redundant.
> 
> 
> Hello,
> 
> While this patchset reorganizes and rewords code of two boards in
> question, module (kernel module) names are unchanged. Currently those
> two are:
> 
> - snd_soc_sst_haswell.ko
> - snd_soc_sst_broadwell.ko
> 
> My question is: Is it viable to reword these two?
> 
> Both modules accept no custom parameters, perhaps *dyndbg* is the only
> possibility so the impact is reduced.

Thanks for asking the question.

I have no objection to the driver name change and haswell is not used in
commercial products outside of Intel.

You have a point that most of the machine driver module names make
limited sense in hindsight, but it's better to leave them as is.
Changing them will increase confusion IMHO.

We have scripts to remove/re-insert modules and every time we add a name
change we break the test suite. This happened when we changed all the
PCI names, it wasn't pretty. See e.g. all the 'obsolete' references in
those scripts to keep them working across kernel versions.

https://github.com/thesofproject/sof-test/blob/main/tools/kmod/sof_remove.sh#L134

we also enable dyndbg with /etc/modprobe.d/sof-dyndbg.conf deployed on
test devices, if we change module names it gives everyone involved in
CI/testing more work.

And last if you Google a bit you'll see references in a couple of wikis
and bug reports to modprobe snd-soc-sst-broadwell, so if you change the
module name you make the information obsolete.

