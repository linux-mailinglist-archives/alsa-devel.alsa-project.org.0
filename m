Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4642CD256
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 10:16:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017B21813;
	Thu,  3 Dec 2020 10:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017B21813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606987017;
	bh=VDesvarqFmTNv353FzQSNpo19ZpMichzC96ONasgYwc=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=W6PaPzZzCHyhnsZ4jKbjbfTWAHhvN2pFUqY4mRfG27KwoyrIaePAKs4OYf82o3pyL
	 lNv7DRJYI7H9PXEqvHUId4EjGVAYMVSJPh3r3ND5jZaQqhrGwKNFaAm6QA5I/Jc0V4
	 BjGJb29OAqVTQSyS3Oga5OjoKXIqwa+bR3xNXhRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5359F80254;
	Thu,  3 Dec 2020 10:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8D74F80254; Thu,  3 Dec 2020 10:15:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C872DF80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 10:15:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C872DF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XKnlgmkT"
Received: from epcas3p2.samsung.com (unknown [182.195.41.20])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201203091502epoutp02a21b3934ef7270f3b45fa47148e595cc~NKhLBFSbA2081720817epoutp02h
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 09:15:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201203091502epoutp02a21b3934ef7270f3b45fa47148e595cc~NKhLBFSbA2081720817epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606986902;
 bh=VyQD8fRZvpo5VaueWpf979fbEfFaB66sVWb9/VfA0Fs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XKnlgmkTTgeKQsqDXwfBb6agmwnI8JHxvaO6QhVC2rjCH5yvPSXaJLWuj9fT6gsXv
 tNVZm/igxqhwuTvc/d+klDDzQ2g4tiq3viA16zzLAtBGtIJ6FiaATFGt167F+jdI/f
 Y6VkJqyN2jrsvEAE3iZZAs4FiGKdFkxvueXe0HGk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20201203091501epcas3p35ed99a0fa8723ac686213b3c255782aa~NKhKvex0q2894028940epcas3p3J;
 Thu,  3 Dec 2020 09:15:01 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp3.localdomain
 (Postfix) with ESMTP id 4CmqtF5JdHzMqYkj; Thu,  3 Dec 2020 09:15:01 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20201203085858epcas2p1258c4c14b9398a15fb348ab92e306a25~NKTJrsJ9h2267122671epcas2p1K;
 Thu,  3 Dec 2020 08:58:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201203085858epsmtrp15bc68d4eadfa3d34784e81a8bb47149f~NKTJqxpRH1029410294epsmtrp1g;
 Thu,  3 Dec 2020 08:58:58 +0000 (GMT)
X-AuditID: b6c32a29-f55ff7000000349e-6c-5fc8a8d2081d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.A2.13470.2D8A8CF5; Thu,  3 Dec 2020 17:58:58 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201203085858epsmtip13f66569007241f5fc6d76a85dfa79043~NKTJcvIgw2483424834epsmtip1S;
 Thu,  3 Dec 2020 08:58:58 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
Subject: [PATCH v3 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Thu, 3 Dec 2020 17:58:58 +0900
Message-ID: <1891546521.01606986901738.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdbJUeENUhUsXEa3TZiLDsAvVI+A+A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTvfSihPxBvcXy1hcuXiIyeLlIU2L
 uz/MLWZs62axaLw3gc1i9dUtTBavDu9itPh2pYPJ4tf/Z0wWRy8uZrJouNvMbvFy8xsmiyON
 U5gceD02fG5i89g56y67x7yTgR7fzkxk8ejbsorRY/Pp6gC2KC6blNSczLLUIn27BK6M/ifT
 GAum8VQs3raYsYHxAWcXIyeHhICJRMOtQ6wgtpDAbkaJq9tyIeISEh/mn2GHsIUl7rccAarh
 Aqp5ziix6c5EFpAEm4CuxJd7d5hBbBGBIIkFS/+CFTELvGOSmLjmI1iRsICXxJnfZ5lAbBYB
 FYmONT+BbA4OXgFLiQervEHCvAKCEidnPmEBCTML6Em0bWQECTMLyEtsfzuHGeIGBYmfT5ex
 QqzSk5h+8zwLRI2IxOzONuYJjIKzkEyahTBpFpJJs5B0LGBkWcUomVpQnJueW2xYYJiXWq5X
 nJhbXJqXrpecn7uJERxZWpo7GLev+qB3iJGJg/EQowQHs5II7+2lJ+KFeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ894oXBgnJJCeWJKanZpakFoEk2Xi4JRqYDK8qSpecENO4XzX3//Wd6RbozM8
 uh5eb09+GskZM893ycFZDQdvyX3nOrWWyffAJ2GNS8WKd/IjvLIlrf8arWue6hMcMd/D+JVL
 mq75soUeq+VfPrnt4V/MePLkNinHL6ulJ/FdEJax/BOxhJV7S6LEUblnuy9MNXy7vDK6UUnX
 9mOl4g3GIo+t67l8nxzcVd4z3+7ZqoIz/TJ81fX6xfJWau1PXeXs93Q5vV781n/Jee/wBXGp
 7D1/i8/Z/Qy5uDHirc9xmzuvY8WWnFrfPfniy0X3rt00bn0TsNtwu+q7azyfgxL8xC3uBf7u
 9WTI47vgPfm3h3Zkz+SG9TLye3Q9lqd9SeJgN/YOPax5TYmlOCPRUIu5qDgRAIhZqZobAwAA
X-CMS-MailID: 20201203085858epcas2p1258c4c14b9398a15fb348ab92e306a25
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201203085858epcas2p1258c4c14b9398a15fb348ab92e306a25
References: <CGME20201203085858epcas2p1258c4c14b9398a15fb348ab92e306a25@epcas2p1.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, 'Takashi
 Iwai' <tiwai@suse.de>, lgirdwood@gmail.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 kimty@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 cpgs@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

>Hi Gyeongtaek
>
>Thank you for your help
>
>> I tried to find out some change from the history.
>> However, I saw that dpcm_lock never be held in dpcm_be_dai_trigger() from the beginning.
>> So, I just fixed some miss from the commit comment and resend.
>> If you have another suggestion or request, just let me know.
>
>OK, thanks.
>I just thought it was related to recent (especially mine :) patch.
>
>BYW, your posted v2 still doesn't have alignment on log.
>Is it mailer issue ?
Sorry.
I didn't fully understand what alignment means.
I fixed the log by looking at some previous commits.

Thank you so much.

Gyeongtaek Lee
>
>> And I have a question.
>> This patch can?t be applied to stable branches directly by conflict.
>> I found out following commits are needed to apply this patch into the 5.4 stable.
>>  ASoC: soc-pcm: remove snd_soc_dpcm_be_get/set_state()
>>  ASoC: soc-pcm: add snd_soc_dpcm_can_be() and remove duplicate code
>> In this case, what should I do when stable maintainer requests resolving conflict to me?
>> Should I send those patches to the maintainer?
>> Or rewrite the patch on the latest of the each stable?
>
>Mark, please help him
>
>Thank you for your help !!
>
>Best regards
>---
>Kuninori Morimoto
>

Gyeongtaek Lee (1):
  ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()

 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)


base-commit: fa02fcd94b0c8dff6cc65714510cf25ad194b90d
-- 
2.21.0



