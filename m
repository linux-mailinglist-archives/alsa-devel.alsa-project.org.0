Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC45BE579
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 14:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72B0851;
	Tue, 20 Sep 2022 14:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72B0851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663676190;
	bh=QWUXa+Pm3tZjVIFDvd/3npgmfO0dcMFt/2HqkVH+4dM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3JbAcL3NSuYKw3VLMW+dIpVHjs5Q4rGVUV5QPN1o89/EYnrorXrPTEd2BL8cu/B6
	 +1cV9iRVU5ufkndXB7M9Ke0fXky2zbOka1F9JZIFUMNo7lWezPJPhw4cYQTKcXdfK8
	 7451/bg42HJLxUr8jw8JueT4Q2FPQMspYbGRoFgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 196AFF800C9;
	Tue, 20 Sep 2022 14:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A5FEF80155; Tue, 20 Sep 2022 14:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CFFBF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 14:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFFBF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IFJFLf3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663676129; x=1695212129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QWUXa+Pm3tZjVIFDvd/3npgmfO0dcMFt/2HqkVH+4dM=;
 b=IFJFLf3rNOQ3jXwFVCoPL3YqB3HEc/OLl5U79WTzTiucUh2m8BLzZsMV
 zk8zIzmCCdPrClvfGhXoMMDisrvoQkcrhysOQ9wB80TtNk+2Wjj4kUJiM
 RDp3OyBydCpPDfZpW9ss7ggiF9fiZaK07wXguQCI81+JxiCB2EAI8GQfP
 1JbW8j2g8UwFZ3kezLWcl+ZGgFSGHiuJ8hgk9gLuTaYzS1rNtHVn1/U0P
 JDxq0Gvy8+uObI1T8ZECdPrRO9lqc/uKSL3sq4Cvu++PM87EGdz9dxFF1
 T5o1x8oRroS1ZJCCkS0eKexl7jQp4RpQDsBR78mELQ14nf4AhnLHCYjKJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299666624"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="299666624"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 05:15:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="687389069"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO [10.251.209.87])
 ([10.251.209.87])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 05:15:22 -0700
Message-ID: <620391b0-322a-a7d0-4a7e-289d04e53e7c@linux.intel.com>
Date: Tue, 20 Sep 2022 14:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
 <20220919123617.44096-4-pierre-louis.bossart@linux.intel.com>
 <YymhvysghXeNQx8i@sirena.org.uk> <878rmegu4a.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <878rmegu4a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 9/20/22 13:31, Takashi Iwai wrote:
> On Tue, 20 Sep 2022 13:19:27 +0200,
> Mark Brown wrote:
>>
>> On Mon, Sep 19, 2022 at 02:36:16PM +0200, Pierre-Louis Bossart wrote:
>>> In preparation of the IPCv4 IPC support, this patch adds
>>> support for SkyLake and KabyLake boot and descriptors
>>> used when probing the PCI driver.
>>
>> This breaks an x86_64 allmodconfig build:
>>
>> In file included from /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:25:
>> /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c: In function ‘cl_dsp_init_skl’:
>> /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:372:56: error: ‘HDA_DSP_ROM_STS_MASK’ undeclared (first use in this function)
>>   372 |                                             ((status & HDA_DSP_ROM_STS_MASK)
>>       |                                                        ^~~~~~~~~~~~~~~~~~~~
> 
> It seems that it's defined in my tree, so maybe I need to apply those
> on mine.  Or you can merge the for-next branch of my tree as a
> preliminary work.  Let me know your preference.

Sorry about that, I am not sure what happened here, this constant has
been defined since 2019. Let me double-check.

184fdfca4ba63d (Keyon Jie             2019-07-22 09:13:51 -0500 254)
#define HDA_DSP_ROM_STS_MASK                       GENMASK(23, 0)


