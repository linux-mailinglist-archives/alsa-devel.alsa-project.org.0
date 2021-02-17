Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979931D4A0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 05:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B671664;
	Wed, 17 Feb 2021 05:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B671664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613536506;
	bh=o8U5KoAd6x0LVdKpFBWmvOF1r1lju60820+aX+Eabi0=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fHOGpBp+XgdJunHpt4FzfYDO3X4T3u3RfmMJ8nTNhTI/HBgHx3zwnEx1IsTH1EoLo
	 jF1Vx9xqLUaQptwGud6C24CxeIcxY/eQT6R52wQyThbIboZBKfSanvV0U8rymiVAVi
	 akvkIrgyLdUMBJAuvGp3wEbMtvgREBj3WhJbO7NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFB4F8026C;
	Wed, 17 Feb 2021 05:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B76E0F80258; Wed, 17 Feb 2021 05:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 781C9F800AE
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 05:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781C9F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="TpAhsHFE"
Received: from epcas3p4.samsung.com (unknown [182.195.41.22])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210217043303epoutp043f7073d4f4b6d6c0eaafca38fb56d07c~kbsqdrtEF2872028720epoutp04c
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 04:33:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210217043303epoutp043f7073d4f4b6d6c0eaafca38fb56d07c~kbsqdrtEF2872028720epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1613536383;
 bh=tNvHFvGNgL+TBgOeD3O/+0wn2FeG+02bXJOXTYoh8p4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TpAhsHFEQWs7Op0PjQ9dGDvoNwtv8fhOo5GMJX8RoNoQqgBSRrT5q6dQ7OZGZZ4px
 GFggddqQ/vkyVmMv5ukRNb+3dJg1or69/Trko+eLj9cgzV71u1WFKQkk54pYGPL6RD
 Z0qeizTOKov1d9m3x+SWtPUQ8l+X0Q/DwgvOxQ6Y=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas3p3.samsung.com (KnoxPortal) with ESMTP id
 20210217043302epcas3p3df21f6bf4cdccf7870c0f9cbc77fd691~kbsqEMp2R1307113071epcas3p3l;
 Wed, 17 Feb 2021 04:33:02 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp4.localdomain
 (Postfix) with ESMTP id 4DgQ1p3tz1z4x9Pq; Wed, 17 Feb 2021 04:33:02 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20210217043113epcas2p1880f919a2c4cb792f74d83e8c952df85~kbrErdEIV2723927239epcas2p1b;
 Wed, 17 Feb 2021 04:31:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210217043113epsmtrp2f8fd27c5d34284172c293dd472c89956~kbrEqhYmF2293422934epsmtrp2X;
 Wed, 17 Feb 2021 04:31:13 +0000 (GMT)
X-AuditID: b6c32a29-f3fff7000000349e-4d-602c9c11b0f3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 21.37.13470.11C9C206; Wed, 17 Feb 2021 13:31:13 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210217043113epsmtip1419d332c76c83d23895180ccf0e9a360~kbrEcYZjy2952929529epsmtip1S;
 Wed, 17 Feb 2021 04:31:13 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <broonie@kernel.org>, <cpgs@samsung.com>
Subject: [PATCH v4 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Wed, 17 Feb 2021 13:31:13 +0900
Message-ID: <1796371666.41613536382543.JavaMail.epsvc@epcpadp4>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcE40JLVrKBvuDGRF23fJdIJ5I6YA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnK7gHJ0Eg83HVC2uXDzEZDH14RM2
 i5eHNC3u/jC3mLGtm8Wi8d4ENovVV7cwWbw6vIvR4tuVDiaLX/+fMVkcvbiYyaLhbjO7xcvN
 b5gsjjROYXLg89jwuYnNY+esu+wem1Z1snnMOxno8e3MRBaPvi2rGD02n64OYI/isklJzcks
 Sy3St0vgyti++ypbwT7Wimtv/rA3MO5i6WLk4JAQMJH4tDC6i5GLQ0hgN6PExtkLmbsYOYHi
 EhIf5p9hh7CFJe63HGGFKHrOKLF/fxMLSIJNQFfiy707YA0iAlkSL//fZQYpYhZ4xyQxcc1H
 sCJhAS+JfRO3sIHYLAKqErM3Pgdr4BWwlNj8cCk7hC0ocXLmE7CLmAX0JNo2MoKEmQXkJba/
 nQN1kILEz6fLWCF26UlM3TadBaJGRGJ2ZxvzBEbBWUgmzUKYNAvJpFlIOhYwsqxilEwtKM5N
 zy02LDDMSy3XK07MLS7NS9dLzs/dxAiONy3NHYzbV33QO8TIxMF4iFGCg1lJhJf9s1aCEG9K
 YmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUyyKju4duf+/yTX
 sWRqtvy3ry+XqkddEjSP938U8PCov/2Lv9dCA3Pva6bpSvne8wkN+/p4jWqC2v2f6bs/Crpl
 MGza68Xy8etsqU971snFsgRODaqdGD7v5NP1z66UHpVbfztBbc3kA2H1zgs262UEbdp41svr
 ypPjBx3aTRQz56onvp1mdETzxT/3n89/XbCxXTxr63cVv6BLe+6YxBlZL7itOuvbzhOqTT/Z
 988MKv++eb9tDmO/Wr+9nd2cMp0dZg2bioyPZ9xZJ51gWpcpy7bbZGXkhUfrJaNUv77d8F/0
 +EOXCRIim+eG6IgZLuj4bMgiz+f2XUjukXC01fd3uTPMzAsTpGKKVALZ4uSVWIozEg21mIuK
 EwE5DdmQJgMAAA==
X-CMS-MailID: 20210217043113epcas2p1880f919a2c4cb792f74d83e8c952df85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210217043113epcas2p1880f919a2c4cb792f74d83e8c952df85
References: <CGME20210217043113epcas2p1880f919a2c4cb792f74d83e8c952df85@epcas2p1.samsung.com>
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

On 2021-01-06 at 12:41, Mark Brown wrote:
>On Mon, Dec 28, 2020 at 08:23:16PM +0900, Gyeongtaek Lee wrote:
>> If stop by underrun and DPCM BE disconnection is run simultaneously,
>> data abort can be occurred by the sequence below.
>
>This doesn't apply against current code, please check and resend.
Hi, Mark.

I resend the patch after rebasing it on the latest of stable linux.

Best regards,
Gyeongtaek Lee

Gyeongtaek Lee (1):
  ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()

 sound/soc/soc-pcm.c | 62 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 18 deletions(-)


base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.21.0



