Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F751A587
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 18:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB9F2166D;
	Wed,  4 May 2022 18:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB9F2166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651681698;
	bh=T8vVeilUSUmhaKyq78ENMag6fs1JQalSDeRAZhNF6tM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qs6Oi57S/L2UGEpHCkmwXfpb5+kwAmsn0THL2GFETMtWqmp0C7kwYjUmNaDHqiPDk
	 /jXVWrzQZU7Hfvhx0KZU98umSorKIKM3OiHosjJmeeQXH7sgfmmuU+dkITqw/9CP6e
	 YbohspzLXQo3ZtczCcQHNvfuiOHquhsB4D1KSGDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D26FF800BF;
	Wed,  4 May 2022 18:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB38CF80163; Wed,  4 May 2022 18:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0642F800BF
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 18:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0642F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fi7MwCLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651681634; x=1683217634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T8vVeilUSUmhaKyq78ENMag6fs1JQalSDeRAZhNF6tM=;
 b=fi7MwCLt3l65H+KxoBPvPes+wkM31fhW2S6wVm3i136se18zt4adbrXa
 YGneQ7jEfUmyLOK/sVUCx7ehusur/w18Z6AEup6ORcNLdtGriswg4rava
 fEg7j0Yig/Z4gqDIlrAHsWZmm/s0M8JeJ6SMEJdvFFewW16xSV0JU1Z8x
 nMAmJbEOWnEvmUXbh1Nl/7tN7MQq/Cx9MfbWosZ+bRdKXbe5y7hcO7H2j
 CIy0EbbSlH1KNNa74AkcgaUptMiOLozCsspMpekTSrzhQWLl/dwptZm3M
 ZTvH6MDU4TEjbbuelYKjScr2SZFcIS07Jgd0L8RonokFCoND1psX/MCKb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="249799431"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="249799431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:27:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="517094929"
Received: from iremsen-mobl.amr.corp.intel.com (HELO [10.212.200.96])
 ([10.212.200.96])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 09:27:09 -0700
Message-ID: <a34be989-c5a9-a7ce-cff4-6fd83c45c9bf@linux.intel.com>
Date: Wed, 4 May 2022 11:27:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: ASoC component/card relationship
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
 <YnGRNfaempsFG9/M@sirena.org.uk>
 <ff511a84-adac-1018-a934-2b8202c5a9fe@linux.intel.com>
 <6009dd4b-e5f3-78a6-eade-76c3f30a6d42@linux.intel.com>
 <2c2c1af4-9c40-841d-fc9e-486c3db482bd@linux.intel.com>
 <e34d453b-1fbe-6e53-dc90-00580c9df9dd@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e34d453b-1fbe-6e53-dc90-00580c9df9dd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


>> Just to make this point stronger, with the recent support of the ES8336
>> codecs, we had to generate the following topologies to account for all
>> permutations:
>>
>> sof-apl-es8336-ssp0.tplg
>> sof-apl-es8336-ssp2.tplg
>> sof-cml-es8336-dmic2ch-ssp0.tplg
>> sof-cml-es8336-dmic2ch-ssp2.tplg
>> sof-cml-es8336-dmic4ch-ssp0.tplg
>> sof-cml-es8336-dmic4ch-ssp2.tplg
>> sof-cml-es8336-ssp0.tplg
>> sof-cml-es8336-ssp2.tplg
>> sof-glk-es8336-ssp0.tplg
>> sof-glk-es8336-ssp2.tplg
>> sof-jsl-es8336-dmic2ch-ssp0.tplg
>> sof-jsl-es8336-dmic2ch-ssp2.tplg
>> sof-jsl-es8336-dmic4ch-ssp0.tplg
>> sof-jsl-es8336-dmic4ch-ssp2.tplg
>> sof-jsl-es8336-ssp0.tplg
>> sof-jsl-es8336-ssp2.tplg
>> sof-tgl-es8336-dmic2ch-ssp0.tplg
>> sof-tgl-es8336-dmic2ch-ssp2.tplg
>> sof-tgl-es8336-dmic4ch-ssp0.tplg
>> sof-tgl-es8336-dmic4ch-ssp2.tplg
>> sof-tgl-es8336-ssp0.tplg
>> sof-tgl-es8336-ssp2.tplg
>>
>> All these topologies come from the same file, and generated using
>> macros. That makes no sense to me, this should be the same topology that
>> is remapped at run-time.
> 
> 
> What Amadeo is explaining here is that AVS driver already addresses this
> too - at least in our opinion - see parse_link_formatted_string() in
> sound/soc/intel/avs/topology.c.
> 
> User is allowed to specify widget name as: ssp%d within the topology
> file, leaving kernel with responsibility to fill the missing index. And
> this is something I (perhaps we all) would like to see within the
> framework in the future.

Wow. I don't think anyone saw that concept in the code or comments....

That's not a bad idea, but is this really what the definition of
SND_SOC_TPLG_TUPLE_TYPE_STRING meant?

That's a de-facto ABI or strong convention between kernel and topology,
we'd probably need framework extensions to be on the safe side and deal
with variability in more 'controlled' way.

In the AVS example, the 'i2s_link_mask' is used, but in practice there
are cases where the information is only known by checking a package in
the DSDT (baytrail), a DMI quirk, an NHLT information, etc. We should
really plan for extensions with a callback into the topology parser.

> In consequence, avs-driver user does NOT need to define N identical
> topologies. For example, SSP-test board [1] and its definition in
> board_selection.c [2] clearly show that all 6 SSP boards look at the
> exact same file. The same approach is used when speaking of other,
> simple i2s codecs, e.g.: rt274, rt286, rt298. Difference between rt298
> on APL and GML comes down to SSP port number. Here, board_selection.c
> shows different prefixes (apl- vs gml-) but the reality is that both
> files are symlinks looking at the exact same actual topology file with
> ssp%d specified as widget names.

ok, but why even consider symlinks? Why not using the same topology name?

We are making things too hard for package maintainers, e.g. for SOF we
released 198 topologies already, that's not sustainable.

> At the same time, compound machine boards are still permitted and made
> use of, example being TDF8532/Dirana board for Automotive (not yet
> present on the list).
> 
> Really, flexibility is key here. As long as devices found on given
> platform are not connected or dependent on each other, there are no
> major objections preventing card split. Such code scales better and has
> good reuseability.

I don't disagree here but you combined two capabilities in one. The
major simplification comes from the remapping or 'dynamic naming' to
quote your code, the split is a refinement.

Thanks for all the comments so far, good discussion indeed.
