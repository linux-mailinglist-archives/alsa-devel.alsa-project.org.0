Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A78A37B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 18:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ACE51678;
	Mon, 12 Aug 2019 18:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ACE51678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565627891;
	bh=vSaT6iWYWGpVQ1cnU1Wqjk33gbrHGW5CK3k8tZraQtM=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnk5vgqOoh/xq7s2fxBTlZVPa9IL/b8Iebi3+JBSeVWdNvrteTAdRBPDRDw18cBDj
	 1nSDfjwiqaBiv8SZfM3/GDCct/T4nlAKobGvgthfeQqa9S0qCy8+9JatIpa+l+0Q8a
	 Tla9FKM6Le2CCDjKkHuZjpXhNboMRRLgGISMkRlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71525F80213;
	Mon, 12 Aug 2019 18:36:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BBE7F80213; Mon, 12 Aug 2019 18:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 874DFF8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 18:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 874DFF8015B
Received: from olorin.ladisch.de (x2f7f8ba.dyn.telefonica.de [2.247.248.186])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 06ACE5583C0D
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 18:36:13 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <CADsNRHvYVykXZ7C+DF14NACxFWYukUAe=aPZ_uo+=_YgBiQYSg@mail.gmail.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <ec17ee5b-e832-7abb-f151-eab3860f7156@ladisch.de>
Date: Mon, 12 Aug 2019 18:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CADsNRHvYVykXZ7C+DF14NACxFWYukUAe=aPZ_uo+=_YgBiQYSg@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at webclient5
X-Virus-Status: Clean
Subject: Re: [alsa-devel] asound snd_pcm_start question
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

Eric Desjardins wrote:
> I call:
> snd_pcm_prepare
> snd_pcm_writei
>
> and it works fine but I would like to delay playback start.

The device starts automatically when start_threshold frames are
available.  To prevent automatic starting, set it to a value that
is larger than the buffer size, i.e., the boundary value.


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
