Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598511004B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 15:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B755E1660;
	Tue,  3 Dec 2019 15:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B755E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575383766;
	bh=LStnfK9d4QG5eCGm+2LmPmWbOFc8p47N8EItM4/t/V8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuRoE2Vdcp5MKrFXhJHfVryqTPOplN3q7MHU827npqHwPxc7FOp50jvuqyDu0W2H1
	 CF5hwzJaQjtIWsrQCA7TG2GsxI25NtkqrLqhJAGGK2e1F3jYSPlt7EllrJ85ais/xI
	 Q5bW8og0wqMCi3IIgUX99ENQno69cC2YyKEurttI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6617DF8022C;
	Tue,  3 Dec 2019 15:34:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A57F800B4; Tue,  3 Dec 2019 15:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB7CF800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 15:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB7CF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="NZgDZvai"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="NZgDZvai"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 7A4D94E200E;
 Tue,  3 Dec 2019 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575383653; bh=9EZCdQydtdvIE92/1ypyPqXdksi6OLhJTwPHjark2o0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NZgDZvaiITTRZLJm2hjTVrCkq4j07CdwftQQbzBYnVAXprfU/9TW/LjA6MMacJlWd
 PPBL+EZnswgGUZEsPVg0YE0tqz2On/Tt3coap5qPzZ7ShrW4hQewVW02Pnvq99uEt8
 AgwTldO/UJIXcQOvnCIQ0Qw7ghGGZp/FpIsApZMc=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHo31eXuCngz; Tue,  3 Dec 2019 14:34:13 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id 152094E2003;
 Tue,  3 Dec 2019 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575383653; bh=9EZCdQydtdvIE92/1ypyPqXdksi6OLhJTwPHjark2o0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NZgDZvaiITTRZLJm2hjTVrCkq4j07CdwftQQbzBYnVAXprfU/9TW/LjA6MMacJlWd
 PPBL+EZnswgGUZEsPVg0YE0tqz2On/Tt3coap5qPzZ7ShrW4hQewVW02Pnvq99uEt8
 AgwTldO/UJIXcQOvnCIQ0Qw7ghGGZp/FpIsApZMc=
MIME-Version: 1.0
Date: Tue, 03 Dec 2019 07:34:13 -0700
From: Angus Ainslie <angus@akkea.ca>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
In-Reply-To: <20191203142759.GJ1998@sirena.org.uk>
References: <20191202174831.13638-1-angus@akkea.ca>
 <20191203142759.GJ1998@sirena.org.uk>
Message-ID: <49c981e5419bbcedd271216350b4e777@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 kernel@puri.sm, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH 0/2] Add the broadmobi BM818
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

Hi Mark,

On 2019-12-03 07:27, Mark Brown wrote:
> On Mon, Dec 02, 2019 at 10:48:29AM -0700, Angus Ainslie (Purism) wrote:
> 
>>   sound: codecs: gtm601: add Broadmobi bm818 sound profile
>>   ASoC: gtm601: add the broadmobi interface
> 
> These subject styles don't even agree with each other :( - please
> try to be consistent with the style for the subsystem (the latter
> one matches, the first one doesn't).
> 

Ok I'll fix that. I pulled those out of previous commit messages of 
those files.

> Please also try to think about your CC lists when sending
> patches, try to understand why everyone you're sending them to is
> getting a copy - kernel maintainers get a lot of mail and sending
> not obviously relevant patches to random people adds to that.

I used the output of ./scripts/get_maintainer.pl . Is that not the 
correct way to generate the CC list ?

Thanks
Angus
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
