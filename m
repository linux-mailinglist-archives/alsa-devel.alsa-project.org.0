Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F020411
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1584116BF;
	Thu, 16 May 2019 13:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1584116BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558004782;
	bh=evjPReSfDqs+jqDBajDED8RKmsyfBbNTkM+W3DbizuQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B44Gxe/prgSt9n52aLgtE+imAgEpGgXTVnzGFU2JtJ7ovfSjwzQ2p/ZOFYiZM2Iw4
	 1v3cSlZXGnRLnZThtk00w4Yt85zr+U4wiMT3TrSGx55nYC2E0AyZimAuQhx5k33wab
	 6Ff1Wn+IgwVwa/Pam+yFJMI/o5GvYC4hLS5cl2p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64D55F80C18;
	Thu, 16 May 2019 13:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 265F3F896B6; Thu, 16 May 2019 13:04:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78AF5F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78AF5F80C18
Received: from [103.217.166.89] (helo=[192.168.1.154])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>) id 1hREBP-0002hB-Mn
 for alsa-devel@alsa-project.org; Thu, 16 May 2019 21:04:21 +1000
To: alsa-devel@alsa-project.org
References: <e182bf72-c369-7344-e4d1-0524b09ca489@flatmax.org>
 <15b3a74a46f3c17f9240e5d90805e4056f80c55f.camel@nxp.com>
 <20190516095234.GB5598@sirena.org.uk>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <051ac4e2-db35-ccd4-02bd-26898698be2c@flatmax.org>
Date: Thu, 16 May 2019 21:04:17 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516095234.GB5598@sirena.org.uk>
Content-Language: en-US
Subject: Re: [alsa-devel] ASoc : cs42xx8 : merge cs42xx8-i2c.c into cs42xx8.c
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 16/5/19 7:52 pm, Mark Brown wrote:
> On Thu, May 16, 2019 at 06:34:47AM +0000, Daniel Baluta wrote:
>> On Thu, 2019-05-16 at 16:15 +1000, Matt Flax wrote:
>>> Is there a reason to keep these two related driver functions separate
>>> ?
>> cs42xxx codec has also an SPI interface. If anyone wants to implement
>> support for that it would be easier with the current split.
> Right, that's the reason for the split - the split would need to be
> redone if anyone wants to add SPI support.
>
OK, make sense.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
