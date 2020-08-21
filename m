Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8824D08B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 10:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5251B169F;
	Fri, 21 Aug 2020 10:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5251B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597998623;
	bh=avWmPL2EtXt/ZNaTUPpSodMdPR2j8+wH4rRJprZugEo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYmrVCdCkNdeWqL8OosbOdaVbR2sU0/zTrabXVBAE8vX6y0p7+NmdYkT/U3tokeVR
	 lowQ89KMQXnx3RQgEC09U+b1sxYXWRRfNmpZg91uSpBeTg8EyrPBICFSbcegwUgi+X
	 JkSPGJ2osmdBsuHfW21ZiLVODuLU4FnwgImcPULE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D792F800D2;
	Fri, 21 Aug 2020 10:28:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1663BF80218; Fri, 21 Aug 2020 10:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D886F800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 10:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D886F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WQRg5YP5"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3f85330000>; Fri, 21 Aug 2020 01:26:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 21 Aug 2020 01:28:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 21 Aug 2020 01:28:22 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Aug
 2020 08:28:19 +0000
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <7ceb0e77-fdf5-dd62-f1f6-660c4ed43e89@nvidia.com>
Date: Fri, 21 Aug 2020 13:58:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597998387; bh=WFsVh6c8M4+WiCczi6dhz+24e/gBsRCCrYxfIkZMvuo=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=WQRg5YP5JQ1N7kppv6l/rKb3lGUdSTI7MFMNVWPLkJ2GRPl3YRAlxxjNsvUdMIAxi
 HH23s0HOtwuDk7g28chlvwDUYHt8zfi2By6nR5DWV71Oj6g6306IYrmBFCc7+LODZX
 yacZwhgpKq/LGMP3/0veVynzR8qlPQ8V2yKUAybt+JCnoMa4R+zLALacsO2bLwyQUh
 +AOqqWA9Pt6VpoVcAEeEj8SoEwyGiRv3D88W6YZdjG0OwgxPPU4IHoVDDViLcI9iXZ
 xPYvJTXv9ic2dhG2h7N4ZfAom1bMo4ihDyRTvi3mvMqVxfhDyJWEU0xPVXYHju0WaV
 Nrqxe4eVVDIJg==
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jonathanh@nvidia.com
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

...

>> If we encode use case information in DT, it would become regid and is
>> not flexible when the HW is giving us the all flexibility (at least in
>> my case). Thus may lead to complications. If there is a way to
>> configure PCM parameters from the user space it would help to simplify
>> things. Then DT can just describe the HW links.
> What kind of PCM parameters you want to get from user-space ?

I was referring to channels, rate, sample size for PCM parameters which 
are part of hw_params(). Having these strictly defined in DT would limit 
from using the same audio path for different configurations. So far used 
mixer controls for overriding this info in hw_param(), but this idea is 
dropped as per Mark's suggestion earlier. The requirement here is, some 
components have the ability to alter these parameters. Subsequent 
components in the audio path should me made aware of this.

For example, SRC (sample rate converter) can change 'rate' info coming 
from hw_param(). Similarly 'mux/demux' can change channel info. Fixing 
one set of configuration in DT will limit the usage. If this is 
configurable from user space, then it would be lot more easier.

. . .
