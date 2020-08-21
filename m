Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E424D916
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 17:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6818E168F;
	Fri, 21 Aug 2020 17:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6818E168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598025112;
	bh=7lGvicdNOA09KI+9Iqs64Ww2ddOSsgTat/wpE3LePBo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjoxiUNB4tYjJgA/ozXNm1vpjEOC0C05vqVty0/8/BlYa/RNA1GMLHdiBucm5ag45
	 Ig6EwDSuBUgJqiobkbd2NTvqKpJikzDGodIsQNsYC7ziHwEZBVc5YJgfStsTu6+8To
	 jkXhxBOhiVRSbKR9Vb7Ss+aJKa+LcyIrKaT0u640=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 955E1F80253;
	Fri, 21 Aug 2020 17:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C926F80218; Fri, 21 Aug 2020 17:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5487EF800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 17:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5487EF800D2
IronPort-SDR: Ku8BDoms2h5Ayw2VlkVIjbTmyw75ZEn02YY3Z/7b3SNAiSvKALH5Iz+QVCTcUSrRmFb9Ik6i25
 pUEFrKW8O58g==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="135101313"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; d="scan'208";a="135101313"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 08:49:55 -0700
IronPort-SDR: U0c/ucYHcYWMlQh/WwpAiK3Danxi4+T+E4u771AvD7KIVPZW1dYADp7rgNRfOP9+NXg4ImwvZO
 xe4Dt3D1dCtw==
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; d="scan'208";a="442385981"
Received: from pcmiller-mobl1.amr.corp.intel.com (HELO [10.209.120.121])
 ([10.209.120.121])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 08:49:54 -0700
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8507bcc1-8b20-4d70-7fd2-1131f8b02d5b@linux.intel.com>
Date: Fri, 21 Aug 2020 10:49:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sameer Pujar <spujar@nvidia.com>, Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Morimoto-san,

 > I know Pierre-Louis want to use it for SOF, but something is missing,
 > thus, can't use (?).

Here's a bit more background.

For SoundWire, we could have the following examples for amplifier 
connections, where in some cases we have two amplifiers located on 
separate links (top diagram) and in the second they are on the same link.

| FE PCMs    |  SoC DSP  | BE DAIs   | Audio devices |

              *************
   PCM0 <---> *           * DAI0 <---> Codec Headset
              *           *
   PCM1 <---> *           * DAI1 <---> Amp Left
              *   DSP     *
   PCM2 <---> *           * DAI2 <---> Amp Right
              *           *
   PCM3 <---> *           * DAI3 <---> BT
              *           *
              *           * DAI4 <---> DMIC
              *           *
              *           * DAI5 <---> FM
              *************

              *************
   PCM0 <---> *           * DAI0 <---> Codec Headset
              *           *
   PCM1 <---> *           * DAI1 <---> Amp Left
              *   DSP     *        |
   PCM2 <---> *           * DAI2/  --> Amp Right
              *           *
   PCM3 <---> *           * DAI3 <---> BT
              *           *
              *           * DAI4 <---> DMIC
              *           *
              *           * DAI5 <---> FM
              *************

We'd need a means to express that the two amplifiers are really supposed 
to operate concurrently and be synchronized, and let the drivers know 
which configuration to use (multi-cpu/multi-codec or single 
CPU/multi-codec).

Currently we do this manually by hard-coding an 'endpoint group', see 
e.g. 
https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/common/soc-acpi-intel-cml-match.c#L69, 
and use this information in the machine driver to know which of the 
configurations to use.

At some point we'd like to read this information from platform firmware 
(will be ACPI for Intel but that's a detail) and create the dais in the 
right way by grouping endpoints on the same dailink when they are 
connected, and create separate dailink otherwise.

Note that we only want the connection between BEs and audio devices to 
be described in platform firmware, the topology inside the SOC DSP is 
handled with a topology file that can be changed at will to e.g. 
add/remove processing.

We really need to make sure the audio graph can be described in two 
parts, the bottom part related to hardware routing and layout, and the 
DSP part. Of course the topology part would have to be constrained to 
use the DAIs used in the lower level.

Hope this helps explain what I am looking for.

Thank you for starting this thread!

Regards

-Pierre
