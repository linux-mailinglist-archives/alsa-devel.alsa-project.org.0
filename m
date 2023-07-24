Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB875F567
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 13:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E74E210;
	Mon, 24 Jul 2023 13:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E74E210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690199244;
	bh=fhZel62+8xGqW7JvNVoWADK8SmdGZHFTifhbfTYCCcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mIpM5FJf0OmzfQ0rhTAbgsawWVcGuAdFmIRn4HGRXL4pdHE2N3cZAQOKvuhOq7Ul+
	 FeyoTf+p+ccCP9GT3ora2FC+pTTr2SCbr1d3G5m2L21OsdyuFZfHSPvSM74CKcI9y7
	 3shm78V8e6BJq8jv/sKdt6esDqhOQUSHAyIi4zGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 731CBF80520; Mon, 24 Jul 2023 13:46:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A36F802E8;
	Mon, 24 Jul 2023 13:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3461BF801F5; Mon, 24 Jul 2023 13:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E9CEF800C7;
	Mon, 24 Jul 2023 13:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9CEF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VbiSf4jt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690199173; x=1721735173;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fhZel62+8xGqW7JvNVoWADK8SmdGZHFTifhbfTYCCcI=;
  b=VbiSf4jtEX+T7GRKgWri7tL6atE1h/JFHyhAUmtCdAsyFYZ45POSnic0
   7OJ25ewLGtlLcZ/DTB9QNxCswujJamUH83Uy02drfVyPgI/joOxPms0tw
   /GOmvmy2MBa2CvHTXAHOE0DlhvPDEJg1OnuJyH6EHVHVacKmUE9KZZjQA
   KvgWXyIXALYojHjNZjVDcdWlLpKjG2yuQfdvO1N+0lHH/3NEZqKmYghpD
   CtJ8zRQO7xphITmZskpE5Nvz9DmKBzAtSIbDi5iBTBB891uWFtQhiPaqH
   4OQNmoO3qnkdv572pEsewXkv2PsddwuFwp/NxKCQkZJVAmP1aUh0IDZod
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398322161"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="398322161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760761948"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200";
   d="scan'208";a="760761948"
Received: from sosterlu-mobl.ger.corp.intel.com (HELO [10.249.37.56])
 ([10.249.37.56])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:46:03 -0700
Message-ID: <10216a8e-c29c-fc24-e4b5-240743fadd5e@linux.intel.com>
Date: Mon, 24 Jul 2023 12:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] ALSA: hda/intel: Fix error handling in azx_probe()
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-2-maarten.lankhorst@linux.intel.com>
 <98af3d56-0efe-8b35-246e-0fa28cf6966b@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <98af3d56-0efe-8b35-246e-0fa28cf6966b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TZUHYSRZFLSMVI6MOO5TXQYULK4I4AGJ
X-Message-ID-Hash: TZUHYSRZFLSMVI6MOO5TXQYULK4I4AGJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZUHYSRZFLSMVI6MOO5TXQYULK4I4AGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/21/23 13:34, Péter Ujfalusi wrote:
> 
> 
> On 19/07/2023 19:41, Maarten Lankhorst wrote:
>> Add missing pci_set_drv to NULL call on error.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  sound/pci/hda/hda_intel.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index ef831770ca7da..0d2d6bc6c75ef 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -2188,6 +2188,7 @@ static int azx_probe(struct pci_dev *pci,
>>  	return 0;
>>  
>>  out_free:
>> +	pci_set_drvdata(pci, NULL);
> The original patch added this:
> f4c482a4d0b3 ("ALSA: hda - Fix yet another race of vga_switcheroo registration")
> 
> but got removed later by:
> 20a24225d8f9 ("ALSA: PCI: Remove superfluous pci_set_drvdata(pci, NULL) at remove")
> 
> and partially added back (to azx_remove) by:
> e81478bbe7a1 ("ALSA: hda: fix general protection fault in azx_runtime_idle")
> 
> I guess, it should do not harm to add it back...
> 
>>  	snd_card_free(card);
>>  	return err;
>>  }
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

