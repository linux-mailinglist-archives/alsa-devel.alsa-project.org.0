Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931433AB9D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 07:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81921773;
	Mon, 15 Mar 2021 07:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81921773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615790245;
	bh=Y53x6QpKkUZebQxqPfj9gduKtxet9w/9GWREsVgsPgw=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TYqfif1cXqD+OAy+/RHc+9z76fLcjXUyD77OII2qpcM5a5hyeRHkVNT9xspnArzNT
	 pc9i8m44R7zj53bmOmA+Ki6cOS4I0EfG7VWxUGmrvV2FBfBGA6mnN5s4UU2JHztIY3
	 FtBiYSZHiCWvCBnO0QP+ef2KXV+RWvSgkzWyn5rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CEB4F8010E;
	Mon, 15 Mar 2021 07:35:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF30EF80171; Mon, 15 Mar 2021 07:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1767FF8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 07:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1767FF8010E
IronPort-SDR: giWFF4CZuXu8HO9kiEKu+QWkNK4rYw3CKAZaVt33b1PJYiS4a8aGGRqt2m3FiD66G1JBJvUxhg
 HJfzD5GM6rDot+KTUPK38TYoyUM2bRo40TL0R9y4pfMBdTKXrsZ/5XMUo/dtRdpJbXkvhMZh0a
 nKT5o9i6KYPGvZFmlGNq7hA1Uk3oI6pGjSfBLRvuWm9fb5Lugbim7tHRdxTc1OGOgBPRI8j71g
 ajbhmenonTy+pFLdXCyh16q//yDrnexNpE1TH6njBOayvRUqddxpawShuP0t1C53ffXRGW14kq
 BBo=
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="59075543"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 14 Mar 2021 22:35:40 -0800
IronPort-SDR: eVwsTFcCONWn6+Oecq+8fzMCQ8Qooph0l9FMjFrHn3wRNQ9pMGZtDdPNXH4TSNbtQlxPOu/dWS
 vka6NZsnOgPnBT/PfOQZzm4NiL9FC1d4Vjbxs3qrZSdiwwPHPT5Ozfl5TGaCfkTytYIGuzcfkO
 rtdGqLJEsnUGJ37RAiEiLykVjZz5R4hs1Gh5bik9rlgWTe2/mKfW6KxeCBhVOCEd3iq0V+rGBc
 prPKV1Hq2tmsJt0Rxh039Al346npbi3RQUbv2up33ihWFggkolQukS3ATrKGqgw++2XVNmCmO6
 qSM=
To: <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
Subject: kernel branch for submitting patches
Message-ID: <5ba29b85-8a09-60c3-6de0-868fc9574ded@mentor.com>
Date: Mon, 15 Mar 2021 16:35:26 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
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

Dear All,

I am new to ALSA development in Linux kernel. Is my understanding 
correct that new patches should be created against the for-next branch 
in https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git ?

When I tried to create a patch on top of the master branch of 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git and 
send it to linux-kernel@vger.kernel.org, my patch was ignored. Reading 
docs from www.alsa-project.org did not help much. In this mailing list I 
found that patches should probably go to broonie/sound.git for-next 
first. Looking forward to receiving your help.

Thanks,
Mikhail
