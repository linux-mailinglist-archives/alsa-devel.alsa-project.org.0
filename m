Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3522B151
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 11:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731E91796;
	Mon, 27 May 2019 11:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731E91796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558949450;
	bh=cvJ0he3flS3Ym8BxehcqDR/eLvyKrsW2B54CLBFBHZc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3dDQHcZDaIsYgfqKI0MnTz0i200W20DZ9zoFDHPVfYGD48lhlSG5ODrpRZx8ijT+
	 AUsME4MZ4YtEqE/Lp1Jg2yDsLjpXlpRufY9r/b+BzRp8EdOEeXUzr1ZAIM1gp8HHCe
	 DhhDWvnJ4Pnpw/QJp8UfzPEeW6cpdn9uYl0WQ1Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 566CEF896E5;
	Mon, 27 May 2019 11:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F35E8F89725; Mon, 27 May 2019 11:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C64F896E0
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 11:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C64F896E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 02:27:33 -0700
X-ExtLoop1: 1
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 02:27:32 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Mon, 27 May 2019 17:07:25 +0800
Message-Id: <1558948047-18930-3-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 2/4] ASoC: hdac_hdmi: jack_event represents
	the status
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

As jack status represents the monitor connected or not, it represents
a status. So it should not be used as a counter. If driver receives
a monitor disconnection event, it should report this disconnection event
to userspace. For example, if the monitor connection event is sent to
driver twice (this should not happen, but in case there is some mistake),
when driver receives monitor disconnection event, it should still send the
disconnection event to user space.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 5a9e7f9..90c2ee3 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -177,11 +177,6 @@ static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
 		snd_soc_dapm_disable_pin(port->dapm, port->jack_pin);
 
 	if (is_connect) {
-		/*
-		 * Report Jack connect event when a device is connected
-		 * for the first time where same PCM is attached to multiple
-		 * ports.
-		 */
 		if (pcm->jack_event == 0) {
 			dev_dbg(&hdev->dev,
 					"jack report for pcm=%d\n",
@@ -189,17 +184,11 @@ static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
 			snd_soc_jack_report(pcm->jack, SND_JACK_AVOUT,
 						SND_JACK_AVOUT);
 		}
-		pcm->jack_event++;
+		pcm->jack_event = 1;
 	} else {
-		/*
-		 * Report Jack disconnect event when a device is disconnected
-		 * is the only last connected device when same PCM is attached
-		 * to multiple ports.
-		 */
 		if (pcm->jack_event == 1)
 			snd_soc_jack_report(pcm->jack, 0, SND_JACK_AVOUT);
-		if (pcm->jack_event > 0)
-			pcm->jack_event--;
+		pcm->jack_event = 0;
 	}
 
 	snd_soc_dapm_sync(port->dapm);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
