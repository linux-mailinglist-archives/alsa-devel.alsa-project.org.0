Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188B2111A2
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 19:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7381677;
	Wed,  1 Jul 2020 19:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7381677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593623427;
	bh=bP9049Z6/9bcFU7S3r5wfSg0pBZvN+OVo7eo+W7r7hk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afisV3R1zZenSRtNSo3Rqpd90CV5NeWpe2dEJAKL+JvjLESLNJYySxRxydqWbKGqi
	 BUo0zNYJJE3YMZF5EJwqt9sThn4chewk54tqcsHZEQUXBrV2m0r9benDQ9fa29BJOK
	 Wu30vjMK2Lv88V1cP1WWkqU66RGfAAWDBwR/ioKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E159CF801D8;
	Wed,  1 Jul 2020 19:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F77BF80217; Wed,  1 Jul 2020 19:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D77F801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 19:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D77F801D8
IronPort-SDR: hH0D8JP1lqX7KoWeDaCVo+oDBB6aS6gI6KrnWHsCAYdaxWp/zx+doP2G2qEcYV8SAHn/HvvVbG
 Thw8KttBNwBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="126269048"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="126269048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 10:08:37 -0700
IronPort-SDR: 6wybi9hH49QPCCLsWxLNU/QX6Uzd2lnSFMF9cURUo4Om71v0j5LHNiV2006sqes0brv484Vk1x
 f7t1a1EznfsA==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455174866"
Received: from dsapozni-mobl1.amr.corp.intel.com (HELO [10.251.16.243])
 ([10.251.16.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 10:08:35 -0700
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: "N, Harshapriya" <harshapriya.n@intel.com>,
 =?UTF-8?Q?=c5=81ukasz_Majczak?= <lma@semihalf.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
 <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <7e38bb2e-2132-d305-e94d-043fa53bd836@linux.intel.com>
 <BY5PR11MB4307BBBCAA78A0506BBC5F74FD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b2236769-6957-dc41-21b2-aca238994b4b@linux.intel.com>
Date: Wed, 1 Jul 2020 12:08:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB4307BBBCAA78A0506BBC5F74FD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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


>>> Tested and the following is something we can use without creating a new
>> dailink.
>>>          	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>> 	if (!strcmp(codec_dai->name, KBL_REALTEK_DMIC_CODEC_DAI)) {
>>> 		if (params_channels(params) == 2 ||
>> DMIC_CH(dmic_constraints) == 2)
>>> 			channels->min = channels->max = 2;
>>> 		else
>>> 			channels->min = channels->max = 4;
>>> 	} else {
>>> 		rate->min = rate->max = 48000;
>>> 		channels->min = channels->max = 2;
>>> 		snd_mask_none(fmt);
>>> 		snd_mask_set_format(fmt, pcm_fmt);
>>> 	}
>>>
>>> Pierre, thoughts?
>>
>> thanks Harsha, that looks like what I had in mind, but my earlier question was
>> why we deal with the rates and formats only in the last case?
> The speaker codec supported only 16 bit.  (Vendor mentioned)
> For playback on this platform, only 48Khz was used.

ok then, as long as Harsha and Lukasz are aligned I'm fine. Thanks!

