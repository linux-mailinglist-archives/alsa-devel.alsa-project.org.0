Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8D337FAC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 22:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE141704;
	Thu, 11 Mar 2021 22:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE141704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615498568;
	bh=EeJDcPLP47/D+G7ElJSCnj3VGoGILxvGuUHw4d3HMl8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=of8VfhthzPxZNLNK9blg1B3bXM6YOKkMny994peuz/Lmxkw5YYxBxHxzangBZiY4S
	 fxoCF2v4y1qrfnvgArOBhLUnKxrpQuECi3hm+LzsIFpDeBPXGCnRgEr7OcqrkRuA49
	 JNfh0jkmJMehTXMPPY+vuMY8jEO2+OIa1UvZWyZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5727F8010D;
	Thu, 11 Mar 2021 22:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6731BF80227; Thu, 11 Mar 2021 22:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C53FF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 22:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C53FF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="ZpGo7Mvg"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BE3632224F;
 Thu, 11 Mar 2021 22:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615498460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4zSLxlmqKWF8rF0E50MCvu5Ykg7ipqxtjl4CTHHmzA=;
 b=ZpGo7Mvg7andqY/6j3wcUlI/ZZ36ZFpZxlFQ7qjY7AyvhSjy4Lu5xwF4lK/BQqWYb35nT0
 bFAmPDCx5s/W5oWNNnIYXpJPMm5HbpgX+6vfndyd6XUT4FxjqkjqV7bjgSkhPt/tfDE7XU
 a1Acu4TpejE05Ov5HorT10yEPvOH+64=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 11 Mar 2021 22:34:19 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210311160052.GF4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <20210311160052.GF4962@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9575973104ff11d4a864a510b5c0a350@walle.cc>
X-Sender: michael@walle.cc
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Am 2021-03-11 17:00, schrieb Mark Brown:
> On Tue, Mar 09, 2021 at 03:41:56PM +0100, Michael Walle wrote:
>> Hi,
>> 
>> > If "clocks = <&xxx>" is specified from the CPU or Codec component
>> > device node, the clock is not getting enabled. Thus audio playback
>> > or capture fails.
> 
>> This actually breaks sound on my board
>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
> 
> Please, when sending replies format the subject line like normal 
> replies
> with a "Re: " at the start so people can tell it's a reply to an
> existing discussion and not a new patch.

Whoops, must have missed that. I need to figure out a new mail setup,
rather than saving the mbox from lore.kernel.org, editing it and
sending it with git-send-email.

-michael
