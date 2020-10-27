Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D553729BD39
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 17:47:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 772861683;
	Tue, 27 Oct 2020 17:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 772861683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603817272;
	bh=7hGXXqu27krTAVO2hF4LVO90Zxl31fhyhjNUoNnFZVY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eqxzs7fk7vpo3h/qpb0zPQ5kCglWKyDH1z1zl//kgUVfntLpozOonQrYsHdwcxY6U
	 5NpH19lr8e+lv7Oed3JkvHhUhFKC2o5qjoVHXWPYUSUsGxVXn9thTSnxX4N0yX32rh
	 /GQCD3WtIUcjLqvC0zRWdL40GyJGDjfG6JUqQbxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF91F800FF;
	Tue, 27 Oct 2020 17:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E46E3F80217; Tue, 27 Oct 2020 17:46:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 948BDF8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 948BDF8020D
IronPort-SDR: SriHVTeIcMXPfksHos7J8USEh1MWGu3N8eAznFwyUlrs8/cPXEIQGCU1QwIyQODAS4Ete9Xu7N
 lH/1/COPxLDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168245817"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="168245817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:46:12 -0700
IronPort-SDR: XKsnFkV3p2HvEjd/nf7vJ4lQcPLWMdFVjaMY25oEFVkfJD/BVP/E3b9OfHmhPOrGOpywdE7r8A
 3x0Hs4jWSipA==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="318289173"
Received: from bretdavi-mobl2.amr.corp.intel.com (HELO [10.209.106.41])
 ([10.209.106.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:46:12 -0700
Subject: Re: [PATCH v1 3/6] ASoC: codecs: lpass-wsa-macro: add dapm widgets
 and route
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
 <20201026141945.19707-4-srinivas.kandagatla@linaro.org>
 <98d3f89b-8d71-e652-504b-2bb770532a09@linux.intel.com>
 <b6ffdcf6-4f3a-f8be-422a-4de2d304fe5f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b69a720a-4ee2-2ede-2d08-3bb800d58359@linux.intel.com>
Date: Tue, 27 Oct 2020 11:14:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6ffdcf6-4f3a-f8be-422a-4de2d304fe5f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com
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



On 10/27/20 5:15 AM, Srinivas Kandagatla wrote:
> Thanks Pierre for review on all the patches.
> 
> On 26/10/2020 19:58, Pierre-Louis Bossart wrote:
>> Run cppcheck on this sort of code:
>>
>> cppcheck --platform=unix32 --force --max-configs=1024 --inconclusive
>> --enable=all --suppress=variableScope sound/soc/codecs/lpass-wsa-macro.c
> 
> I normally do sparse checks before sending patches, which did not catch 
> these.
> 
> thanks for the suggestion, I will keep add these checks to my future 
> patches.

Each tool has its own merits and strengths.

My routine is

export KCFLAGS="-Wall -Werror"
make W=1 sound/
  this typically catches set-but-not-used assignments, kernel-doc, etc.
make C=2 sound/
   Sparse catches big-little issues and when static should be used.
and the cppcheck last.
   this is a bit verbose and not suitable for CI/automation, but catches 
set-but-ignored assignments and differences between declarations and 
definitions. It also catches logical errors (always true, always-false, 
etc).

Hope this helps
-Pierre

