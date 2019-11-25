Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AD108C4F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 11:53:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA4216CC;
	Mon, 25 Nov 2019 11:52:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA4216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574679204;
	bh=tstwmQf8TOw0uEk6J9Tv9sgHura7/B4DaZNeeQLBafA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bON2QLVfN7vInUL6PrcMl6mkYkQtA052evnUp9iI8xanuzmqmaovmIA86KPR0XUD9
	 IOTzdVoWwi1rvnqDQ3ldkHNPkPExRr+UQkkfu77SBD/2XtHFL3XHve+qR1YIbm8b54
	 /66IgaH/vN8hMwXwY58t2hataBkIIa5vnF1k8u6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89779F8019B;
	Mon, 25 Nov 2019 11:51:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14477F8016F; Mon, 25 Nov 2019 11:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3140F800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 11:51:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D1E61A0040;
 Mon, 25 Nov 2019 11:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D1E61A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574679095; bh=tEWioOjY6IkcpeTMHql3eeIiYfmL4Sl8lTLECrrHadQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HegtDyrAE0oe9jXaj7IXmI17AKZ+S0/aENgotnflTjEnknMLXvp8a1ifncT+6c4Yx
 EigcNgpOWQoOGQLJphtAc2Tsr74IcZ6KHXoArX5xLJ26p8OPCFHs6AgoXzVmAMZMUL
 jLrHEaq8poybWOIpkGcf+Y4m6ZmHyhW6n1Yk75Os=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Nov 2019 11:51:31 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <20191119104822.15053-1-hdegoede@redhat.com>
 <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
 <56edc7da-ba0f-1ffe-6b31-6eb6b570580d@redhat.com>
 <8d5a2fa8-9294-bee4-1cef-24bcf2c325a9@perex.cz>
 <13c01b25-809f-cbc7-8e5f-db3ac8e99172@redhat.com>
 <s5hlfs46z8p.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <be53c299-32f3-a4a8-e193-a9f30634a490@perex.cz>
Date: Mon, 25 Nov 2019 11:51:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5hlfs46z8p.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH alsa-lib 1/4] ucm: Fix opening of
 master-configs by the card's longname
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

Dne 25. 11. 19 v 11:12 Takashi Iwai napsal(a):

>>> The tar ball is in ftp://ftp.alsa-project.org/pub/testing .
>>
>> Thanks, I've given this a quick test spin, the 1.2.1.1 tarbal looks good to me.
> 
> Jaroslav, when will this tarball released officially?

Oops, it's already in /pub/lib on ALSA's FTP. I just forget to write a release 
note. I will do it now.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
