Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ECF20F3EE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 13:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA8D1672;
	Tue, 30 Jun 2020 13:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA8D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593518219;
	bh=UPnjSEb2d6J/6mPOlEYDBA6WuVh5FW0X/3rJj8D4oFQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXVLNOFKf9MESZUlva/vl/XGun5pzlQ0h0tZNxFnXssbcC+gyzg6RzNA0zSl974zd
	 ajEzMH+dXpeCSOyMA7yAqsedgYkWgqQoXID4xqVkvJgF3MOL45fNX+8SRMxKeXupix
	 HPYuhp4kINvqkiUId7tE4375jbulh/Z8gsxYzqvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 962E7F800EA;
	Tue, 30 Jun 2020 13:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21C06F801F2; Tue, 30 Jun 2020 13:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A955F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 13:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A955F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="H21t0clf"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb27e70002>; Tue, 30 Jun 2020 04:54:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 04:55:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 04:55:04 -0700
Received: from [10.25.97.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:54:54 +0000
Subject: Re: Re: [PATCH v4 00/23] Add support for Tegra210 Audio
To: Mark Brown <broonie@kernel.org>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <20200630105142.GF5272@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <b44cf9a8-f01b-5c73-5929-d02c4502832e@nvidia.com>
Date: Tue, 30 Jun 2020 17:24:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630105142.GF5272@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593518055; bh=aqJ2upnaq3qCdZVAi6vfeAtGXsTFXwxy04lLWsSjgro=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=H21t0clf+ESX3Od8FVqcK5gF9fZG/EUdlFKDC3XhnyXrw6fVxcoWIf0w1/Cpajsr2
 6VetDIIzPOi0BA+1zTh4B73h3xNayfS9R0gF2aof1JJrljcsrshrWTiwKCSGFl4zbu
 hWf9OTFMoGsB+dosGpJqCInbxpxgJWxX78KrLlYWzR9gps5pIwodyG0Hq6M+43kqic
 MCZPJKCyQNxtykKcNpUxIrEN6OIh4WZnL0Bim+mk476Hb2q1c/DCXbzMcGKf3f5VN1
 vKaBCrtQD54fv/DlxFcHUIhj6Azi59YOhzUKce4yr/TWqXjUwhOWPJTBTNe3iiwVXd
 96jpXFk5aTrHQ==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
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



On 6/30/2020 4:21 PM, Mark Brown wrote:
> On Sat, Jun 27, 2020 at 10:23:22AM +0530, Sameer Pujar wrote:
>
>> Following is the summary of current series.
>>   * Add YAML DT binding documentation for above mentioned modules.
>>   * Helper function for ACIF programming is exposed for Tegra210 and later.
>>   * Add ASoC driver components for each of the above modules.
>>   * Add DT entries for above components for Tegra210, Tegra186 and
>>     Tegra194.
>>   * Enable these components for Jetson Nano/TX1/TX2/Xavier
>>   * Enhance simple-card DPCM driver to suit Tegra Audio applications with
>>     few changes in core.
>>   * To begin with, enable sound card support for Tegra210 based platforms
>>     like Jetson Nano/TX1.
> This series is too big and covers a few different topics which makes it
> difficult to manage, please split it up.  The most obvious thing here is
> that it contains both the drivers you're adding and a bunch of changes
> to the generic audio cards (which are a single throwaway line in your
> cover letter) - splitting out the generic card changes into a separate
> series would result in more manageable sizes.

My initial thought was, it would be better to present a entire picture 
where complete audio path can be tested or reviewed and hence added 
simple-card patches in the series. I will split this up in next revision.

