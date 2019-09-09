Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02EADFB0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 21:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C8B1667;
	Mon,  9 Sep 2019 21:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C8B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568058835;
	bh=6vA395Hrl/Y1+FjhQsAuF4do38inpxTfMYvlKzAcHPM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IVvY1aaVY+VZheMCw56h5IMrsD/ilCufSzCp0HkIwLCVmoSmCORE/JNYi1oc+cEl7
	 kq5r0Dkm1oHc8pnJnC7VqpplDJ5nrdIC02DlbvuKM1IHmC5eLDz0cKbeDnioazolVv
	 9gHZNAWPEQFBkk7apw7qkSL61FCKbXA1vdwGEwwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE11F800C9;
	Mon,  9 Sep 2019 21:52:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B987F80323; Mon,  9 Sep 2019 21:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C032F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 21:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C032F800C9
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N1x2P-1iIZj622rR-012H2S; Mon, 09 Sep 2019 21:52:01 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Mon,  9 Sep 2019 21:51:43 +0200
Message-Id: <20190909195159.3326134-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:gapkT++dW/u0T3Hv/dXCemLrT+qeHLxTRC7Df4YYvlCWiLXXb89
 Z9FHg4c/nG9ra4DLNXZ0PcJkJ7cnzAgDLI6ZwLI2is1EJmyHtbzJ3bvrf9t7OAGaA1Xn95Q
 +47ZpbYw45l5GBldArJvAbecHUuaQrpMktX/zG9Oevaff1iVX4FBt2UzsNtCup/0u7N+0+S
 pB2ej5Z3stbRaf0bHVyaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5We9ZmG2fbc=:bEn6ODlb9DT5uU5/ve/uek
 jLpamsrcMYhJNidVceg3twMkEVGkFUVfweyUIBg9ZjGWYw0KFGjM9oqjtjVEoU49fBkoBK2ar
 cGn49aGt6XSME7QBKqMW0DZniDdBTMlReapev877tM6J1bfFRsDTIW97rXmCwV2AARRX/5iY/
 XS+FjfaVDqJIBs8jNX6zd8sczJtRsEErVhwgWiq37BSVsFPfX65neuWJpFRhngDztD6MkziWd
 0XWXSIPcqcA8tjRybiYT+wZZVqGXgT6usyiGu+06UWY5pYL162znoOSEkLyYbLlXrZrmchloG
 HKjT58PqGoPurmn7/cGfYjpc2aLBQQvSaRPBHLUMsXmyS/6S4wK2HD3tIvl0JVr89HxIRBq4L
 PtvTyJhM6esx3WeQ/YpBhZ05IdQqC2o3mdgbarzPtD+KcPg4hdR1dI17NsuCOhNI6ZNYxSR4J
 DyK7Vy5/9K0Lf7QRW8Av3VyEByNCql4GkifPCvW/JHCWebRJRcIrCnfN+PkzQ5kRMg1dzeIMR
 gHqVFJ6gaHYT9xmqjt6iHqFrZdUDy0dUb3l1gk+AW2OpjZhawPPNIbpf7Lakvedm6TqL9sCK+
 6Vy5I7r6Ej40l2jlxkLSIZ5hexbkIhux9dX2fyWt/z1sIzDXNImJEXFXnoDTL0cOFUfY8ocSs
 z831na6maxRBhKU/61FRzwoOSmWuLZ/qBTsDjLhiVJYFz61WkOslDA0j/EeEi3wjJq+zo/b7O
 h7vPC8XdHnbLotL9o/RrE7BK4Mqg9fuupc7KB4/aMQM5/vFlk3mKByAIBFcBE3pEHHmED9YED
 fBURvS36QpmMJaVD4SiLx8cfQOllWS04/4z7SCHagt7PzHHSs8=
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: work around
	snd_hdac_aligned_read link failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When CONFIG_SND_HDA_ALIGNED_MMIO is selected by another driver
(i.e. Tegra) that selects CONFIG_SND_HDA_CORE as a loadable
module, but SND_SOC_SOF_HDA_COMMON is built-in, we get a
link failure from some functions that access the hda register:

sound/soc/sof/intel/hda.o: In function `hda_ipc_irq_dump':
hda.c:(.text+0x784): undefined reference to `snd_hdac_aligned_read'
sound/soc/sof/intel/hda-stream.o: In function `hda_dsp_stream_threaded_handler':
hda-stream.c:(.text+0x12e4): undefined reference to `snd_hdac_aligned_read'
hda-stream.c:(.text+0x12f8): undefined reference to `snd_hdac_aligned_write'

Add an explicit 'select' statement as a workaround. This is
not a great solution, but it's the easiest way I could come
up with.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 479ba249e219..9180184026e1 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -248,6 +248,7 @@ config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_HDA_LINK_BASELINE
+	select SND_HDA_CORE if SND_HDA_ALIGNED_MMIO
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
