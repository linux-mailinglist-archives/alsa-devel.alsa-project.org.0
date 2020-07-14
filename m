Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01521EB05
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 10:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390A91661;
	Tue, 14 Jul 2020 10:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390A91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594714204;
	bh=8f28j13TDKgcxRazbI12lvKti/UxCjQU5A5efSXnXK4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evZEXMXThBPzPU9BXA4dlv2/aR2HlDpeBOfmiCn9uR20bJz8dZQS5TG29j2AVuFsy
	 EBfEjPKy8zvj8xwJ+6p4w4WJ5SKBPjjhMkdwhT7yZQ+bUR6iZlrDCBd+pPYEGY9xCF
	 G+kiJV6D7dqeGC0b7/FEG4SDUjZ/5zz4uaJM5aCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37001F8016F;
	Tue, 14 Jul 2020 10:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12273F8019B; Tue, 14 Jul 2020 10:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C890F80113
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 10:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C890F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iHgksAVa"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0d67740000>; Tue, 14 Jul 2020 01:06:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 14 Jul 2020 01:08:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 01:08:05 -0700
Received: from [10.26.72.103] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 08:08:03 +0000
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>, linux-tegra
 <linux-tegra@vger.kernel.org>
References: <20200618144051.7415-1-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
Date: Tue, 14 Jul 2020 09:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618144051.7415-1-tiwai@suse.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594713972; bh=wXjtpt92lXHea/LvRhP9pH3OyC9jJX6GLMwk3vi+S1A=;
 h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iHgksAVauWoPQ40HWwaxzIuoG0KE3XXZciaiFVy6yU6i2SeECKMnO+9tsSvJij7XU
 TL3Pqea7hv4Gz4nySMW17yE+hBwrpd2LFGoBmwAbiebOi/9akqiOoLCveH+KML/0Dj
 y+lvQdOX8+/XwHz3wPB3BiFYSmTfB7WIqWBEt2/hzTFRnZC1+OOWQyf28+EbRCzs9Y
 AO5/HxbSBoNzhXadqbDDhUX2MILzGnFEVeVdKrlLFpeLmj8Y5xk+h1J4SJg6J54U+g
 fm1FYy4BspXCcty5BpQ/4Hyg/Xc/R9eLBZsjRmm8LMvcRf+8hyB6Kl+vj7dKyaVIaa
 rczsxXIwQ5l5A==
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

Hi Takashi,

On 18/06/2020 15:40, Takashi Iwai wrote:
> In the end we already enabled the sync-write mode for most of HD-audio
> controllers including Intel, and it's no big merit to keep the async
> write mode for the rest.  Let's make it as default and drop the
> superfluous AZX_DCAPS_SYNC_WRITE bit flag.
> 
> Also, avoid to set the allow_bus_reset flag, which is a quite unstable
> and hackish behavior that was needed only for some early platforms
> (decades ago).  The straight fallback to the single cmd mode is more
> robust.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>


I have noticed a regression in HDA playback on our Tegra186 Jetson TX2
platform. Bisect is pointing to this patch and reverting this does
appear to fix it. Interestingly, I am not seeing any problems on other
Tegra platforms, however, Tegra186 does have the IOMMU enabled for HDA
which is one different between the other platforms.

We can take a closer look at this for Tegra, but I am wondering if we
revert this for Tegra for now.

Cheers
Jon

-- 
nvpublic
