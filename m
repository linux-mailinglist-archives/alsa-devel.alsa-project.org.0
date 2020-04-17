Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CFB1AE134
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 17:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37D01673;
	Fri, 17 Apr 2020 17:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37D01673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587137593;
	bh=GQpMJ+YX5GJJULfRYZHwFV3dQ+E8kCysvAmbr7NIETU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTEVlsi4hd7zZmfcU0UboNiA3xB/LbI0hHr0y1NhdHfgepPJ01wWKi7/0KqMhaLFj
	 yu0R+qCkQ6y8nZtdCD8cpoLlfd9a105DBW4L2ev9/O5ExEuogLsb97VTdIM8X0ONA1
	 4G7sMbLUXKmplgnn+wtg5OHm0JbwXbUMHJAD8oBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF15AF80229;
	Fri, 17 Apr 2020 17:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77E3BF8026A; Fri, 17 Apr 2020 17:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C5AF80229
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 17:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C5AF80229
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N0WsG-1j4Nko1EJA-00wSVb; Fri, 17 Apr 2020 17:30:30 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id B5F9E64ECEB;
 Fri, 17 Apr 2020 15:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9ig1oZlNVEl; Fri, 17 Apr 2020 17:30:28 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
 by mail.cetitecgmbh.com (Postfix) with ESMTPS id 6E047650DE0;
 Fri, 17 Apr 2020 17:30:28 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.29) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 17:30:28 +0200
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rsnd: Fix "status check failed" spam for multi-SSI
Date: Fri, 17 Apr 2020 17:30:17 +0200
Message-ID: <20200417153017.1744454-3-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
References: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.5.29]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B64766A
X-Provags-ID: V03:K1:0iRD0Id+7QAfQTeP6+QurWwUltdZG+fqMJxBvkqJPUd9FojZGun
 sf/9XgiwufPW5lLOJnygfUJDpIG3Z4/yUnjoh2uQ3UTbt+ieGVMXWejLjl4NJFwleR7VHXz
 eRsYNxfKmS1M33G07P44CMIo742DTe2CGMpOqZivLTzQTkStbAMtWDN5CKCSydpQxOTyUkZ
 FwuIJnLucp0OAHrIeur5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qrbtVe90pA4=:tpoXoz3xiMvTH8cBv3+3P5
 O4EfrILxVOr5loC4L9WtX5APJDqGNf3/02r4YxVynorLJGVCh/O4fVnfGLw7bn1ah8a2azkk9
 GbUbFIDS9MYt5+SS2kfMgcoemth2pPdoReZlC3AempfKFBat9gacbxiGTH+zdL5pyXvXZ6P5b
 i0rXQ3ka5ADlVHSX8K/wVthVsNVlKd9/f7238FjMJkns3Zk/b+HUfYa7gwOlBYqlMviXeUdCd
 6xf19mziHr6IBOetMAF1i2bVDnwU7xxFy1aYFIGXqzvpDGDvwTYEGpBGB+OvLhKLn1KOZBlXx
 yHpsVOGpORrmCSQLRpNaMCymL6RoaDJCco3APjIMVIqyTBsvpDEVT6VF6y4BHbRs2Gv85ARNJ
 DSX7qcjmp7FW2QHI/vUk9tcVuER2NYUWlRv5QPhbtp441llHqfXKfsogfMIbMBMQ7yzTKx4s2
 0sbIazv1WZR618d1aRS7H6N5/+Te/h2a5bC0KBLN3aacObwZCpGXRt3Gv2oLMGo4IidjwqEbD
 RpvbEUHoAsBTR5X0Feqks9hQFhkJFU1ukodv65khpgHXq1+kPT350qQj27Eb+YjWyR5Q8Jk66
 APq2T35CZTvLSAHG3IoAbxVEOcvfDH33qutyMOUDelS0C6i6xKnN6yb7wQmyF7meFkOtRdZsV
 OH2IZCe3Q8X3nV//JRVeP5fa0yJpgqPmtbXsekghIoZ0DMhWdA3z0H2FOIAKFWIf8F7s3lmtt
 bmOoT5ZGm/lwnPkCLZPwlARHRXc/zIi2RNJ3qfQiSxP0xDOy8fnTcKJmZiTWGw9iNPK6Wt1Ad
 jUgYyQPkWFiAUeibo2fhkR/uZhGy4SJid8Ysld0jikN58hBAUX0hoXh9/fCDCC1W2IQIaHzkd
 ebk9P8irWlOJkEzhT4sQ==
Cc: alsa-devel@alsa-project.org, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-renesas-soc@vger.kernel.org
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

Fix the rsnd_ssi_stop function to skip disabling the individual SSIs of
a multi-SSI setup, as the actual stop is performed by rsnd_ssiu_stop_gen2
- the same logic as in rsnd_ssi_start. The attempt to disable these SSIs
was harmless, but caused a "status check failed" message to be printed
for every SSI in the multi-SSI setup.
The disabling of interrupts is still performed, as they are enabled for
all SSIs in rsnd_ssi_init, but care is taken to not accidentally set the
EN bit for an SSI where it was not set by rsnd_ssi_start.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---
 sound/soc/sh/rcar/ssi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 9900a4f6f4e5..4a7d3413917f 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -594,10 +594,16 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	 * Capture:  It might not receave data. Do nothing
 	 */
 	if (rsnd_io_is_play(io)) {
-		rsnd_mod_write(mod, SSICR, cr | EN);
+		rsnd_mod_write(mod, SSICR, cr | ssi->cr_en);
 		rsnd_ssi_status_check(mod, DIRQ);
 	}
 
+	/* In multi-SSI mode, stop is performed by setting ssi0129 in
+	 * SSI_CONTROL to 0 (in rsnd_ssio_stop_gen2). Do nothing here.
+	 */
+	if (rsnd_ssi_multi_slaves_runtime(io))
+		return 0;
+
 	/*
 	 * disable SSI,
 	 * and, wait idle state
-- 
2.26.1

