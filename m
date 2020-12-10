Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2882D6314
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 18:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F06C1663;
	Thu, 10 Dec 2020 18:09:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F06C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607620197;
	bh=P6kPJY4XWZeP3+UJ8OUobp0lXNpTJwV/lltfDE5kLLc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O34TBVFkSgfMBGfzLHBErVnAyEf//3s1hJ7ON45bFQpt5WOl6XaFbgJNNiOhWwrLz
	 U0rPJpz2U6LFHjC4fEH2SdSUMkjHHIJ5tLnofSeN7k5ZoqfiQBHqr930ic89/Lh24l
	 Mm9cbyMwgxpf8lMrgPHk32+NqFb71PhMejBJzWPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E363F804C3;
	Thu, 10 Dec 2020 18:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD58F804C2; Thu, 10 Dec 2020 18:08:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9024DF800E1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 18:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9024DF800E1
IronPort-SDR: acdgFLVQgUXdxTZS+y7+xb9kzLm24P29z2druhqhW0BK9D5n+CSaoGPwLMU15viT9Jtg6ojFLW
 jk2//+zs0eVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174436684"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="174436684"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:07:48 -0800
IronPort-SDR: OZHBvAxOJze37dvK9tMLnFNHSIa+u4x5mvS+2fGUQXY3qSKVQEEFAGvVb5ZHmDjxid1cjON1sH
 NtPzljwIsuhg==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="543436750"
Received: from apobanz-mobl3.amr.corp.intel.com ([10.212.60.128])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 09:07:48 -0800
Message-ID: <74bb51e4e38382b25d6b2f58d9dcf5fd03cdf86c.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: topology: Add missing size check
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Dec 2020 09:07:48 -0800
In-Reply-To: <20201210152541.191728-2-amadeuszx.slawinski@linux.intel.com>
References: <20201210152541.191728-1-amadeuszx.slawinski@linux.intel.com>
 <20201210152541.191728-2-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On Thu, 2020-12-10 at 10:25 -0500, Amadeusz Sławiński wrote:
> When we parse "values" we perform check if there is correct number of
> them. However similar check is missing in case of "texts", add it.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
Both patches look good, Amadeusz!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

