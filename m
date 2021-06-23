Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953D3B2249
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 23:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB81165D;
	Wed, 23 Jun 2021 23:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB81165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624482924;
	bh=7XvJIFpnQKdLxgbnMGNr7Ej2ama0m/2bvhgFYhOU29s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnSOD/xlJjziBsVS+vmxiHVm7el2f0KGMtFE+zZylleTx/IBJOWuTRMfvY0p/aysi
	 akPVzuOsGiaafsppAdSskbwT1IBI8CDZtCfeGyZ7wAnYbHvmSVpJ1Z/zUm79M97h5H
	 wfv0yaHjJnsDV+OcZvfIcxdP2tJmcp27uZ7vqca4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD08F801D5;
	Wed, 23 Jun 2021 23:13:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF1EEF8016D; Wed, 23 Jun 2021 23:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
 [80.12.242.133])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C225F80137
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 23:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C225F80137
Received: from [192.168.1.18] ([86.243.172.93]) by mwinf5d90 with ME
 id LlDn2500Q21Fzsu03lDnbG; Wed, 23 Jun 2021 23:13:49 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 23 Jun 2021 23:13:49 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] ASoC: da7219: Fix an out-of-bound read in an error
 handling path
To: Dan Carpenter <dan.carpenter@oracle.com>
Newsgroups: gmane.linux.alsa.devel, gmane.linux.kernel,
 gmane.linux.kernel.janitors
References: <4fdde55198294a07f04933f7cef937fcb654c901.1624425670.git.christophe.jaillet@wanadoo.fr>
 <20210623094655.GB2116@kadam>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <8e0d461a-c633-0162-b9e6-c2166bc013fe@wanadoo.fr>
Date: Wed, 23 Jun 2021 23:13:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623094655.GB2116@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, support.opensource@diasemi.com,
 lgirdwood@gmail.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
 Adam.Thomson.Opensource@diasemi.com
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

Le 23/06/2021 à 11:46, Dan Carpenter a écrit :
> On Wed, Jun 23, 2021 at 07:22:45AM +0200, Christophe JAILLET wrote:
>> If 'of_clk_add_hw_provider()' fails, the previous 'for' loop will have
>> run completely and 'i' is know to be 'DA7219_DAI_NUM_CLKS'.
>>
>> In such a case, there will be an out-of-bounds access when using
>> 'da7219->dai_clks_lookup[i]' and '&da7219->dai_clks_hw[i]'.
>>
>> To avoid that, add a new label, 'err_free_all', which set the expected
>> value of 'i' in such a case.
>>
>> Fixes: 78013a1cf297 ("ASoC: da7219: Fix clock handling around codec level probe")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   sound/soc/codecs/da7219.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
>> index 13009d08b09a..1e8b491d1fd3 100644
>> --- a/sound/soc/codecs/da7219.c
>> +++ b/sound/soc/codecs/da7219.c
>> @@ -2204,12 +2204,14 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
>>   					     da7219->clk_hw_data);
>>   		if (ret) {
>>   			dev_err(dev, "Failed to register clock provider\n");
>> -			goto err;
>> +			goto err_free_all;
>>   		}
>>   	}
>>   
>>   	return 0;
>>   
>> +err_free_all:
>> +	i = DA7219_DAI_NUM_CLKS - 1;
>>   err:
>>   	do {
>>   		if (da7219->dai_clks_lookup[i])
> 
> This do while statement is wrong and it leads to potentially calling
> clk_hw_unregister() on clks that haven't been registered.

Obviously right.

Thanks for the review Dan.
I'll send a v2 in the coming days.

CJ
> 
> I think that calling clk_hw_unregister() on unregistered clocks is
> supposed to okay but I found a case where it leads to a WARN_ON()
> (Nothing else harmful).  It's in __clk_register() if the alloc_clk()
> fails:
> 
> 	hw->clk = alloc_clk(core, NULL, NULL);
>          if (IS_ERR(hw->clk)) {
>                  ret = PTR_ERR(hw->clk);
>                  goto fail_create_clk;  // <- forgot to set hw->clk = NULL
>          }
> 
> The better way to handle errors from loops is to clean up partial
> iterations before doing the goto.  So add a clk_hw_unregister() if the
> dai_clk_lookup = clkdev_hw_create() assignment fails.  Then use a
> while (--i >= 0) loop in the unwind section:
> 
> err_free_all:
> 	i = DA7219_DAI_NUM_CLKS;
> err:
> 	while (--i >= 0) {
> 
> regards,
> dan carpenter
> 
> 

