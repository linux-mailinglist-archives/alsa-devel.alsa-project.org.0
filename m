Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF0A217C27
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 02:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70AAC15E0;
	Wed,  8 Jul 2020 02:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70AAC15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594167537;
	bh=IqWz0M/b8X8gw9k5wNuqSRwbGeVZuY/8tf8CmoBlE3I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TC4MU8uOQSnnLeVbSXGva/ilwvg+ehmCimFms6A4X9o3D0KbnoHMoJxKUU36Qnfy9
	 a1cBiTPnTP3jpjJe2I8G5IUkGTmp7xSsKXYXgv3zxddjEhBSOdx2aFaQcpk113zUHD
	 Wg3CrPQDZvDdv0W+QmmSm9/6ffAplCViXcFkodCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB3EF800D0;
	Wed,  8 Jul 2020 02:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC11F80216; Wed,  8 Jul 2020 02:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6D3F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 02:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6D3F8011F
IronPort-SDR: wkAPs1gziS7g2OvFmZUYbDtTF99x0+h/KYiCzJpJhQAr5hUCvDdL6WZ3DnNWBzu4Lu+uDqnPBg
 ZbyMD7eTVmWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232574963"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="232574963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 17:17:00 -0700
IronPort-SDR: 9RgYEy4NEGLxZ8m/ZrK4HvDEoxlhMspeeeF3bhXXdRu3yM8+6uPCjV22XiKWCQoZ+OMeife5O0
 jsN91cKPeFMg==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="323701265"
Received: from teresabx-mobl1.amr.corp.intel.com (HELO [10.255.230.32])
 ([10.255.230.32])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 17:16:59 -0700
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_0/3=5d_ASoC=3a_Clean-up_W=3d1_build_warnin?=
 =?UTF-8?Q?gs=e2=80=8b_-_part3?=
To: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
 <1jo8ordshd.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <951676be-fd0a-530a-d57b-d684b93efc70@linux.intel.com>
Date: Tue, 7 Jul 2020 19:16:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1jo8ordshd.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
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



On 7/7/20 2:39 PM, Jerome Brunet wrote:
> 
> On Tue 07 Jul 2020 at 21:23, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> 
>> This is a much smaller set of cleanups, all related to warnings thrown
>> by the use of GENMASK() with an unsigned variable. I just made the
>> warning go away but I wonder if there's a better fix in the definition
>> of GENMASK() itself?
> 
> Looking at the patch I was going to ask the same thing.
> It does not make much sense to me to force GENMASK arguments to be
> integer (instead of unsigned integer) to then check there are positive ...

Agree, it's just that the following macro isn't exactly simple to change:

#define GENMASK_INPUT_CHECK(h, l) \
	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
		__builtin_constant_p((l) > (h)), (l) > (h), 0)))

I couldn't find a means to avoid the comparison.

I just realized this is a fairly recent addition in 295bcca84916 
('linux/bits.h: add compile time sanity check of GENMASK inputs'), 
adding the author Rikard Falkeborn in CC:

include/linux/bits.h:26:28: warning: comparison of unsigned expression < 
0 is always false [-Wtype-limits]
    26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
