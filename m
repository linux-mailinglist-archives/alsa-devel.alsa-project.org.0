Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC15329FA2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 13:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7248916F2;
	Tue,  2 Mar 2021 13:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7248916F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614689844;
	bh=WSQ5OmpDjnBfZSFw+1rouxFXlsQZWQTrgpfTp3JMPt0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/WBKnFXsLJHnKRMDQxHRU5FguYtrNm7iJ5RPHa9Kk2+Lg01TmVGQk6aTdg5Q6bMp
	 m48bIZBCIqoj0Jf7PZ5V3HNdsIdOVwST/KqTV5Gxt08HbazsU57rPg8GMFEB1ekmGu
	 y6Oynz42lK4PUubZyDNN9aOW4WiAr8R4DnrWhbq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5279F8025B;
	Tue,  2 Mar 2021 13:55:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34C6AF80269; Tue,  2 Mar 2021 13:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by alsa1.perex.cz (Postfix) with ESMTP id EA666F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 13:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA666F80227
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7603e35c7067-935b6;
 Tue, 02 Mar 2021 20:55:37 +0800 (CST)
X-RM-TRANSID: 2ee7603e35c7067-935b6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.21.77] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9603e35c7299-1c3fb;
 Tue, 02 Mar 2021 20:55:37 +0800 (CST)
X-RM-TRANSID: 2ee9603e35c7299-1c3fb
Subject: Re: [PATCH] ASoC: codec: Omit superfluous error message
 injz4760_codec_probe()
To: Paul Cercueil <paul@crapouillou.net>
References: <20210302121148.28328-1-tangbin@cmss.chinamobile.com>
 <K2DCPQ.25EEALUNZ4K3@crapouillou.net>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <76c87931-094e-0804-9405-ad4841fae2d3@cmss.chinamobile.com>
Date: Tue, 2 Mar 2021 20:55:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <K2DCPQ.25EEALUNZ4K3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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

Hi Paul:

On 2021/3/2 20:23, Paul Cercueil wrote:
> Hi Tang,
>
> Le mar. 2 mars 2021 à 20:11, Tang Bin <tangbin@cmss.chinamobile.com> a 
> écrit :
>> The function devm_platform_ioremap_resource has already contained error
>> message, so remove the redundant dev_err here.
>>
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> ---
>>  sound/soc/codecs/jz4760.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
>> index e8f28ccc145a..c2d8a107f159 100644
>> --- a/sound/soc/codecs/jz4760.c
>> +++ b/sound/soc/codecs/jz4760.c
>> @@ -843,7 +843,6 @@ static int jz4760_codec_probe(struct 
>> platform_device *pdev)
>>      codec->base = devm_platform_ioremap_resource(pdev, 0);
>>      if (IS_ERR(codec->base)) {
>>          ret = PTR_ERR(codec->base);
>> -        dev_err(dev, "Failed to ioremap mmio memory: %d\n", ret);
>>          return ret;
>>      }
>
> Indeed, you are right.
>
> I guess you do this instead:
>
> if (IS_ERR(codec->base))
>    return PTR_ERR(codec->base);

Yes, I would have written it in your ways, but considered the variable 
"ret", I gave up, and just deleted dev_err().


Thanks

Tang Bin





