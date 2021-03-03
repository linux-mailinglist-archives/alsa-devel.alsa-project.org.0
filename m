Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CC32B509
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 07:06:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CAA1AFD;
	Wed,  3 Mar 2021 07:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CAA1AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614751607;
	bh=hfjfwuUz5hCp1EJJ8uIVJx4l3pAdWlBvNdzqCa5OzYY=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UUUhaGeACd/yMbQc8nIJJArrkvsJKSWHs6bYbXPw/abenglHlKf8ajRqHExNx/Twe
	 SFW+FWQn3Gco9BWBYqXn5efqJ1fltplv86ax3NAm/liQJxBFVd7vGYBsI54i5lzhvL
	 MMduPqybpU+yA/ShqH9p4aBeidoMmCmNdT3hXL9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30077F8012D;
	Wed,  3 Mar 2021 07:05:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F2CF8026A; Wed,  3 Mar 2021 07:05:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEBAF8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 07:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEBAF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="jthYFTJx"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210303060502epoutp01d0efefef11c090cf48e4a828504caa39~ov__xQWET2178921789epoutp01B
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 06:05:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210303060502epoutp01d0efefef11c090cf48e4a828504caa39~ov__xQWET2178921789epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1614751502;
 bh=2kCxJoB4c79GwjGHtxy5yjssULi/d/s77sB3KP6IKTs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=jthYFTJxHYeUDQhtcMvbsmkr+7eNOzcU95f1oTf5fGu0xYZBMKrkBO+6xZVX3mR5A
 ClRrXbHtRv7MPiCMSxtCR19pAowADuTUqGxhe/zjA2DFuNLkVG02Z/4lgB9diV+h7S
 2QxfpcHSLxwpIS9k318WADdM9kroMJj0Ogrg9hU0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas3p4.samsung.com (KnoxPortal) with ESMTP id
 20210303060502epcas3p454ef823ec3f119581ca69cc0d16cf835~ov__bgVsX2370223702epcas3p40;
 Wed,  3 Mar 2021 06:05:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp2.localdomain
 (Postfix) with ESMTP id 4Dr3PV1Ldjz4x9Py; Wed,  3 Mar 2021 06:05:02 +0000
 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20210303060125epcas2p2f8bd60105935980a670a72f8481ddf00~ov70bktJB2732827328epcas2p2O;
 Wed,  3 Mar 2021 06:01:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210303060125epsmtrp19a0db8b13198f1b410831f171460921f~ov70ar9xT2317223172epsmtrp1Y;
 Wed,  3 Mar 2021 06:01:25 +0000 (GMT)
X-AuditID: b6c32a29-f3fff7000000349e-70-603f2635ce5d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0B.62.13470.5362F306; Wed,  3 Mar 2021 15:01:25 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210303060125epsmtip1929c96a3bb9c2c53397e86ac7f5d1507~ov70Nw4ep2311323113epsmtip1f;
 Wed,  3 Mar 2021 06:01:25 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <broonie@kernel.org>, <cpgs@samsung.com>
Subject: [PATCH v5 0/1] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Wed, 3 Mar 2021 15:01:24 +0900
Message-ID: <2038148563.21614751502179.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcPxSxmyTU0C67NRtS/utnZZ5oyWA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnK6pmn2CwcNJ/BZXLh5ispj68Amb
 xctDmhZ3f5hbzNjWzWLReG8Cm8Xqq1uYLF4d3sVo8e1KB5PFr//PmCyOXlzMZNFwt5nd4uXm
 N0wWRxqnMDnweWz43MTmsXPWXXaPTas62TzmnQz0+HZmIotH35ZVjB6bT1cHsEdx2aSk5mSW
 pRbp2yVwZayesYCtoJe74smTm4wNjG84uhg5OSQETCQub/rB1sXIxSEksJtR4vv0PkaIhITE
 h/ln2CFsYYn7LUdYIYqeM0qsX76aFSTBJqAr8eXeHWYQW0QgS+Ll/7vMIEXMAu+YJCau+cgC
 khAW8JJY8/kLWAOLgIpE88RlYFN5BSwl1hzdxQhhC0qcnPkEqJ4DqFlPom0jWJhZQF5i+9s5
 zBBHKEj8fLqMFaREBKjk8X9LiBIRidmdbcwTGAVnIRk0C2HQLCSDZiHpWMDIsopRMrWgODc9
 t9iwwDAvtVyvODG3uDQvXS85P3cTIzjetDR3MG5f9UHvECMTB+MhRgkOZiURXvGXtglCvCmJ
 lVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MAUbOfdev5WjX/Jn
 52bLf8sD/27q+xFXtF5Zqm/Jx/3zNNNO304y/H/qqeOm/08FwhrmWDxfybtD8pNF6RGL8Dfy
 wvX7VwS4/pvz88m165zzLukVCEa8kAtOqGD4OkNeqIV5EXuGqWLRwpevvLNLNfXlNkT7JAh4
 tp9KznzAZbJW45xqndm5+Gv3Li/Kume3Z1N76s2zrg2PL0j8MtiR9f7U2zLvE187ix0Zqir2
 +oU8KVnSZX3p44f92gx2az/qNzedKDDT7JpRXav1afq1U63JzpUfN+ZkMYTdWCL3Svz1p+Np
 XbazTJ/dWF7pajDL+6IA060FCxftXyjfr7mERWtuF///j6v/bnzRbr6zL0KJpTgj0VCLuag4
 EQA784O6JgMAAA==
X-CMS-MailID: 20210303060125epcas2p2f8bd60105935980a670a72f8481ddf00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20210303060125epcas2p2f8bd60105935980a670a72f8481ddf00
References: <CGME20210303060125epcas2p2f8bd60105935980a670a72f8481ddf00@epcas2p2.samsung.com>
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

On Wed, 2021-02-17 16:29, Takashi Iwai wrote:
>On Wed, 17 Feb 2021 05:31:49 +0100,
>Gyeongtaek Lee wrote:
>> 
>> If stop by underrun and DPCM BE disconnection is run simultaneously,
>> data abort can be occurred by the sequence below.
>> 
>> CPU0					CPU1
>> dpcm_be_dai_trigger():			dpcm_be_disconnect():
>> 
>> for_each_dpcm_be(fe, stream, dpcm) {
>> 
>> 					spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>> 					list_del(&dpcm->list_be);
>> 					list_del(&dpcm->list_fe);
>> 					spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
>> 					kfree(dpcm);
>> 
>> struct snd_soc_pcm_runtime *be = dpcm->be; <-- Accessing freed memory
>> 
>> To prevent this situation, dpcm_lock should be acquired during
>> iteration of dpcm list in dpcm_be_dai_trigger().
>
>I don't think we can apply spin lock there blindly.  There is
>non-atomic PCM that must not take a spin lock there, too.
Hi, Takashi

I fixed the patch to hold dpcm_lock during accessing dpcm related data only,
not on the trigger callback of driver.

Thank you.
Gyeongtaek Lee
>
>
>thanks,
>
>Takashi
>

Gyeongtaek Lee (1):
  ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()

 include/sound/soc-dpcm.h |  5 ++++
 sound/soc/soc-pcm.c      | 59 +++++++++++++++++++++++++++++++++-------
 2 files changed, 54 insertions(+), 10 deletions(-)


base-commit: fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8
-- 
2.21.0



