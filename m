Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C458CA1ED2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6746216CC;
	Thu, 29 Aug 2019 17:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6746216CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092080;
	bh=VchTLieKIRVhvDGZups2W73qV8XE/eeYiNZblYUb5hk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qjGgh5l06H5nvHrCyZg3hL+pSqlywZfAr96LByx0PmrYgA0vd1GgTh6pvZaZ8UMZq
	 qbzX/EnBfFKLny/IIvkHoNvjIrKSgI0aMFqmjLNwMs+UaYFDcBULYc13Z7En+rBgli
	 UsbD+4RdiQQK1iBpoH27Vou9kcLELGQFhAljvny4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92FAF80678;
	Thu, 29 Aug 2019 16:20:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CCCFF8063A; Thu, 29 Aug 2019 16:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9828DF805FE
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:20:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C0BCDA0040
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C0BCDA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1567088428; bh=YT5UWILaDOaMKo18qVEYDBRsUEA+rSucrma7WVJWRUc=;
 h=To:From:Subject:Date:From;
 b=aoMW9P7Pw/39IwrJRr5Ewr8xZ4XcCyhEJW0cjOEzFzQ2wW+UqQbGkknR49d5F5JJ5
 S6CGuD4g3p1cgovZhTIpbjy/OSjGPF0o+fvuMp/06YYWKqNmmpMnOixe3DmHZk5jyg
 8mBc7AEl5Y6PuHXtFYrs5O9ewrT8USKQOj+3DrOQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:20:27 +0200 (CEST)
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <669e36fe-5094-bd7c-7ccc-c8d68f20ce9f@perex.cz>
Date: Thu, 29 Aug 2019 16:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] mailing list outage
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

Hi,

  I am really sorry, but the e-mail delivery was paused for more than one day
for this alsa-devel mailing list. The problem is fixed right now (messages
from the queue are just being delivered). No messages should be lost.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
