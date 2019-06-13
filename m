Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F644C0C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:22:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A60918BE;
	Thu, 13 Jun 2019 21:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A60918BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453742;
	bh=hH2ensWMaqkBSvrAqqog6F0iWS/UoM42H7Cm06CbwTQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=doWRRZbl4KGworaQklb2bEp2i9eG2kzOS5y48AdufLmqU6481z3hLjU9Sj6vz6YG0
	 i0/W2F90qsSG4lgT0/p52zZmw2//8KGUMZ6IlTLmKzXF++GH2OPG8Wr6DOjRWiuYoD
	 lFEyv7kYSoGU21po9GcHSWkpDP60pCz54jBrZv84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE0B2F897A7;
	Thu, 13 Jun 2019 21:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37221F8977A; Thu, 13 Jun 2019 21:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0FC6F896F1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FC6F896F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sZFcb5N2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jb16YznCRE5HQevibjg2W3ZxpsXNXm+H9zfkc7IoFH8=; b=sZFcb5N2bfJk
 OWCnj9w/pjqmt8LZcTYh/VpmB0fX5w72xJn59RGqIHIRDQHaXdpoolg2FMoTiTl6cmgnpSfmrM+sk
 O4OmSn4hXfXk22OVA51xwnsdAfEV45gQe83S4Tkoje65xLslWNczRYQRrSrOH82ikQ/+Tfdr0dlUK
 l56TI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV35-0005SX-4z; Thu, 13 Jun 2019 19:06:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A220B440046; Thu, 13 Jun 2019 20:06:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190613115412.13921-1-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190610.A220B440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:10 +0100 (BST)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: codec: hdac_hdmi: fix pin connections
	at cvt enable" to the asoc tree
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

The patch

   ASoC: codec: hdac_hdmi: fix pin connections at cvt enable

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 489f231e0f4c44d4d019aa5c26e1c3f147875f13 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 13 Jun 2019 14:54:12 +0300
Subject: [PATCH] ASoC: codec: hdac_hdmi: fix pin connections at cvt enable

In display codecs supported by hdac_hdmi, the connection indices are
shared by all converters. At boot and resume from suspend,
the connection state may be reset to default values.

In case of multiple connected pins (multiple monitors connected
with audio capability), routing and mute status of pins that
are not connected to any PCM, may interfere with other pins.
E.g. after resume from S3 with multiple monitors, unless
all converters are in active use, playback to some PCMs may
be muted due to the default settings of unrelated converters.

Avoid this by ensuring all pin:cvt selections are correct
in codec whenever a converter is enabled for playback.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hdmi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 660e0587f399..7eba57157bb9 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -546,6 +546,29 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 	return NULL;
 }
 
+/*
+ * Go through all converters and ensure connection is set to
+ * the correct pin as set via kcontrols.
+ */
+static void hdac_hdmi_verify_connect_sel_all_pins(struct hdac_device *hdev)
+{
+	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
+	struct hdac_hdmi_port *port;
+	struct hdac_hdmi_cvt *cvt;
+	int cvt_idx = 0;
+
+	list_for_each_entry(cvt, &hdmi->cvt_list, head) {
+		port = hdac_hdmi_get_port_from_cvt(hdev, hdmi, cvt);
+		if (port && port->pin) {
+			snd_hdac_codec_write(hdev, port->pin->nid, 0,
+					     AC_VERB_SET_CONNECT_SEL, cvt_idx);
+			dev_dbg(&hdev->dev, "%s: %s set connect %d -> %d\n",
+				__func__, cvt->name, port->pin->nid, cvt_idx);
+		}
+		++cvt_idx;
+	}
+}
+
 /*
  * This tries to get a valid pin and set the HW constraints based on the
  * ELD. Even if a valid pin is not found return success so that device open
@@ -806,6 +829,14 @@ static int hdac_hdmi_cvt_output_widget_event(struct snd_soc_dapm_widget *w,
 				AC_VERB_SET_CHANNEL_STREAMID, pcm->stream_tag);
 		snd_hdac_codec_write(hdev, cvt->nid, 0,
 				AC_VERB_SET_STREAM_FORMAT, pcm->format);
+
+		/*
+		 * The connection indices are shared by all converters and
+		 * may interfere with each other. Ensure correct
+		 * routing for all converters at stream start.
+		 */
+		hdac_hdmi_verify_connect_sel_all_pins(hdev);
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
