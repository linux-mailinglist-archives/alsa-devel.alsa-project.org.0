Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C91B86278
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 15:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264F915F2;
	Thu,  8 Aug 2019 15:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264F915F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565269259;
	bh=RtUMFCmMWH5Koz0kGp8Cp7F1R0daoSGkw84RxMyNaLI=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKgH4hizTXF+9gDM52wBhMQGPcGTuICP5Jdi9rAvxOOLESAnwMA4c7rzGAAmhB0rn
	 Jell6NsWHKPfp654YP2e/ETlCf7BB8ol8huXBwBqqKXeL1hADNGRsb8M0Gd4rRd48z
	 hMD+44GxkGzF1YxNWUKPL1IL3jR957vloAco1KL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 367E9F80535;
	Thu,  8 Aug 2019 14:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 437CFF80534; Thu,  8 Aug 2019 14:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B06F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 14:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B06F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.b="zYTVhAOH"
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 2B57E5C271D;
 Thu,  8 Aug 2019 14:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1565269149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9R4pNwt9uuq1VgKEb/EAbsgASwWpej+aa/aWzuZJ3s=;
 b=zYTVhAOHHOdlKw03JbSXgVmZZGNvZo0ZUGizuplW55WOTHiFI16uqlf4tVjhorgZYHRBsz
 V87DiYhzjsL78YYluM0SdNgSQV2XzN7zRnJuOYj7tgNZ+d7+ehKtTVsIGjVPfIG5A7LOnc
 mM/bFy7IahZXsCVDTyM56nlWJYfDCcc=
MIME-Version: 1.0
Date: Thu, 08 Aug 2019 14:59:09 +0200
From: Stefan Agner <stefan@agner.ch>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20190808124437.GD3795@sirena.co.uk>
References: <20190808123655.31520-1-stefan@agner.ch>
 <20190808124437.GD3795@sirena.co.uk>
Message-ID: <83988e57c768513425ed79eac6744ed8@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: alsa-devel@alsa-project.org, Stefan Agner <stefan.agner@toradex.com>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: remove error due to probe
	deferral
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

On 2019-08-08 14:44, Mark Brown wrote:
> On Thu, Aug 08, 2019 at 02:36:55PM +0200, Stefan Agner wrote:
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Deferred probes shouldn't cause error messages in the boot log. Avoid
>> printing with dev_err() in case EPROBE_DEFER is the return value.
> 
> No, they absolutely should tell the user why they are deferring so the
> user has some information to go on when they're trying to figure out why
> their device isn't instantiating.

Hm, I see, if the driver defers and does not manage in the end, then the
messages are indeed helpful.

But can we lower severity, e.g. to dev_info? In my case it succeeds in
the end, just defers about 6 times. I have 3 links which then leads to
18 error messages which confuse users... From what I can see
soc_init_dai_link() would print dev_err in case there is an actual
error.

--
Stefan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
