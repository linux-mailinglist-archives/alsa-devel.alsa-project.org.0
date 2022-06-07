Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4153F6B4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 08:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D339190A;
	Tue,  7 Jun 2022 08:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D339190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654585111;
	bh=ltG5EA89P5458FWJlE4pP+qBvyqGHll6hn4SSQ4lbK0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hKi+uC283UnNxmnYI7CkLacgSFWe/G1+YA1IKGVSjfzBqWQuahIDOlpo0rim/MBiF
	 Kqu8hn2puqfLDrE422hkXzDIvzHNAEvdWZn0oM/i8QvMxw3jhgA6kuEQqij2eTnpzP
	 1KropiaiGfaqITptjIhuQ1BFWflNQ3AEBoYQYqNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA680F800ED;
	Tue,  7 Jun 2022 08:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1330AF800ED; Tue,  7 Jun 2022 08:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 317F6F800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 08:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 317F6F800ED
X-QQ-mid: bizesmtp73t1654585032t8s42oo4
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 07 Jun 2022 14:57:10 +0800 (CST)
X-QQ-SSF: 01400000002000B0I000B00A0000000
X-QQ-FEAT: 3uawQE1sH+0UENyeZvBC2+CqJpj1X/QUXqr0o5erVBPRI3rYEoJGAe8aH2Z25
 8OgPf7MwX9EgjwGBudMmQ6qGoUtpJ/S+lJ5tB7hvZq8BsklQ+Yt7UcoTMhRoxww78M7Z13o
 iDaqoANJdy69LLTTKtKCmYTYlUpyehXGDJj/kzTX3ue0Z1JpMbs0FU+VyjkWV4fSWaFBXWM
 Fa/2ovqlMsZoPK+4dnDWbht8YPZRCTwnNq/UIIh6wMehcRPW0Puw+R201pgKlRyRzNUEAHm
 A3cxriZ4W2WkpbJw3dttm5tp3gA28bJn4a+G/1/aU/geTTbxGN2WrP/9wwV7rorXT7kTYfC
 xdcd8dN2/bOVpFbf54=
X-QQ-GoodBg: 2
From: huangwenhui <huangwenhuia@uniontech.com>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/conexant - Fix loopback issue with CX20632
Date: Tue,  7 Jun 2022 14:56:31 +0800
Message-Id: <20220607065631.10708-1-huangwenhuia@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 huangwenhui <huangwenhuia@uniontech.com>
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

On a machine with CX20632,Alsamixer doesn't have 'Loopback
Mixing' and 'Line'.

Signed-off-by: huangwenhui <huangwenhuia@uniontech.com>
---
 sound/pci/hda/patch_conexant.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index aa360a0af284..1248d1a51cf0 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1052,6 +1052,13 @@ static int patch_conexant_auto(struct hda_codec *codec)
 		snd_hda_pick_fixup(codec, cxt5051_fixup_models,
 				   cxt5051_fixups, cxt_fixups);
 		break;
+	case 0x14f15098:
+		codec->pin_amp_workaround = 1;
+		spec->gen.mixer_nid = 0x22;
+		spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
+		snd_hda_pick_fixup(codec, cxt5066_fixup_models,
+				   cxt5066_fixups, cxt_fixups);
+		break;
 	case 0x14f150f2:
 		codec->power_save_node = 1;
 		fallthrough;
-- 
2.20.1



