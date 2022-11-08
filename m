Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02462316B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283F716B8;
	Wed,  9 Nov 2022 18:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283F716B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014753;
	bh=9OL7z7Op39Gfeajq6bsx/Xmg2Mi/R8dJ/+nahVAcrCA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XS/KwIz6Q1uVgTbi7nJD4sKlkAUjylyVv7eIitXkDKeuYb8wmgls90beh/FbXgJXH
	 YU3Yu1W23KZNcLKbuJdjo4YxF8EDZXSuy+ani9uuPfbuNowTSCma6rI50xZr3pUTPr
	 TC815SkCaQ35FaIDlZ8dgTTZ/Xelrr/RjWqzcebk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A41F8061A;
	Wed,  9 Nov 2022 18:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD8CAF8020D; Tue,  8 Nov 2022 05:25:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com
 [203.205.221.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB811F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 05:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB811F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OHL9hT3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1667881541; bh=MX+wr/Y2czJnOXuMbk1ClRRWdWuP38+jsoOu17Qathg=;
 h=From:To:Cc:Subject:Date;
 b=OHL9hT3xWtrotxTu1/p/uSr/ougt08+eiFc9c4swqVOTN+oxTHmRa7zZegIpFzS2x
 TNeqKMIrl3lY/LFiNAAhG3L0uyG8YMaZdCuICqKlHUtExSjc9M8koF77vyZ4V0/oW4
 XHWptxiX0zEgx26aIynAptVClSGuHzI5NNiRf8Lo=
Received: from localhost.localdomain
 ([2409:891f:a923:8f9d:b48b:b960:e2ae:5996])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id 66626489; Tue, 08 Nov 2022 12:25:38 +0800
X-QQ-mid: xmsmtpt1667881538tysdr77po
Message-ID: <tencent_59850BB028662B6F2D49D7F3624AB84CCF05@qq.com>
X-QQ-XMAILINFO: OakVxA/3u/8RbaUwNC+HBQqjwSTSL4oPpEJLpLHRRf2r7Z5uiIiD0fjC9vyld5
 H8g0XIYDFJ4rth/EMnv2hlhTaiUP0mNRGDxzVVjn5Vdsn/D7EJN06ggzeuxCPHNjEKrsq75gNBXh
 +ci/KjZmnt9keRisuVWsBKth2bd80O6dXF90ZeMECgVW0v/HePQBfHCBH18R36/d5abjvGxdvxBy
 n3OSh8RB/+ks1RTUsSvuNfdxr1JuMLEDzWb/C6+4rBYgwT65rMXVopRn4vTbNIouXKy37CW5okKG
 /2P++MVPc9DwARPx9/W4A99+1Nf4H6iP+z0JB5Clxyo1lcXW1Vshrhht+d6+s6fd7IOgC0bPHBJt
 YF27l9ae8azpQqpMs4nTVCBMeoKAd2YsRb2LZ40+Q1VwsCsZWUw8RGN6S8wzuiUT8FOjpsxBEGHx
 3AcDCdAVoIJtitlmXQLO2LcTaAqA+DTaDLSzO2cVYSOMybE8+nFM7ZlIWnoKXEkLBb10gfzEe0NN
 rgScB0Dd/8mDxK7ULH9A9hZgwUYNoWEXSRdS8xGa1Jr4/KwaesSi3e3PaEqwtR4vrBm67uOwCUzt
 HygkkixdMGs9ThO+0vOCaNVx09SMQ17/Ynr2IhvF3Jy+JA9jKCES89LdAllyId1eILlnB8nxmB7N
 zy9kRA5W1KXFnU3D2liVYRPVI9cnkRL29lYskDGF8Kft90B4vZUSyYDEC0rIcltgDS0ijnDC5Mpq
 p/qL9xbMyy0wVuHodHr3d9Bwxk7WonPOpzzQ2HG9mX5D/2hwQdd26ygTwKEY84kG1kw4Q3FER9c0
 tm/crzvzFGMD5PWQAAxqqo5pSAaqajRKAgcKWw1ZlVTfBI316JjtZEIbR2/WWGtlqz94LMtal7T6
 KhYzGtXANH2taab9+PbwWLHoZrPF9CNIhN8g63OvdwyU7i5yxVtj0rVgL0o8974KmdeRZCsBRYCn
 engFc1KS3HlrWxV18DwfnMT6pbYt45JQPCdItcULW9OfZ2HfwbyQ==
From: lishqchn <lishqchn@qq.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] Asoc: core: fix wrong size kzalloc for rtd's components member
Date: Tue,  8 Nov 2022 12:24:56 +0800
X-OQ-MSGID: <20221108042456.198176-1-lishqchn@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 lishqchn <lishqchn@qq.com>, linux-kernel@vger.kernel.org
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

The actual space for struct snd_soc_component has been allocated by
snd_soc_register_component, here rtd's components are pointers to
components, I replace the base size from *component to component.

Signed-off-by: lishqchn <lishqchn@qq.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a6d6d10cd471..d21e0284b2aa 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -459,7 +459,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 */
 	rtd = devm_kzalloc(dev,
 			   sizeof(*rtd) +
-			   sizeof(*component) * (dai_link->num_cpus +
+			   sizeof(component) * (dai_link->num_cpus +
 						 dai_link->num_codecs +
 						 dai_link->num_platforms),
 			   GFP_KERNEL);
-- 
2.25.1

