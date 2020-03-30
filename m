Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CD197E3F
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 16:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5AE1616;
	Mon, 30 Mar 2020 16:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5AE1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585578091;
	bh=vEyItXIHuKRVMMPS3+lsOya/avsl/SpRiXN0ujJhlA4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JI4nYTpNdHAUdpi1V25zJ4gtHFkXzZI79RWVoIhrlM44any9hX9YIE8T4FayTlj7F
	 78QnoxmUGxgOSGVlw/b5o4Dc5M/5Sn2f7awn+X5V3l4ZMpjnRYMAOxfSpM2j2iRn7Z
	 8KzMqcEC9DZGEO/PdULEr11Jyud7eUgkld5DMUtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3021F8014A;
	Mon, 30 Mar 2020 16:19:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E1CF80148; Mon, 30 Mar 2020 16:19:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32ED8F800AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 16:19:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BCADFA003F;
 Mon, 30 Mar 2020 16:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BCADFA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585577982; bh=WswNLs19cZ4tz06JZuSEo+yxmDz2F8piEHQTp3LcXg8=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=D0mMgEPFK+Ipn+aYek6bqA/cGwQ4c4e6Wl6rpN9fbbHp0g8Bg25cnJdd9sxEA2GMM
 jInu5DU1S/u488ZvdCDHaxIzZ4tuE67SmLVbFfnJbf0PhYrnJI4+G9nbcLcKH7fzeW
 RznVXkmnqtlDvh5aKKQOEot4DmAWG4y3PuhZBx/Y=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 30 Mar 2020 16:19:40 +0200 (CEST)
Subject: Re: [PATCH 0/4] ucm2: Add support to SDM845 based platforms
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
 <41e83744-5164-7cbb-98e6-fb8504c6b44e@linaro.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8732f355-adff-3a28-34b3-a85a027f297e@perex.cz>
Date: Mon, 30 Mar 2020 16:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <41e83744-5164-7cbb-98e6-fb8504c6b44e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 30. 03. 20 v 16:10 Srinivas Kandagatla napsal(a):
> Hi Jaroslav,
> 
> On 05/03/2020 13:44, Srinivas Kandagatla wrote:
>> This patchset adds UCM support for WSA881x, WCD934x codec and two platforms,
>> DB845c DragonBoard and Lenovo YOGA C360 Laptop that use these codecs.
>>
>> Tested on Ubuntu 20.04 with pulseaudio 13 along with
>> with this fix
>>    https://github.com/pulseaudio/pulseaudio/commit/cabd387e26b5fe03661f4b894826c7c6b58d7efa
>>
> 
> Are you okay to pick these ucm2 patches?

Hi,

   it seems that those changes does not pass through the ucm validator 
(https://github.com/alsa-project/alsa-tests - python/ucm-validator directory).

   I have also some comments, but I would probably prefer to create a pull 
request on github to do the review for all files with history.

				Thank you,
					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
