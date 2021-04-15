Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40A360FD2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65C8166B;
	Thu, 15 Apr 2021 18:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65C8166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618502784;
	bh=fOti0JWVub3MDgJ5kLDJpIT/+/IarsGlfVqhfvXbb6U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrRsQOtL6OGzgbGrDVGfv8ddqE2BQBDLRpE0E8fRtvfDW6Nt+MwV/SgFjBw6nK5xZ
	 OfE6raZkztaS/pGi8Fi/NXLyYTl1yVHxWIfQsfICAVcjb9KVKSmakDuZfkDiDSQTlD
	 TNiELXKkTX4VqVRZ9wDN1RoHBgn0utotHy9oVwuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D60F80260;
	Thu, 15 Apr 2021 18:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47E66F8025C; Thu, 15 Apr 2021 18:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 190B3F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190B3F80128
IronPort-SDR: RmXkXw0KLDgNTdhT5uG+kUI2dLVGxS8qZQdQ9X4qp+64N6WQLzjVS8HPlLNG1Aw5lcLLGZQQ8s
 8ij2kvfYrzDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182005143"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="182005143"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:39 -0700
IronPort-SDR: m2Dl1SuLXmJiuU730Cb0MHegPf8sGJwNsfnIr58ngPf6RGESyw+O/ACrKA7uFpJNr79WIDA6rE
 TPkc5VgAXePw==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="615684919"
Received: from andrelei-mobl.amr.corp.intel.com (HELO [10.209.167.172])
 ([10.209.167.172])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:38 -0700
Subject: Re: [PATCH] ASoC: SOF: use current DAI config during resume
To: Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20210414165926.1875465-1-ranjani.sridharan@linux.intel.com>
 <20210415155309.GA48833@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <718ff501-df0d-93ff-5626-a190bf0bb05a@linux.intel.com>
Date: Thu, 15 Apr 2021 11:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415155309.GA48833@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 4/15/21 10:53 AM, Mark Brown wrote:
> On Wed, Apr 14, 2021 at 09:59:26AM -0700, Ranjani Sridharan wrote:
>> Recently, the sof_pcm_dai_link_fixup() function was
>> updated to match SSP config with the PCM hw_params
>> and set the current_config for the DAI widget.
>>
>> But the sof_restore_pipelines() function still chooses the
>> default config for the DAI widget upon resuming. Fix this
>> to use the last used config when setting up the DAI widget
>> during resume.
>>
>> Fixes: a1e1f10a6ed6 ("ASoC: SOF: match SSP config with pcm hw params")
> 
> I don't seem to have that commit.

I think it should be:

Fixes: c943a586f6e49 ("ASoC: SOF: match SSP config with pcm hw params")

I can re-send if needed
