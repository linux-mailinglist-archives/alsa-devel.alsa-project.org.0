Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9FD277336
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 15:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D2517D1;
	Thu, 24 Sep 2020 15:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D2517D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600955875;
	bh=vwp8LA9/9aKhgFClWbGQKpZkGdvKdlmTolLbNINj4uE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nidSWpBYD0zTcVtpqFrFOPyUR6eKXmxfcZyaKkFanIk0jTzJFvXHM/PGiCUpEVo1h
	 2i6BeDVMZQU8g2/qm9CkII4kZ/1/Wxf4bWYE1gHv7trFUjA6krKCyYro0Q02HuEGWE
	 Vt7/ukVbC6pHmQjJ4/TBKNEn8ucDfJc5jjxBFVHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342F6F8015F;
	Thu, 24 Sep 2020 15:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25700F80232; Thu, 24 Sep 2020 15:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA2FF8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 15:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA2FF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="SAVhC6ya"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6ca50c0000>; Thu, 24 Sep 2020 06:54:20 -0700
Received: from [10.25.98.1] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep
 2020 13:55:53 +0000
Subject: Re: No ack() calback in component driver
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <fb148b74-a452-7dc0-649f-84553df6921c@nvidia.com>
 <20200921181447.GE4792@sirena.org.uk>
 <87h7rokow8.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <7f4919b2-85ba-3b46-914a-fec95e0cbeb6@nvidia.com>
Date: Thu, 24 Sep 2020 19:25:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87h7rokow8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600955660; bh=J3LuWienF+Z5hLTCqTfvweRMr/zYvAA3GdmQTX8JAK8=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=SAVhC6yaqlpaIneZ4cMM0JU6fYXq2IoRD9Vyk2v9ZyltBGdSbL61ARtgmDRbxOpm0
 kf/YcE/NKku8DySuyFfwEvQiQ4RX32DRFkSYaj2/S1i+Va+ybxt2iKtLGtUz6zKB5X
 ej46jOuWTm88nm7Plo94EaBkrEfXiUxfHmNq83ZeRnt8g63MrLndC4lIasIi9nPXvV
 jBAj/atFaNZhTLhleIMcyU2oWAK/HC6wy2o4QWxcLCja738xtiWblyMuthoBFO/128
 LnYo/EPqFDrV+FGMAvIzdkLdFn1Y4ULOJEXO+3M4z3mAVKHcTURBwMlVy677ISu8+N
 6KY2Cjjy0VhLA==
Cc: sharadg@nvidia.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 atalambedu@nvidia.com
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

Hi Morimoto-san,

>>> With your commit e2cb4a14541d ("ASoC: soc-core: merge snd_pcm_ops member to
>>> component driver") snd_pcm_ops is replaced with callback functions in
>>> component driver. In doing so, ack() callback was not retained in component
>>> driver.
>>> Was this intentional because there were no users of ack() or if there were
>>> other reasons?
>> I can't see any reason not to allow components to have an ack()
>> operation so I'd guess it was just lack of use.
> I think I replaced existing callback only.
> Thus, I think I did nothing to it if there was no users.

I was infact referring to [0] in which you added callbacks directly in 
component driver. Later in the same series [1] 'snd_pcm_ops' was removed 
from 'snd_soc_component_driver'. It looks like at that point of time 
'snd_pcm_ops' had ack() callback. The reason for asking this is, for a 
driver (not yet in upstream) some implementation depended on this 
callback() and while moving to component it was noticed that ack() is 
not present in component. I guess without an user it is not recommended 
to add this callback. In that case I will push it along with the driver 
once it is ready.

[0] Link: 
https://lore.kernel.org/r/87tv8raf3r.wl-kuninori.morimoto.gx@renesas.com
[1] 
https://lore.kernel.org/alsa-devel/8736gb90by.wl-kuninori.morimoto.gx@renesas.com


Thanks,
Sameer.
