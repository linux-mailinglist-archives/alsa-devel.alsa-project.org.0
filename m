Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF413B1504
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 22:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B75166C;
	Thu, 12 Sep 2019 22:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B75166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568318635;
	bh=QUiqE9NgNURS1IhJTZI/RFHLIkNfpk7U53gUD9eWBTc=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OS/oITip/81q07hp/OxIUm5U9ufXOKEEVzIQHxczRzQNhpGH/J1Tk0omStp4Y7UJd
	 hXPgKTmjBcZI4H3pzAx0tOTqIM0YyV77wlf5zXMMQzBJ+uy042fpBSpfBE6tgQkiOW
	 IGbF989PzBUDzdycqrGMMn0mR14byHqXyk7Omoms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE794F80368;
	Thu, 12 Sep 2019 22:02:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B50F4F80368; Thu, 12 Sep 2019 22:02:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C43F80143
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 22:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C43F80143
Received: from olorin.ladisch.de (unknown [46.114.32.78])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 3322F5583E5E
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 22:02:03 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <1000767908.8406503.1568280868516@mail.yahoo.com>
 <e9f48f93-6974-5dde-61dc-1d6d8dc4260f@ladisch.de>
 <593282117.8695389.1568302489535@mail.yahoo.com>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <73f79d55-07ab-5b69-100f-e96403d13366@ladisch.de>
Date: Thu, 12 Sep 2019 22:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <593282117.8695389.1568302489535@mail.yahoo.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at webclient5
X-Virus-Status: Clean
Subject: Re: [alsa-devel] alsa compliance test: H340 (USB audio) playback /
 capture rate asymmetry bug?
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

Hin-Tak Leung wrote:
> # lsusb -v -d 046d:0a38
>
> bEndpointAddress 0x01 EP 1 OUT
> bmAttributes 5
> Transfer Type Isochronous
> Synch Type Asynchronous

This device regularly reports to the host how fast it wants to receive samples.
If that is not the same speed at which recorded samples are sent, then that is
entirely the fault of the device's firmware.


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
