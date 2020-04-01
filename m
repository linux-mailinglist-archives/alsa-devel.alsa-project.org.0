Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57E19A848
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 11:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99099166F;
	Wed,  1 Apr 2020 11:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99099166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585732039;
	bh=9ctfZ8n2Ipe+s1/eY+y5lXJdJCz6iKnfPS1ikl+20Vg=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vuvzu8Q+mgWRYFPLFbSmFsBm2kbyPt5hDjAZymdGGHja949DpWstDhW8qwSNTvaXS
	 GJHKMeBDNl1CPaM56G/ZTEn/3m7CJkCsrc8X/Sayn+0xD53O5PbAG6V+VFPLFYVaPl
	 Sq0p6BTbGzS6968Qj4HBw97E2xbymiVDvlbnRc4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAFEF8014A;
	Wed,  1 Apr 2020 11:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE30AF8014B; Wed,  1 Apr 2020 11:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E401AF8010D
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 11:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E401AF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="t6fWOoRe"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200401090527epoutp023e90fa10bc81019e842136bff21b21ba~BpslMJmRW1202412024epoutp02d
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 09:05:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200401090527epoutp023e90fa10bc81019e842136bff21b21ba~BpslMJmRW1202412024epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585731927;
 bh=J0OgxZUFvtPnCJffRgZhZh7lujP8jp3o8PMlnhmIO9E=;
 h=From:To:Cc:Subject:Date:References:From;
 b=t6fWOoRe9v8+GS+3h2STmvvDvX9LYu9FXQEwmQSdyxj5RKVRBYK0VpwEL7HLcip9t
 CZfCB7gFWmZcp5w/ba3nFmsIcaVSqADDh/NVfk9nf5RwvZc/+/K8LXQZi94gycAK9z
 5yb4+XfQdtysdnLhlvmwWRY45EVAl0OGd2k6X1IM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200401090526epcas2p464609a3a32de47cb87451b197e0c0fc9~BpskqWiQ-0172201722epcas2p4a;
 Wed,  1 Apr 2020 09:05:26 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.188]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48sgJj57dCzMqYkk; Wed,  1 Apr
 2020 09:05:25 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 13.88.04024.559548E5; Wed,  1 Apr 2020 18:05:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200401090524epcas2p33a2ce1324ee7b2511a72c3dfa12d515f~BpsjCBK3A0963209632epcas2p3r;
 Wed,  1 Apr 2020 09:05:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200401090524epsmtrp1cb1484c54c03119f0f3b203a94e5be61~BpsjApVGc1672216722epsmtrp1U;
 Wed,  1 Apr 2020 09:05:24 +0000 (GMT)
X-AuditID: b6c32a48-5a9ff70000000fb8-c5-5e845955953c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.5C.04158.459548E5; Wed,  1 Apr 2020 18:05:24 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200401090524epsmtip17e6d7dff724ac5011157ada1079329fa~Bpsi4aFEc0255902559epsmtip1V;
 Wed,  1 Apr 2020 09:05:24 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: topology: use name_prefix for new kcontrol
