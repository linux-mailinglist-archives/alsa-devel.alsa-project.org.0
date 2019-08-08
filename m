Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E4862DA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 15:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE29415F2;
	Thu,  8 Aug 2019 15:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE29415F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565270322;
	bh=2E7+zd/lUVLDQ2P2a8A6dv6OMvMJPAv1IDraaSd5i5k=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQMbrURfjI5Vp6fQ16fVxbV0zstVN6wdiFBIBpU1svMUMTEDxlFYuqYCquASlBtGV
	 fbK8Y0GmHs7gHqspnjgjEHyc6VO5+cEPde2a33JSc7W4fMBU+KSZk6RVuxnz/HaUGX
	 G1mO1wAhPRvwGknYIQOAUZV59iS+vXpSWDJ+K7X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A85F804FF;
	Thu,  8 Aug 2019 15:16:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEBCEF80534; Thu,  8 Aug 2019 15:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C680AF800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 15:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C680AF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.b="ihji1C0P"
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id F38935C2324;
 Thu,  8 Aug 2019 15:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1565270214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAyN24AzAzO1awwqHODdXPWc78B4O/mVcZTdCznoEes=;
 b=ihji1C0POjshqOnHilzCuIJvCLQiIHTYUZvITc2HhVRGqAwz7VUPA7HyZnNVoj8M0cxJog
 0o304WNpDEQmark5ttYGQwnbMGUwQnc854J8a+oymFH6jw8IuoNb96izgE5X3BZlI++rwL
 nFxk2rEl1AJFBrbrXLmQMig+I+bNdJw=
MIME-Version: 1.0
Date: Thu, 08 Aug 2019 15:16:53 +0200
From: Stefan Agner <stefan@agner.ch>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hftmbiyuc.wl-tiwai@suse.de>
References: <20190808123655.31520-1-stefan@agner.ch>
 <20190808124437.GD3795@sirena.co.uk> <s5hlfw3izhl.wl-tiwai@suse.de>
 <20190808130217.GE3795@sirena.co.uk> <s5hftmbiyuc.wl-tiwai@suse.de>
Message-ID: <cd3fd8b9ce6e4f9820197c70dfc42b67@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: alsa-devel@alsa-project.org, Stefan Agner <stefan.agner@toradex.com>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

On 2019-08-08 15:14, Takashi Iwai wrote:
> On Thu, 08 Aug 2019 15:02:17 +0200,
> Mark Brown wrote:
>>
>> On Thu, Aug 08, 2019 at 03:00:06PM +0200, Takashi Iwai wrote:
>> > Mark Brown wrote:
>>
>> > > No, they absolutely should tell the user why they are deferring so the
>> > > user has some information to go on when they're trying to figure out why
>> > > their device isn't instantiating.
>>
>> > But it's no real error that *must* be printed on the console, either.
>> > Maybe downgrading the printk level?
>>
>> Yes, downgrading can be OK though it does bloat the code.
> 
> I guess we can use dev_printk() with the conditional level choice.
> 

How about use dev_info always? We get a dev_err message from
soc_init_dai_link in error cases...

		ret = soc_init_dai_link(card, dai_link);
		if (ret && ret != -EPROBE_DEFER) {
			dev_info(card->dev, "ASoC: failed to init link %s: %d\n",
				 dai_link->name, ret);
		}
		if (ret) {
			soc_cleanup_platform(card);
			mutex_unlock(&client_mutex);
			return ret;
		}

--
Stefan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
