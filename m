Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC822792AD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB801AAA;
	Fri, 25 Sep 2020 22:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB801AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601067140;
	bh=sIEdRQnQrYofDtlsEoOOaB5GOZHb4ow977skj545eUo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sb4+22VBWski2wJteS1/kmkky5jlIM2HgXQbyRuV9hlgRnhHu2hswiaEP/9tVf1bG
	 OYCE42Vchr+jfaoDLulw1r1AKHcjiH5fHT6KR9g9XlHbLPsCmhTq8EaEoGqNknMKl7
	 bzIY2kVUek2NLYkLzi9sul1HoxWg3XMU7kd/4Hqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5538EF800DA;
	Fri, 25 Sep 2020 22:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E5E3F801EB; Fri, 25 Sep 2020 22:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 818EBF80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 818EBF80162
IronPort-SDR: jOryV21eAVkkUQszjoclH9wVAFcYla1DYxO8IObV0EUHh2BD6BA2jgVBV2rTBKp+GdceKRUQQi
 T7NOjcqRmcgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="161720454"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="161720454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 13:50:31 -0700
IronPort-SDR: +y6XqKiIGhPS/JZn//b7Bwn6ep2Yt7DVCF/Q15C/VDqdsaNsWNEFyIQRI2y7HcpZQPwubBzrQK
 BY0jWSXE0+Pw==
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="513140872"
Received: from mfischmx-mobl1.amr.corp.intel.com (HELO [10.209.30.115])
 ([10.209.30.115])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 13:50:30 -0700
Subject: Re: More Generic Audio Graph Sound Card idea
To: Mark Brown <broonie@kernel.org>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
 <87blhuljkb.wl-kuninori.morimoto.gx@renesas.com>
 <20200925192202.GA9831@sirena.org.uk>
 <aceb1334-9b3f-7a62-60e9-6028059d4bf7@linux.intel.com>
 <20200925201057.GI4841@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <085030a3-201a-70d9-5f04-89bb19b98532@linux.intel.com>
Date: Fri, 25 Sep 2020 15:50:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925201057.GI4841@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sameer Pujar <spujar@nvidia.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, jonathanh@nvidia.com
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




> If a device is hard limited to particular slots we can presumably
> discover that (either through the spec or by keying off the ID
> registers) and do the right thing?  In any case if we need a firmware
> mapping for DT systems it sounds like something that works for TDM
> should be mappable onto SoundWire channels easily enough.

yes, if we can define a notion of logical TDM 'slot group' (e.g. 
headphone, mic, streamA, <add tag here>, etc), then the mapping with 
SoundWire data ports is straightforward. The mapping would typically 
come from platform firmware, not by checking device registers.

The actual value of a TDM slot which defines the transport position is 
however irrelevant for SoundWire.
