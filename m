Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12B339370
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BC5176E;
	Fri, 12 Mar 2021 17:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BC5176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615566747;
	bh=CkCOPTFIXACAysAPtapS6GQns0kG8jWuUbka7IkCmPE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJSENTYlkIdBGu4bR02sQuBfcsWI34CY1xgNzlsJVxFh6o+ZQwV03GumQfm+t3RcU
	 th4XfUZx3svZcj5zoclrpU9za7t81r8dN+uCv6T6hfV5CzqiPmrM4xU/aBykDoaBAW
	 ganUgF2bW5SruPEuBAuT3aHfwgJxYP1BvqmSeZyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED35F800AB;
	Fri, 12 Mar 2021 17:30:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50BD1F801D8; Fri, 12 Mar 2021 17:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF6AFF800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF6AFF800AB
IronPort-SDR: llZ66xm0hRMVYNRAFlUyfRRxDks7RrTVbmBy/MIV7AVG651zMS0QgQBU971UXPVEMF4P5qToJH
 fIh3xRJ6kSKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="208697459"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="208697459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:30:34 -0800
IronPort-SDR: ger7O0uf9egtmMbqWdf6zVVZ7H3ix27xYVtB4bE1jdEUmztM01ASjX+r17WgMXYaxRUjtzkxvS
 koG3AXh91IlQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="411057188"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO [10.212.135.254])
 ([10.212.135.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:30:34 -0800
Subject: Re: [PATCH v3 1/2] ASoC: samsung: tm2_wm5110: check of of_parse
 return value
To: Mark Brown <broonie@kernel.org>
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
 <20210311003516.120003-2-pierre-louis.bossart@linux.intel.com>
 <20210312142812.GA17802@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a9caf1c6-d9d0-7e05-31f2-6a8d9026e509@linux.intel.com>
Date: Fri, 12 Mar 2021 10:30:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312142812.GA17802@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
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



On 3/12/21 8:28 AM, Mark Brown wrote:
> On Wed, Mar 10, 2021 at 06:35:15PM -0600, Pierre-Louis Bossart wrote:
> 
>> Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
>> Cc: <stable@vger.kernel.org>
> 
> Commit: 11bc3bb24003 ("ASoC: samsung: tm2_wm5110: check of of_parse return value")
> 	Fixes tag: Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
> 	Has these problem(s):
> 		- Subject does not match target commit subject
> 		  Just use
> 			git log -1 --format='Fixes: %h ("%s")'
> 

Sorry, I don't know what to make of this. I don't see this commit 
11bc3bb24003

Something odd happened, there was an initial merge and it seems to have 
disappeared, it's no longer in the for-next branch?
