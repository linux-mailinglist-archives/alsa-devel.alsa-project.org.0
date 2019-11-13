Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E77FB1F1
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 14:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F023D3E;
	Wed, 13 Nov 2019 14:57:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F023D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573653476;
	bh=ETNZkC9zbdoUNIAnznBHkeV+9uhMTBXmrY6yMVN/68o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rULCXIeSIu3L3ojO60lKWy8JuFyl4ZY/Oi8UytUmJ4RkR1mWIX/dtD3hqbM0ebTun
	 oZX0CK8TedyMT0aCn8GRqJVpg0S2kk6VsRFTQYmeme+egka6uiB/jwHZrW+2awsZgw
	 Wej6H5V0LV3rYDg0bdl5DFyLeGfK11grXReFiIDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF46F80083;
	Wed, 13 Nov 2019 14:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF1DF80081; Wed, 13 Nov 2019 14:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5185F8007F;
 Wed, 13 Nov 2019 14:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5185F8007F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 05:55:57 -0800
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
 d="scan'208,217";a="216392161"
Received: from pharlozi-mobl.ger.corp.intel.com (HELO [10.237.141.12])
 ([10.237.141.12])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 13 Nov 2019 05:55:55 -0800
To: Mark Brown <broonie@kernel.org>
References: <20191112130237.10141-1-pawel.harlozinski@linux.intel.com>
 <20191112130237.10141-2-pawel.harlozinski@linux.intel.com>
 <20191112171022.GG5195@sirena.co.uk>
From: "Harlozinski, Pawel" <pawel.harlozinski@linux.intel.com>
Message-ID: <a65b78da-6faa-9b3d-312e-90c754a45626@linux.intel.com>
Date: Wed, 13 Nov 2019 14:55:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112171022.GG5195@sirena.co.uk>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: cezary.rojewski@intel.com, patch@alsa-project.org,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rt274: Disable jack report IRQ with
 disabling jack
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


On 11/12/2019 6:10 PM, Mark Brown wrote:
> On Tue, Nov 12, 2019 at 02:02:37PM +0100, Pawel Harlozinski wrote:
>
>>   		/* Disable jack detection */
>>   		regmap_update_bits(rt274->regmap, RT274_EAPD_GPIO_IRQ_CTRL,
>>   					RT274_IRQ_EN, RT274_IRQ_DIS);
>> -
>> +		disable_irq(rt274->i2c->irq);
>>   		return 0;
> Shouldn't the register update above be suppressing interrupts?
For rt274 disable_irq is also needed, otherwise we're getting flood of 
irq's in case of not loaded machine board.
> disable_irq() is a bit of a hammer and interferes with things like
> possible share use.

This irq should be handled in codec code anyway - control of jack detect 
events from non-codec code is done with set_jack.
Similar solutions for jack report irq enable/disable flow are 
implemented in rt5640 and rt5651.

> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
