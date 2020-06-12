Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345961F7C7E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 19:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970D4167D;
	Fri, 12 Jun 2020 19:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970D4167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591983140;
	bh=ibPnJgwIX8KwS0YYTpp+rzjVhUif7LE5tRS2XPXX2vg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5q2zuJTjusiIObbDQtYaUflLyXa2Vhld7p4nrOnfHx4MluvNIKVqMM8SnajPtd8T
	 swVtOHVpfjbeHWWaG/97lB4TeY/n5oaIZPGvf1SfHj/v5Sq0tsKwQ9StTk4PHQrkfK
	 ndJjhHPm25y17wE2hHRRBzTOaJ0xGE8JS9vHwA6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC559F800C7;
	Fri, 12 Jun 2020 19:30:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A923F8021C; Fri, 12 Jun 2020 19:30:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A553BF800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 19:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A553BF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wbAUXz//"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05CHUUAN039824;
 Fri, 12 Jun 2020 12:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591983030;
 bh=sr2KEVEQVbaiZmHzFtwyvYGxG5ls7pPhGG6jAjqwh3M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wbAUXz//1QR6GveZJRYVE6er4iYGDqc9JHH9yXVhRS/vgKTlxa1JH7D9kwDc9RuJN
 nwQU7gBSr+icGaxgEtUaGm9uhqXg6/YOMu3PJEWl2o8EvN7ma9q1A+/tcJucx+I+9/
 PR5UMwbmE0ZmHglwZ37U0A4k/JXxwdBMll1hVUjE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05CHUUUE104980
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jun 2020 12:30:30 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 12:30:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 12:30:29 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CHUTf7052587;
 Fri, 12 Jun 2020 12:30:29 -0500
Subject: Re: [RFC PATCH 2/2] ASoc: tas2563: DSP Firmware loading support
To: Mark Brown <broonie@kernel.org>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-3-dmurphy@ti.com> <20200609175000.GO4583@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f9601516-2091-322b-85ff-7cea484fd933@ti.com>
Date: Fri, 12 Jun 2020 12:30:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609175000.GO4583@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

Mark

On 6/9/20 12:50 PM, Mark Brown wrote:
> On Tue, Jun 09, 2020 at 12:28:41PM -0500, Dan Murphy wrote:
>
>>   	.val_bits = 8,
>>   
>> -	.max_register = 5 * 128,
>> +	.max_register = 255 * 128,
>>   	.cache_type = REGCACHE_RBTREE,
>>   	.reg_defaults = tas2562_reg_defaults,
>>   	.num_reg_defaults = ARRAY_SIZE(tas2562_reg_defaults),
> Should some or all of the DSP memory be marked as volatile?  I guess if
> we only write program to it then on reload after power off it should be
> fine to just blast everything in again and ignore the fact that some
> will have changed, but it might be helpful for debugging to be able to
> read the live values back and do something more clever for restore.

Well the only values I see that change that regmap should care about are 
in first page of the register map.

After reverse engineering a binary I found that its contents modify page 
0 registers of the device.

Not a fan of this as it causes un-wanted changes that may have been setup.

>
>>   #define TAS2562_PAGE_CTRL      0x00
>> +#define TAS2562_BOOK_CTRL      0x7f
> *sigh*  Of course the two levels of paging register are not located
> anywhere near each other so we can't easily pretend they're one double
> width page address.  :/
Yes I agree
>
>> +static int tas25xx_process_fw_single(struct tas2562_data *tas2562,
>> +				     struct tas25xx_cmd_data *cmd_data,
>> +				     u8 *fw_out)
>> +{
>> +	int num_writes = cpu_to_be16(cmd_data->length);
>> +	int i;
>> +	int ret;
>> +	int offset = 4;
>> +	int reg_data, write_reg;
>> +
>> +	for (i = 0; i < num_writes; i++) {
>> +		/* Reset Page to 0 */
>> +		ret = regmap_write(tas2562->regmap, TAS2562_PAGE_CTRL, 0);
>> +		if (ret)
>> +			return ret;
> Why?

Well the reason to set this back to page 0 is that is where the book 
register is.

So setting this back to page 0 set the Book register appropriately.

>
>> +
>> +		cmd_data->book = fw_out[offset];
>> +		cmd_data->page = fw_out[offset + 1];
>> +		cmd_data->offset = fw_out[offset + 2];
>> +		reg_data = fw_out[offset + 3];
>> +		offset += 4;
>> +
>> +		ret = regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL,
>> +				   cmd_data->book);
>> +		if (ret)
>> +			return ret;
> This manual paging doesn't fill me with with joy especially with regard
> to caching and doing the books behind the back of regmap.  I didn't spot
> anything disabling cache or anything in the code.  I think you should
> either bypass the cache while doing this or teach regmap about the
> books (which may require core updates, I can't remember if the range
> code copes with nested levels of paging - I remember thinking about it).

Yeah. After reading this and thinking about this for a couple days.  
This actually has contention issues with the ALSA controls.

There needs to also be some locks put into place.

I prefer to disable the cache.  Not sure how many other devices use 
Books and pages for register maps besides TI.

Adding that to regmap might be to specific to our devices.

>
>> +static ssize_t write_config_store(struct device *dev,
>> +				struct device_attribute *tas25xx_attr,
>> +				const char *buf, size_t size)
>> +{
> This looks like it could just be an enum (it looks like there's names we
> could use) or just a simple numbered control?  Same for all the other
> controls, they're just small integers so don't look hard to handle.  But
> perhaps I'm missing something?

No you are right.  The issue with using enums is that the binary is not 
parsed until after codec_probe and the device is registered.

So the controls would appear later which could be a race condition for 
the user space.

>
>> +	tas2562->fw_data->fw_hdr = devm_kzalloc(tas2562->dev, hdr_size,
>> +						GFP_KERNEL);
>> +	if (!tas2562->fw_data->fw_hdr)
>> +		return -ENOMEM;
>> +
>> +	memcpy(tas2562->fw_data->fw_hdr, &fw->data[0], hdr_size);
> Should validate that the firmware is actually at least hdr_size big, and
> similarly for all the other lengths we get from the header we should
> check that there's actually enough data in the file.  ATM we just
> blindly copy.

I will have to look into doing this.  I blindly copy this data because 
there is really not a viable and reliable way to check sizes against the 
structures.


> It'd also be good to double check that the number of configs and
> programs is within bounds.

This I can check once the data is copied.

Dan

