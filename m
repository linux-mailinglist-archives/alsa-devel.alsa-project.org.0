Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207F1FBF0D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 21:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBDE51679;
	Tue, 16 Jun 2020 21:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBDE51679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592335948;
	bh=vxIbknIDOpY0n8dzfj/MQSDsvq14slq4x/GztH8qt6M=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBqjhltzSrIvHEkoKQEY0GTWcwJQKS76xTBzgy+yMMRnKr/GS25l7nVKT4vezg4yO
	 IbhCsdGPbe1kIxsL/sUNez7nYBylUdGo4N9A8FX28t0aOSI+O6Qk22jf97JnFU//dW
	 FUfX3Zc7Vx3M4OpET71uWfjfiQNO9ZDQaezUpJFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F378FF80232;
	Tue, 16 Jun 2020 21:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 875E2F8022B; Tue, 16 Jun 2020 21:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD945F80101
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 21:30:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D16E7A003F;
 Tue, 16 Jun 2020 21:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D16E7A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592335837; bh=+Sk36dUMIby1XKyUOie5g10Uioiw6igLPOavjUUu8pI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=X+oBaBP9eQJHfO0b2cisVuYlwb+/9Ys3wvuP2+mebrc0+N8QtRmAUXTNwWXwdYePK
 4NJb3fEJ5fJJeBDUytmsiXuT22SClSd/TH9eLpO/HuL5NAa1f8yVNL4fmjxuFwW+W3
 wd1wdiU5C7BB3Je+7scgWDR7/XRCZwJhfDDbyNYk=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 16 Jun 2020 21:30:35 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] control: ctlparse - use type-specific bound on
 element count
To: John Keeping <john@metanate.com>, alsa-devel@alsa-project.org
References: <20200616182930.480959-1-john@metanate.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a9e1fa18-2b82-fc2b-0109-c5d5eb4c3563@perex.cz>
Date: Tue, 16 Jun 2020 21:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616182930.480959-1-john@metanate.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 16. 06. 20 v 20:29 John Keeping napsal(a):
> Using a fixed bound of 128 means that too many values may be set for an
> INTEGER64 type and that any elements past 128 are out of reach for BYTE
> type controls.
> 
> Derive the maximum number of elements from the type so that the full
> range is parsed for all types.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Nice catch. Applied to the alsa-lib repository. Thank you.

			Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
