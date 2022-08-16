Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 629EF59571E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 11:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD119163F;
	Tue, 16 Aug 2022 11:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD119163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660643586;
	bh=zm7wuWhUdBYsU+jESMa+goFmxWUZE4GpfIYr5Trwj4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=elTkoqiCd4dD681DHfBp2OJ79qFj9/wDVK3iPqCOfN5FJxgBPKV4hlLgelsgoQN1j
	 8PQ4WaI7P0lFjSvDxH8MVmmnuJ1I56hPtkS8MPlsPg49vnjL+uiW7+XEsUDZn7yBuf
	 gMls+QZXXcL5kRNmXLroqUaXLoLtQeWh9WbPirDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EDEF80424;
	Tue, 16 Aug 2022 11:52:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2C27F80238; Tue, 16 Aug 2022 10:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7680F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 10:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7680F80082
X-QQ-mid: bizesmtp75t1660640107t9u3xd1f
Received: from localhost.localdomain ( [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 16 Aug 2022 16:55:04 +0800 (CST)
X-QQ-SSF: 01400000002000D0T000B00A0000000
X-QQ-FEAT: 6aXALTFZqPsYTigoi/pJHQIrfEjlbZTVVo4ceE/miflM2QL0ScN/MLKWd9pj/
 GpI0Y0g4qovfiem9q3Z4SWKP5MlRzDTno+u3GL4PM5mbtBXO1WJo87SgDryelNO5b+KbCo1
 NDdEC7iYKBCJIT0zjx28cAXU3afo3bcJHpKQb+2xypQmKjrX3+PeqMkUlok2zrH4YSP6Xof
 P3ocSKToVuCM5NhP6UKY0j5U0XyEvbkqt2W0HGR4i3ACGDI2sCY6IUEAEDzg9Guy1VXWsYn
 0JNzO3WBs1tO1hvkNDIpnW6zFIBetn4QxfGTB6REcvv59IkDvcTLffgOOQkscmi22zR2iCW
 23sOHumGks+sjSme0AjnLWeAEAfLBIVMJUhoPNL8cSi/hAbBEWF2FigQ7QXiw==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: intel: Replace scnprintf() calls with sysfs_emit_at()
Date: Tue, 16 Aug 2022 16:55:02 +0800
Message-Id: <20220816085502.25295-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr1
X-Mailman-Approved-At: Tue, 16 Aug 2022 11:52:05 +0200
Cc: daniel.baluta@nxp.com, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, zhaoxiao <zhaoxiao@uniontech.com>,
 broonie@kernel.org, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
instead of the raw sprintf() & co.  This patch replaces the open-code
with a new helper, sysfs_emit_at(), by passing the string offset.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6d4ecbe14adf..917d639671a7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -574,7 +574,7 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, const char *le
 	chip = get_chip_info(sdev->pdata);
 	for (i = 0; i < HDA_EXT_ROM_STATUS_SIZE; i++) {
 		value = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg + i * 0x4);
-		len += scnprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
+		len += sysfs_emit_at(msg, len, " 0x%x", value);
 	}
 
 	dev_printk(level, sdev->dev, "extended rom status: %s", msg);
-- 
2.20.1

