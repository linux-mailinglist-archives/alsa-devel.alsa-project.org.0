Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42930EB27
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 04:48:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E691709;
	Thu,  4 Feb 2021 04:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E691709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612410508;
	bh=nsw7Xz5mx/F7K22kYUf0rLIDgr9/fgGo7j0pL679u0M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROgApc6j5O8eqoS0RvtnuA5D9G27l8H8zA1b+lHltFpZADdPthEzTAu4cMWuchlTr
	 VPzrlHIKmUpNx7wiPibHPUPV8Jncs9oHV9wFY29wAvEczTAnDjaFgN1vBnYAuiMadA
	 FZtmVeN+9ahYdgAHcVcE3PWNC9plvxDVRZ8cpHRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6133FF802E7;
	Thu,  4 Feb 2021 04:46:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1361EF802E3; Thu,  4 Feb 2021 04:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87163F802E0
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 04:46:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87163F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="IAQYv23Z"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601b6dfe0000>; Wed, 03 Feb 2021 19:46:06 -0800
Received: from [10.25.102.154] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 03:46:01 +0000
Subject: Re: [PATCH 1/2] ASoC: audio-graph: Export graph_remove() function
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <1612368575-25991-1-git-send-email-spujar@nvidia.com>
 <1612368575-25991-2-git-send-email-spujar@nvidia.com>
 <20210203161951.GG4880@sirena.org.uk>
 <64b65aaf-9971-e071-5d52-02286fe0cacc@nvidia.com>
 <20210203172415.GH4880@sirena.org.uk>
 <87y2g494b0.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c090ef0b-3af8-4ff3-027d-d8c84019eca4@nvidia.com>
Date: Thu, 4 Feb 2021 09:15:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87y2g494b0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612410366; bh=DwIn2j1vQcvA9mQebkfkn8fWS9nwtb6i848UUWLIsQc=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=IAQYv23ZZbiCxLRGuJWC1dUROtZHT2sm1b/i6fGFUEPvJSl1wQkgc5mWy6rx7GHDv
 xsBB2g5ZtEvYaQub+VCtXdIkm6hqsOymcBeHZnY8HVAkTqqfotN8VIoRkDAeN7awPT
 ENmWJ8Q1qqW5eIjQTXe8P67Ncf/xR6WqgcYhwUrqghlyGONc/qrClXxwCTtalc9XMs
 F/0LsnBF0OwwK9ZdvVj7Y1msr5U1M8qzcLloJkRtDbo2NBFQwF/4VKVxPQJKlAIsFa
 4knX5TfEU1Lj2Wa8j4s9I8o6AJo7w7x45orTAaUpOTe8C8XY+lSLTVVIjBOa/eihQw
 qY5vE2oI20Dbg==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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



On 2/4/2021 4:03 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi
>
>>>>> +int graph_remove(struct platform_device *pdev);
>>>> I think this needs better namespacing if it's going to be exported.
>>> audio_graph_remove() can be a better choice?
>> Yeah, that looks reasonable.
> Nice naming I think.
> In such case,  update also graph_parse_of() is nice idea for me.
>
>          - int graph_parse_of(...)
>          + int audio_graph_parse_of()

OK, Will update following.

graph_remove()=C2=A0=C2=A0=C2=A0=C2=A0 --> audio_graph_remove()
graph_parse_of()=C2=A0=C2=A0 --> audio_graph_parse_of()
graph_card_probe() --> audio_graph_card_probe()


