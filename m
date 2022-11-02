Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC161570E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 02:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8F0168E;
	Wed,  2 Nov 2022 02:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8F0168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667353170;
	bh=bCjre6QfFLyMAYYNROhX88LB5C4z93AB2yXH5fCcDzw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=orHLQwN2Deca2fRZqEK8JBLrddUqa5akuy4MBhCGqjU82CnG5x/m+mKiRdSn2HQ+A
	 RTw92bqPJ9oMIZgMdm91lugKaRnRewi4Ho3K+aV8phg9Yum1tnlrxVDVHAO4kgtbfU
	 6+EnbIvWQqf4XaumiQ9WHiAXTx1ls/73JAKPJQxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B89F804AB;
	Wed,  2 Nov 2022 02:38:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C410BF80423; Wed,  2 Nov 2022 02:38:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 293DAF80249
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 02:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 293DAF80249
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N28Zf5DHRzpW4T;
 Wed,  2 Nov 2022 09:34:50 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 09:38:23 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 09:38:23 +0800
Subject: Re: [PATCH] ASOC: SOF: Intel: hda-codec: fix possible memory leak in
 hda_codec_device_init()
To: Mark Brown <broonie@kernel.org>
References: <20221020034752.2392283-1-yangyingliang@huawei.com>
 <Y2Flon6lR10x/rys@sirena.org.uk>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <76d12b17-358a-4a72-d612-5ed36029e98c@huawei.com>
Date: Wed, 2 Nov 2022 09:38:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y2Flon6lR10x/rys@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

Hi,
On 2022/11/2 2:29, Mark Brown wrote:
> On Thu, Oct 20, 2022 at 11:47:52AM +0800, Yang Yingliang wrote:
>> If snd_hdac_device_register() fails, 'codec' is leaked, free it in 
>> snd_hdac_device_exit(). And device_initialize() is called in 
>> snd_hdac_device_init(), it should call put_device() to give up 
>> reference or the name allocated in dev_set_name() is leaked. The 
>> snd_hdac_device_exit() will be called in dev->release(). 
> This doesn't apply against current code, please check and resend.
This is v1, the v2 has already been merged.
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-6.1&id=e9441675edc1bb8dbfadacf68aafacca60d65a25

Thanks,
Yang
