Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57962CCBF6
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 03:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E7C1802;
	Thu,  3 Dec 2020 03:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E7C1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606961216;
	bh=h8INZgDOZnfJVIA2Y4POVZbJpgCRebNE7wKATDtP004=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRkOFP0WtH8elmAtUbhJOVTOL1r9pkLrIzUVvuppvBq6N2KTXJr3C1m+q9fWoS++g
	 6/Atu7TCuHz3Y2Zm4AjTryDOPmHxTJ4rcPs6MSpY5Ohr7PnW1cnDwgqktsX4duNLRZ
	 0rTZRY+/C0DzFuxdgd4JOMLbDYq/zKqujCF4u/Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67147F8049C;
	Thu,  3 Dec 2020 03:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FCCFF80168; Thu,  3 Dec 2020 03:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03528F80168
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 03:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03528F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="VRbRj1wW"
Received: from epcas3p2.samsung.com (unknown [182.195.41.20])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201203020502epoutp03bcf16ceaa3fe3ed71be7af6714957c5f~NEpvJoStp0752207522epoutp03U
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 02:05:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201203020502epoutp03bcf16ceaa3fe3ed71be7af6714957c5f~NEpvJoStp0752207522epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606961102;
 bh=3aiqXLobVTY6k6E74GSknOrtj48sO+04S24dTe8sErw=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=VRbRj1wWCB9ySW320P73HnBS3VEU1Q8FCCqHAhitSwSktJtCXq46pQUFJjt/ABDSP
 9PVeCruK5GO0tqr34jk99ysELG0OY08k+EucsXElnuey2OfQ3e1AxZP34qpAELo7TM
 EquOnGw+8Jw/IgbLrISvj9D3nYimklc+kBnfztcU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas3p2.samsung.com (KnoxPortal) with ESMTP id
 20201203020502epcas3p20a0f7c733c3f20c9e257e1508b58546f~NEpu2j65c0725107251epcas3p2F;
 Thu,  3 Dec 2020 02:05:02 +0000 (GMT)
Received: from epcpadp3 (unknown [182.195.40.17]) by epsnrtp4.localdomain
 (Postfix) with ESMTP id 4CmfL574m8zMqYkV; Thu,  3 Dec 2020 02:05:01 +0000
 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20201203010628epcas2p21a18eab524fc52e61f051185b169d75a~ND2mTl81k0331003310epcas2p2N;
 Thu,  3 Dec 2020 01:06:28 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201203010628epsmtrp2e46fd5ae44407bb8bb5672adcafd7c4a~ND2mSxR2f2773327733epsmtrp2u;
 Thu,  3 Dec 2020 01:06:28 +0000 (GMT)
X-AuditID: b6c32a2a-755ff70000002229-29-5fc83a14cf12
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.BB.08745.41A38CF5; Thu,  3 Dec 2020 10:06:28 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20201203010627epsmtip18872d35b4d68b052b3f21cd80f17a19f~ND2mFYG3t2235022350epsmtip1H;
 Thu,  3 Dec 2020 01:06:27 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>,
 <cpgs@samsung.com>
In-Reply-To: <87tut3c08p.wl-kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH] ASoC: dpcm: acquire dpcm_lock in dpcm_do_trigger()
Date: Thu, 3 Dec 2020 10:06:27 +0900
Message-ID: <1891546521.01606961101988.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFbMrnWt5vU62WFOJaPsklg18y2CgIP5R6AAigCCu6qufu1kA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSnK6I1Yl4g8sXWSyuXDzEZPHykKbF
 3R/mFjO2dbNYNN6bwGax+uoWJotXh3cxWny70sFk8ev/MyaLoxcXM1k03G1mt3i5+Q2TxZHG
 KUwOvB4bPjexeeycdZfdY97JQI9vZyayePRtWcXosfl0dQBbFJdNSmpOZllqkb5dAlfGtJsd
 7AXNXBXr/mxnbGCcztHFyMkhIWAiceXARsYuRi4OIYEdjBLTX29lgUhISHyYf4YdwhaWuN9y
 hBWi6DmjxONzzxhBEmwCuhJf7t1hBrFFBIIkFiz9C1bELPCOSWLimo8sEB2HGCXWLLwJNpZT
 wFZi8825rCC2sIC7xKLXV4BWcHCwCKhIrJqvCGLyClhK9FxxAangFRCUODnzCQtImFlAT6Jt
 I9haZgF5ie1v5zBD3KYg8fPpMlaIE5wknq45yQJRIyIxu7ONeQKj8Cwkk2YhTJqFZNIsJB0L
 GFlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIEx6KW1g7GPas+6B1iZOJgBHqQg1lJ
 hJfl35F4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxfZy2MExJITyxJzU5NLUgtgskycXBKNTCp
 vtwpc8Cgmn+2PB/L9p0rnXbrS1uWThayrNtyPGvf5o0brLomql+bkfYtyXHV8R2Vc6zdIlKb
 U3KMrlfZf5j/LDM+9WxG56ay+VOM7vKe3nx1O8P5h2L2y29Vngv0YmS92pB7+OTMj7EzHVm+
 6fcvin60ml0nNqT13H/BaXolYhIv/x6YtkC7xzz8z/YJcQeCgqxkjvgJXC9eyBekcerySa/c
 TfPf+8ivnnaaJ/rE3hUXzpmE7Mpl6pv0+euEzZvPZ8XZbnHfXCw7aWuW7tsypoo56Z6ynSun
 hmxUPMa+m6XyqEDPlcyTUjuORTM/2+fRLRTItLZFdNukLJabErs+bZOZn2KwzlD962mfKW3m
 SizFGYmGWsxFxYkAQjcnUzQDAAA=
X-CMS-MailID: 20201203010628epcas2p21a18eab524fc52e61f051185b169d75a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8
References: <CGME20201202072607epcas2p43171cd23ab1752db8d71b2ed5f581aa8@epcas2p4.samsung.com>
 <2038148563.21606894682167.JavaMail.epsvc@epcpadp4>
 <87tut3c08p.wl-kuninori.morimoto.gx@renesas.com>
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

On 03 Dec 2020 07:33:03 +0900, Kuninori Morimoto wrote:
>Hi Gyeongtaek
>
>Thank you for your patch
>
>> If stop by underrun and DPCM BE disconnection is run simultaneously,
>> data abort can be occurred by the sequence below.
>> 
>> /* In core X, running dpcm_be_dai_trigger() */
>> for_each_dpcm_be(fe, stream, dpcm) {
>> /* In core Y, running dpcm_be_disconnect() */
>> spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>> list_del(&dpcm->list_be);
>> list_del(&dpcm->list_fe);
>> spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
>> kfree(dpcm);
>> /* In core X, running dpcm_be_dai_trigger() */
>> struct snd_soc_pcm_runtime *be = dpcm->be;   <== Accessing freed memory
>
>It is easy to read/understand if this code has alignment.
>
>> To prevent this situation, dpcm_lock should be acquired during
>> iteration of dpcm list in dpcm_do_trigger().
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>> ---
>
>Is this bugfix patch for some recent commit ?
>If so, having Fixes: tag is helpful.
>
>Thank you for your help !!
Thank you for your review.
I'll resend the patch v2 after fixing the patch as 
your review comment.

Thanks again.
Gyeongtaek Lee
>
>Best regards
>---
>Kuninori Morimoto
>


