Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CF12903F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 00:23:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3E9166E;
	Mon, 23 Dec 2019 00:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3E9166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577057005;
	bh=3QX+/p9kbjh3Mj+lgdmyVHu92RGxuA7BG4ixcZvxogk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1Ytga6N+DgVMALqMgTjMwjxGuvBV9zcENMoSTlWPN7n4MGy/siTv7fpJrM51SPAW
	 itSMYQzG9sLLkZHN1UJQ8isiM0V/HS4bjAU2JrTufBgbZ3QxAPW3KHOfaCd2d/CLKZ
	 4WI/VJzdllmNkPBNsZqKkUE0vhAtI/suNuhIi45k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D27F80148;
	Mon, 23 Dec 2019 00:21:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2286F80136; Mon, 23 Dec 2019 00:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BD632F800AD
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 00:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD632F800AD
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1577056894736834049-webhooks-bot@alsa-project.org>
References: <1577056894736834049-webhooks-bot@alsa-project.org>
Message-Id: <20191222232138.A2286F80136@alsa1.perex.cz>
Date: Mon, 23 Dec 2019 00:21:38 +0100 (CET)
Subject: [alsa-devel] How to install on debian buster?
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

alsa-project/alsa-ucm-conf issue #8 was opened from kopax:

I use kernel 5.3 on debian buster and I am following thos offical Lenovo tutorial to install the microphone on my x1c7:

https://forums.lenovo.com/lnv/attachments/lnv/lx02_en/3199/1/Enabling%20audio%20on%20the%20X1C7.pdf

It says:

![image](https://user-images.githubusercontent.com/1866564/71328607-1a5e8180-251a-11ea-8621-1655d7746c60.png)

Now the [link](https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm/sof-skl_hda_card) is 404, what do I need to get now ?

Thanks in advance and merry xmas!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/8
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
