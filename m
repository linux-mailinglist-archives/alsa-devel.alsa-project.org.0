Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75654254C40
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D521826;
	Thu, 27 Aug 2020 19:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D521826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598549769;
	bh=sSHh0SalXuG7BXFUVBcY5L/8Wsw6PQQfZ7l8uajXaMg=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P1g72ZlaQ/rWhdAmW2BtvMk38jqFpx3VBdkVIvPQEAPZ6zA/JLzr4nv94Sjpj/+0H
	 WjCmdk6/L25vCVpXLd0dBTsdIlZ/dKrFI6hM6WwK6GPHo9irCY5htwZCdPdKKX6ewk
	 WPAtV104FTTykwHrWdiLdLsWHeUxbxFaOpIKPEts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 289D2F800EB;
	Thu, 27 Aug 2020 19:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F3B8F8016F; Thu, 27 Aug 2020 19:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC54F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 19:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC54F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XvcyLiX4"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200827173412euoutp01a8968e3e0cb91a6c6237c97d8adf7eb7~vMHBqYWKV0438704387euoutp01B
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 17:34:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200827173412euoutp01a8968e3e0cb91a6c6237c97d8adf7eb7~vMHBqYWKV0438704387euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598549652;
 bh=FG4lWC3OyYSTOLqHoWMOSEZ22uCxKHsr9ai6/RI9xsA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XvcyLiX4GVkJkxO+lCRDFklWIHp4//bHe9ytEqj4F/nqdfrB6sHoLWDB9sgKHia2V
 quSa2dCsE6qExuihCpL6ekF5ib58G3+x3nl/6+8Kx33yUgJ/4a5TJ5KZ82OiJMRTOC
 jTwbh0smewhFFftvJeHpGor79p7q2U9PfLYECdpE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200827173411eucas1p29395f8de00aeb99cfa455d2567f3f3be~vMHBPD3lW0522405224eucas1p2M;
 Thu, 27 Aug 2020 17:34:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4F.B8.05997.39EE74F5; Thu, 27
 Aug 2020 18:34:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200827173411eucas1p1283200677c5e077c5e07af938934eb5d~vMHA0w_EJ2355723557eucas1p1C;
 Thu, 27 Aug 2020 17:34:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200827173411eusmtrp2e006860f94534a2855b95257a53d0a71~vMHA0IHnN2777327773eusmtrp26;
 Thu, 27 Aug 2020 17:34:11 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-58-5f47ee933c6a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.C6.06314.39EE74F5; Thu, 27
 Aug 2020 18:34:11 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200827173410eusmtip181f6027bcab211c6c172b88b90a66242~vMHATrp0z0123701237eusmtip1a;
 Thu, 27 Aug 2020 17:34:10 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, lgirdwood@gmail.com
Subject: [PATCH 1/2] ASoC: wm8994: Skip setting of the WM8994_MICBIAS
 register for WM1811
