Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF0433F6A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 21:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E921695;
	Tue, 19 Oct 2021 21:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E921695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634672782;
	bh=S7HUAsEBBESlNc4/I+ON75vYB4mdK5gg8TGkIrAVpqc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUeuutuY0rqap8JInAlbW2MNSWNDTDLlg2/RciuWHwLV/lVWyDylXwOV0Iq/vFnPs
	 KdV77M2PaH2zRQhMyOdIHiPKiyoiCMu6OxBO1HfXdK8yokCf0hqcx3uXuEs8f/m2IY
	 Sp/s2MthPHJHEMMJjmCzJYr4ujKoumIDwOTERrg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3211DF80249;
	Tue, 19 Oct 2021 21:45:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 402A9F80240; Tue, 19 Oct 2021 21:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RDNS_NONE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D139EF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 21:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D139EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Xpz1VDBO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ikxZZf5qplCBT+zQNa/Q3/V1ehE/BtQKefk6PvgVhMI=; b=Xpz1VDBO13VAz0YldOrMMO+3C9
 G3dnSCDwHIM98RYiz37ambGdNlG/vGfX8efOKBnMQzqXWktS3F9f2zNTePCuC/x7ZBofHbLyWWzII
 4XWJwmEKaSbzxNtk6uwmTBjA0WgWUhpispL3FuvyBYf5vvCpDE34UZU7tKE9ZWHmrQ6X/OVcSQZda
 P0cjI8Arj3PR+XBV47pDJVFdeKPGb7P8y3MLJ1mueVME0ArSY4+kVp6EyMO5vNQytMo7TauWCZwjl
 txjZLIyE4rB/W98cknDsGr6TVqsU+uwdt0G/+9p0lpEXsUAAMP4VWQeu/OtgHwJqA3mAA8aK7Gnwi
 8g793Wgw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcv2W-002XOP-Dm; Tue, 19 Oct 2021 19:44:48 +0000
Subject: Re: [v4] ASoC: max98520: add max98520 audio amplifier driver
To: George Song <george.song@maximintegrated.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org
References: <20211019084914.14622-1-george.song@maximintegrated.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c6d2ea5-e138-960b-bb83-fadf5c2996f7@infradead.org>
Date: Tue, 19 Oct 2021 12:44:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019084914.14622-1-george.song@maximintegrated.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org
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

On 10/19/21 1:49 AM, George Song wrote:
> +config SND_SOC_MAX98520
> +	tristate "Maxim Integrated MAX98520 Speaker Amplifier"
> +	depends on I2C
> +	help
> +	  Enable support for Maxim Integrated MAX98520 audio
> +	  amplifier, which implements a tripler charge pump

                                         ^^^^^^^ correct or typo?

> +	  based boost converter and support sample rates of

	                            supports

> +	  8KHz to 192KHz.


-- 
~Randy
