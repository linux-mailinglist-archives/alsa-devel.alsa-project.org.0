Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28390127B8B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35CD167A;
	Fri, 20 Dec 2019 14:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35CD167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576847512;
	bh=q3U9q4YNEvJ9uiVF0KbY0j2cXYold/mtxigtDznt81A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzkxg4RrdF62jX7diRft66ETVsrTuII7Ts8YmEgJwQAsMHKOsN3quiukR/cvnZBaF
	 PSlHjVpT9UePLjHPG57sD7Nm0kaCGgp9h2p3n2vS6KlR8UOa7jLzWuVvhlK+j5YdPh
	 mrKW4JYhZ+6LsZOOQCGtAE0C2M2VT+nzfdPiVobU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C55BCF80268;
	Fri, 20 Dec 2019 14:10:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7D3FF8015A; Fri, 20 Dec 2019 14:10:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72CB6F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CB6F8014C
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47fTck5j4Cz1rXQ1;
 Fri, 20 Dec 2019 14:10:14 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47fTck590Dz1rYZY;
 Fri, 20 Dec 2019 14:10:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id y4gwAQXB7j43; Fri, 20 Dec 2019 14:10:13 +0100 (CET)
X-Auth-Info: jPtXtV5d8SEiC+6UfJhGw8kiq6PMMe79I++bacIOguM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 20 Dec 2019 14:10:13 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <20191219213257.366145-1-marex@denx.de>
 <20191220130030.GE4790@sirena.org.uk>
 <8769149d-99c4-f577-bc9b-c621c4f3eba4@denx.de>
 <20191220130250.GG4790@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
Message-ID: <6c387365-2512-d41c-8804-58e31173bc26@denx.de>
Date: Fri, 20 Dec 2019 14:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191220130250.GG4790@sirena.org.uk>
Content-Language: en-US
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, alsa-devel@alsa-project.org,
 festevam@gmail.com, Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO
	comparison
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

On 12/20/19 2:02 PM, Mark Brown wrote:
> On Fri, Dec 20, 2019 at 02:01:30PM +0100, Marek Vasut wrote:
>> On 12/20/19 2:00 PM, Mark Brown wrote:
> 
>>> This sort of peering inside the internals of the framework is obviously
>>> not OK, please add an interface for this if it's needed.
> 
>> It's needed, unless there is a better way to compare two regulators in
>> the driver already. Is there ?
> 
> Like I said above "please add an interface for this if it's needed".

I'm asking whether such a thing exists already :)

If not, then I'll add it in V2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
