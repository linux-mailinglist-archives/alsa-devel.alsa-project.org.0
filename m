Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B83346EB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 19:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA2916DB;
	Wed, 10 Mar 2021 19:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA2916DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615401533;
	bh=ieUwIRpN4C3NOVNcAmR/MCMn4H/q4m7sBfCA7escc8U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aaAs1Igm72gZRoH4gg+PnPiiE6YV/UkFc0V5uYzAcuXBRkd/rYsya20D+alq4EbBo
	 L8isq8qoDBdb3uuV/eT8ps4w6cVIa7Pf4jS9BbNkXWGpWkSIyK/ShMjLiQWX1RJCca
	 57zKEB1s+ne/xccM6BYf1YcieLX6q52DedsEkIzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2016FF801ED;
	Wed, 10 Mar 2021 19:37:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A73F801D8; Wed, 10 Mar 2021 19:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2F29F8014E
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 19:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F29F8014E
IronPort-SDR: ltARed8bDIXXPRGHViDZwWVZjCzP4tWK61mBLnLH82b+5COK+1dcBYdmPUlt84iqFaHoBn8bNH
 X99A235CCgdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="187899352"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="187899352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 10:37:13 -0800
IronPort-SDR: 5o943c0kgvAX14ZxTFPwFhrVTX6enozmWA1CgGJ9MKwP5hy7hKsjslEcTQ81XP0hH3/H2ZwmeD
 kNVtaLeIv6wA==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="447996950"
Received: from jsglenn-mobl1.amr.corp.intel.com (HELO [10.251.2.203])
 ([10.251.2.203])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 10:37:11 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To: Mark Brown <broonie@kernel.org>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk> <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
 <20210310181611.GE28564@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
Date: Wed, 10 Mar 2021 12:37:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310181611.GE28564@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


>>> Build time dependencies aren't going to help anything, arm64 (and to my
>>> understanding some future x86 systems, LynxPoint IIRC) supports both DT
>>> and ACPI and so you have kernels built with support for both.
> 
>> well, that's what I suggested initially:
>>         if (is_of_node(card->dev->fwnode))
> 
>> I used the of_node test as a proxy for 'no DMI' since I am not aware of any
>> means to detect if DMI is enabled at run-time.
> 
> Can we not fix the DMI code so it lets us check dmi_available either
> directly or with an accessor?  I don't understand why all the proposals
> are dancing around local bodges here.

something like this then (compile-tested only)?

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index d51ca0428bb8..f191a1f901ac 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
  static const char *dmi_ident[DMI_STRING_MAX];
  static LIST_HEAD(dmi_devices);
  int dmi_available;
+EXPORT_SYMBOL_GPL(dmi_available);

  /*
   *     Save a DMI string
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16ba54eb8164..c7e4600b2dd4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card 
*card, const char *flavour)
         if (card->long_name)
                 return 0; /* long name already set by driver or from DMI */

-       if (!is_acpi_device_node(card->dev->fwnode))
+       if (!dmi_available)
                 return 0;

         /* make up dmi long name as: vendor-product-version-board */



