Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99622BC824
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 14:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243AC169B;
	Tue, 24 Sep 2019 14:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243AC169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569329247;
	bh=5tWXgkshX21+Vle1JEa6xTsY1Xcmd0jCGX2HGAwUQms=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kxI610lxrnEhdzBIsVbQE8bUgb/gTt61MXEi6SytBUlWKxH759T1nW9DBUfqCbz/U
	 23FugnNoJhFVsxqipxVsV3MNgtAwAcWEz91Qke8ln8GDHXAJCrNb4QbI18ySQxpcGz
	 38B3JRKdSjoaidG9oCL5TxYU76FSXxtPtihTWPUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9718FF803F4;
	Tue, 24 Sep 2019 14:45:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C53EF8045F; Tue, 24 Sep 2019 14:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CD4F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 14:45:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3819BA0040;
 Tue, 24 Sep 2019 14:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3819BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569329136; bh=ybKeTJlIQh2Z79F5xCkSoWkQAVmY1997W6vMbsp0Dvo=;
 h=From:Subject:To:Cc:Date:From;
 b=DjCziQNn6PowjVxEZeb+e5Ohb3XD+Q/23+SBUivagS8z452w0PJA1Qmef33iSTqXj
 mKaY3yqsBt+qjOwT4D80sOxN8emArMzvGw8F/LYqkYITPt8nFWaXrXEmQeb+0I+waV
 odp06O8P07LSd77vK2Shm1J2Hlha+TtK3iAkxu94=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 Sep 2019 14:45:32 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Message-ID: <d828cf2f-03e2-5609-9561-54b1ad301a62@perex.cz>
Date: Tue, 24 Sep 2019 14:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] alsa-ucm-conf repository - initial import
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

Hello all,

  I just made an initial import to to alsa-ucm-conf repository which is in the
'import' branch:

  https://github.com/alsa-project/alsa-ucm-conf/tree/import

  I do not have the BSD-3-Clause licence acknowledgements from some minor
contributors. I do not think that it's a problem. I would expect that if we do
not have a disagreement, it is fine.

  The question is, if we need automake/autoconf tools to package those files.
It seems to me that it might be clever to keep this ASIS for now.
Users/packagers can just do 'cp' to the appropriate directory.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
