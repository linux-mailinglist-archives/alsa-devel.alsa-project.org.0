Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8319CED8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 05:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FAC1685;
	Fri,  3 Apr 2020 05:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FAC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585884051;
	bh=UnUc8UNzvcfbxSNphFRyk8ybJE+pfoOlyHAmfNVpfCw=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KH0427ct374SZgLZwyUc2UIhtAkuFIOOt8qbMnD/o3qm71mIymEGkBfVRfah1F+Qn
	 /7lv4mr7l8A1nwIkQDiiCy3pmy8Eq2aAeJX8Xs4/RUjVb45g2d6shOmz7oovIOvIie
	 MLEcRjY/F8TDKjsBX6GKVZfxc25NamKfOa6UC2cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9C8F8022D;
	Fri,  3 Apr 2020 05:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED23F8015C; Fri,  3 Apr 2020 05:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F10E7F8014B
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 05:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F10E7F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="L4JtGacZ"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200403031801epoutp0438fc225aecff2fadf06b6efe5ebc8efc~CMPzogNzY0806108061epoutp04M
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 03:18:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200403031801epoutp0438fc225aecff2fadf06b6efe5ebc8efc~CMPzogNzY0806108061epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585883881;
 bh=c0vdaYzQPbVfx2NJVLTPMMGcecI0fMGZccyNMXPRZTQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=L4JtGacZfphV73ayEWckUloJxGT8Hq2+Q2RPNsGOsrbOcgzIZKhZXjJzbgMkCyewO
 pBSlvBgCEHU7XNdm2lLeZSpSBlJli7FUFu5BtsVXbprisuzDyrb7hc4hnuAnLHt/Mw
 OaVJqxK8yMxJZTExIAhsQ0+SKZ9jDH2lKzc8OqLc=
Received: from epcpadp2 (unknown [182.195.40.12]) by epcas1p4.samsung.com
 (KnoxPortal) with ESMTP id
 20200403031801epcas1p4be34d282f0d585b013f72c30fcb072cd~CMPzcAlEZ1227912279epcas1p4-;
 Fri,  3 Apr 2020 03:18:01 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200403022314epcas2p2f0626aacff2ad57890bf46d354c3b1c6~CLf99Ajm31719217192epcas2p27;
 Fri,  3 Apr 2020 02:23:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200403022314epsmtrp28f686b608023ebcc1cf947763a731f0d~CLf98NdHj0245202452epsmtrp2E;
 Fri,  3 Apr 2020 02:23:14 +0000 (GMT)
X-AuditID: b6c32a29-2c7ff70000000fb8-ac-5e869e115760
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D8.B8.04024.11E968E5; Fri,  3 Apr 2020 11:23:14 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200403022313epsmtip2e8b2babfd79be65939af868f11c11cd2~CLf9xxMPp1476114761epsmtip2G;
 Fri,  3 Apr 2020 02:23:13 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
In-Reply-To: 
Subject: [PATCH 1/1] ASoC: soc-component: add snd_soc_component_ack()
Date: Fri, 3 Apr 2020 11:23:13 +0900
Message-ID: <857068247.21585883881357.JavaMail.epsvc@epcpadp2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYJXZGvKxKC2H0XTAaHFKB54siVTAAAKi8gAAAaNsA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvK7QvLY4g0vtzBZXLh5ispj68Amb
 xctDmhYztnWzWLw6vIvR4tuVDiaLoxcXM1ls+L6W0eJI4xQmB06PDZ+b2Dx2zrrL7rFpVSeb
 x7czE1k8+rasYvRYv+UqSwBbFJdNSmpOZllqkb5dAlfG7wXHWQteiVXsv36VrYFxunAXIyeH
 hICJxMbll5m6GLk4hAR2M0p8mfyfBSIhIfFh/hl2CFtY4n7LEVaIoueMEgt63zGBJNgEdCW+
 3LvDDGKLCPhKXHnUwghSxCywgVFiwuSHYEVCAjwSrzbsB0pwcHAK8EpM+GcNEhYWcJW4OmUa
 I4jNIqAicWfBazCbV8BS4v7F2VC2oMTJmU/ADmIW0JZ4evMplC0vsf3tHGaI4xQkfj5dxgpx
 g5XExD03oWpEJGZ3tjFPYBSehWTULCSjZiEZNQtJywJGllWMkqkFxbnpucWGBYZ5qeV6xYm5
 xaV56XrJ+bmbGMHRpqW5g/HykvhDjAIcjEo8vAwHW+OEWBPLiitzDzFKcDArifA6zgAK8aYk
 VlalFuXHF5XmpBYfYpTmYFES532adyxSSCA9sSQ1OzW1ILUIJsvEwSnVwDj5ynfBBIuDVfk/
 CiyXNElu/PpgScmeDbmyjW+PVF1L4nuv8vDRGu/J/rVyy4se/klTm6rX/cf+3KRe+w/bgmW7
 fqrviuFua/c7nnhKRUbYnf/IGmf9SRdOZKQqTdz4psFB4QsHV21Q8ReP/uqjhVoZz/uLutY5
 nZ91R/le05yQq1P/HEsK11RiKc5INNRiLipOBAA6/vw/sgIAAA==
X-CMS-MailID: 20200403022314epcas2p2f0626aacff2ad57890bf46d354c3b1c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20200403022314epcas2p2f0626aacff2ad57890bf46d354c3b1c6
References: <CGME20200403022314epcas2p2f0626aacff2ad57890bf46d354c3b1c6@epcas2p2.samsung.com>
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

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_ack() and use it.
Ack callback is revived because some ASoC driver is using it.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 14 ++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 154d02fbbfed..a8c60efac8f7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -104,6 +104,8 @@ struct snd_soc_component_driver {
 	struct page *(*page)(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     unsigned long offset);
+	int (*ack) (struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream);
 	int (*mmap)(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream,
 		    struct vm_area_struct *vma);
@@ -415,6 +417,7 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma);
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd);
 void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 785a0385cc7f..b4b3245ef016 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -516,6 +516,20 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 	return -EINVAL;
 }
 
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component;
+	int i;
+
+	/* FIXME. it returns 1st ack now */
+	for_each_rtd_components(rtd, i, component)
+		if (component->driver->ack)
+			return component->driver->ack(component, substream);
+
+	return -EINVAL;
+}
+
 int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 289aebc15529..c6fddd1cb5aa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -3027,6 +3027,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 		if (drv->sync_stop)
 			rtd->ops.sync_stop	= snd_soc_pcm_component_sync_stop;
+		if (drv->ack)
+			rtd->ops.ack		= snd_soc_pcm_component_ack;
 		if (drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (drv->page)
-- 
2.21.0



