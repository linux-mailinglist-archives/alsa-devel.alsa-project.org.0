Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B222419CEDA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 05:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519FA1687;
	Fri,  3 Apr 2020 05:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519FA1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585884117;
	bh=Aj6oXDkb9P+Zn6vAISsYEy03qawdcVtPqsqjcGtUrJQ=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V67wvSVxx+nt7U1xsT1SjcWhsLU2Mu3C5RkwOd8yoGD9RZ1nuTwb+iqh3hNQZgi4c
	 SJrEQIeez1TafJXQm/KC4Ns87m4e5xm4WsggU1fLuOUkAh3g3zbKSSNPXRVjIhxVsL
	 07AX1k0+d+Jc7guVAhBqj/Mm4wzNKyeLj43piEe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9781F8028C;
	Fri,  3 Apr 2020 05:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C982F8028C; Fri,  3 Apr 2020 05:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE18F8014B
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 05:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE18F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="MY+pGZVp"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200403032002epoutp020119af1cc9770573d1a144d8d9055d71~CMRkdDvuL0597205972epoutp02Y
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 03:20:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200403032002epoutp020119af1cc9770573d1a144d8d9055d71~CMRkdDvuL0597205972epoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585884002;
 bh=8yiV7JoozVO5Eur9/GvWYyNm0ktX1cMQbYJUSZXPD/k=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=MY+pGZVpghFrHpwPU5Pxk+SptxawC+vqwEdUJPJb60WEV7cFukziJhrtntFajiKQb
 5qWE3WwiqcyT9Ybua93HLtO7leoRGCEh041bnUbbp/+LZgmZK4+l6ubVH8CuGZATks
 I3xwlcTXnqEWgbiOGHF4K/h+rFeZL7X1Pl2FEybg=
Received: from epcpadp1 (unknown [182.195.40.11]) by epcas1p2.samsung.com
 (KnoxPortal) with ESMTP id
 20200403032002epcas1p23303c75140dbe5ddbfff33e084300459~CMRj7mrpU2241122411epcas1p2n;
 Fri,  3 Apr 2020 03:20:02 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200403021853epcas2p1cec9bf3facf123393608134af3e96b75~CLcLbNjm43235232352epcas2p1d;
 Fri,  3 Apr 2020 02:18:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200403021853epsmtrp185585bc203536921dc80b19e55882279~CLcLagcYg1628716287epsmtrp15;
 Fri,  3 Apr 2020 02:18:53 +0000 (GMT)
X-AuditID: b6c32a29-2dfff70000000fb8-20-5e869d0d27b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.58.04024.D0D968E5; Fri,  3 Apr 2020 11:18:53 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200403021853epsmtip28533fba67088d71628e41ab7b489bb75~CLcLL_2cp1303513035epsmtip2j;
 Fri,  3 Apr 2020 02:18:53 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
In-Reply-To: 
Subject: [PATCH 0/1] reviving ack callback for 5.4
Date: Fri, 3 Apr 2020 11:18:53 +0900
Message-ID: <1019298652.01585884002144.JavaMail.epsvc@epcpadp1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYJXEhnCPDd1oOCR0aWW6LKHWvARQAAcY9A
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvC7v3LY4gyt3VCyuXDzEZDH14RM2
 i5eHNC1mbOtmsXh1eBejxbcrHUwWRy8uZrLY8H0to8WRxilMDpweGz43sXnsnHWX3WPTqk42
 j29nJrJ49G1ZxeixfstVlgC2KC6blNSczLLUIn27BK6MP+t2sBRcZamY+HMJUwPjTeYuRk4O
 CQETibtNP4BsLg4hgd2MEhM2TGKBSEhIfJh/hh3CFpa433KEFaLoOaNEZ/M8sG42AV2JL/fu
 gNkiAr4SVx61MIIUMQtsAJo0+SETSEJIgEfi1Yb9QAkODk4BXokJ/6xBTGEBI4lzO2VAKlgE
 VCTWL7nOCGLzClhKzDl6nBnCFpQ4OfMJ2D3MAtoST28+hbLlJba/nQP1gILEz6fLWEFGigCN
 /HdBE6JERGJ2ZxvzBEbhWUgmzUIyaRaSSbOQtCxgZFnFKJlaUJybnltsWGCYl1quV5yYW1ya
 l66XnJ+7iREcaVqaOxgvL4k/xCjAwajEw8twsDVOiDWxrLgy9xCjBAezkgiv4wygEG9KYmVV
 alF+fFFpTmrxIUZpDhYlcd6neccihQTSE0tSs1NTC1KLYLJMHJxSDYxLDq5fHLx207qrfK/1
 bgV/vWl2vnXjA+PVN46w6Ca5O7SfcJyusV3onAHD0Q0XDS+/+NBvceWmw/91R+OvmK71tPXo
 eCnC5aIw6dU6y38HzO9XTnDIUgpuSDv5Oeag4O0lK94aWT/4H7db2GVxCuuPtz3bb/ctKC+d
 0Op+7mPbThvNeXrX5zAmKbEUZyQaajEXFScCAD9ylDGwAgAA
X-CMS-MailID: 20200403021853epcas2p1cec9bf3facf123393608134af3e96b75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20200403021853epcas2p1cec9bf3facf123393608134af3e96b75
References: <CGME20200403021853epcas2p1cec9bf3facf123393608134af3e96b75@epcas2p1.samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, cpgs@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

ACK callback is useful to notify application pointer in DMA buffer to DSP,
because it is called after application pointer is updated in ALSA.
DSP can use the pointer to control preprocessing, detect underrun and so on.
I'd like to revive it from 5.4 if it is possible.

Gyeongtaek Lee (1):
  ASoC: soc-component: add snd_soc_component_ack()

 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 18 ++++++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 21 insertions(+)


base-commit: ef8e14794308a428b194f8b06ad9ae06b43466e4
-- 
2.21.0



