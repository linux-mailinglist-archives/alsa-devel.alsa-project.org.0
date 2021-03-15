Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C033C3DD
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:15:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBB118A9;
	Mon, 15 Mar 2021 18:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBB118A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615828503;
	bh=OlSlJ9S0VcyoB34Y2oCOcCZJE4O5HcSmYycktlptuLI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGy7wh1EN01Ofy/Uy18qfPJBQzwOilzRpQq7adrDnOzVsZqZbeZquuwEak1ePmPWb
	 38aB8/88eyk+dxsgsmaEj3evt4eRV2Kg01zjDHSZb0HslLp0AJ4e89wdg42x/+SIFL
	 zny5Ds7iQ2eedKcJy6reoARLdTnDDUkT051Pkep0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC7CFF801F7;
	Mon, 15 Mar 2021 18:13:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B71AF80171; Mon, 15 Mar 2021 18:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28EFF8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 18:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28EFF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="FDedj9di"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 343E022234;
 Mon, 15 Mar 2021 18:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615828400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvXuiNr6/ZH9LeLj3FbJ4cXG+gnUdCJXUawyo6mrnF8=;
 b=FDedj9diIvD/llhNi5mdiIowvQEiqOlJyODlAvBfiNTOJY4AtjHMVm5PejQE7LXWxdaQ1w
 +qgXPv1Yllm/Mktd2tWNeVVy42rVvx8kreG52pzZq4uWZZ4u+bY2ol8GegZmiE28BlTzMd
 PWmUz3fRLEO4VhGrks7HEgmxtsyOnoU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 15 Mar 2021 18:13:20 +0100
From: Michael Walle <michael@walle.cc>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <3b3c5aea-60bc-d7bd-9ae6-5e890782b2e8@nvidia.com>
References: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
 <8cdf1cfa971945792b509a687a4de735@walle.cc>
 <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
 <20210315153925.GC4595@sirena.org.uk>
 <3b3c5aea-60bc-d7bd-9ae6-5e890782b2e8@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <67ca8858be63a07e3549f73afcc08437@walle.cc>
X-Sender: michael@walle.cc
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, thierry.reding@gmail.com,
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

Am 2021-03-15 18:10, schrieb Sameer Pujar:
>>> Yes this is a problem, unfortunately I missed checking some of the
>>> simple-card examples. I wonder we should be specifically looking for 
>>> "mclk"
>>> clock here.
>> That would definitely help mitigate the problem but I really think 
>> it's
>> cleaner and safer to just push this down to set_sysclk().
> 
> Understand now. I will push patches based on this. Thanks for the 
> details.

Please keep me on CC, I'm not subscribed to the sound/alsa mailinglist.

Thanks,
-michael
