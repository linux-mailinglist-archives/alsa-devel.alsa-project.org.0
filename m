Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FEF8D52
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EAB81667;
	Tue, 12 Nov 2019 11:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EAB81667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573556024;
	bh=dNnq6GVm3TWpfU1wAouD7zuZxg9vxRS2JVC5jN6UjXU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQwmkurVcKpDy6XuEdERtJNY6nC/jmuOAPx35p2kEYs5JB9s734Z5/ljL50zvvwzH
	 WrLKtknm0FJTi/0/LtL+lxHWXFuk3Bfc3qZvJMyy3RuvSX891kTObrF5C6HoyKCbpf
	 h6gwyFbAQOGxdb7cYZa6ldlYwzRKFKnLs+UdYmOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91458F80483;
	Tue, 12 Nov 2019 11:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC649F80483; Tue, 12 Nov 2019 11:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4B22F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 11:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4B22F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="CragUSkc"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dca8e900000>; Tue, 12 Nov 2019 02:50:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 02:51:52 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 02:51:52 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 10:51:50 +0000
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
 <c976b330-f635-e818-1feb-f25db42a6ae4@nvidia.com>
 <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fe4baf43-a06c-f2ac-9b1c-6f0ec5a25cb2@nvidia.com>
Date: Tue, 12 Nov 2019 10:51:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573555856; bh=9U0iekHPqCKCtONtPFuEXlIHBgl069HGxR9z4sqUB0Y=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=CragUSkcOp2rOui25I7KothxQEPbeBZIwYXe91TsOf9rEEWagZbwahyZBZvnRRS2t
 mFmr6uDg5UAQabd2kOu3xxe1tFHZplSFIB+cURRqx8UkugVUUXgB+XelV2X6MPcXi2
 HLsQb/iYVWflJEZ641SVLt0xXptzirWcWpb7aUpURrd8UifH1s02v4oRIA8xEL2jBf
 B84STsRC5JMN88tHhNws5B6MYTEHpAjVM3NcwWYirxlbGHXd5T2P6BdsI3LQxCAtJW
 y5AJtHeOsZVx9JRu3cfih2aDCR63JpmF0plY/PMgY02h7Psnnt1Usr4Z14nVewWsA3
 kPYLKlXgVIwXA==
Cc: linux-tegra <linux-tegra@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 02/19] ASoC: soc-core: tidyup
 soc_init_dai_link()
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


On 12/11/2019 00:24, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
> Thank you for reporting.
> 
>> I am seeing an audio regression on -next and bisect is pointing to
>> this commit. I am seeing the following crash on boot during probe
>> deferral of the soundcard ...
> 
> It seems timing bug.
> I have a plan to post below patch if my current posting patch are accepted,
> but it seems it is necessary immediately.
> I believe your issue will be solved by this patch,
> but can you please test it ?
> I will formally post it with your tested-by if it was OK.
> 
> # It will be more cleanuped in the future,
> # but it needs more other cleanup patches...
> 
> --------------------
> Subject: [PATCH] ASoC: soc-core: care card_probed at soc_cleanup_card_resources()
> 
> soc_cleanup_card_resources() will call card->remove(), but it should be
> called if card->probe() or card->late_probe() are called.
> snd_soc_bind_card() might be error before calling
> card->probe() / card->late_probe().
> In that time, card->remove() will be called.
> This patch adds card_probed parameter to judge it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Thanks! I can confirm that this works, so ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
