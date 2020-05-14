Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF201D2F62
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 14:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855EE1672;
	Thu, 14 May 2020 14:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855EE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589458713;
	bh=pnNyUQhPABKEmlABOTJazaMzPgUMFv6jDon4BDaPnTE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WsjCaZsGyilPcz6+p13yTpA7Dewlly27uLyt75F/z2ZUaGa3EdIeY0t+n5uaO9sv+
	 CpWUTYM3B252YelqNbLg6aEX3KbhNckRxoEiOAb4O+xfc5y+0qL8/d77a6rcULxn8t
	 3vYCv34QynZ1F3kB5J6bC/z5X9LYGmjxK3kdkO4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D45F80101;
	Thu, 14 May 2020 14:16:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD07F80158; Thu, 14 May 2020 14:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5CBDF80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 14:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5CBDF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bVOaUokL"
Received: by mail-pg1-x541.google.com with SMTP id u5so1180902pgn.5
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8psrfxuLJ4TJl2o4vMFKaniWYtduDfiv4RO4VswAsrg=;
 b=bVOaUokLCYXkFYeqHH1OEV25hz4lgjtn3NrokN2C6Rn7s2p2uXiWnKD4bkGL3ZWhX+
 4U/IWnlxdqSjXFSjFSUc3CoUw5hEzO3deTXiBjj3dlQ/xu0EIoJH37StmbJ8CVWrWSWU
 DLFldL8sreksestfVDeWpurmaGyuaRSFySqqebepjGRbUEc3akLu5QR+29idvfUTC29n
 exA+NdktkyWgpbixn3YkjQSR7tMmB2g7SnZnViQ/ZahPVEMi0YNYNi312F2vWpthtWBD
 Fjot1xo8EMN8G7GBToq7yR6FFBeKu4jjcLq4ibMpAY8AmF7bsS3hki9KwYUvtFJi2iAS
 qy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8psrfxuLJ4TJl2o4vMFKaniWYtduDfiv4RO4VswAsrg=;
 b=HtbE2eB+8DJl3fnCy+gjd/O+eBu2EUuQXr4yBTJv+7Dbhndivb0TJL/+LV9imnRHP0
 ZZNplbK/Gki2tQZA73ZpRsUs6g3W6srDsstazDuXzIzxj86SOs78Kzmu0GGlc2SbuS+8
 AtZSewEssX14et1bA9LG7BSIvYCyCalpVguIv/bOjcHuufKHaKQSSyHVSiKRhJsvT2+c
 gdULmJMyFcrGS8u1kthfN0gMTLKiVGuNgLPMLzmgK30BytCQxLGeQAKqaOIoA6n5zxd+
 rApXkEEM0Eh+aZnqITOU3UBmL2G8LsPFnSubN3fGnwbPitftDxJZ5CUYtiqBDO2H3+xt
 GPGg==
X-Gm-Message-State: AOAM533T1V0iU9MCdep0WGNAlsgbrHJP53hM36vbwSSSsrZ3iQ1w2hP7
 gdzCTixgGBRtIHX0/OWwgcg=
X-Google-Smtp-Source: ABdhPJz2p17RSHqQW3n8WMjTtwaHmykfyYXnrgEUQwJ9KTqyeHsLsXjfpqXub/PHt+EivdkDTsGJDA==
X-Received: by 2002:aa7:8bd3:: with SMTP id s19mr4517069pfd.143.1589458600090; 
 Thu, 14 May 2020 05:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:2d8:eb02:505a:d5fe:3ea6:5791:c8e8])
 by smtp.gmail.com with ESMTPSA id m4sm2216727pfm.26.2020.05.14.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:16:39 -0700 (PDT)
From: Steve Lee <steves.lee.maxim@gmail.com>
X-Google-Original-From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [V4 PATCH 1/2] dt-bindings: Added device tree binding for max98390
Date: Thu, 14 May 2020 21:16:17 +0900
Message-Id: <20200514121617.8193-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Cc: ryan.lee.maxim@gmail.com, steves.lee@maximintegrated.com,
 ryans.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Add documentation for DT binding of max98390 amplifier driver.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---

Changed since V3:
	* No changes.
Changed since V2:
	* No changes.
Changed since V1:
	* Modified sample text in example

 .../devicetree/bindings/sound/max98390.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98390.txt

diff --git a/Documentation/devicetree/bindings/sound/max98390.txt b/Documentation/devicetree/bindings/sound/max98390.txt
new file mode 100644
index 000000000000..0ddd4c6ae55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98390.txt
@@ -0,0 +1,26 @@
+Maxim Integrated MAX98390 Speaker Amplifier
+
+This device supports I2C.
+
+Required properties:
+
+ - compatible : "maxim,max98390"
+
+ - reg : the I2C address of the device.
+
+Optional properties:
+
+- maxim,temperature_calib
+  u32. The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
+
+- maxim,r0_calib
+  u32. This is r0 calibration data which was measured in factory mode.
+
+Example:
+
+codec: max98390@38 {
+	compatible = "maxim,max98390";
+	reg = <0x38>;
+	maxim,temperature_calib = <1024>;
+	maxim,r0_calib = <100232>;
+};
-- 
2.17.1

