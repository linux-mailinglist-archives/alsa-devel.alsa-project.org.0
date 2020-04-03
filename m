Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0E19CED9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 05:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0981A1674;
	Fri,  3 Apr 2020 05:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0981A1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585884068;
	bh=zA30b/0GrrJiv0mj5a9OPg0WFQZEKV4HBmkkpT8MsI4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T8O1K6UwzyLC0H+lDqM77eWwcNq078bZhA9IoLgeMAQZJO7n86el2RU45YrVYuCs+
	 H7iXxntbMr97lI32I60zJz50iDvMnvZhoP6yXSGd3mqzMjgvlTIkj8O5lNG6F3Hj4c
	 0wOJSdOfhjzubEB34tX5KiToIl70VeUYmvBTCH7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC5BF8014B;
	Fri,  3 Apr 2020 05:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A26D8F8015C; Fri,  3 Apr 2020 05:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95261F800C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 05:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95261F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="ChyuDcpD"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200403032002epoutp041a1f34f548b617a8b9657ddd43dfddf9~CMRkVIrmj0942109421epoutp04d
 for <alsa-devel@alsa-project.org>; Fri,  3 Apr 2020 03:20:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200403032002epoutp041a1f34f548b617a8b9657ddd43dfddf9~CMRkVIrmj0942109421epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585884002;
 bh=f5TK58gqq7PmPD7XHpVJI8o1g4ENJqR0DWpC6SYILyQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=ChyuDcpDkA/yFwuO4jz1cY02CXULmsnb5l94SAHwqyO+05Hd8WPjt3UabNqJMDrHL
 Vc4bM6kUiY0s5rvfVhOv/dDr0pi6rRNCF5dQtNuXnsIUIw0pzxhEVGT2y9ThdaGpsr
 MpZhFVA3eunUyd76nqlrFEfCOOj4/U8GR8JOavEQ=
Received: from epcpadp1 (unknown [182.195.40.11]) by epcas1p2.samsung.com
 (KnoxPortal) with ESMTP id
 20200403032002epcas1p2c114419dbbbdc5d110a22b810a323582~CMRkHjDdh2241122411epcas1p2p;
 Fri,  3 Apr 2020 03:20:02 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200403021943epcas2p36334748d486a0d4703fb12d88fbc9ee8~CLc6K1ptj2702427024epcas2p3F;
 Fri,  3 Apr 2020 02:19:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200403021943epsmtrp1daf28e564fc64801a289dc0fbf8daa3a~CLc6J8nlH1699216992epsmtrp1j;
 Fri,  3 Apr 2020 02:19:43 +0000 (GMT)
X-AuditID: b6c32a2a-d51ff7000000103e-d7-5e869d3f80ce
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 24.E7.04158.F3D968E5; Fri,  3 Apr 2020 11:19:43 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200403021943epsmtip108288da1d409607f363570eb8d8e52d5~CLc6B7NGe0088900889epsmtip1T;
 Fri,  3 Apr 2020 02:19:43 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
In-Reply-To: 
Subject: [PATCH 1/1] ASoC: soc-component: add snd_soc_component_ack()
Date: Fri, 3 Apr 2020 11:19:43 +0900
Message-ID: <857068247.21585884002347.JavaMail.epsvc@epcpadp1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYJXZGvKxKC2H0XTAaHFKB54siVTAAAKi8g
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSnK793LY4g94PxhZXLh5ispj68Amb
 xctDmhYztnWzWLw6vIvR4tuVDiaLoxcXM1ls+L6W0eJI4xQmB06PDZ+b2Dx2zrrL7rFpVSeb
 x7czE1k8+rasYvRYv+UqSwBbFJdNSmpOZllqkb5dAlfGjA/HmQpuCle8mDmPsYHxjEAXIweH
 hICJxMx7zF2MXBxCArsZJTa39bJ1MXICxSUkPsw/ww5hC0vcbznCClH0nFFixrlrYAk2AV2J
 L/fuMIPYIgK+ElcetTCCFDELbGCUmDD5IRNIQkiAR+LVhv2MINs4BXglJvyzBgkLC7hKXJ0y
 jRHEZhFQkVj24yVYOa+ApcTLpZvZIWxBiZMzn7CA2MwC2hJPbz6FsuUltr+dwwxxnILEz6fL
 WCFuMJKYfOEOO0SNiMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PbfYsMAoL7Vc
 rzgxt7g0L10vOT93EyM41rS0djCeOBF/iFGAg1GJh5fhYGucEGtiWXFl7iFGCQ5mJRFexxlA
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzy+ccihQTSE0tSs1NTC1KLYLJMHJxSDYwL19btNuly
 mLwq5xSfyz2+GY2WZ15cP+l739pob86XfLmrFT82NoSHCmhX7vxxK/hltvgDi3K3TUyTug7e
 nqYTa2bxy95x3lbF5qSIcsHbrywqzfId+TPXmCxqkHoSbDCVS7DHoSBPMDRML8ueT+vMBvtn
 +Vdmubwo/31B2H/+eZeHd4xO/VJiKc5INNRiLipOBAAeych+sQIAAA==
X-CMS-MailID: 20200403021943epcas2p36334748d486a0d4703fb12d88fbc9ee8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20200403021943epcas2p36334748d486a0d4703fb12d88fbc9ee8
References: <CGME20200403021943epcas2p36334748d486a0d4703fb12d88fbc9ee8@epcas2p3.samsung.com>
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

Change-Id: I85573cb43f3ca050c47ca9e3af3cfa9ec1fae3d0
Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 18 ++++++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5d80b2eef525..50b079272b47 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -381,6 +381,7 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma);
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_new(struct snd_pcm *pcm);
 void snd_soc_pcm_component_free(struct snd_pcm *pcm);
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 79ffc2820ba9..b4be91cb9fa0 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -526,6 +526,24 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 	return -EINVAL;
 }
 
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		/* FIXME. it returns 1st ack now */
+		if (component->driver->ops &&
+		    component->driver->ops->ack)
+			return component->driver->ops->ack(substream);
+	}
+
+	return -EINVAL;
+}
+
 int snd_soc_pcm_component_new(struct snd_pcm *pcm)
 {
 	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b600d3eaaf5c..c8a5a9a9d35f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2941,6 +2941,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		if (!ops)
 			continue;
 
+		if (ops->ack)
+			rtd->ops.ack		= snd_soc_pcm_component_ack;
 		if (ops->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (ops->page)
-- 
2.21.0