Date: Wed, 1 Apr 2020 18:05:24 +0900
Message-ID: <009b01d60804$ae25c2d0$0a714870$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYIBJvymUv2NPIMQ2uHR1iM/QbKYw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURT1zUzbQa2OtehN/aCOGreAbaU4IOCG2kQTiYYPl4AjTIDYZdIp
 xC1BhdQixi0YtYjgggvEiLUikhBNcW2AgBGJBjEGFDEiIoorxJYZkv6de+85756T+0hcdVWu
 IbOtDs5uZc20fDxR0zB/SWTK5oJUXcv1COZFqw9jTr3rljNnaooIZuiFC2MetV7CmOqfNxDz
 8EAxtlxhqh48KDfdc79RmDyVhXLTUW8lMt30thHJsi3m+CyOzeDsWs6absvItmYm0Os2pa1K
 M8bo9JH6WGYJrbWyFi6BTlqfHLkm2xzwQWtzWXNOoJXMCgK9KDHebstxcNosm+BIoDk+w8zr
 9XyUwFqEHGtmVLrNEqfX6QzGAHO7OetYvwfxLbJd1S2H0H7UThxGYSRQ0fDD26E4jMaTKqoW
 wcemYUwsviF41XlVJhZDCAYHuvAxSd3fPolVj6DkQz8hFr0I8t/fCbBIUk7FwZEiOihQUwDf
 656OCnDqJIKqjz0oOJhKrQCfuxIL8glqNjRWbQi2lVQsNDV9k4l4Cjw72z3qFacMcLmqDBNx
 BNztOycZ0sLv91dk4q4o+Pq8Q+KroaTQiQf3AtUoh3vdNZgoSIL+t6UKEU+FT0+8EtZA7zGn
 QhTkI/jS9E8aFCMoLFKJeDF4S/2jpoGaBQ9fS8smgathWCG2leBySmwabvlHJDbA+WrpQROU
 XxrGj6OZ7pCU7pCU7pCU7pA05YioRNM4XrBkcoKBjw69tgeNftIFplr0oHm9D1EkoicqtXH5
 qSoZmyvstvgQkDitVpYkFaSqlBns7j2c3ZZmzzFzgg8ZA0c4gWvC022BL291pOmNhpgYXayR
 McYYGHq60jPh1TYVlck6uJ0cx3P2MR1Ghmn2o8R214zyd7KRM4N853b/nvbztz8/Wdvy9Ef9
 5HK3s+d0xcDKl3HFHQb/uDL1r67Wrn48L29G96rOT0MpWxMbIwhbxfF5Rz3NKcsKBjTXH59w
 ppf551w4dE238fGVhX+ef7/b25a3qD18RJ1ytlHeoHTtW157ce/9iqVzS1dbdmyur0viaULI
 YvULcLvA/gcN585CugMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnG5IZEucwZ5jFhZXLh5ispj68Amb
 xYxt3SwW3650MFkcvbiYyWLD97WMFkcapzA5sHts+NzE5rFz1l12j02rOtk8+rasYvRYv+Uq
 SwBrFJdNSmpOZllqkb5dAldG//tNjAUXWCs2XGhnbGC8ztLFyMkhIWAisev3W6YuRi4OIYHd
 jBKtM5awQiQkJD7MP8MOYQtL3G85wgpR9JxRYu6k/UAdHBxsAlYSPd1KIDUiQPVfdp0AG8Qs
 MItR4tWc2WCDhAUcJQ7NWgVWzyKgInFmtT9ImFfAUuLs2U+sELagxMmZT8AOYgY6qPFwN5Qt
 L7H97RxmiBsUJH4+XcYKsUtP4sOlO1A1IhKzO9uYJzAKzkIyahaSUbOQjJqFpGUBI8sqRsnU
 guLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg+NDS2sF44kT8IUYBDkYlHl5Fq+Y4IdbEsuLK
 3EOMEhzMSiK8s11a4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzyucfixQSSE8sSc1OTS1ILYLJ
 MnFwSjUwrvn05ueTnRNeF5z+w/LnnOQlJqGGo4bBRgtmX3q0TFqjJF3Mb8bvfI41TD4O235z
 1U6NeCT+1r/ZcoPojxAZ3u0p5bNEDc76On0qsPAtajn48MI6q+QZvoFs0fW694M36/o+4X/W
 nPOl9PmfLRFKiU/n3kv7/Dj7xdyrqupxzzWN5/6Uy8hVVmIpzkg01GIuKk4EANeqj0yLAgAA
X-CMS-MailID: 20200401090524epcas2p33a2ce1324ee7b2511a72c3dfa12d515f
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200401090524epcas2p33a2ce1324ee7b2511a72c3dfa12d515f
References: <CGME20200401090524epcas2p33a2ce1324ee7b2511a72c3dfa12d515f@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

Current topology doesn't add prefix of component to new kcontrol.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 575da6aba807..a152409e8746 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -362,7 +362,7 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
 	struct snd_soc_component *comp = tplg->comp;
 
 	return soc_tplg_add_dcontrol(comp->card->snd_card,
-				comp->dev, k, NULL, comp, kcontrol);
+				comp->dev, k, comp->name_prefix, comp, kcontrol);
 }
 
 /* remove a mixer kcontrol */
-- 
2.21.0


