Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C9151669
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 08:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77A8168A;
	Tue,  4 Feb 2020 08:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77A8168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580800953;
	bh=oOsavM2fFEh5KYWiT5g+ISPQLlKzujDEnClJNdIba8Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N+oSFveLih65GS9tP5+zpkXV7iGvOiQ0O6U98Xgwj+fvnzDW4ObJU/OrpDhmJaY/R
	 epC3MXa4tscl/QOMFjCULOeoe9zOpyj9Ezx0vMQfZt/62BuImvlEZNrDdY7H/wWOm0
	 gkY04eyX+t+6f2vYfrZoKDODKExBd2YsCxv4lxWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 910D3F80212;
	Tue,  4 Feb 2020 08:20:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27235F800F4; Tue,  4 Feb 2020 08:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58EB9F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 08:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58EB9F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="AP0yEZk4"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e391b360000>; Mon, 03 Feb 2020 23:20:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 23:20:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 23:20:36 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 4 Feb 2020 07:20:34 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>
Date: Tue, 4 Feb 2020 12:50:14 +0530
Message-ID: <20200204072017.9554-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580800822; bh=xvt3tfy6ExBkChYGhZPd52BKQr/0+XIUH4nSPItatfc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=AP0yEZk4gPUPYm2cPLhAHvYaJKptBlvfd1M1P31UiSkPCLQltjj65eK9wuYVaWX6z
 W1VC2fnSfbedOAah8X5t9Uy9CanTWKaZ8hMk/yEIVoQTCQ0SzaE6XPmAVuQZNfll+7
 Zp1FcRfDddiIrAZo7ORahtwJvq5DJfFfuYfqt01Z3FpT31T0IhgA94nAaQt89aKKih
 +6WhSe1RObPrZS/HXDdFPcA8DtQujnBIsneqgrURVy7ybUsM0UZiHW85H+L3wd6mbJ
 B1/DJfMJGx5ZjBOUq92F5hVlhzxhSVwzXXq6UFKrDhs9JDfMfvGErNbLpuHbpLxkqW
 CDpaRy6I7Ff+A==
Cc: alsa-devel@alsa-project.org, martin@larkos.de,
 Nikhil Mahale <nmahale@nvidia.com>, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 1/4] ALSA: hda - Simplify
	hdmi_present_sense_via_verbs()
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

The jack report block, was added by commit 464837a7bc0a ("ALSA: hda
- block HDMI jack reports while repolling"), to avoid race condition
with repolling.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 48bddc218829..ee084676f625 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1569,7 +1569,6 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	 * the unsolicited response to avoid custom WARs.
 	 */
 	int present;
-	bool ret;
 	bool do_repoll = false;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
@@ -1603,16 +1602,15 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	else
 		update_eld(codec, per_pin, eld);
 
-	ret = !repoll || !eld->monitor_present || eld->eld_valid;
-
 	jack = snd_hda_jack_tbl_get_mst(codec, pin_nid, per_pin->dev_id);
 	if (jack) {
-		jack->block_report = !ret;
+		jack->block_report = do_repoll;
 		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
 			AC_PINSENSE_PRESENCE : 0;
 	}
 	mutex_unlock(&per_pin->lock);
-	return ret;
+
+	return !do_repoll;
 }
 
 static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
