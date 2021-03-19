Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85D3416FF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 09:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB6A1695;
	Fri, 19 Mar 2021 09:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB6A1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616140856;
	bh=ufgGXzRwU4zk5qmX0p7scCNqZP+BbfyKyXyViL9vu/k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M/WfZhTvybDlC9lPejUOiLkjUXd74zCiM6mv6VTrTcqKFlY08nv6sIIHC+JjjGJgW
	 5f0g2hNSYJ6aIu5wvwUMisNes9V5tQpIlTY9tO+YPZhSVH+wI/5ZngM4PAuHMpTvOJ
	 +VKlzBTJomrEFaCNzQ5orighGSNOC721EIOnNN9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05AEF80124;
	Fri, 19 Mar 2021 08:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 567FDF80124; Fri, 19 Mar 2021 08:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6BF7F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 08:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BF7F80124
Received: from [103.229.218.199] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lNA2G-0005XM-IW; Fri, 19 Mar 2021 07:59:09 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	kailang@realtek.com
Subject: [PATCH v2 1/2] ALSA: hda/realtek: fix a determine_headset_type issue
 for a Dell AIO
Date: Fri, 19 Mar 2021 15:59:02 +0800
Message-Id: <20210319075903.6480-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We found a recording issue on a Dell AIO, users plug a headset-mic and
select headset-mic from UI, but can't record any sound from
headset-mic. The root cause is the determine_headset_type() returns a
wrong type, e.g. users plug a ctia type headset, but that function
returns omtp type.

On this machine, the internal mic is not connected to the codec, the
"Input Source" is headset mic by default. And when users plug a
headset, the determine_headset_type() will be called immediately, the
codec on this AIO is alc274, the delay time for this codec in the
determine_headset_type() is only 80ms, the delay is too short to
correctly determine the headset type, the fail rate is nearly 99% when
users plug the headset with the normal speed.

Other codecs set several hundred ms delay time, so here I change the
delay time to 850ms for alc2x4 series, after this change, the fail
rate is zero unless users plug the headset slowly on purpose.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8239e5efc12d..442e555de44c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5263,7 +5263,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	case 0x10ec0274:
 	case 0x10ec0294:
 		alc_process_coef_fw(codec, coef0274);
-		msleep(80);
+		msleep(850);
 		val = alc_read_coef_idx(codec, 0x46);
 		is_ctia = (val & 0x00f0) == 0x00f0;
 		break;
-- 
2.25.1

