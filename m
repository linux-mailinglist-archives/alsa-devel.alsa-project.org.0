Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37B2D95A9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 11:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5119A1757;
	Mon, 14 Dec 2020 11:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5119A1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607940114;
	bh=VDesvarqFmTNv353FzQSNpo19ZpMichzC96ONasgYwc=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYjEJ4kKDBEh17TrSNVyA0VbZ7IayLfeEFX642+fz6dlc6pxEZHsVekhDY7f8/0PY
	 vCx97zyGDLc1jtZ+1wnzutbUC6QPsXybUIHreFvC3lCcVGUXRRLZy1GeeRvo+MRXeD
	 +tVE9z0toVY5hlR5MYaTdxvq41Yfez65jrGUs1sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BC3F800ED;
	Mon, 14 Dec 2020 11:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98822F800ED; Mon, 14 Dec 2020 11:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A674BF80171
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 11:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A674BF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="Gj9umrdr"
Received: from epcas3p4.samsung.com (unknown [182.195.41.22])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201214100003epoutp012a4b4e52079dabcce99bb086c8026e72~QjOnj6qPT0479704797epoutp017
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 10:00:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201214100003epoutp012a4b4e52079dabcce99bb086c8026e72~QjOnj6qPT0479704797epoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607940003;
 bh=VyQD8fRZvpo5VaueWpf979fbEfFaB66sVWb9/VfA0Fs=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Gj9umrdr1JUesJSbWlKHENM1sXgRpyNsGPx18R2gBNJD/kTKcW2s359ceMnRKR6Jm
 4Nsha9sYOVrX8FgqzQMKPLS2PML2amYyxINiZYm/SqUgJ1fVn30zVQyRCpUL+N/EBS
 oOcCZsBRSG9uX540cTkoh3gwRTiAPRpkQf65+Klc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20201214100002epcas3p4d82da0454a28125ffe50cf839f834a6a~QjOm5SRCj2981629816epcas3p40;
 Mon, 14 Dec 2020 10:00:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp2.localdomain
 (Postfix) with ESMTP id 4CvcM62XPhz4x9Pq; Mon, 14 Dec 2020 10:00:02 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20201214083825epcas2p3c1b9e236ec1342195c46d91c6f29fb21~QiHWcUX_x0781207812epcas2p31;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201214083825epsmtrp13657e68ac845b1c3a4739faccfaa8698~QiHWbYfTS1364913649epsmtrp1U;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
X-AuditID: b6c32a2a-73fff70000002229-5e-5fd724815c52
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.1C.08745.18427DF5; Mon, 14 Dec 2020 17:38:25 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201214083825epsmtip27633dcc8eea0396ff89522cdf4ea347b~QiHV_CSV60496604966epsmtip2p;
 Mon, 14 Dec 2020 08:38:25 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
In-Reply-To: 
Subject: [PATCH v3 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Mon, 14 Dec 2020 17:38:24 +0900
Message-ID: <1007309018.21607940002350.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AdbJUeENUhUsXEa3TZiLDsAvVI+A+AIogZow
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSvG6jyvV4gwM3lCyuXDzEZPHykKbF
 3R/mFjO2dbNYNN6bwGax+uoWJotXh3cxWny70sFk8ev/MyaLoxcXM1k03G1mt3i5+Q2TxZHG
 KUwOvB4bPjexeeycdZfdY97JQI9vZyayePRtWcXosfl0dQBbFJdNSmpOZllqkb5dAldG/5Np
 jAXTeCoWb1vM2MD4gLOLkZNDQsBEYsfhe6wgtpDADkaJ/ReKIeISEh/mn2GHsIUl7rccAarh
 Aqp5ziix/OZdsAY2AV2JL/fuMIPYIgJBEguW/gUrYhZ4xyQxcc1HFoipPBKvNuxn7GLk4OAU
 4JWY8M8aJCws4CVx5vdZJhCbRUBVYt/M7WAzeQUsJQ4d2QtlC0qcnPkEbAyzgJ7E+vVzGCFs
 eYntb+cwQxynIPHz6TJWiLiIxOzONqh7jCSOv9/CPIFReBaSUbOQjJqFZNQsJO0LGFlWMUqm
 FhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIER6OW1g7GPas+6B1iZOJgPMQowcGsJML7u/5y
 vBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MbQ9V5z86
 vMJyirMgY5jSYue/b7IX3o1IyVTd9W3W8YQWcdN1jw8ZvOt/s971xEnX5+fvPmMKW7/SanGc
 cHDpndsT+U19OL7c6+2YKHF6u9eREKe7FrFzFR49ZDy4KT5WkDVgcr45N6PzzXWaP3K+ur/M
 +L7Nvn+V9j5hhXcLi7NU/poUsB8Oudud0HL41RmvF1tDNJ5s3Xm68HLOh8bfq51d9m4qaH+0
 RvHQtDMvvVQZ+nJrr4tYrGr9OeOM1LVdvm6N01R2H57osJdj7mbllbH1u6ZJ+XqLMNzsl//B
 t8Ep9mW/Zuo7mVnP1ho5xB6f1O97XHX6ynMiS77xRhZPEzix7/lPBSdP/djFHCJPPZRYijMS
 DbWYi4oTAX1NVVc1AwAA
X-CMS-MailID: 20201214083825epcas2p3c1b9e236ec1342195c46d91c6f29fb21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201214083825epcas2p3c1b9e236ec1342195c46d91c6f29fb21
References: <CGME20201214083825epcas2p3c1b9e236ec1342195c46d91c6f29fb21@epcas2p3.samsung.com>
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



