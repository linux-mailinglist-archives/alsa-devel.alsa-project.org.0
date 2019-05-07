Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CA15D15
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 08:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1085117B0;
	Tue,  7 May 2019 08:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1085117B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557209408;
	bh=K3OEwuK4V/J+PY2AshzZ/xaaAWOwedA1ga/+iParcXk=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRrpxdGpqji9YrTp3tJGIBMeIC5PRQlW/T6sRmimNTpC4arwOSCjSG+tyImuxOZai
	 XqY7EkS4zHW9t0LqrKijYLNAsJts+ocU5SdeG3i8GZrwRJRRRoeg7QI1XGjwvz3nNv
	 p/0cdz/kEmBzlsOlOXXdmAX1cd5UW7hf+1ojGx/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D21F89682;
	Tue,  7 May 2019 08:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC60F89674; Tue,  7 May 2019 08:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS
 autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A07FF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 08:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A07FF807B5
Received: from [10.1.2.4] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id ADA415583451
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 08:08:15 +0200 (CEST)
To: alsa-devel@alsa-project.org
References: <bdc0a30f-c6f3-8ccb-f556-1d1a6a68f3b9@flatmax.org>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <1c0e5dbe-d5d5-c505-3b62-77e5fab8ee3d@ladisch.de>
Date: Tue, 7 May 2019 08:08:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bdc0a30f-c6f3-8ccb-f556-1d1a6a68f3b9@flatmax.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.4 at webclient5
X-Virus-Status: Clean
Subject: Re: [alsa-devel] cs4265 : alsactl store and "C data buffer" fails
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

Matt Flax wrote:
> When alsactl store is run with a cs4265 chip, the following error occurs (from https://github.com/Audio-Injector/Ultra/issues/25) :
>
> $ sudo alsactl store
> alsactl: get_control:256: Cannot read control '2,0,0,C Data Buffer,0': Input/output error

This sounds like a bug in cs4265_readable_register(); try replacing CS4265_SPDIF_CTL2
with CS4265_MAX_REGISTER.


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
