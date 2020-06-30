Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5BA20F529
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5229F1688;
	Tue, 30 Jun 2020 14:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5229F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593521753;
	bh=pIAOQr5KmrnwCzBtXXB8RxWWM7jUs7Q4XbZ5fURun0U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnnNcUF4SS7WR1ZeJihIyL9Q02JMca+ovNhauuLIf3dYx1ot8aWtLxYEHAI8EvIAk
	 fgUIxN2qGZCULxl4a1SEJc2i6mYsO/HJ6Qmqh6wLongDT8EhZmHZsG0Ig+dqKYYkvl
	 yO00BEjL1w3Hlk9lKMIkUjrEdZe5Bd6NCz5xdgD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53267F8022D;
	Tue, 30 Jun 2020 14:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 667E6F801F2; Tue, 30 Jun 2020 14:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B45F3F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B45F3F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Gh3ACliK"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb35850000>; Tue, 30 Jun 2020 05:52:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 05:54:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 05:54:00 -0700
Received: from [10.25.97.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 12:53:53 +0000
Subject: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link
 with multiple Codecs
To: Mark Brown <broonie@kernel.org>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
Date: Tue, 30 Jun 2020 18:23:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630110100.GH5272@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593521541; bh=aXxCz2dTV4FtL79w8/1SiDck9RwhPcel5Fp7Yqr93ys=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Gh3ACliKpLklTAftBCph4CwFuABvt9iKOaYeZz9J9rKIAEuUd7rQRvaTVD6XQZt7T
 axfWqqI5PiBn9JpHQfL4rhdLKiL76uJ1w5S9AXLytg4BCoLvKCRCEH9kLNV2M1wDFw
 bc6uYFwF6yT2JQeqDfGjx6xCmCL2jAaPmAQbPZOZmOciS4J0knlc5kq1ijFmM7z6N3
 EG7PlhYruqj0fsBMzrETSEnSnHNxCc9q/3GEKJ4gd6mAJSiYMI0uvC/QIrlzYDJzWQ
 ZURoXaJ+7yXHbfQ/3oLA/KBcWn0rYoBp1R/7vrhUiBe9fHg6ZA8NE6L55EZOkiOWgP
 Q3oHajDJIRzZg==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, nwartikar@nvidia.com,
 lgirdwood@gmail.com, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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



On 6/30/2020 4:31 PM, Mark Brown wrote:
> On Tue, Jun 30, 2020 at 01:22:29PM +0530, Sameer Pujar wrote:
>
>> Yes there are complex use cases, but if we look at the amount of changes
>> required in simple-card driver that is not too much. Existing binding for
>> simple-card driver would still work fine for our cases. Yes there are some
>> deviations and we don't want to break existing users, that is why a *new*
>> compatible was introduced and specific items can be pushed under it.
>> Majority of the simple-card driver is getting re-used here. We just need to
>> make sure it does not affect anyone else.
> Why simple-card and not audio-graph-card?

Frankly speaking I have not used audio-graph-card before. I had a brief 
look at the related binding. It seems it can use similar DT properties 
that simple-card uses, although the binding style appears to be 
different. However I am not sure if it offers better solutions to the 
problems I am facing. For example, the ability to connect or form a 
chain of components to realize more complicated use cases with DPCM, 
some of which were discussed in [0]. Can you please help me understand 
why it could be preferred?

[0] https://lkml.org/lkml/2020/4/30/519

>>> Using fe/be instead of cpu/codec is easy to understand.
>> I guess you are referring to DT binding part. The parsing code specifically
>> looks for "codec" sub node and thus present conventions had to be used.
> Remember that this stuff gets fixed into the ABI so we'd have to live
> with this for ever.

