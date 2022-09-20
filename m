Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D75BE5C0
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 14:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39232826;
	Tue, 20 Sep 2022 14:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39232826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663676889;
	bh=Ff6S5kIzqDlSQFEZ5spBnfyD2CpFkXyiU2WgpvuuQ9E=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pg1PPdlNPEEtq6P2/Pxrs04GoDaNw3mWR+Gvn36ieJrJU8rv/BeOm67SbTrseJupw
	 ekrXf7Ol6kUM0a4oTLpYDXg+ipnyEJJWkJuLAdNsrxNTAuisBr1IIl943IdYnbT5dh
	 Pc3oR95NELIRhFPmVojdOiV233WPvcVCikUjeAGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D938F800C9;
	Tue, 20 Sep 2022 14:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB36F80155; Tue, 20 Sep 2022 14:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8465F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 14:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8465F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VvN7weQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663676828; x=1695212828;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Ff6S5kIzqDlSQFEZ5spBnfyD2CpFkXyiU2WgpvuuQ9E=;
 b=VvN7weQ9oAuqumX2hz+01OwUad4/0fXT8myf49JBR2EKZZ8U4ee4Itr6
 /2+xVs6a7xLp2Si7ePfQ7Oc58tkSKkTCbp/KvavKRvDs/1vAFE2fpMS+E
 vZNQodHdjYlRaYn5aGVNZkCIdjjKGZXMca+QCSbtwX2WJZvFJCVQrFgtO
 Jhll/7EiLsEC3UURne9e9cIEwu92dIUj4clq+wEMNyq2abG8pyiwJZbaH
 ijuW/DLKagriP0qNKJLxm2K+0zMDDd9kLNDVbdmNvyGfnKzegldo+VE2F
 d24IpNEcb/bYRzvoOOBLbl1TzJ0lsyKfgkOXblRp/2G7Qui6x27XBl+4Y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="297272742"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="297272742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 05:27:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="570062351"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO [10.251.209.87])
 ([10.251.209.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 05:27:01 -0700
Message-ID: <81f17736-eca3-4b80-3958-6f3215396af6@linux.intel.com>
Date: Tue, 20 Sep 2022 14:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
 <20220919123617.44096-4-pierre-louis.bossart@linux.intel.com>
 <YymhvysghXeNQx8i@sirena.org.uk> <878rmegu4a.wl-tiwai@suse.de>
 <620391b0-322a-a7d0-4a7e-289d04e53e7c@linux.intel.com>
In-Reply-To: <620391b0-322a-a7d0-4a7e-289d04e53e7c@linux.intel.com>
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



On 9/20/22 14:15, Pierre-Louis Bossart wrote:
> 
> 
> On 9/20/22 13:31, Takashi Iwai wrote:
>> On Tue, 20 Sep 2022 13:19:27 +0200,
>> Mark Brown wrote:
>>>
>>> On Mon, Sep 19, 2022 at 02:36:16PM +0200, Pierre-Louis Bossart wrote:
>>>> In preparation of the IPCv4 IPC support, this patch adds
>>>> support for SkyLake and KabyLake boot and descriptors
>>>> used when probing the PCI driver.
>>>
>>> This breaks an x86_64 allmodconfig build:
>>>
>>> In file included from /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:25:
>>> /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c: In function ‘cl_dsp_init_skl’:
>>> /build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:372:56: error: ‘HDA_DSP_ROM_STS_MASK’ undeclared (first use in this function)
>>>   372 |                                             ((status & HDA_DSP_ROM_STS_MASK)
>>>       |                                                        ^~~~~~~~~~~~~~~~~~~~
>>
>> It seems that it's defined in my tree, so maybe I need to apply those
>> on mine.  Or you can merge the for-next branch of my tree as a
>> preliminary work.  Let me know your preference.
> 
> Sorry about that, I am not sure what happened here, this constant has
> been defined since 2019. Let me double-check.
> 
> 184fdfca4ba63d (Keyon Jie             2019-07-22 09:13:51 -0500 254)
> #define HDA_DSP_ROM_STS_MASK                       GENMASK(23, 0)

My bad, this definition was removed in "ASoC: SOF: Intel: hda: Drop no
longer used ROM state definitions", and I mistakenly didn't squash the
patch from Peter that dealt with this change for SKL.

Will send a v2, sorry for the noise.

