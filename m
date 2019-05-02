Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B27121C3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 20:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE925182B;
	Thu,  2 May 2019 20:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE925182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556820934;
	bh=eMFLur/qDbTFWwbxIv9GRAzTbsSk7CirOazgfqfMnK4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P6zMdq3SF8YnfDg/JB1MIvV2DcoKjmeLJBfiOVmKlCvgq//FM5OKTPMVpDi9UtCwP
	 ydmsk6AcKX8RkGwsAs5yyIQ7HzBeCeIL2M4Hi7aQPHM5tR9OUdtOEtP5RmK2kcj4l1
	 p8hv56RmJxk/XdA9ItKaBywZPWwXrJe0ifI+p47E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BFD8F896AA;
	Thu,  2 May 2019 20:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55072F896C7; Thu,  2 May 2019 20:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD31F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 20:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD31F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ggtQCBfv"
Received: by mail-wr1-x444.google.com with SMTP id h4so4665047wre.7
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=Rmr9swsP9mexZbGo2Ob3HCdnRpjtEiyM8vvaodXClP4=;
 b=ggtQCBfvcEGmgkThJofofXW6bdpldDkwpwYDmCiFeziCy1YJRJQPJtjZsGvnXJIj4X
 IFhm3ahc8Q39r0nM2vZAIPePMVWE15rMJsIXinOmeRlhqjM9JXBK4Zh61t8tZ6D9MV97
 1kIofdv1wFa05bBhDBP3za2NHPQ5CkvDWnduwkqqwzU69QrNVn9NV4Wa0WEIBO/3ml/9
 3QCemAMT5nuXU73LjNllkSqIcNMXXYJa/2aSVYZ1RaOTUoAL+2d9Nfl/2uRdEL1NQvC/
 iCSio36jpVIDcgqn9wlz/URPPoaYBqHa1sF+1CSb77gmdgYMRUfJN1BvaUssk+c+JjfG
 Er1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=Rmr9swsP9mexZbGo2Ob3HCdnRpjtEiyM8vvaodXClP4=;
 b=er5jBeYOdgibM9QZES+iIZWqMHCLC4s06PU8BO/KAIW+swV2oSMkcen/Csr3gFpeQf
 RDDRbPMFDR7uY7PUwLPu5sdsp/th3974WcNtYOrgn/FSKx3YBfb7z9KZhxoCiGaNz4H2
 vqY+UoFEJPj25I+4t+OrzwaYlfmqAvpsCLBAzpgYz3I8oPIb1LAFsV8YwSeBODJKShKj
 jJV7Uzg14GmoFuz+XdC2ja2CKLkn3zNrhZuyLn7KpakIAOhX0VyW4kzSdoHiArGQr8eG
 AenzqOJAPAdccAiuuME815QT5eRuUPjDdzUkeVAhyoi1T9NoqdqefUxKSmbpiNA2J70s
 Gs5w==
X-Gm-Message-State: APjAAAV2ufjk0MDLSDHqgBEsxanzBEwJC9I8KQlbGkzseBTNhOnrzkEn
 nCMRmogjfSfCxE7Qi5ihzKE=
X-Google-Smtp-Source: APXvYqy8WVZHfflnbU0wUejzRScvp4aPuyhdyBaPwhvnCVvtrg8PLaStuGBe+tMC/8R2HcCk8pYotw==
X-Received: by 2002:adf:da51:: with SMTP id r17mr3945752wrl.118.1556820822652; 
 Thu, 02 May 2019 11:13:42 -0700 (PDT)
Received: from localhost.localdomain (p5B3F672C.dip0.t-ipconnect.de.
 [91.63.103.44])
 by smtp.gmail.com with ESMTPSA id x14sm7812142wmj.3.2019.05.02.11.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 11:13:41 -0700 (PDT)
From: Saravanan Sekar <sravanhome@gmail.com>
To: sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Thu,  2 May 2019 20:13:32 +0200
Message-Id: <20190502181332.5503-1-sravanhome@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [alsa-devel] [PATCH v3] ASoC: tlv320aic3x: Add support for high
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
    Changes in V3:
    -Fixed compilation error
    
    Changes in V2:
    - Removed power control as it is handled by DAPM
    - Added level control for left channel

 sound/soc/codecs/tlv320aic3x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 516d17cb2182..489a6d89d63d 100644
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
+			4, 9, 0, hp_tlv),
+	SOC_DOUBLE_R_TLV("HPCOM Playback Volume", HPLCOM_CTRL, HPRCOM_CTRL,
+			4, 9, 0, hp_tlv),
 };
 
 /* For other than tlv320aic3104 */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
