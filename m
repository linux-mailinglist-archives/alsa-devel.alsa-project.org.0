Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E339B3E1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 09:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209361716;
	Fri,  4 Jun 2021 09:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209361716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622791805;
	bh=AHZkVo0A1wp+HJGMRGTYAfreTZXqD0HuzwFTS1KbngM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWUKQDJcadPsxP6em0ZWoicQ7ZM707CQDN8S6JWQ5VtmpfXVAIsCA5LH6VVuwjtfN
	 dX8i0XZQeLVa+cqILZiZHoz2rDZt8Kh2fAsf1NWEliksYd5QfkxRo9LJHtQwZdSfvg
	 eL4ALv7fFedd5BabTWS4isvmQmLNa141OCtqXp7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96037F8016D;
	Fri,  4 Jun 2021 09:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7166BF802C4; Fri,  4 Jun 2021 09:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.148.104])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FB6F8016D
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 09:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FB6F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="ifpshzET"
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 7F31FFD085
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 02:28:15 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id p4FblI1P1nrr4p4Fbl6A5f; Fri, 04 Jun 2021 02:28:15 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aQ/n0tyE7dMetP5aE/5p8GF8KyW8q+XkKwtHdmpiX0Q=; b=ifpshzETtcBhc+8FEzm3P3Nu5J
 N9VdujNRGiArU31Glgfa8L+L3f0kRfvjSXZXLm7T5CbOpTjvQ4S5iiZDPZHPEhEEI+zugoi3/fs8s
 bdPWDgl9khdWDu+do/1zgTDFJScMEnu/gTxCcviAHTi1kZuQ4bXChJttUAk+jyfhWjPQopwgvkbX5
 XSNGfsapr4+kUS9kH05a6f86W/DXFaF1B/iK67/qmDHjpU4bHjSO7u2tvwUfnOz7rB55rIuJTZ8p+
 xcf5omWp5VlbOmpXVaHAdjZL3wqJVh1x4xDvUyxHtbPIujmNxbc4sSInS3/Uzp3+vfsmNiMI20TeB
 iKshgkwQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:35128
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lp4FX-000WMr-G5; Fri, 04 Jun 2021 02:28:11 -0500
Subject: Re: [PATCH][next] ASoC: ti: davinci-mcasp: Fix fall-through warning
 for Clang
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210528202047.GA39602@embeddedor>
 <25941c37-6e38-88ae-3afe-4f5af44380d3@gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <94eadd21-a64f-9b83-595b-1401d7ec2194@embeddedor.com>
Date: Fri, 4 Jun 2021 02:29:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <25941c37-6e38-88ae-3afe-4f5af44380d3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lp4FX-000WMr-G5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:35128
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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



On 6/4/21 02:14, Péter Ujfalusi wrote:
> 
> 
> On 28/05/2021 23:20, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>> by explicitly adding a goto statement instead of letting the code fall
>> through to the next case.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>> JFYI: We had thousands of these sorts of warnings and now we are down
>>       to just 25 in linux-next. This is one of those last remaining
>>       warnings.
>>
>>  sound/soc/ti/davinci-mcasp.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
>> index b94220306d1a..587967720135 100644
>> --- a/sound/soc/ti/davinci-mcasp.c
>> +++ b/sound/soc/ti/davinci-mcasp.c
>> @@ -2317,6 +2317,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>>  		break;
>>  	default:
>>  		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
>> +		goto err;
> 
> Would:
> 	fallthrough;
> 
> be enough to silence the warning? If so, then I would prefer this version.

Yep.:) Done:

	https://lore.kernel.org/linux-hardening/20210604072714.GA244640@embeddedor/

Thanks
--
Gustavo
