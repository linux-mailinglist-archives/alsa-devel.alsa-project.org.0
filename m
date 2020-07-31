Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2D234A5C
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 19:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDC41665;
	Fri, 31 Jul 2020 19:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDC41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596217254;
	bh=gAIqYBWDjk5naLtiZ2V42qUygdggOzpRP2KU9kV3xYk=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TEWyH6ajGGscvHWBuQj4HLNbZrZx3MSDWRU7+Bnk+UsasqRKYKaYbrtrp1psrlzih
	 w5CuPHpRHJYv/FtY0N7P/4cGuVkxBuU6kWXmjGAxMOV+F2jYi88yTV3r4/0dxSGfW3
	 DMCbej0OqA+WlQRdi9VTWaVJnbfg/WvSrqFzuo4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DB9F801A3;
	Fri, 31 Jul 2020 19:39:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB01F80111; Fri, 31 Jul 2020 19:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76518F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 19:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76518F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="pH567Zyl"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200731173858euoutp024bce27eb960719ef5b526eeda3389e21~m5wevztPv0982409824euoutp02s
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 17:38:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200731173858euoutp024bce27eb960719ef5b526eeda3389e21~m5wevztPv0982409824euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1596217138;
 bh=u4kQKnN+M9Yc7ZVHPLxmGzXSC90Qgt16NBkoLuo9GJ0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=pH567ZylAvA3g7R/yJjTQEoxyrDDhC1iLX8GhMaUER7z1HYGwQvbU7oOY26U/Ffpb
 usK3V0MZuYp0wAM9pPX0Qf2gnE110cJyQlya9M6GJKhviWbWZ6rMS1oRmcnvih187i
 PpMmhRFKyRJipP8qq9RrOIjwVTQFW+l191/vieos=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200731173857eucas1p1b68417e7cfe414bf0d8fd6c13a664d09~m5wdtvotC1181011810eucas1p1Z;
 Fri, 31 Jul 2020 17:38:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 97.CF.06318.037542F5; Fri, 31
 Jul 2020 18:38:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b~m5wdMudlb1279112791eucas1p2E;
 Fri, 31 Jul 2020 17:38:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200731173856eusmtrp1c5ecea289e21bd18c55940381d8aaad8~m5wdMGO1P3251732517eusmtrp1_;
 Fri, 31 Jul 2020 17:38:56 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-77-5f24573070ef
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 21.48.06017.037542F5; Fri, 31
 Jul 2020 18:38:56 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200731173856eusmtip2cb77ca37efe92d5f28f4255ffc825240~m5wcv6j6_1601416014eusmtip2c;
 Fri, 31 Jul 2020 17:38:55 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, ckeepax@opensource.cirrus.com
