Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB7381C1E
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 04:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BC116B8;
	Sun, 16 May 2021 04:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BC116B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621132851;
	bh=oW3Bh9pz4OiL4272cz7lJLLoR72SvTgSQUNaiyH0K8k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKvWyvBMuPYak8GJNIY7JVASCZ1xkpg4OdnQYVgg98nA/2S279a715Znu96F+gZj2
	 SUnE5+h/SYZ7sU/DZuCvsKrXfxfl0KGjB1y0Xfkquoe+IdblrIRXJ1S96f4beJjc0r
	 98WCGVdFhV+KB3VCNGpoxuiSvxeGQLWBzCm8I5Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23E31F8012C;
	Sun, 16 May 2021 04:39:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA41F80217; Sun, 16 May 2021 04:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95419F8012C
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 04:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95419F8012C
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FjRFl0ljszNxFf;
 Sun, 16 May 2021 10:35:39 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 10:39:05 +0800
Received: from [10.174.179.215] (10.174.179.215) by
 dggema769-chm.china.huawei.com (10.1.198.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sun, 16 May 2021 10:39:05 +0800
Subject: Re: [PATCH -next] ASoC: soc-core: use DEVICE_ATTR_RO macro
To: Mark Brown <broonie@kernel.org>
References: <20210514081100.16196-1-yuehaibing@huawei.com>
 <20210514122442.GA6516@sirena.org.uk>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <bc0f78b7-6ced-dfbc-d3c4-e6675dc4957e@huawei.com>
Date: Sun, 16 May 2021 10:39:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210514122442.GA6516@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com
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

On 2021/5/14 20:24, Mark Brown wrote:
> On Fri, May 14, 2021 at 04:11:00PM +0800, YueHaibing wrote:
> 
>> -static ssize_t pmdown_time_set(struct device *dev,
>> -			       struct device_attribute *attr,
>> -			       const char *buf, size_t count)
>> +static ssize_t pmdown_time_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t count)
> 
> This unrelated formatting change should be in a separate patch.

This change pmdown_time_set() to pmdown_time_store(), which trigger
checkpatch warning.

> 
