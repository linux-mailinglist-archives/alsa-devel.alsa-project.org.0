Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3071CD073
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 05:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B7215F2;
	Mon, 11 May 2020 05:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B7215F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589168021;
	bh=yGMFMRv4f89+DameNEBteZK1rledBY0fRlmd/YsCWmI=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V37VwMOkE6vQrlzFkezXFV4P0wGWSGqZ1m1/6rrROVYa5TZJMZT+vMnqsSpkQQPtO
	 FjWHjuIZhUMOEOddmc5z/x2oPeBrbb19FontnYvw+DiE3YJ6ALEg7+mVEPBID7cFvQ
	 3VmgQ8P5hKo3nXXyDjubd0S/4LQ/Le7k64H1oagU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA20DF801F2;
	Mon, 11 May 2020 05:31:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED039F8027D; Mon, 11 May 2020 05:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C448BF801F2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 05:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C448BF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="F0PZ8edW"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200511033110epoutp0461f6259858f843d72f3ad07744b1516b~N28Ik6QS_1361313613epoutp04T
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 03:31:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200511033110epoutp0461f6259858f843d72f3ad07744b1516b~N28Ik6QS_1361313613epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589167870;
 bh=bchrPLaSvPE/9JeSX/j/z4iqKebq0Wx8IOr5Gw4NNWk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=F0PZ8edWZosU8FZx50vCT8B0lUkl2jepXm8DzZ2GzOvMIlpiPQ0tS4D1zqN+VeP7Q
 vIyG+G3jm7Z8WrRBE+Bc2SdX8NugToCnH7aMQM3eYQEwIAUStasCStzg4NvCkdCTDV
 mHhqwQqfLmIX/R44S4B1oNByWYfHwoszDOQ8cTfM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200511033109epcas2p30ce24254813125d42701c1466a0c3e33~N28HxLvF72804428044epcas2p3q;
 Mon, 11 May 2020 03:31:09 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.186]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49L60W5DKtzMqYkZ; Mon, 11 May
 2020 03:31:07 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 45.14.04647.BF6C8BE5; Mon, 11 May 2020 12:31:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e~N28FzTyzo2681726817epcas2p29;
 Mon, 11 May 2020 03:31:07 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200511033107epsmtrp2d3a201db69b0dc57633775b01440ffbb~N28FycQDY2323523235epsmtrp26;
 Mon, 11 May 2020 03:31:07 +0000 (GMT)
X-AuditID: b6c32a48-8a5ff70000001227-ed-5eb8c6fb1b09
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.EA.25866.BF6C8BE5; Mon, 11 May 2020 12:31:07 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200511033107epsmtip1c42cdf0019682d068bfce9831602b63d~N28Fj4O9k0947209472epsmtip1B;
 Mon, 11 May 2020 03:31:07 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-dai: pull out be_hw_params_fixup from
 snd_soc_dai_hw_params
