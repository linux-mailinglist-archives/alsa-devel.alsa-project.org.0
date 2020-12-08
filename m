Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11A2D2F31
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 17:14:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB4B16C2;
	Tue,  8 Dec 2020 17:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB4B16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607444051;
	bh=XgtpZdL2AMIoHO+VE1syi8rmg78v2PJ1bgh7IMkKvPE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BiuTpv177DioAFQPRuckYe0UP7JU4GUwv4E4xJ2Nx7rmzUFRrKy583lZ4ySs8Bd3P
	 7KvV3E8l7jwWy6EhGLiIJpsRg3+/HyL/nZlvsuHt9Qcl4Ce5PC1iLWMTYC4OYcCVPk
	 Tma1AuP2TTX1Jng58pdfZczv9YsGeE1K5BQqQm6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 861B4F8019D;
	Tue,  8 Dec 2020 17:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92A7F8019D; Tue,  8 Dec 2020 17:12:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E960F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 17:12:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E960F8010A
IronPort-SDR: 2NoyyH8wzupbZjYhc5d/Giu9wb00nIwS+kUlEn/KpaM03j+elDevyRxDZ1nWLvn3ZsJdBTVZrP
 1ZnA/wARhQRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="171344629"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="171344629"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 08:12:17 -0800
IronPort-SDR: MIIeZ22/zm0c0YHtXpGhaEr2JLvE5bNrL1SYXrwOW4XWovtutdIF9IJrguIUNaxlcg5Zu5RyvU
 xLFusinORGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="540304110"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2020 08:12:16 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/proc - print DP-MST connections
Date: Tue,  8 Dec 2020 18:09:41 +0200
Message-Id: <20201208160941.2797510-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

To help in debugging issues with DisplayPort Multi-Stream Transport (aka
DP-MST) support, print information of active connections for
each device of a display audio pin widget.

Example output with the patch with two monitors connected to a DP-MST hub:

Devices: 4
     Dev 00: PD = 0, ELDV = 0, IA = 0, Connections [ 0x03* 0x05 0x07 0x09 ]
     Dev 01: PD = 1, ELDV = 1, IA = 0, Connections [ 0x03* 0x05 0x07 0x09 ]
    *Dev 02: PD = 1, ELDV = 1, IA = 0, Connections [ 0x03 0x05* 0x07 0x09 ]
     Dev 03: PD = 0, ELDV = 0, IA = 0, Connections [ 0x03* 0x05 0x07 0x09 ]
Connection: 4
     0x03 0x05* 0x07 0x09

Format of existing "Connection:" entry is left intact to keep
compatibility.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_proc.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
index 0631f31ef87f..e1cba574cadb 100644
--- a/sound/pci/hda/hda_proc.c
+++ b/sound/pci/hda/hda_proc.c
@@ -679,6 +679,39 @@ static void print_gpio(struct snd_info_buffer *buffer,
 	print_nid_array(buffer, codec, nid, &codec->nids);
 }
 
+static void print_dpmst_connections(struct snd_info_buffer *buffer, struct hda_codec *codec,
+				    hda_nid_t nid, int dev_num)
+{
+	int c, conn_len, curr, dev_id_saved;
+	hda_nid_t *conn;
+
+	conn_len = snd_hda_get_num_raw_conns(codec, nid);
+	if (conn_len <= 0)
+		return;
+
+	conn = kmalloc_array(conn_len,
+			     sizeof(hda_nid_t),
+			     GFP_KERNEL);
+
+	dev_id_saved = snd_hda_get_dev_select(codec, nid);
+	snd_hda_set_dev_select(codec, nid, dev_num);
+	if (snd_hda_get_raw_connections(codec, nid, conn, conn_len) < 0)
+		goto out;
+
+	curr = snd_hda_codec_read(codec, nid, 0,
+				  AC_VERB_GET_CONNECT_SEL, 0);
+
+	for (c = 0; c < conn_len; c++) {
+		snd_iprintf(buffer, " 0x%02x", conn[c]);
+		if (c == curr)
+			snd_iprintf(buffer, "*");
+	}
+
+out:
+	kfree(conn);
+	snd_hda_set_dev_select(codec, nid, dev_id_saved);
+}
+
 static void print_device_list(struct snd_info_buffer *buffer,
 			    struct hda_codec *codec, hda_nid_t nid)
 {
@@ -702,10 +735,14 @@ static void print_device_list(struct snd_info_buffer *buffer,
 			snd_iprintf(buffer, "     ");
 
 		snd_iprintf(buffer,
-			"Dev %02d: PD = %d, ELDV = %d, IA = %d\n", i,
+			"Dev %02d: PD = %d, ELDV = %d, IA = %d, Connections [", i,
 			!!(dev_list[i] & AC_DE_PD),
 			!!(dev_list[i] & AC_DE_ELDV),
 			!!(dev_list[i] & AC_DE_IA));
+
+		print_dpmst_connections(buffer, codec, nid, i);
+
+		snd_iprintf(buffer, " ]\n");
 	}
 }
 
-- 
2.28.0

