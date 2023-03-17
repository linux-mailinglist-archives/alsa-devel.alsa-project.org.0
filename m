Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8E6BE735
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 11:46:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D446F9B;
	Fri, 17 Mar 2023 11:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D446F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679050006;
	bh=ra2hHUtg/cweOH8Inub7601QpMUjDC+HkQHZrUQ7x84=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=jHU9ZMOEz0SVUX7czElTAPYZXzz0iJiixMDSyw4koyHcoW4Vuof94KIIqbZeCBdyc
	 zUqVCCue/65QCmbZW0H6LQq1fT4RR9Uj9ot67gluCxEuMi7y+e0Eq8GmAsCJ4vcpi8
	 9r1bmtfpUxBcILOCD3KgzCAKDFqnIJVQ5mMgRA3U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16253F80093;
	Fri, 17 Mar 2023 11:45:55 +0100 (CET)
Date: Fri, 17 Mar 2023 10:45:42 +0000
Subject: Re: [PATCH v2 8/8] ASoC: cs35l56: Add driver for Cirrus Logic CS35L56
To: kernel test robot <lkp@intel.com>,
        Richard Fitzgerald via Alsa-devel
	<alsa-devel@alsa-project.org>,
        <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
References: <167872265923.26.336497278776737619@mailman-core.alsa-project.org>
 <202303170422.ZYpOtc4P-lkp@intel.com>
 <2f983fe6-8c43-be16-758b-098ea461836b@opensource.cirrus.com>
In-Reply-To: <2f983fe6-8c43-be16-758b-098ea461836b@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAZPOOQ5FI5Q5CBCO5W52CQWZEUWML3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167904995359.26.15880055864006167551@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 Simon Trimmer <simont@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BEEF80423; Fri, 17 Mar 2023 11:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5DE5F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 11:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5DE5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=i1IWqaIH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32HABu1c032534;
	Fri, 17 Mar 2023 05:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=JhmEC93g+SxlROvIkYC7tyHstq9M2CgefcOULYathYE=;
 b=i1IWqaIHUhbr7mManT/cOWX/6ohQC9aFxy4tp7CZdivbzuPzdMXbXAMWg6J4PcDoYjpK
 rUz+bgP0FS0koY6Vaq0pSgYUfLeS8lVL+ePDH9LYS3nGNZX2KTigOZLP3ZKSZtD/tnB1
 j06CQ3XI6W6+Ej4iVRCHrv91vhXW95X6gMmsPAP0jrPfatVXlfi6ALKGco5slsB04Oe9
 UTy3swRRyU44orn01pJIrLBtLQ/QGGRJG8uhvlnVn/hL6ErU5DtSBTSQEYPIFxvmkWz4
 qiz9gRZp9HVctoeMw3f8mQRvbaF5VQo/zDQboWwR7IRUyBUtYZD0lgtXrPxjdCMcjkmW +A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pbs3b9x06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 05:45:45 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 17 Mar
 2023 05:45:43 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 05:45:43 -0500
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DC8A411D3;
	Fri, 17 Mar 2023 10:45:42 +0000 (UTC)
Message-ID: <27d797fb-c68b-ebc0-7d87-39c6287415e8@opensource.cirrus.com>
Date: Fri, 17 Mar 2023 10:45:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 8/8] ASoC: cs35l56: Add driver for Cirrus Logic CS35L56
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>,
        Richard Fitzgerald via Alsa-devel
	<alsa-devel@alsa-project.org>,
        <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
References: <167872265923.26.336497278776737619@mailman-core.alsa-project.org>
 <202303170422.ZYpOtc4P-lkp@intel.com>
 <2f983fe6-8c43-be16-758b-098ea461836b@opensource.cirrus.com>
In-Reply-To: <2f983fe6-8c43-be16-758b-098ea461836b@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eFWrPVLIvg54Zq8KlnYfb8DSZi5XORmD
X-Proofpoint-ORIG-GUID: eFWrPVLIvg54Zq8KlnYfb8DSZi5XORmD
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VAZPOOQ5FI5Q5CBCO5W52CQWZEUWML3Z
X-Message-ID-Hash: VAZPOOQ5FI5Q5CBCO5W52CQWZEUWML3Z
X-MailFrom: prvs=8440ce0520=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 Simon Trimmer <simont@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAZPOOQ5FI5Q5CBCO5W52CQWZEUWML3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/03/2023 10:40, Richard Fitzgerald wrote:
> On 16/03/2023 20:15, kernel test robot wrote:
>> Hi Richard,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on broonie-sound/for-next]
>> [also build test ERROR on linus/master v6.3-rc2 next-20230316]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    
>> https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald-via-Alsa-devel/ASoC-wm_adsp-Use-no_core_startstop-to-prevent-creating-preload-control/20230313-235605
>> base:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 
>> for-next
>> patch link:    
>> https://lore.kernel.org/r/167872265923.26.336497278776737619%40mailman-core.alsa-project.org
>> patch subject: [PATCH v2 8/8] ASoC: cs35l56: Add driver for Cirrus 
>> Logic CS35L56
>> config: s390-randconfig-r044-20230313 
>> (https://download.01.org/0day-ci/archive/20230317/202303170422.ZYpOtc4P-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 
>> 67409911353323ca5edf2049ef0df54132fa1ca7)
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install s390 cross compiling tool for clang build
>>          # apt-get install binutils-s390x-linux-gnu
>>          # 
>> https://github.com/intel-lab-lkp/linux/commit/5856c94d659f9c9963f5c37762cf201e1f1765e9
>>          git remote add linux-review 
>> https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review 
>> Richard-Fitzgerald-via-Alsa-devel/ASoC-wm_adsp-Use-no_core_startstop-to-prevent-creating-preload-control/20230313-235605
>>          git checkout 5856c94d659f9c9963f5c37762cf201e1f1765e9
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 
>> W=1 O=build_dir ARCH=s390 olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 
>> W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: 
>> https://lore.kernel.org/oe-kbuild-all/202303170422.ZYpOtc4P-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     s390x-linux-ld: sound/soc/codecs/cs35l56.o: in function 
>> `cs35l56_dsp_work':
>>>> sound/soc/codecs/cs35l56.c:887: undefined reference to 
>>>> `sdw_write_no_pm'
>>>> s390x-linux-ld: sound/soc/codecs/cs35l56.c:888: undefined reference 
>>>> to `sdw_read_no_pm'
>>>> s390x-linux-ld: sound/soc/codecs/cs35l56.c:889: undefined reference 
>>>> to `sdw_write_no_pm'
>>     s390x-linux-ld: sound/soc/codecs/cs35l56.c:953: undefined 
>> reference to `sdw_write_no_pm'
>>     s390x-linux-ld: sound/soc/codecs/cs35l56.o: in function 
>> `cs35l56_sdw_dai_hw_params':
>>>> sound/soc/codecs/cs35l56.c:710: undefined reference to 
>>>> `sdw_stream_add_slave'
>>     s390x-linux-ld: sound/soc/codecs/cs35l56.o: in function 
>> `cs35l56_sdw_dai_hw_free':
>>>> sound/soc/codecs/cs35l56.c:729: undefined reference to 
>>>> `sdw_stream_remove_slave'
>>
> 
> I don't understand what's happened here.
> include/linux/soundwire/sdw.h provides inline dummy versions of these
> functions if !IS_ENABLED(CONFIG_SOUNDWIRE) so how can they be
> undefined reference?

Oh, I see it now.
CONFIG_SOUNDWIRE=m but CONFIG_SND_SOC_CS35L56=y so it can't link.
