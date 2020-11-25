Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 550652C46D9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 18:33:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4F317AD;
	Wed, 25 Nov 2020 18:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4F317AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606325609;
	bh=D35r83d1aEJWrdWR0BEEt6eN7GnUUfkiew3G9Hdb0f8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWyn+WxlmYXdyCf0iv+L9z89lXTaE6+aSSJCQpJHhU404Oy8fyscngwBBQNEyJlX3
	 feAMjmvZ67EcCX5fVOcWiJQ2kVPxeEAetOMbo9TAN9+yskSv9AJQtXAOmCCXDWuad0
	 lMnZ+NaqDO7ryBdeCCKw7Su1gZ/qwa+q0xUV0V3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47178F80218;
	Wed, 25 Nov 2020 18:31:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F706F8019D; Wed, 25 Nov 2020 18:31:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB659F800D2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 18:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB659F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="GaOiLhHX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=sIqavWIU/mrQicWvL0KfH6FQlzXzymdAsQA6+ryFvwo=; b=GaOiLhHXFI1cPUREWJAWySfCgB
 vg5y+YLo7nORpAdr0HWaaFeSubqzDYU+8wMpUb0b1pulyrv0YyiWX1J7e5eka3GKfOptTIHuJ54UZ
 5Up61/EtrJCtU/OIw/rO5fAVl3GEwI6cCrzFBpmY6k84Oje9NoYlEAwvT/nDYOjPOpnd8ef1HlURL
 hNLBw03Wkhe5S4m3Spch6bilsdZxIxoPPdtm5D6hzcSxLInh68frjtekBh3+f+OA7ChYiamzH9AEG
 i5H5SUL3LQMgLmLKy2ZhB6dlQlUq6TNIaYXTuF+xTcPprqyjVQ99hyaq95FFFsfgmFIvMKN9PGqPZ
 dvUBbotw==;
Received: from [2601:1c0:6280:3f0::1935] (helo=dragon.site)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khydo-0005Eo-Vu; Wed, 25 Nov 2020 17:31:41 +0000
Subject: Re: drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
To: Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <202011030351.iq9CBMO3-lkp@intel.com>
 <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
 <20201125055155.GD8403@vkoul-mobl>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e298ed8-dc23-7a1f-1bb1-44ba2f43ee07@infradead.org>
Date: Wed, 25 Nov 2020 09:31:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125055155.GD8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 11/24/20 9:51 PM, Vinod Koul wrote:
> Hi Randy,
> 
> On 04-11-20, 19:32, Randy Dunlap wrote:
>> On 11/2/20 11:47 AM, kernel test robot wrote:
>>> All errors (new ones prefixed by >>):
>>>
>>>     or1k-linux-ld: drivers/soundwire/qcom.o: in function `qcom_swrm_probe':
>>>>> drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
>>>>> or1k-linux-ld: drivers/soundwire/qcom.c:771: undefined reference to `slimbus_bus'
>>>
>>> 09309093d5e8f87 Jonathan Marek       2020-09-08  770  #if IS_ENABLED(CONFIG_SLIMBUS)
>>> 02efb49aa805cee Srinivas Kandagatla  2020-01-13 @771  	if (dev->parent->bus == &slimbus_bus) {
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  772  #else
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  773  	if (false) {
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  774  #endif
>>
>> config SOUNDWIRE_QCOM
>> 	tristate "Qualcomm SoundWire Master driver"
>> 	imply SLIMBUS
>> 	depends on SND_SOC
>>
>> The kernel config that was attached has:
>> CONFIG_SOUNDWIRE_QCOM=y
>> CONFIG_SLIMBUS=m
>>
>> I expected that "imply" would make SLIMBUS=y since SOUNDWIRE_QCOM=y,
>> but I guess that's not the case. :(
>>
>> Any ideas about what to do here?
> 
> Sorry to have missed this earlier. I did some digging and found the
> Kconfig code to be correct, but not the driver code. Per the
> Documentation if we are using imply we should use IS_REACHABLE() rather
> than IS_ENABLED.
> 
> This seems to take care of build failure for me on arm64 and x64 builds.
> 
> Can you confirm with below patch:
> 
> ---><8---
> 
> From: Vinod Koul <vkoul@kernel.org>
> Date: Wed, 25 Nov 2020 11:15:22 +0530
> Subject: [PATCH] soundwire: qcom: Fix build failure when slimbus is module
> 
> Commit 5bd773242f75 ("soundwire: qcom: avoid dependency on
> CONFIG_SLIMBUS") removed hard dependency on Slimbus for qcom driver but
> it results in build failure when:
> CONFIG_SOUNDWIRE_QCOM=y
> CONFIG_SLIMBUS=m
> 
> drivers/soundwire/qcom.o: In function `qcom_swrm_probe':
> qcom.c:(.text+0xf44): undefined reference to `slimbus_bus'
> 
> Fix this by using IS_REACHABLE() in driver which is recommended to be
> sued with imply.

   used

> 
> Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>   drivers/soundwire/qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index fbca4ebf63e9..6d22df01f354 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -799,7 +799,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	data = of_device_get_match_data(dev);
>   	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>   	ctrl->cols_index = sdw_find_col_index(data->default_cols);
> -#if IS_ENABLED(CONFIG_SLIMBUS)
> +#if IS_REACHABLE(CONFIG_SLIMBUS)
>   	if (dev->parent->bus == &slimbus_bus) {
>   #else
>   	if (false) {
> 

