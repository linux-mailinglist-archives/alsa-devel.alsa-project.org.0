Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A08261396
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 17:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8B31795;
	Tue,  8 Sep 2020 17:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8B31795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599579321;
	bh=PIsUJCHEWZm+jaskcSzu6wMDFhw0KfoBzIILP8lK1CI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Koa/K259iD/omi3dE0CnbYIQ1qBu5/AyI+3CLSnNszhu69FfU8H9El2Pc2ynR5usy
	 jgdFDk+iNQFpGjN/1I3VShysOuQUQBXS5KtiP5TsUcuis1MutypenVAEIgWYfF1kfe
	 iUVZg+RAAoTAI4r8dRUMH46LCxy23QSXjmYV2eGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 390C1F801F2;
	Tue,  8 Sep 2020 17:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513F4F80264; Tue,  8 Sep 2020 17:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 483DEF8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 17:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 483DEF8015F
IronPort-SDR: WN1CAsQnJKg6vd/WjTJD+Zgp8Q/bI6S7Ge+OiTzlc56WhZcTIOqDTfCyI0aBcsMEXGczH6CKpj
 pN1HXh5LIjEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="176213227"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="176213227"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 08:33:24 -0700
IronPort-SDR: vw0zCnDsR3rSALWyjSRKlBGHJJL1ap4kPMjhz/Azq2iirmf8bzzpQaFK6CAeQrc5BskNEvTCo8
 y98Oog5bQdZg==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="448829315"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134])
 ([10.212.179.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 08:33:20 -0700
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
To: Mark Brown <broonie@kernel.org>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
 <20200828065125.GI2639@vkoul-mobl>
 <ec5fe867-f2e4-4278-0376-e54bcdd7f94d@perex.cz>
 <20200908121133.GA5551@sirena.org.uk>
 <1950b662-ec59-6603-36c7-7a41d9e8460c@perex.cz>
 <20200908143312.GC5551@sirena.org.uk>
 <ce68a159-de6d-2d8a-c8a2-3e527cb1239e@linux.intel.com>
 <20200908151412.GE5551@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <973b1a09-40a9-1d10-4975-3f6d5a9340b1@linux.intel.com>
Date: Tue, 8 Sep 2020 10:33:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151412.GE5551@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Vinod Koul <vkoul@kernel.org>, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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



>>>>> I don't have this patch and since I seem to get copied on quite a lot of
>>>>> soundwire only serieses I just delete them unread mostly.
> 
>> We now try to use the ASoC/SoundWire prefix for cover letters to highlight
>> that a patchset changes things across two trees, does this help or do we
>> need a different way of flagging these patches?
> 
> I think the issue is mainly where the patch itself touches both, if some
> of the patches mention ASoC I'll generally notice them but Soundwire is
> one of these things I get so many random CCs for I just zone it out so
> highlighting the individual patches would help.

ok, we'll highlight individual patches then and better explain dependencies.
