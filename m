Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2319E20C
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 03:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F23A1612;
	Sat,  4 Apr 2020 03:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F23A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585963027;
	bh=5lJjnPepBaGKOS0OXRRjPSVxiznLGpmmBv145M0KXbw=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jWxhwcXYt4ELqrG57vdWVyeMZJqyhSwuw635LYeRT5exgdkAsrJGcxk4IKfrAh8L2
	 snopqtyvCuS/xMRZsptNQUYtZsgkt+XppRndVi56ghTl3GDfvynxkBaDDwnfQZ3FC1
	 bFqeP5NItsGOI5KTvAazXWhws/74EGVLq3yl540c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F480F800C2;
	Sat,  4 Apr 2020 03:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B1CEF8014C; Sat,  4 Apr 2020 03:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6136CF800C2
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 03:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6136CF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="eCT4h8tk"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200404011502epoutp039d007a8b3e73e49feff357a4cf0dac89~CeNtnNO5L0695906959epoutp03E
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 01:15:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200404011502epoutp039d007a8b3e73e49feff357a4cf0dac89~CeNtnNO5L0695906959epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585962902;
 bh=PvDPnEeL38qwNjUsp6lgQLyDbYk60hp7979iwMWeQaY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=eCT4h8tkh5BBQpm0VenMzRgub2gdHvT2ct+4BgdsYdH2jVGsl5voUlKTAhRLfhfBU
 NK9LARiuoCXuX3dnsb7hglgKMi43zpLO4oyfg0zr9Sx+SE1tAtBBYEBOtpwm5NX3bf
 reYqPwQWBxoUzBgKyjcDykK0sxqaXc3wWkPCZyCI=
Received: from epcpadp1 (unknown [182.195.40.11]) by epcas1p4.samsung.com
 (KnoxPortal) with ESMTP id
 20200404011501epcas1p489e695112a7a0fbd8e37c67ab769ee72~CeNs7z78v1802018020epcas1p4F;
 Sat,  4 Apr 2020 01:15:01 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200403041724epcas2p233810a68ae04a15427c33e5b82bc200a~CNDpZmCjr0654106541epcas2p2D;
 Fri,  3 Apr 2020 04:17:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200403041723epsmtrp2ee17d63b6d31f07acc45858c1fc379cd~CNDpYvFR73171631716epsmtrp2e;
 Fri,  3 Apr 2020 04:17:23 +0000 (GMT)
X-AuditID: b6c32a29-2dfff70000000fb8-e3-5e86b8d39bd1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.50.04024.3D8B68E5; Fri,  3 Apr 2020 13:17:23 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200403041723epsmtip1ad30a327ab13d2a79b75b0fd73d856c5~CNDpPR89L3066230662epsmtip19;
 Fri,  3 Apr 2020 04:17:23 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Mark Brown'" <broonie@kernel.org>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/1] ASoC: soc-component: add snd_soc_component_ack()
Date: Fri, 3 Apr 2020 13:17:23 +0900
Message-ID: <1019298652.01585962901762.JavaMail.epsvc@epcpadp1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYJbrRSoxcxjOniTkOYVNEBV7kQiQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJTvfyjrY4g1uTLC2uXDzEZDH14RM2
 i5eHNC1mbOtmsXh1eBejxbcrHUwWRy8uZrLY8H0to8WRxilMDpweGz43sXnsnHWX3WPTqk42
 j29nJrJ49G1ZxeixfstVlgC2KC6blNSczLLUIn27BK6MZZ8XshbcEa6Yc2sNcwPjWYEuRk4O
 CQETidN/77F0MXJxCAnsZpQ4dvUiM0RCQuLD/DPsELawxP2WI6wgtpDAc0aJ61vAbDYBXYkv
 9+6A1YsI+EpcedTCCDKIWWADo8SEyQ+ZQBLCAh4SvzccZQSxWQRUJF5umAc0lIODV8BSYvpb
 R5Awr4CgxMmZT1hAbGYBbYmnN59C2fIS29/OgbpHQeLn02WsELv0JB7eXsgOUSMiMbuzjXkC
 o+AsJKNmIRk1C8moWUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI4dLc0d
 jJeXxB9iFOBgVOLhZTjYGifEmlhWXJl7iFGCg1lJhNdxBlCINyWxsiq1KD++qDQntfgQozQH
 i5I479O8Y5FCAumJJanZqakFqUUwWSYOTqkGxr6Fr2d8nHjgPmvBbr9E8y3HzSxuzRP4s3ih
 16/DTV3XA9itlW0WNh6b7iuUcOe/cvUUGU7TG/tqbgkIvjXZ3GkVGb/loFhUvUFI5a24XXsS
 M954fNOx5tz0Qe7MxQDjiYbcraXvVvhwWv//NUt3jdKW2wauOV8uC71iPG+7x/6QmXr5k9kX
 9JVYijMSDbWYi4oTAc1YN/qZAgAA
X-CMS-MailID: 20200403041724epcas2p233810a68ae04a15427c33e5b82bc200a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20200403041724epcas2p233810a68ae04a15427c33e5b82bc200a
References: <CGME20200403041724epcas2p233810a68ae04a15427c33e5b82bc200a@epcas2p2.samsung.com>
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

base-commit: ef8e14794308a428b194f8b06ad9ae06b43466e4
-- 
2.21.0



