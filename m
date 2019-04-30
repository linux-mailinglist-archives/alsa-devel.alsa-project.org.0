Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31FC10085
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 22:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E0D216B3;
	Tue, 30 Apr 2019 22:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E0D216B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556654604;
	bh=5n5C/CDBvhWlPWn6xagvzqPbmUpJW3ePLVGrpaAViyc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WRBbKVpSIaZEeWj+wogZqjcqgXmCHaAedlRXWPVEK1bh8+irkVTpNCESnguv4anDg
	 ++EK5b6dom4wP2Pfb9Dyg9vqx0P1sGhT5R7cRsuXMT5Llcmc4A+u1/rMRSXuRC64DV
	 1GBN+ji+kGVAMx5VhekwI4xp26nNw/ITxJpRFBRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0EBF896AA;
	Tue, 30 Apr 2019 22:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC15F896AA; Tue, 30 Apr 2019 22:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AE79F8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 22:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE79F8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tDVy5cQq"
Received: by mail-wm1-x342.google.com with SMTP id n25so5087345wmk.4
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=4+Rp/OQZEkVz9ANlwYNqq4aD6edbQOGd5WFLx5kOqMs=;
 b=tDVy5cQqzPNv4O+IQczPxWS8AJof0ww4LxOG56q4P/4pp6W3l3BV7S7P4YXwHuqjeK
 6s8V3jhQhCQEYMbLpbixd7IcKRQ3+cg8dH//bF/WwHQ2yA3ZXV34EI5r8lKbBnKPTeiV
 G0LPY7Q1kCjXnO1baUuB7vFOlGGI6iTQSSQi8BPLeQutEyqnlVvLCRfbGj7rn+rXW5mD
 n2pTlagvx5KF0AuoXrviCt7aEdu3haaD1XvndcJMY1H5+GxB5nzpuXwimm0xEi1OvUf/
 k8dryi45mKi8ECMiiVk2sGjLyxUUTmZ0Iu4YcnSJq3BRmSxqsPPNzFXdmgsfVKLnwa4L
 7vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=4+Rp/OQZEkVz9ANlwYNqq4aD6edbQOGd5WFLx5kOqMs=;
 b=ZpdMYz68piC1iS1DdZ9NSaWs6V1w1p1EjEULNBJdwoc9uY6iK97WOb8ThRC2Ug32ez
 /rIfioX+USBVNxZjQ62pCm119eFCJ52G2gDpQYJEA5DvxFiVhPpL8KIgzm95sT19csXx
 ut1FmLEpKEtrVgwI8JDZWN29cTkMT8xDTGoJKIYK3AmnsvY2iB0XYM4ys5+dViqde4Vf
 ch6Faajif9eXZXKOKCTIXkRdAl/wezjlfAUzTgS8MEeCysHygOB8LM+8DulzT/2RR4Oi
 mkkxdvGpqlj9MLZXG95aYnMpSTxaxVrPHpiIk2JBTBwITF2q5HTUasU3QhrclyrpD+pA
 rDMw==
X-Gm-Message-State: APjAAAVpN00WiipxFYtdUhD3Hr/F+n9OM+TI4VfMuJOieQkPXwFeE3ZT
 O7Y8bWw89+WAjIEFSo4vpLc=
X-Google-Smtp-Source: APXvYqxHhu8Rl0AyMaRtY0p7rIs+NQKfd5e/OKf/mSkRVbYYKjhAFwg3Kvzfcj/XMQvuRK5wEmj1xg==
X-Received: by 2002:a1c:f119:: with SMTP id p25mr4248002wmh.4.1556654489976;
 Tue, 30 Apr 2019 13:01:29 -0700 (PDT)
Received: from localhost.localdomain (p5B3F6192.dip0.t-ipconnect.de.
 [91.63.97.146])
 by smtp.gmail.com with ESMTPSA id s124sm4020346wmf.42.2019.04.30.13.01.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 13:01:28 -0700 (PDT)
From: Saravanan Sekar <sravanhome@gmail.com>
To: sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Apr 2019 22:01:18 +0200
Message-Id: <20190430200118.13014-1-sravanhome@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v2] ASoC: tlv320aic3x: Add support for high
	power analog output
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

Add support to output level control for the analog high power output
drivers HPOUT and HPCOM.

Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---

Notes:
    Changes in V2:
    - Removed power control as it is handled by DAPM
    - Added level control for left channel

 sound/soc/codecs/tlv320aic3x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 516d17cb2182..90f53f9b5c2f 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -324,6 +324,9 @@ static DECLARE_TLV_DB_SCALE(adc_tlv, 0, 50, 0);
  */
 static DECLARE_TLV_DB_SCALE(output_stage_tlv, -5900, 50, 1);
 
+/* HP/HPCOM volumes. From 0 to 9 dB in 1 dB steps */
+static DECLARE_TLV_DB_SCALE(hp_tlv, 0, 100, 0);
+
 static const struct snd_kcontrol_new aic3x_snd_controls[] = {
 	/* Output */
 	SOC_DOUBLE_R_TLV("PCM Playback Volume",
@@ -419,6 +422,12 @@ static const struct snd_kcontrol_new aic3x_snd_controls[] = {
 	/* Pop reduction */
 	SOC_ENUM("Output Driver Power-On time", aic3x_poweron_time_enum),
 	SOC_ENUM("Output Driver Ramp-up step", aic3x_rampup_step_enum),
+
+	/* Analog HPOUT, HPCOM output level controls */
+	SOC_DOUBLE_R_TLV("HP Playback Volume", HPLOUT_CTRL, HPROUT_CTRL,
+			4, 9, 0, hp_tlv);
+	SOC_DOUBLE_R_TLV("HPCOM Playback Volume", HPLCOM_CTRL, HPRCOM_CTRL,
+			4, 9, 0, hp_tlv);
 };
 
 /* For other than tlv320aic3104 */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
