Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B367294E25
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 15:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A03217F6;
	Wed, 21 Oct 2020 15:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A03217F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603288738;
	bh=hE19x5eREx6b4XL71tFCwca4BNiqRzIrWQcdAFsJQ5c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CafdNV3S7l7r398AXTZ7iIV9KoQafXu3nB85kWvwRsUgA6Suzk0Zh70w/TtbGQZ9v
	 dTOiKkHF6BZmYYdEAwt43MGK54l9l2YhfFSTuHnMhQwpFfgEYnU0cLHg+AA4YHUjvZ
	 yMgEO0ueGW9fJM/vxxvLLY5Luylmd+DKpK5ppwMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C99F80277;
	Wed, 21 Oct 2020 15:58:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BF34F80272; Wed, 21 Oct 2020 15:58:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B515BF80264
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 15:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B515BF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="bEkY2uHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=951; q=dns/txt; s=axis-central1;
 t=1603288678; x=1634824678;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=GhsTwaG030Ho7aL78CG5i8LWFa+UPDRUjbrFPEkT3/A=;
 b=bEkY2uHEwFKyvqaEIew5q6AJS2JtCDfMhAG0CwHA/Vs8A9pM993DUv1o
 WkN8v14RKDKkWObgHLlsn3J0wu6EACPFYu8VIUDd2CfCqVwbAt2Xx8/hj
 NL1WR0BeQNpsLZ/pQCJ3D5O0e02PMnhBYcbbO0Ig/SWzZ+ICKM93GdNme
 VJBSokcZ5PNT2ig+lMs02FhVN2aM0BUXjc9FwFj75XKvmpwzfcIxDPHMZ
 6bCXMAefFaZ/w9b4OqrKKLa/ybbH//C+RLLPP5GBQia/Urfm8IbOaAa5D
 6Y4GJvJDFD+3D/iEd8x58DO41bq6XrfqP4kun79ZcGS87V30X/GT315Hw Q==;
IronPort-SDR: 8E0ehORx3hOoSjRngypIBAlMy1Y4jjeUyvpEjqf0tCvZcrd7EMeuckLyuL1C+DLXvUha2cETZv
 70uLBSBZoNbm9QOOR/r9oBN6zw4MIv2gvvhM3sPwjqFJQD341nD/96n2rCjv3zX4wjS6VGIpqd
 IjGh6MpO5uYGsMe52maUWNxC6WUwwF5l6k6Eeqkw8y/bzP3oiNpzQEpXjnRyAgVktSI8ZCi22E
 GqvE9xmx+WAzbZfn2D1+jFnvFvgFD29dC28ZuYFhPwU0bdbFYkJ9hzjtw/3we9vIIVMge2R7gD
 QjU=
X-IronPort-AV: E=Sophos;i="5.77,401,1596492000"; d="scan'208";a="14261687"
Date: Wed, 21 Oct 2020 15:57:50 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Amanda Ava Koci Pereira <arsoftware10@gmail.com>
Subject: Re: How to downmix 5.1 and 7.1 channels to 2 channels
In-Reply-To: <CALAz8EWAKP-LaeDyQZW0BauwYBthSbgJgxRT8hypuXEWEOfPhA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010211554200.22113@lnxricardw1.se.axis.com>
References: <CALAz8EWAKP-LaeDyQZW0BauwYBthSbgJgxRT8hypuXEWEOfPhA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


On Tue, 20 Oct 2020, Amanda Ava Koci Pereira wrote:

> Hi guys...
> 
> We need some clues about to downmix 5.1 and 7.1 channels to 2 channels
> 
> for the moment we are using the following code ->
> 
> It works but fails miserably if all channels have data at same time
> 

Is the problem that you get clipping if there is audio on more than one 
input channel?

In general, if you sum a number (N)( of digital channels which have a 
maximum amplitude of M, then the maximum amplitude of the sum will be N * 
M. So in this case you need to reduce the output amplitude by 1/N if you 
want to keep the maximum amplitude of the sum at M.

So in your case you need to set 

> #define AR_K_P_ATTENUATION_LEVEL 1.0

according to the number of channels being downmixed per output channel.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
