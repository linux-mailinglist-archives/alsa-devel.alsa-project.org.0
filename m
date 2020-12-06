Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9632D0547
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 14:37:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2581796;
	Sun,  6 Dec 2020 14:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2581796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607261861;
	bh=cdCnhWNwtTkMNU7okWv2gCB2pWFhZYO+A3MGfiypVqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbObQm1nyJXbBkcFlKnY6n1ecDDxnHFZEKJji13n0+tZCbsf6b6ZIt+meGz+L5g3M
	 UAfTcCl2iEG/01kjsmbMKZjH7g5tGqVw1VIjmmaZCrpioX99MkX8onSVehmSiVMNiV
	 07/J3ZmxOaZTEBcG3df1HBhd9LRJuPg06pI1n6PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 073AAF804EB;
	Sun,  6 Dec 2020 14:34:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85094F804D6; Sun,  6 Dec 2020 14:34:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EF9FF804CA
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 14:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EF9FF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JOVXuy3e"
Received: by mail-ej1-x643.google.com with SMTP id b9so5250150ejy.0
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=JOVXuy3e6JymxKOPEoHBdkzfQUhgnoR1msgkoaiMxH70fRYib/t+qYr+VQpo7JKMln
 F91whwe0wS6E4TTblt2ayRevdquO+k5v8NBiIGfJfJ6kCo75D+I0zR/Vp3M9iOTClr+y
 RCD4WdS3002o8Co4VHrBS/SLNuFuYVhfulYpaFxC/YwFdKNT4An0K8Wd/1+AdipNSVDq
 DmHl6hIzKsAopuPY3pE8J0vQW+3Q5+kXiYphccbg7W1ZVI6bX+A6IWPSUqr82lBEhjME
 zxPxH0zFGmboVpKVBFPb3LvGF83sSP9eqfPZsKkrNaa7ufXKT5erD+NMFSrNFe0jGx/r
 fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=HRAlazEVw6g5bdLDKaBDGTjhUzQ2fMWiEf8ZzgUPWNaFhJD7yvBYtm0deJWrqvJ/Lb
 Ns3lHO/D3VYBMcqYyE97kTqCU/WcM8V9aY4nXzh9htt2fXJwi7/MoqaClhBw1lYm9ajK
 Gsy172UCmI+2/WYK3Gf7UG1DSgI5cz/2NqCxAesbJYmM1J9Xak7uKViDvF4fEG4zPjGq
 SRUyzyZuU87QE9nDqYCrlY26nBNarPv7d2Xa5DAtHh3EdNJqzdf2803zgP8orn9b1GlK
 f+cbMrA5kpdsNEMVCs58+cPESGjcXE0tJoUPISf8rEkx4sfBbz6hpqCtKKp7JwETs8jF
 /ebw==
X-Gm-Message-State: AOAM533HKUYtv1z6OGjwkRPx68qbJRdDl3QOoR4AoHYy9dWkxu9070jm
 /k7BXiAziSQfQpVYhiPVw6k=
X-Google-Smtp-Source: ABdhPJztME1AEa+6AzKHTpyb9Y+omIXYUc5Z2Uz2KCJGA5tPM3cmuLgOt76RoEEmj6mHLL05lTnjBQ==
X-Received: by 2002:a17:906:f05:: with SMTP id z5mr15442015eji.8.1607261651143; 
 Sun, 06 Dec 2020 05:34:11 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:10 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 5/5] ARM: dts: rockchip: enable hdmi_sound and i2s0 for
 rk3066a-mk808
Date: Sun,  6 Dec 2020 14:33:55 +0100
Message-Id: <20201206133355.16007-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201206133355.16007-1-jbx6244@gmail.com>
References: <20201206133355.16007-1-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
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

Make some noise with mk808. Enable the hdmi_sound node and
add i2s0 as sound source for hdmi.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index eed9e60cf..5fe74c097 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -116,6 +116,14 @@
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s0 {
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.11.0

