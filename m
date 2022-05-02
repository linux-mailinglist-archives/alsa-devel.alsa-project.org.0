Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5804517128
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 16:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307D015E5;
	Mon,  2 May 2022 16:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307D015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651500139;
	bh=SB+mn4fRsEDPQCfTw8QCueHkfqpMzSgEmOFpanrd+SA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZEmYDwpURrQfH9jg1CzrXiD9EyeoEBR0qpn5wTwJDakBvO6BxcjoM2qWeIM4ssOa7
	 njK9ZMjXrjfZWJ00rrcZ/azD+C7PprkSO8haTq25fGP785XoeO2rj2M2j4ZtgO3Bv2
	 AdJ4ShCgbvaHwWSfJC8fziQaqaPM2OmfQ6TuHEvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BFAF800D2;
	Mon,  2 May 2022 16:01:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E739F80245; Mon,  2 May 2022 16:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F2FDF80129
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 16:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F2FDF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FoxT2E40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651500075; x=1683036075;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SB+mn4fRsEDPQCfTw8QCueHkfqpMzSgEmOFpanrd+SA=;
 b=FoxT2E40zE2w483pgrrdVWAWz5OpXmiWzMflwdcYrIp6U3watN1D5uGj
 L9BMArHo5YHLUmTDuWZeXMQtrHI2rkfZ/GKl0kRzvIXi7VKqXAmIlrke4
 USHFDvPZnmUtbrYsHZieXsTmykUeZ4Nqr1hfB0abWmdmUHMmYbFZk1b7+
 4meOpvUZp27J4QwSMxVQ1eIsrfoKTZgkvGpwcduWzyn4LlHl8cMR8vhM6
 fOa6euxMgoRBofPDRIxWOXr1J6ux6Rezm3x0xe7W2TraGmE/+aUIo//ES
 LP2YbXCd0xGkkpDpa9Vy7pkl+jfy4Uy6BebqkK74aCSPTNGrRbqm+fpth g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="267370955"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="267370955"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:01:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="561742281"
Received: from sushilsu-mobl1.amr.corp.intel.com (HELO [10.251.9.25])
 ([10.251.9.25])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:01:05 -0700
Message-ID: <62f73d83-56b0-1ccb-c7f6-5bf975f7bf9b@linux.intel.com>
Date: Mon, 2 May 2022 09:01:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH AUTOSEL 5.17 06/22] ASoC: Intel: sof_es8336: Add a quirk
 for Huawei Matebook D15
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20220426190145.2351135-1-sashal@kernel.org>
 <20220426190145.2351135-6-sashal@kernel.org> <Ymko4F24MvbGJUXp@sirena.org.uk>
 <Ym7gMZRI7ad6u0fL@sashalap>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Ym7gMZRI7ad6u0fL@sashalap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 yang.jie@linux.intel.com, alsa-devel@alsa-project.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, yung-chuan.liao@linux.intel.com
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



On 5/1/22 14:32, Sasha Levin wrote:
> On Wed, Apr 27, 2022 at 12:28:32PM +0100, Mark Brown wrote:
>> On Tue, Apr 26, 2022 at 03:01:29PM -0400, Sasha Levin wrote:
>>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>
>>> [ Upstream commit c7cb4717f641db68e8117635bfcf62a9c27dc8d3 ]
>>>
>>> Based on experimental tests, Huawei Matebook D15 actually uses
>>> both gpio0 and gpio1: the first one controls the speaker, while
>>> the other one controls the headphone.
>>
>> Are you sure this doesn't need the rest of the series it came along
>> with?
> 
> I'm not :) Should we queue it too?

If you add this platform to -stable, you'd need the entire series https://lore.kernel.org/alsa-devel/20220308192610.392950-1-pierre-louis.bossart@linux.intel.com/, and the additions made by Mauro.

My take is that it's not really relevant for -stable, support for this hardware codec is still a works-in-progress and while we'd certainly want to have more distributions use the hardware support it's quite disruptive for -stable maintainers, with the risk of compilation problems and functional issues introduced. it'll make more sense for 5.18+.

