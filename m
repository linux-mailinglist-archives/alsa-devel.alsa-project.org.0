Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6F16498F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 17:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA68516A6;
	Wed, 19 Feb 2020 17:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA68516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582128721;
	bh=Y4IVG9EdM9GGqYVDnKSi7S7GV3/7tEnqSahIk5yOcYk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UCZNLYL7oGHwVCgyDIsrDaSTYQZ8xVoqIPxzdgXDWAklt3JEnFkk0MgtxRh1J1rvA
	 qc12hpJRft24Esn7cWdEvcc8TdvroVLN/9PrQoK3PQt5igSIGkMnp3jx9RZ63eWS/0
	 8o3LUnE7SOHgbyXyMLKcvytn3F+U07hAfVj4wFKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D84F8025F;
	Wed, 19 Feb 2020 17:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC92F80277; Wed, 19 Feb 2020 17:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85D41F8025F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D41F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="YRz9DrxY"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4d5dcf0000>; Wed, 19 Feb 2020 08:09:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 19 Feb 2020 08:10:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 19 Feb 2020 08:10:24 -0800
Received: from [10.25.75.111] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 16:10:14 +0000
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
 <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
 <3b42c858-733b-0d17-f457-8043d97f5058@gmail.com>
 <62b8ffbc-aa32-ae44-6cb4-b176b8ba9b0e@nvidia.com>
 <847739f8-6f54-cf64-54b8-94707944850b@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <319a0922-3de2-5d02-65c3-d96036eea6d9@nvidia.com>
Date: Wed, 19 Feb 2020 21:40:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <847739f8-6f54-cf64-54b8-94707944850b@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582128591; bh=Y4IVG9EdM9GGqYVDnKSi7S7GV3/7tEnqSahIk5yOcYk=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=YRz9DrxYbhYO6MTRtYvDuHjxISyreNHeLWM8zCWFBDDruqQ7Iu/eWxWcpvrSipAeN
 +y1QGqIhOVyKFac4zZXp91ebRRec/wz5LQD9o107Ixrks2W4G92ivh3VWFmmT7y/rn
 fS2qsZQFF36hhMiEBBEhcg/GFGcrYiNQb4RZF2O624d0UvCmvR5ul6qKf+PBYdwWcg
 JwnX7UiisfcEa6rwlhs5yQTsza33PiBpoZIydDJecnDrCyppBbpk2nc4AZ+X797Va2
 kRck5XiZTa3GPHWP+xfSbLUeCSCTquzreb9s3RTCFY3SNL/0l1bHFcF0ZsEI6rxT1a
 wgbd5x3qJtG6Q==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, atalambedu@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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



On 2/18/2020 6:30 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 14.02.2020 17:05, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 29/01/2020 03:41, Dmitry Osipenko wrote:
>>
>> ...
>>
>>> The !RPM case isn't supported by Tegra anymore in upstream kernel. I'm
>>> trying to help to make yours driver better and gave you reasons to
>>> remove the unneeded code, while you're keep saying that "there is no
>>> harm to retain it", which is not a reason to clutter up the code. I
>>> don't feel that it's worthwhile to continue arguing here.
>> On further review, it does look like a reasonable argument to get rid of
>> this now completely. Like you see less clutter and the soc-core should
>> ensure that the card is shutdown before unloading. OK, so fine with me.
> And the RPM core ensures that state is synced on disable, sorry if I
> didn't make it clear before.
>
> +1 for less clutter :)

Done, I am removing explicit RPM suspend in the next revision. Thanks=20
Dmitry and Jon.

