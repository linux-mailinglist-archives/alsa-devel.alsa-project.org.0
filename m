Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3B1FF71
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 08:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074AC16A8;
	Thu, 16 May 2019 08:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074AC16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557987458;
	bh=ehS6QWYETQ3rLlH23Qm+grEnUlnur69vkB//le4XkyU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=reRpSO+0L25ibQigmUv8w9dJm1K3/7KC/6IUGahJ79SACE6F/nlF9IhqeorQPVSJs
	 pYouHnA7F7sQ40+2jIpj5Lmxl2UW1ykuLQUgO0BGgaXKy0WNssth1jp6xe43JwzcOc
	 Z9LAhT/I9zJYjUrEfH7HboxHyz+w7pdrXsEt2ikQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB07F896B9;
	Thu, 16 May 2019 08:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B82EF896B6; Thu, 16 May 2019 08:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79FB6F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 08:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79FB6F80C18
Received: from [103.217.166.89] (helo=[192.168.1.154])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1hR9fd-0005VK-25; Thu, 16 May 2019 16:15:16 +1000
To: "S.j. Wang" <shengjiu.wang@nxp.com>, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <e182bf72-c369-7344-e4d1-0524b09ca489@flatmax.org>
Date: Thu, 16 May 2019 16:15:11 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] ASoc : cs42xx8 : merge cs42xx8-i2c.c into cs42xx8.c
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

Do you think it would be a good idea to merge cs42xx8-i2c.c into cs42xx8.c ?

Is there a reason to keep these two related driver functions separate ?

Here is their source code :

https://github.com/torvalds/linux/blob/master/sound/soc/codecs/cs42xx8-i2c.c

https://github.com/torvalds/linux/blob/master/sound/soc/codecs/cs42xx8.c

Matt

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
