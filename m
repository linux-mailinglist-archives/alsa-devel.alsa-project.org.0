Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62464C9AD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:05:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D96312418;
	Wed, 14 Dec 2022 14:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D96312418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671023105;
	bh=GZEykBLRY6xcsFpVXkvhdUKjKSjymjAXbtZtme1Q4E8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pLRvjUc44RhTnnFr97i2O4IjZqP6J76HOV78JzzAL9xByqJxyL/AdVouZPladO5O9
	 9MxSnQWBR7DeUdPAwCAg9Rmvvmj0i3jYJqa7QPEWH/zYFOs6z8q0GBw1gLXO+7HiIL
	 FAAmSG5EqsFFZG0pf/bpEl3edAkoVSDDOSSl6nAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80950F80141;
	Wed, 14 Dec 2022 14:04:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CF7F804D0; Wed, 14 Dec 2022 14:04:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99BBDF801D5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99BBDF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=L3MWub+8
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A54B76602C4E;
 Wed, 14 Dec 2022 13:04:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1671023043;
 bh=GZEykBLRY6xcsFpVXkvhdUKjKSjymjAXbtZtme1Q4E8=;
 h=From:To:Cc:Subject:Date:From;
 b=L3MWub+8UXzsNySJvlrzmj27f8o4iAeJkAW/wJr1oroFMO3CU1WQ3qUge9+bbPzNe
 Ae11AYDf73jO3Gaw8m2dafrgJJYi71g03hapgtNhMmQ64q3bP+nR26mcykZWFbaQwT
 mZ79vee70XXhrT34BpQKMxvtvzYLnZ7BOU81Go0bGBQV2H16WcrwAkMSrfodIG7m5V
 xJD0cjymPN3rfA3qla4hullm7nSo3XLnLj/ODU4zsHsnnCQq90mQ18pSlKAQM714kx
 28FQ+y+AV/F3TJ/L0Q6zGi9BBMeJM0GKKSSX5X8A8+5BUIQm4qZVJPYgSXL6DZg9Mw
 FqXop6nFTqcEA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] kselftest/alsa: Increase kselftest timeout
Date: Wed, 14 Dec 2022 10:03:53 -0300
Message-Id: <20221214130353.1989075-1-nfraprado@collabora.com>
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

The default timeout for kselftests is 45 seconds, but that isn't enough
time to run pcm-test when there are many PCMs on the device, nor for
mixer-test when slower control buses and fancier CODECs are present.

As data points, running pcm-test on mt8192-asurada-spherion takes about
1m15s, and mixer-test on rk3399-gru-kevin takes about 2m.

Set the timeout to 4 minutes to allow both pcm-test and mixer-test to
run to completion with some slack.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Reduced timeout from 10 to 4 minutes
- Tweaked commit message to also mention mixer-test and run time for
  mixer-test on rk3399-gru-kevin

 tools/testing/selftests/alsa/settings | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/alsa/settings

diff --git a/tools/testing/selftests/alsa/settings b/tools/testing/selftests/alsa/settings
new file mode 100644
index 000000000000..b478e684846a
--- /dev/null
+++ b/tools/testing/selftests/alsa/settings
@@ -0,0 +1 @@
+timeout=240
-- 
2.39.0