Date: Mon, 11 May 2020 12:31:06 +0900
Message-ID: <000001d62744$9b631670$d2294350$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYnQamtqD9wwKvKSHanH5z5Y1p+gw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d17d71mq+u0PKyodSMiQ92Ws2toD4pa1B+jIqKkddGbs/Zi
 dxtZBGpkPkiULGpWaFGGUS6Zy4xC1N4vNK2UHmRWFGvmA8VetOtd5H+fc873+zvncH4Urqgn
 lVSO1ck7rJyZIacQ/rZFbMLPu0071X8qF7NdHa0Ye/x9P8me9JcSbP7bcpK93O3D2NGuIoy9
 03EeY71jVxDbnl+JrYzUe4cLSP0Nz5sIfUNdMakv89Uhfb2vmzDItpvTTDyXxTtUvDXTlpVj
 zU5nNmw2rjbqUtSaBE0qu5RRWTkLn86s2WhIWJtjDk3EqNyc2RVKGThBYJKWpzlsLievMtkE
 ZzrD27PMdo3GnihwFsFlzU7MtFmWadRqrS6k3GU21bR4ZXYfva8iWIby0H15CYqkgE6GX52j
 shI0hVLQTQh6A8FwMIRg8NJhJAXDCLzBGvKf5fntgExkBd2MoKpriyT6gqD7XSUmFkg6AUbe
 vsZFjqUBRprvY6IIp9sRfPrQRoiFGHobXG4fRSIT9AIo/FAwYZbTqXDlzXdC4mh4cKp/gnF6
 Llz/dhqXplDB+MeLoSmoUINEKC4DSRILVcWFuNgL6KMUDNT1EpJ+DRQ0jmESx8DXe74IiZUw
 HLxFSoZDCIJPfoULlQiKSxUSLwHfmYeY2AynF0F9c5KIQM+H9t7waNOgqO13hJSWQ1Fh2MjA
 tYd/MCkNcNYbflsPfTf9RDma55m0o2fSjp5Jy3j+t61GRB2aydsFSzYvaO3Jk2/dgCY+a7y+
 CbU83diKaAoxU+UGVdNOhYxzC7mWVgQUzsTKay2hlDyLy93PO2xGh8vMC61IFzpBBa6ckWkL
 fX2r06jRaVNS1Kk6VpeiZZk4eUNUT4aCzuac/F6et/OOfz6MilTmofyXB3vds6uTa/2zHiiP
 HXjZ4b/w4txI7KbUrXnGgbQkcO3v2RMIdB7acc8Ql6iNTj/ivOQeOjFu3JDRs0x3M+NxxW7F
 8oI5TIarM77owoHTzzYfdtf0rT/SaF1YYlt1ravvx6vrcVfH1q14qjFVTY8qfDQeiG64/Vnf
 eLGkFjseQQ4yhGDiNPG4Q+D+AoTHt53CAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnO7vYzviDH7PELK4cvEQk8XUh0/Y
 LGZs62axaLw3gc1i9dUtTBbfrnQwWRy9uJjJYsP3tYwWRxqnMDlwemz43MTmsXPWXXaPTas6
 2Tz6tqxi9Fi/5SpLAGsUl01Kak5mWWqRvl0CV8bCAxtYC7YIVEx818fYwHiCt4uRk0NCwETi
 8r43rF2MXBxCAjsYJaZc/ccKkZCQ+DD/DDuELSxxv+UIVNFzRomHn+4zgyTYBHQlvty7A2aL
 ADV82XWCCaSIWeAco8T2TY1sIAlhgTCJ/20tYEUsAqoSbY+bmEBsXgFLibV3P7BA2IISJ2c+
 AbOZBbQlnt58CmXLS2x/O4cZ4goFiZ9PlwFdwQG0TE+is08CokREYnZnG/MERsFZSCbNQjJp
 FpJJs5C0LGBkWcUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERw1Wlo7GPes+qB3iJGJ
 g/EQowQHs5II7/LcHXFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeb/OWhgnJJCeWJKanZpakFoE
 k2Xi4JRqYDq8mXv58aMGfbm3n8anrAhMt6s6/ERz267JHznsdrGGn/hQ9ko6+x4XZ8BBzpxM
 qx9N9tNijm7bNC0vdFeRTdEaBw7Fhylhbxs4Xm1e2pBxorlsxbpi64NyklNmuDmrn9t64dXs
 2olCcn83lga8k/q+6/V7v5dlzyfcXbvghEm8+1UtpqmvntULnD1/66a1fJX03vnfbtrY7FoQ
 /dtxy4sGaUWeEGvdeys3bihSVzeP/DVDpFqt/KeR9eJdkd+e3dvO+kft45mcxs8HDn//6Vr2
 WPVfenjPirwz7nn+H6ZPXtD5VOHi6exNKaeEdfOZjvgZvJq1buPdmuCjmgIC6is11rOnTT/4
 q/rPgsRi783WSizFGYmGWsxFxYkAQpbjqQkDAAA=
X-CMS-MailID: 20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e
References: <CGME20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e@epcas2p2.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, hmseo@samsung.com, tkjung@samsung.com,
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

When dpcm_be_dai_hw_params() called, be_hw_params_fixup() callback is
called with same arguments 3times.
It is called in be_hw_params_fixup() itself and in soc_pcm_hw_params()
for cpu dai and codec dai.
Tested in 5.4.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-dai.c  | 12 ------------
 sound/soc/soc-dapm.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 31c41559034b..4785cb6b336f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -257,20 +257,8 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	int ret;
 
-	/* perform any topology hw_params fixups before DAI  */
-	if (rtd->dai_link->be_hw_params_fixup) {
-		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
-		if (ret < 0) {
-			dev_err(rtd->dev,
-				"ASoC: hw_params topology fixup failed %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	if (dai->driver->ops->hw_params) {
 		ret = dai->driver->ops->hw_params(substream, params, dai);
 		if (ret < 0) {
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e2632841b321..d86c1cd4e8fa 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3886,6 +3886,17 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
 		= config->channels_max;
 
+	/* perform any topology hw_params fixups before DAI  */
+	if (rtd->dai_link->be_hw_params_fixup) {
+		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
+		if (ret < 0) {
+			dev_err(rtd->dev,
+				"ASoC: hw_params topology fixup failed %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 	snd_soc_dapm_widget_for_each_source_path(w, path) {
 		source = path->source->priv;

base-commit: f3643491bd079c973ac6c693da7966cd17506ca3
-- 
2.21.0


