Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D031421ED41
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 11:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7655D1662;
	Tue, 14 Jul 2020 11:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7655D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594720401;
	bh=tAdvKEXsJtdCBP8F+1b/hYl+CAjdhBQs+E4NiWc5Hik=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1itfYagWjC3Kzu2LmG/4lljLvAHRig/RdBqOM28fZmF9/p0meNQYKbm1ijHBRLYO
	 XaqKCXMdOb7wNsip6A3Qf7nWKzUU50yduc/8AqzY4tLXSa4WICu6htPN03sVvPZeSt
	 eDKIDcW7NkEznRZlwFrz4gp4Kr7XnG78r91/Te1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C95F800E5;
	Tue, 14 Jul 2020 11:51:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B3B6F8019B; Tue, 14 Jul 2020 11:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8768BF800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 11:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8768BF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="gku6mRwx"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0d80100000>; Tue, 14 Jul 2020 02:51:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 14 Jul 2020 02:51:25 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 02:51:25 -0700
Received: from [10.26.72.103] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 09:51:23 +0000
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
To: Takashi Iwai <tiwai@suse.de>
References: <20200618144051.7415-1-tiwai@suse.de>
 <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
 <s5hy2nmv6qv.wl-tiwai@suse.de>
 <6f7a6d27-127d-9242-0638-abaf10e38410@nvidia.com>
 <s5hr1tev4sw.wl-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c2c925ab-5bf7-7f7c-cf30-126b3ba34fff@nvidia.com>
Date: Tue, 14 Jul 2020 10:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hr1tev4sw.wl-tiwai@suse.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594720272; bh=w7g3s9EjCSylMdJ5ySi5SN8nnfirYHN96+rO9FyAjdo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=gku6mRwxysxKbZqUMYWGmfEcmAVWxh3dH8RYPaj2zWovPIrN50sGQr+LhUg1sW+TN
 TgS2caGRBulOMutrGTdGddjGKmcUCoAmdGe4IUDoM0Kz9O3GBrO2jb4ggI6OuicDeB
 eW7BLt5jq5OvZSwglzdzDiQ4WBUnFDaX2LAAnatGmm10x/G8LAYpwyW/HQZK64tZBB
 geoFS3qmu2zVlUz4ny+soH9Zs7oI3ffOXYj1BH5Nq+NK0CdtwbOYZwJKzkto5q+8z1
 Rlz/EARNDLWmtCWrw0ihwVZXPmCo6WjTzvz7/yIQsTnX4qo1h1NyLdoQFo0J8PA+iN
 DF1yAykbMJ7IA==
Cc: linux-tegra <linux-tegra@vger.kernel.org>, alsa-devel@alsa-project.org
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


On 14/07/2020 10:12, Takashi Iwai wrote:

...

>> Did you mean ...
>>
>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>> index 0cc5fad1af8a..5637f0129932 100644
>> --- a/sound/pci/hda/hda_tegra.c
>> +++ b/sound/pci/hda/hda_tegra.c
>> @@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
>>         if (err < 0)
>>                 return err;
>>
>> +       chip->bus.core.sync_write = 0;
>>         chip->bus.core.needs_damn_long_delay = 1;
>>         chip->bus.core.aligned_mmio = 1;
>>
>> The above works for me.
> 
> Yeah, sorry, that was a wrong patch :)
> I'm fine for applying it with some more comments.
> 
> Care to submit a proper patch?


No problem. I will submit a patch.

Jon

-- 
nvpublic
