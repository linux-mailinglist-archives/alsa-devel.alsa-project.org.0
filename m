Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B8508D13
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 18:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC851AEE;
	Wed, 20 Apr 2022 18:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC851AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650471578;
	bh=Y1a4pcTqymAWKcsqfTocRlg43sp5JlsqbUEBLfk5npw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4g611nmYjTsRz/Fhq3X9rbBYsurWwVCa1B7zEvn1zXLwTuZAusnEmcDTony6b9oZ
	 +DvxtdliS6dRnyroi5XCkA1mJOHwj5JtHqTN8stY8ByGx+rRzUN1jYlvTiEclIql42
	 kx194Bj6YMchiZFnCfqfuDb6TVaA+EXx7KpQQPrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 869DEF804FE;
	Wed, 20 Apr 2022 18:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C1ABF804FD; Wed, 20 Apr 2022 18:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8562AF804F1;
 Wed, 20 Apr 2022 18:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8562AF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bNGcxRtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650471509; x=1682007509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y1a4pcTqymAWKcsqfTocRlg43sp5JlsqbUEBLfk5npw=;
 b=bNGcxRtqp4XBYbAoc0H+vvwuAx2B3T3hh4fUZLqs/wG3pTMJ15kBsxBk
 hPonHA0U7aOSe1e2RzhQcmx3b+zZgvir6ZVQH+eMQ1O4AqsNB7lH4O5UR
 Q02hnx7NFJjShdexir7f8wwfIR85Vte0Vv6CCe5xYqf7wbKnjy+54PMgn
 L/F0H2RjBHINlnQDq+V1OY0Ji/72c97YNEsDtLi2KnehibUMYVjdoDf/U
 oc21dayjJM4roXIt9j7ZWnEz43jQVndbMOyGJOufFXvq/oSDpfmQ8Hp4D
 W/AIAPNffXUX32owPmHdtX/9brgj4kCuDMQDigOoZSqPyzhf3pprw5foQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="245968831"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="245968831"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 09:11:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="576661339"
Received: from sbidasar-mobl.amr.corp.intel.com (HELO [10.209.100.171])
 ([10.209.100.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 09:11:04 -0700
Message-ID: <2572220e-57d0-4f10-1695-bfeab54de38d@linux.intel.com>
Date: Wed, 20 Apr 2022 11:11:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify
 the code
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
 <78c7edc3-f431-9735-238d-9aa2b45ec45e@linux.intel.com>
 <YmAljQjpLCoBv+nj@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YmAljQjpLCoBv+nj@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cgel.zte@gmail.com, Zeal Robot <zealci@zte.com.cn>, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 4/20/22 10:23, Mark Brown wrote:
> On Wed, Apr 20, 2022 at 08:28:31AM -0500, Pierre-Louis Bossart wrote:
>> On 4/19/22 22:03, cgel.zte@gmail.com wrote:
>>> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
>>> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>>> pm_runtime_put_noidle. This change is just to simplify the code, no
>>> actual functional changes.
> 
>> Well, maybe that's a simplification, but we've been using the same pattern for years now.
> 
>> Is there really a clear direction to use this new function?
> 
> It seems like a much better pattern and there's been a steady stream of
> conversion patches.  The whole get/idle thing is pretty much just sharp
> edges.
> 
>> the overwhelming majority of drivers in sound/soc still rely on the pm_runtime_get_sync (111 v. 7).
> 
> We'll get there I'm sure.

ok, I'll send follow-up patches for the remaining code.

For this patch: 

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
