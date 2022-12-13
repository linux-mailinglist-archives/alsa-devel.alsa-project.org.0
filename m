Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B264BC1A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 19:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F9A1833;
	Tue, 13 Dec 2022 19:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F9A1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670956434;
	bh=in4KxuaodXSv+hPUQOAviPmjlubzU66m7rSKlYo79rE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=I5VUCB1ACsHiwCkaqDySX6dV47bvCZLnnMiCTPBlyv0aJkS3Gc4sbhaYiphFogGSG
	 UvE1y2VnHjJUsq/jfPxCqlWazcRl7dUMTBkGlfIjBMT44FO1uIjIHNy+QgriHTRhE9
	 7VlziarDHZqKNvJGUs3zRgfbmgZ+SRG7Be7GBHhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E72F80141;
	Tue, 13 Dec 2022 19:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91179F804E2; Tue, 13 Dec 2022 19:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E4FAF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 19:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E4FAF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=DkBhhHO5
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 921D06602C3C;
 Tue, 13 Dec 2022 18:32:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670956370;
 bh=in4KxuaodXSv+hPUQOAviPmjlubzU66m7rSKlYo79rE=;
 h=From:To:Cc:Subject:Date:From;
 b=DkBhhHO54ulTMHSX2348dRKJx3krNKGcmpQtCRz1cUkCeXPGFlVInA+k3o6+xdWAi
 n5fIszy0mo7oxsBy5NAlyvHV3qONLScqbsnzVmv7OshmjKWHXWAZ7C+KfsTMUCBHMh
 BuVtnuqp1IBl9ew97pcDoomSZmuDcYFIdMAMH8j8WF5utuizi0U9f8Ip4nwMBhjmnW
 xnfhVK5jxDMJ9pKJhirwt+X6lB8TmcM8BtF+a5ETMryp7Y8ralDmmXRDjQtP7+Nsjx
 Z2SMfwYVRpTob+ENrMDqJ8BEFWRHEds40ykK52OImDd+jarHDufDFviKlJv31wesYF
 nk3HF8QX4O9yQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] kselftest/alsa: Increase kselftest timeout
Date: Tue, 13 Dec 2022 15:32:42 -0300
Message-Id: <20221213183242.1908249-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org,
 kernel@collabora.com, Shuah Khan <shuah@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The default timeout for kselftests is 45 seconds, but pcm-test can take
longer than that to run depending on the number of PCMs present on a
device.

As a data point, running pcm-test on mt8192-asurada-spherion takes about
1m15s.

Set the timeout to 10 minutes, which should give enough slack to run the
test even on devices with many PCMs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 tools/testing/selftests/alsa/settings | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/alsa/settings

diff --git a/tools/testing/selftests/alsa/settings b/tools/testing/selftests/alsa/settings
new file mode 100644
index 000000000000..a62d2fa1275c
--- /dev/null
+++ b/tools/testing/selftests/alsa/settings
@@ -0,0 +1 @@
+timeout=600
-- 
2.39.0

