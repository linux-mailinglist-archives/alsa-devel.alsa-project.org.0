Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88284467CAE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 18:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E0A247D;
	Fri,  3 Dec 2021 18:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E0A247D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638553117;
	bh=6DQqd6PdWjbwATYc5OwpxooTIyDGyjPYpNpe0Obs3Sc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjE3Y3tysZEFt4BUeod2U2QgOc1j+patL14dbhJ8iVjHPFjgmedpY4n69XWqzwVtm
	 Zs9iekIKgXRguAaoP8TsLFHfmbck+7ylaawg/f5AqQLrp5VnRiKozUcXoucu0HYFOo
	 D2/WdqWCpve+1C4A4LS+UmYfiwuIlVgbc8sSTZ+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F769F80249;
	Fri,  3 Dec 2021 18:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455A3F80246; Fri,  3 Dec 2021 18:37:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6CA3F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 18:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CA3F80085
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="Yr7TRkzR"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 3E02E1F40F12
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553029; bh=6DQqd6PdWjbwATYc5OwpxooTIyDGyjPYpNpe0Obs3Sc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yr7TRkzR/0XKIud0HXHmtfb1p9HPCeObqRIBjA9PgYseBSC92kOQLiCRUFZMwkVA/
 pxUJyDEdierMw6v4Y+mrSnE5uXBJQEmILlMdiy47sBKNu1JMp4JL1I2VIjmQSwkbZR
 s6XqUQEWOwIp9sHjSaKSGoyF4wSTsUN6GoymFrRFBBcHFCtBt2QIClg4RNUCW/ZMkd
 6SnXkfc3addcXm8oNwu0b9euYjERQZMbBdJqBKN3c1djj6GEbdTixaqf8r2xM+fjN5
 95qyx6k9h5kyKQQhtlUUQUmVNDbWy0hHsIfcqvMP0hJzAP0KJjYWYYopRazNyARIA1
 9Mvv8TyrSfbIg==
Subject: Re: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
To: Mark Brown <broonie@kernel.org>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
 <6a2ff1f0-ebd9-be6d-9b2c-5704edd7c25d@collabora.com>
 <YapVH3b9urxvngWG@sirena.org.uk>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <2a79ca46-74b7-4add-912e-d687cee825a7@collabora.com>
Date: Fri, 3 Dec 2021 14:37:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YapVH3b9urxvngWG@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, bkylerussell@gmail.com,
 michael@amarulasolutions.com, festevam@gmail.com
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

Hi Mark,

On 12/3/21 2:34 PM, Mark Brown wrote:
> On Fri, Dec 03, 2021 at 02:25:17PM -0300, Ariel D'Alessandro wrote:
>> On 11/22/21 9:00 PM, Mark Brown wrote:
> 
>>> If any updates are required or you are submitting further changes they
>>> should be sent as incremental updates against current git, existing
>>> patches will not be replaced.
> 
>> I gotta send a fix for one of the patches. So, should it be a new
>> incremental patch or I can still send a patchset v2?
> 
> See above.

Got it, thank you for confirming it.