Date: Thu, 27 Aug 2020 19:33:56 +0200
Message-Id: <20200827173357.31891-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42LZduzned3J79zjDW53K1pcuXiIyWLjjPWs
 FlMfPmGzuNK6idHi/PkN7BbfrnQwWVzeNYfNYu2Ru+wWn9/vZ7U4/Kad1YHLY8PnJjaPnbPu
 sntsWtXJ5jF9zn9Gj74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4MrovvGVtWAbf8XcFwsZGxi/
 8nQxcnJICJhIrDo+i7GLkYtDSGAFo8TjltdMEM4XRonFf3axQjifGSVmXXzMBtOy9PZDqKrl
 jBJ7Oq6DJcBatp9KBLHZBAwleo/2MYLYIgLaEnNudrCBNDALdDJJnJx8lR0kISwQLXF9zlmg
 FRwcLAKqEs9/gPXyClhLLHh9G2qZvMTqDQeYQXolBH6zSVycMIMZpF5CwEXiWgMTRI2wxKvj
 W9ghbBmJ/zvnM0HUNzNK9Oy+zQ7hTGCUuH98ASNElbXEnXO/2EAGMQtoSqzfpQ8x01GiY2sx
 hMknceOtIEgxM5A5adt0qK28Eh1tQhAzVCR+r5oOdYGURPeT/ywQtofE4/cTGSEhEisx7c1C
 9gmMcrMQVi1gZFzFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmDBO/zv+ZQfjrj9JhxgF
 OBiVeHh37HOPF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRmkOFiVxXuNF
 L2OFBNITS1KzU1MLUotgskwcnFINjFvYVcI0UnJNkgMsvogv4hF555SzXOD1psCu7ae/vZ7z
 Wlvmg2zM+sKqsx9n68/ODJx/2K+/+f56wX93e/XrPhw08fgr5vb6cuGyyO3Hawz2bM37y2Mi
 1HXs0oEegy/nqtkPaXKnOhndVj0Tuf7sm7wvgkyi04NS08R2qXPOl6qStTRaNSXHVImlOCPR
 UIu5qDgRAEjZOnEUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsVy+t/xu7qT37nHG9zezG5x5eIhJouNM9az
 Wkx9+ITN4krrJkaL8+c3sFt8u9LBZHF51xw2i7VH7rJbfH6/n9Xi8Jt2Vgcujw2fm9g8ds66
 y+6xaVUnm8f0Of8ZPfq2rGL0+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DY
 PNbKyFRJ384mJTUnsyy1SN8uQS+j+8ZX1oJt/BVzXyxkbGD8ytPFyMkhIWAisfT2Q6YuRi4O
 IYGljBLbel8zdzFyACWkJOa3KEHUCEv8udbFBmILCXxilLjxOhrEZhMwlOg92scIYosI6Erc
 WnqMGWQOs8BEJolND68zgSSEBSIlbr1fxQgyk0VAVeL5j0SQMK+AtcSC17fZIObLS6zecIB5
 AiPPAkaGVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGBuu3Yz807GC9tDD7EKMDBqMTDu2Of
 e7wQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAu2eyCwlmpwPjKK8knhD
 U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MZX82MPjbWf1qCCj2PLzY
 5LXkragreYzt7+NYxHiOlqy3v3Vc75j8gRVHfMIYlpYKCq5j2y/xdIWz8SZjd5apt3keXhET
 nbOHY9fn3Y3m8U7hHp/jauY+f/+7clHc9wA5p+vSMfP3rnKWjV4q4fYwT1LL/uW2j+c17mg0
 KBpafdz0gGnRdgFVJZbijERDLeai4kQAEXn4fWoCAAA=
X-CMS-MailID: 20200827173411eucas1p1283200677c5e077c5e07af938934eb5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200827173411eucas1p1283200677c5e077c5e07af938934eb5d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200827173411eucas1p1283200677c5e077c5e07af938934eb5d
References: <CGME20200827173411eucas1p1283200677c5e077c5e07af938934eb5d@eucas1p1.samsung.com>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 m.szyprowski@samsung.com
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

The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
initialization of that register for that device.
This suppresses an error during boot:
"wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8994.c  | 2 ++
 sound/soc/codecs/wm_hubs.c | 3 +++
 sound/soc/codecs/wm_hubs.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 038be66..b3ba053 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4193,11 +4193,13 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 			wm8994->hubs.dcs_readback_mode = 2;
 			break;
 		}
+		wm8994->hubs.micd_scthr = true;
 		break;
 
 	case WM8958:
 		wm8994->hubs.dcs_readback_mode = 1;
 		wm8994->hubs.hp_startup_mode = 1;
+		wm8994->hubs.micd_scthr = true;
 
 		switch (control->revision) {
 		case 0:
diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index 891effe..0c88184 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -1223,6 +1223,9 @@ int wm_hubs_handle_analogue_pdata(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, WM8993_ADDITIONAL_CONTROL,
 				    WM8993_LINEOUT2_FB, WM8993_LINEOUT2_FB);
 
+	if (!hubs->micd_scthr)
+		return 0;
+
 	snd_soc_component_update_bits(component, WM8993_MICBIAS,
 			    WM8993_JD_SCTHR_MASK | WM8993_JD_THR_MASK |
 			    WM8993_MICB1_LVL | WM8993_MICB2_LVL,
diff --git a/sound/soc/codecs/wm_hubs.h b/sound/soc/codecs/wm_hubs.h
index 4b8e5f0..988b29e 100644
--- a/sound/soc/codecs/wm_hubs.h
+++ b/sound/soc/codecs/wm_hubs.h
@@ -27,6 +27,7 @@ struct wm_hubs_data {
 	int hp_startup_mode;
 	int series_startup;
 	int no_series_update;
+	bool micd_scthr;
 
 	bool no_cache_dac_hp_direct;
 	struct list_head dcs_cache;
-- 
2.7.4

