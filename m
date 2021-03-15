Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7833ABD8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 07:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FD41773;
	Mon, 15 Mar 2021 07:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FD41773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615791480;
	bh=ln7Y1uJ5A2i8wLVygyN741mpMenSYp+3HBgW7yrh/hc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMsErZjKuEgpQMjDOE62kVGDaWcTtNMJ2Htsi3lRYrfF1YLxG3UE5EAAo3DthQCQD
	 2YtJFU6fcawtDhZRtDsUJAGalup8oL/ioRZrdIiOpOm9SxFF8hDKnkFEFQ8adgzH0k
	 8YOUr4hnuCVSbWbQKLF1QHnLSVmFOMovLw450irg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA1EF8010E;
	Mon, 15 Mar 2021 07:56:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2532AF8013F; Mon, 15 Mar 2021 07:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80574F8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 07:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80574F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="JaVcywpA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=TMhXja6aH5Gc0pZUQsRreijXcAUMr0IuN3sOj2XUIrE=; b=JaVcywpA2/boDc7xVfhwi98DQs
 jY6VtUh3F65UoudY3MyxZ2Lw3ASI73LEsPN9Lv0K2564pu8dFaQgSX6dclYm2qkDOoXTslfYf+UVl
 4fDQUCWUlj+4nvDjxtSnfxWmHfYBL+RFNcemhZF2XF6TceRoFeJJdLAs/VJbxm98giM9iLSIDfE6n
 HB9LJ/v46i+fTsgus9pq4iWn+OO+FXD/Wy/tWnXehKnw1jIjxOdUhbmo5uhZ/phjq/0h7YpvU0gAD
 JoKpZNwGVmHwXzEqyJ1syHJtWaGmf2ubEynmXbeg6CIoBurs0uoOJ9OWdY0CFoM/QCHSGfJhJFml1
 0906fsIw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1lLh9I-000EOK-2c; Mon, 15 Mar 2021 07:56:20 +0100
Received: from [2001:a61:2aea:a901:9e5c:8eff:fe01:8578]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1lLh9H-0008uH-Uc; Mon, 15 Mar 2021 07:56:19 +0100
Subject: Re: kernel branch for submitting patches
To: Mikhail Durnev <Mikhail_Durnev@mentor.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <5ba29b85-8a09-60c3-6de0-868fc9574ded@mentor.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <157ccead-a812-3c8f-fdcd-134167501076@metafoo.de>
Date: Mon, 15 Mar 2021 07:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <5ba29b85-8a09-60c3-6de0-868fc9574ded@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26108/Sun Mar 14 13:05:46 2021)
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

On 3/15/21 7:35 AM, Mikhail Durnev wrote:
> Dear All,
>
> I am new to ALSA development in Linux kernel. Is my understanding 
> correct that new patches should be created against the for-next branch 
> in https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git ?
>
> When I tried to create a patch on top of the master branch of 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git and 
> send it to linux-kernel@vger.kernel.org, my patch was ignored. Reading 
> docs from www.alsa-project.org did not help much. In this mailing list 
> I found that patches should probably go to broonie/sound.git for-next 
> first. Looking forward to receiving your help.
>
Hi,

There is a section in the "Submitting Patches" documentation that 
describes how to figure out where to send a patch. See 
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#select-the-recipients-for-your-patch

You are right that the Mark's for-next branch is what patches for the 
ASoC framework should be created against. There is also Takashi's 
for-next branch, which should be used for any non ASoC audio patches.

- Lars

