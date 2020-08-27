Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450E253B8F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 03:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BB417DF;
	Thu, 27 Aug 2020 03:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BB417DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598492435;
	bh=XqXMyEgQsChQ8F20E+T/ztUS80Xb8FHUw/8297QYeco=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhR0kQLviUrcR2fRjCM4ETSLU4FDJRTZU8aeFe4sX5LYi5Dtp/LfM8i2CAjlSnpGt
	 /sRTpVV7qfUh7MdbWV98BtjvShGJQc++J/b1zFi7EfP8ktpN6e4Zf9r4OwUouixlCB
	 /cJj9KQtdgcjKy1iCTcoB5H5o12ttWiq42s8SVr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7E9F801F2;
	Thu, 27 Aug 2020 03:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2DDBF801F2; Thu, 27 Aug 2020 03:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 76AE4F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 03:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76AE4F800EB
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec5f470e8b176-60d10;
 Thu, 27 Aug 2020 09:38:20 +0800 (CST)
X-RM-TRANSID: 2eec5f470e8b176-60d10
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.21.77] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55f470e8be69-26624;
 Thu, 27 Aug 2020 09:38:20 +0800 (CST)
X-RM-TRANSID: 2ee55f470e8be69-26624
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unnecessary check infsl_spdif_probe()
To: Mark Brown <broonie@kernel.org>
References: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
 <20200826165308.GJ4965@sirena.org.uk>
From: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <f2196e55-6458-4f55-96ac-bd18ecb461d1@cmss.chinamobile.com>
Date: Thu, 27 Aug 2020 09:37:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200826165308.GJ4965@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
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

Hi Mark

在 2020/8/27 0:53, Mark Brown 写道:
> On Wed, Aug 26, 2020 at 11:09:18PM +0800, Tang Bin wrote:
>> The function fsl_spdif_probe() is only called with an openfirmware
>> platform device. Therefore there is no need to check that the passed
>> in device is NULL.
> Why is this an issue - the check will make things more robust if someone
> manages to load the driver on a non-DT system and otherwise costs us a
> couple of instructions?
Thanks for your reply.

In this function,  function fsl_spdif_probe() can be triggered only if 
the platform_device and platform_driver matches,

so I think the judgement at the beginning is redundant.

Thanks

Tang Bin



