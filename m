Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F14CE9FE
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Mar 2022 09:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362621743;
	Sun,  6 Mar 2022 09:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362621743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646553869;
	bh=ZZ+OtJOuogCOK45CGSAO0Tp44JBnJ9yubwcBDFH8KSs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cWj1mWXFWXgWFDyudDhhfK59Rfz8+wD0AYmQSMitgKvv2RB3GXgIDwPoVy0Xe1/51
	 h8pYZEj45HB6FkIb1XYKafOLGU71zMxykPvI7U7U0nyDy6/wesKIE6eFJfTEq+oyT+
	 1xRnonjPmypvB8hTrNPb75F4ATWx5YivvftSqhsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98BB4F801F5;
	Sun,  6 Mar 2022 09:03:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DC01F80237; Sat,  5 Mar 2022 13:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFB4F800E4
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 13:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFB4F800E4
X-QQ-mid: bizesmtp90t1646484673tmmsihaa
Received: from localhost.localdomain ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 05 Mar 2022 20:51:08 +0800 (CST)
X-QQ-SSF: 01400000002000B0I000000A0000000
X-QQ-FEAT: GiB59JtT4hAixvUU2qMoUK1jxRaTIQvQpwNoHAYOtAikGp4o7FujPsm4KBCi+
 uVQPuReEEfBKYprwtvfCTYJs5343XjPZY3W2QVV+JWWaMPx0guzNqRTPAMYx6Rp58oRc4Qy
 XdgY/PXb+IZhSwYshdtwFPgWq8tfStviCNxVXMLeOI0zc9hzZUt/89SWqZx/GJsbWsHaRvI
 bSK/lbPRwInv6hWY/wfJ6rY9NBPjWTq98g2GWfGbdihVmt1UXD8rDEDnxxSnv6kJI3k+oAh
 LxS/966DoHhRMeTB8/XwlQ0Z7t03Z/473ci74uTPQekaGGSF5HjDJbKaQPDCvv6Jw+KAd8e
 PWXuDcRZER2Ot/R0Fc=
X-QQ-GoodBg: 1
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ASoC: intel: use asoc_substream_to_rtd()
Date: Sat,  5 Mar 2022 20:51:05 +0800
Message-Id: <20220305125105.142704-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sun, 06 Mar 2022 09:03:19 +0100
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, zhanglianjie <zhanglianjie@uniontech.com>
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

Now we can use asoc_substream_to_rtd() macro,
let's use it.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 939a9b801dec..a26000cd5ceb 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -74,7 +74,7 @@ static struct catpt_stream_template *catpt_topology[] = {
 static struct catpt_stream_template *
 catpt_get_stream_template(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
 	enum catpt_stream_type type;

@@ -593,7 +593,7 @@ static int catpt_component_pcm_construct(struct snd_soc_component *component,
 static int catpt_component_open(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);

 	if (!rtm->dai_link->no_pcm)
 		snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
@@ -604,7 +604,7 @@ static snd_pcm_uframes_t
 catpt_component_pointer(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
--
2.20.1



