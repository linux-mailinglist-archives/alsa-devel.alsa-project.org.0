Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C3566BC4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 14:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C952886;
	Tue,  5 Jul 2022 14:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C952886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657022988;
	bh=t4bnxIAlzIQEOHmXOwgyLjmHsBOSElXHODbbcY2VNkY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a985ysfINuX/7WvmDgenG9TKLEnzn7cZ3YdVZPVBjpNOXVY1Rqb6ihcp/vJ1TZj96
	 UyPdlujhnT62WDv3bk58BC4jRCz30n1mJr1gU78FGurLKad6GooO5UxUBNdP1XYrSN
	 L6Vx8M43dmiH3SULtzo10HkgKRgsGu06hONCxMoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F5F9F800CB;
	Tue,  5 Jul 2022 14:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC4EF8015B; Tue,  5 Jul 2022 14:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DB9F80104;
 Tue,  5 Jul 2022 14:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DB9F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n71U0zpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657022923; x=1688558923;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t4bnxIAlzIQEOHmXOwgyLjmHsBOSElXHODbbcY2VNkY=;
 b=n71U0zpfqYPcR+Vh8jOnLhk0xqmzySDKMy6Xtj9zZ0iaJRqz63WiMS14
 hFUX64lBnhp16XCFpcg66YyfEdCQPEJ++3SIXGuYGQpkjok3mYqWTas/j
 r6S4TUhA8Q3qOj+2QravfuyqgIYZ0V1N9VhQ2jV3BwcHGAEMHy4iglMhg
 7eaRRFlKGg7RmzLnQJtOYAraRRzIAcO0621tNT8V/RQF7tvkOrjagZdOb
 1qMa7tm3rDAEvmm0osEWUEQa8iAkDcqukOKHjqrQwv4fXABegfoDXZVNq
 OthbNqkcbsZiNxaYRz5fQX9ExLJm0ESd+oALZwjvTfGfB0q7mbuCcXm4M g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="266362208"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="266362208"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:08:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="590379430"
Received: from kszenk-mobl.ger.corp.intel.com (HELO [10.249.254.134])
 ([10.249.254.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:08:33 -0700
Message-ID: <21522ae3-96a3-ce07-6466-89cbf6c67a9f@linux.intel.com>
Date: Tue, 5 Jul 2022 15:09:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
 <91f156ba-5d93-63d6-5fa0-86614bc370d3@linux.intel.com>
 <YsMTHTcOWX4Q3W7f@smile.fi.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsMTHTcOWX4Q3W7f@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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



On 04/07/2022 19:19, Andy Shevchenko wrote:
> On Mon, Jul 04, 2022 at 10:31:48AM +0300, Péter Ujfalusi wrote:
>> On 03/07/2022 17:35, Andy Shevchenko wrote:
> 
> ...
> 
>> +	return sof_acpi_probe(pdev, (const struct sof_dev_desc *)id->driver_data);
>>  }
> 
>> We don't use the desc in sof_broadwell_probe(), so we can just pass the id->driver_data
> 
> I prefer not to cast inside the function parameters when it's not about POD.

Fair enough.

How about assigning desc before it is used?

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 26df780c702e..a446154f2803 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -681,11 +681,8 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	desc = device_get_match_data(dev);
-	if (!desc)
-		return -ENODEV;
-
-	return sof_acpi_probe(pdev, device_get_match_data(dev));
+	desc = (const struct sof_dev_desc *)id->driver_data;
+	return sof_acpi_probe(pdev, desc);
 }
 
 /* acpi_driver definition */



-- 
Péter
