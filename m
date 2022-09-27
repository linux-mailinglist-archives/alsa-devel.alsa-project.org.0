Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7D5EED90
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8148CE0E;
	Thu, 29 Sep 2022 08:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8148CE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431702;
	bh=1Fwar725Kyl1I+c/VFYd8WrvJj7LyimhDqngJd5hD5U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mShtQHAesxKgq4O5EhKk9Tnr7sAem3uBbbS/JeSzgBi5mg6aPcrrwZ8wkxs6p7QS7
	 zl1BGsheB7hsFh5PoBLfCmfotzQ1r3JDNQBUJ5o9WIU9CJ3s0eEFLr/tx2hUVPSNUi
	 L7zSFS0NoHRGqCRChFwBx27wvwilrvG4w6U+WM4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C35BF80095;
	Thu, 29 Sep 2022 08:06:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 301F7F804D0; Tue, 27 Sep 2022 15:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63A45F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 15:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A45F8011C
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4McLDP3379zHqJM;
 Tue, 27 Sep 2022 21:33:25 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 21:35:41 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:35:40 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
 <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <christophe.jaillet@wanadoo.fr>,
 <peter.ujfalusi@gmail.com>, <alsa-devel@alsa-project.org>,
 <patches@opensource.cirrus.com>
Subject: [PATCH -next 0/4] ASoC: Use DIV_ROUND_UP() instead of open-coding it
Date: Tue, 27 Sep 2022 22:09:44 +0800
Message-ID: <20220927140948.17696-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:06:37 +0200
Cc: shangxiaojing@huawei.com
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

Use DIV_ROUND_UP() instead of open-coding it, which intents and makes
it more clear what is going on for the casual reviewer.

Shang XiaoJing (4):
  ASoC: cs35l36: Use DIV_ROUND_UP() instead of open-coding it
  ASoC: wm8978: Use DIV_ROUND_UP() instead of open-coding it
  ASoC: rsnd: Use DIV_ROUND_UP() instead of open-coding it
  ASoC: ti: davinci-mcasp: Use DIV_ROUND_UP() instead of open-coding it

 sound/soc/codecs/cs35l36.c   | 4 ++--
 sound/soc/codecs/wm8978.c    | 2 +-
 sound/soc/sh/rcar/core.c     | 4 ++--
 sound/soc/ti/davinci-mcasp.c | 7 +++----
 4 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.17.1