Subject: [PATCH RFC] ASoC: wm8994: Avoid attempts to read unreadable registers
Date: Fri, 31 Jul 2020 19:38:34 +0200
Message-Id: <20200731173834.23832-1-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsWy7djPc7oG4SrxBrPPWlhcuXiIyWLjjPWs
 FlMfPmGzuNK6idHi25UOJou1R+6yW3x+v5/V4vCbdlaLLWduszlwemz43MTmsXPWXXaPTas6
 2Txa1m9i85g+5z+jR9+WVYwBbFFcNimpOZllqUX6dglcGUsOvmIuOMtd0bP7AlsD4z3OLkZO
 DgkBE4mj95vYuxi5OIQEVjBK9M7+ygrhfGGUuLm5gQnC+QyU+fqeGabl4PEZbBCJ5YwSt2b9
 Z4Nrubemhw2kik3AUKL3aB8jiC0iYCqxacovsCXMAmcZJe6f6QUq4uAQFgiQuLirCqSGRUBV
 YvrJe+wgYV4Ba4k5OyohlslLrN5wgBmkVULgPZvEySlP2SESLhLHnz5jhLCFJV4d3wIVl5E4
 PbmHBaKhmVGiZ/dtdghnAtDi4wugOqwl7pz7BXYEs4CmxPpd+hBhR4lrmyDCEgJ8EjfeCoKE
 mYHMSdumM0OEeSU62oQgqlUkfq+azgRhS0l0P/nPAmF7SBw9dRUsLiQQK3Hi6Sz2CYxysxB2
 LWBkXMUonlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYLE7/O/51B+O+P0mHGAU4GJV4eCuE
 VeKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS
 1OzU1ILUIpgsEwenVANj8eVa41ghg99qbm/0n+pFTA2ZnC0X79G18avyQ72DlT6qjBNOZJ+c
 XeeldWDKH7Hkxbylz6e8Ud1Ucvvuk2tis/dP82d/eHVd+beVVQtTv0Ufba0/cU0y6QKHwrnH
 pUcCCgV+iOoeKZ3LyCGc8LS3YcvBiZPOXJoeubLB0Kq04LzG5ZCik5lHlViKMxINtZiLihMB
 YIxYtRIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsVy+t/xe7oG4SrxBg9bpCyuXDzEZLFxxnpW
 i6kPn7BZXGndxGjx7UoHk8XaI3fZLT6/389qcfhNO6vFljO32Rw4PTZ8bmLz2DnrLrvHplWd
 bB4t6zexeUyf85/Ro2/LKsYAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNT
 JX07m5TUnMyy1CJ9uwS9jCUHXzEXnOWu6Nl9ga2B8R5nFyMnh4SAicTB4zPYuhi5OIQEljJK
 /N99iLGLkQMoISUxv0UJokZY4s+1LqiaT4wSd75/ZgZJsAkYSvQe7WMEsUUEzCVmrDgEVsQs
 cJVRoq/pKAtIQljAT6J17xUmEJtFQFVi+sl77CALeAWsJebsqIRYIC+xesMB5gmMPAsYGVYx
 iqSWFuem5xYb6RUn5haX5qXrJefnbmIEhui2Yz+37GDsehd8iFGAg1GJh7dCWCVeiDWxrLgy
 9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYF2T2SWEk3OB8ZPXkm8oamhuYWlobmx
 ubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRs9PDaX9/TEWK2ef9jBveHqkiIeBt8FB
 Yvl+26PFkdZLWd8kFrwNXaP1OWH6549L9S7uM5Rb/yE5+seBZ5ccn8Vf+bau/fVZnx/Mx1bt
 z+8uueL7Qzpaa1prqN3LRSua1/+aK8VTrX/z/nKr6OWF/1doiZ0NC7ktySa3tONVxts8zqgF
 HwQCm5RYijMSDbWYi4oTAfN55uJnAgAA
X-CMS-MailID: 20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b
References: <CGME20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b@eucas1p2.samsung.com>
Cc: simon@lineageos.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, m.szyprowski@samsung.com
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

The driver supports WM1811, WM8994, WM8958 devices but according to
documentation and the regmap definitions the WM8958_DSP2_* registers
are only available on WM8958. In current code these registers are
being accessed as if they were available on all the three chips.

When starting playback on WM1811 CODEC multiple errors like:
"wm8994-codec wm8994-codec: ASoC: error at soc_component_read_no_lock on wm8994-codec: -5"
can be seen, which is caused by attempts to read an unavailable
WM8958_DSP2_PROGRAM register. The issue has been uncovered by recent
commit "e2329ee ASoC: soc-component: add soc_component_err()".

This patch adds a check in wm8958_aif_ev() callback so the DSP2 handling
is only done for WM8958.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/codecs/wm8958-dsp2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 68a3b48..3bce9a1 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -412,8 +412,12 @@ int wm8958_aif_ev(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wm8994 *control = dev_get_drvdata(component->dev->parent);
 	int i;
 
+	if (control->type != WM8958)
+		return 0;
+
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.7.4

