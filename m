Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA712494E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 15:19:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85E54165E;
	Wed, 18 Dec 2019 15:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85E54165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576678761;
	bh=BVfHBMDOqDhBIJUF2CMJrNmZQ6AnjTNTx+twe70W4Mg=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8Bfk/LXjiafqRmCfA2C6qOBxLtJ7UjZVTfAuK30hPkG5peRvk8OqUTTcqIFBj+FL
	 sri88Q6jpkgINQ6/8wMjTzi2A4Zdd2pU1giJQmeJU99KBvkTAX8N72WGPGl2Lo6JCJ
	 xW2Brnb6lGcI6OlwlJR5pWnLmPLyu0b13MOw/gnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD49BF8015A;
	Wed, 18 Dec 2019 15:17:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65649F8022C; Wed, 18 Dec 2019 15:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE52AF80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 15:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE52AF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Or5kzB4B"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfa34de0000>; Wed, 18 Dec 2019 06:17:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Dec 2019 06:17:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 06:17:30 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 14:17:29 +0000
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>, linux-tegra
 <linux-tegra@vger.kernel.org>
References: <20191210145727.22054-1-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
Date: Wed, 18 Dec 2019 14:17:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210145727.22054-1-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576678622; bh=ttBXWiRp+M4718kAAsDcfDS1d4d3FxcEEPyLMsuz4iM=;
 h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Or5kzB4BMfnC50madLTDz/10s8nfe/EVmMyucCaKFsWXLNRpvZjIerdCn8hjiz5Cg
 OULD3kTM9LaKv/Hc3+TlGiTFe9qk3LHDm2puQUliu7SnU2UnDghNEDkRZ9Znf9wWvu
 9vSFFf5fc5p+NjpvJ4yz/zUY1RdJUs6bZJmZzyCrB7n0GzQUIQAOxB7eUormEMcXdt
 N7X94PGuRNyeobyKpwhhpQBt5aK6s/My4MklZCoCoPEFKkpr9pLddb8FvIWIKY8sSz
 VkmNOLHI3bx7++Tie0MlVI2OGxW5E7VPVsDAG2JXQ/2MsEnd5TTfR099iuZQ5KghaI
 xUu42aXYn42Rg==
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use standard waitqueue for RIRB
 wakeup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 10/12/2019 14:57, Takashi Iwai wrote:
> The HD-audio CORB/RIRB communication was programmed in a way that was
> documented in the reference in decades ago, which is essentially a
> polling in the waiter side.  It's working fine but costs CPU cycles on
> some platforms that support only slow communications.  Also, for some
> platforms that had unreliable communications, we put longer wait time
> (2 ms), which accumulate quite long time if you execute many verbs in
> a shot (e.g. at the initialization or resume phase).
> 
> This patch attempts to improve the situation by introducing the
> standard waitqueue in the RIRB waiter side instead of polling.  The
> test results on my machine show significant improvements.  The time
> spent for "cat /proc/asound/card*/codec#*" were changed like:
> 
> * Intel SKL + Realtek codec
>   before the patch:
>    0.00user 0.04system 0:00.10elapsed 40.0%CPU
>   after the patch:
>    0.00user 0.01system 0:00.10elapsed 10.0%CPU
> 
> * Nvidia GP107GL + Nvidia HDMI codec
>   before the patch:
>    0.00user 0.00system 0:02.76elapsed 0.0%CPU
>   after the patch:
>    0.00user 0.00system 0:00.01elapsed 17.0%CPU
> 
> So, for Intel chips, the total time is same, while the total time is
> greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
> The only negative data here is the increase of CPU time for Nvidia,
> but this is the unavoidable cost for faster wakeups, supposedly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Starting with next-20191217 I am seeing the following error on one of
our Tegra platforms ...

tegra-hda 3510000.hda: azx_get_response timeout, switching to polling
mode: last cmd=0x404f2d00

Bisect is point to this commit and although it does not cleanly revert,
if I revert this and a couple dependencies on top of -next the issue
goes away. Any thoughts on what could be going on here?

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
