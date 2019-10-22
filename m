Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261EE04BD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 15:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AFD2166B;
	Tue, 22 Oct 2019 15:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AFD2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571750354;
	bh=RgRgRx4yc/P0ANHlasSjkqtZxObC8srcBRiOWoBfMEo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YbQcmaz64rtQIlbQksqmsIDf1ky1hCzDBDEklipFwIqWlNWbPdtbYvTQMA7WdLYMn
	 p5aBL5eJNH5eXpEtRxTFJA/Adb4o5YjDf//C0K4fsjL77ziVtm88Hkly29VYwIM02S
	 m1mNICT7mhDEpofIC6ePkgOtLxMLYviu+HS6z2TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6930F80322;
	Tue, 22 Oct 2019 15:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D47AF8031A; Tue, 22 Oct 2019 15:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6613F800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 15:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6613F800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 06:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,327,1566889200"; d="scan'208";a="187885825"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 22 Oct 2019 06:17:21 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id BF4F258048F;
 Tue, 22 Oct 2019 06:17:20 -0700 (PDT)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
 <20191011112745.25800-6-kai.vehmanen@linux.intel.com>
 <cf6a8edb-689d-e068-a9c4-d728b7741fec@linux.intel.com>
 <alpine.DEB.2.21.1910111705060.16459@zeliteleevi>
 <s5hmudziz13.wl-tiwai@suse.de>
 <2b172a1b-04d3-624f-f10b-6ff15bdc6c9d@linux.intel.com>
 <alpine.DEB.2.21.1910221416430.16459@zeliteleevi>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fb1fa3e4-7df6-e08d-0ea2-b936667362a7@linux.intel.com>
Date: Tue, 22 Oct 2019 08:17:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910221416430.16459@zeliteleevi>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, libin.yang@intel.com,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v6 5/9] ASoC: SOF: Intel: add support for
 snd-hda-codec-hdmi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> On 10/17/19 2:58 AM, Takashi Iwai wrote:
>>> A trivial conflict can be resolved by either Mark or my side, so don't
>>> worry too much about it.
>>>
>>> But if the patches don't rely on the new stuff that are found only in
>>> my tree, maybe it's better to rebase on Mark's tree, so that you can
>>> follow the whole other SOF development.
>>
>> I'll let Kai comment, but this change will have ripple effects on machine
>> drivers we need to upstream, so it might be better to use Mark's tree?
> 
> ack on both, now that we agree on the few change to generic hda part,
> the rest is SOF specific and easier to merge via Mark's tree. I'll
> work with Pierre to submit v7 (either directly, or even as part of
> Pierre's next SOF series).

Kai, it's probably better if you manage this directly, the next series 
will be about all the S0ix/DOix support and already quite dense.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
