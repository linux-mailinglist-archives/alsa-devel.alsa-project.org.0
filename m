Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B87A15159E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 07:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB1B168B;
	Tue,  4 Feb 2020 07:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB1B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580796309;
	bh=TkOZse+TN07umVugg5Xz3kNxj+z5EEQZm1SVkmCPl+c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ir29vBsqCcXdmTjLx4aWXdnjidRBpTuEbNQMy7Dt1B2PFKI96+EYy+yKrkUsfjnDF
	 c7U3veS8VbRYNwSwCQMxwDR2QgQMiBuBDywfgPL3eX76dIlPY+f/1a/Xxsouk+2oTk
	 pEovTcKfHEFJwyY3u/40vvWObK5wmSM1SQG5pVKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128E6F801DB;
	Tue,  4 Feb 2020 07:03:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C881DF80162; Tue,  4 Feb 2020 07:03:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C19C8F80051
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 07:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C19C8F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iXUE6ebm"
Received: by mail-oi1-x242.google.com with SMTP id i1so17303556oie.8
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 22:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMN+K684Z/eVZ2yqWGF8j0z6j6M569qkTkBF8k40oto=;
 b=iXUE6ebm4DNRaybXe8E5MJV+zuFNTp8YtrjhZBJpVahnRtRlo/wlsroYUWsbzOcqpB
 ZrD9bBlQE23F5TGK2maz/caplkgCljAVe/NWWPzOTvJESIZqSQ0tLvEinV0j79S2sgCh
 NqGXfWe/nIqgwPvone2XLITAudSxoARaNlFO2Rw7eFWcs0zfv+F6Qw4SfiTNwxppZVXg
 yX32n16CFb5WLXAm05/f0NiNfKnbSCdfAsBJC1tdAgIWD7NHiUe9pDBtj8WHq4e7pY61
 0wZn9jjAC0bAWM31CCckaMxVAePFzTxouLcpqwRCJaT/8E98hn+W/cygJo9iH7G5hRsH
 IfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XMN+K684Z/eVZ2yqWGF8j0z6j6M569qkTkBF8k40oto=;
 b=R1i0wKvmucoYYiCF+N+/WTv4sWB7XKnEYK9QQbL7EEDKUTl6yaZrLrurOOAC+SXBFu
 JlkSwj36xeVZDyha47m71dudIXV43omrqH69fH7WKZaf3tsfZSAXaFnH9pdC6N+VrHnR
 d4dFDNZLBojNYLpYdYOpdeMVYHOZkH17y8I+MZpj24IInD+4eCSGjTz0T4R9Ac/kBszw
 zV74UVmtu2rehVWrP+t7Sr37OsAWJA7c9ngBXpnYGPUhL38gWkw3NThoskfBzyftpj5h
 exglBVVpTrXW3HpdZxS/PZYcDJ9r86Tb+vRmv3+LghmCvcpM12IpSmSsMFjF9d+JeoLp
 IxoA==
X-Gm-Message-State: APjAAAVb9vmalolILuao/f6mO9Qthdmle3cr1/uZ87QHwPfLa217fEj/
 t5y8wDXmp7PChvDwm/Y6hos=
X-Google-Smtp-Source: APXvYqzmORnsr5YKAbx545QjhZhcUKYFi/BJlFYlcOrBRtot49y/1d6gwfVV0ShbmWEKuNCpqRV6Nw==
X-Received: by 2002:aca:fc0c:: with SMTP id a12mr2264517oii.118.1580796193543; 
 Mon, 03 Feb 2020 22:03:13 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id d131sm6501708oia.36.2020.02.03.22.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 22:03:11 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  3 Feb 2020 23:01:44 -0700
Message-Id: <20200204060143.23393-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wcd934x: Remove some unnecessary NULL
	checks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clang warns:

../sound/soc/codecs/wcd934x.c:1886:11: warning: address of array
'wcd->rx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
        if (wcd->rx_chs) {
        ~~  ~~~~~^~~~~~
../sound/soc/codecs/wcd934x.c:1894:11: warning: address of array
'wcd->tx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
        if (wcd->tx_chs) {
        ~~  ~~~~~^~~~~~
2 warnings generated.

Arrays that are in the middle of a struct are never NULL so they don't
need a check like this.

Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
Link: https://github.com/ClangBuiltLinux/linux/issues/854
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Also, turns out this was fixed in the wcd9335 driver in
commit d22b4117538d ("ASoC: wcd9335: remove some unnecessary
NULL checks")...

 sound/soc/codecs/wcd934x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 158e878abd6c..e780ecd554d2 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1883,20 +1883,16 @@ static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	if (wcd->rx_chs) {
-		wcd->num_rx_port = rx_num;
-		for (i = 0; i < rx_num; i++) {
-			wcd->rx_chs[i].ch_num = rx_slot[i];
-			INIT_LIST_HEAD(&wcd->rx_chs[i].list);
-		}
+	wcd->num_rx_port = rx_num;
+	for (i = 0; i < rx_num; i++) {
+		wcd->rx_chs[i].ch_num = rx_slot[i];
+		INIT_LIST_HEAD(&wcd->rx_chs[i].list);
 	}
 
-	if (wcd->tx_chs) {
-		wcd->num_tx_port = tx_num;
-		for (i = 0; i < tx_num; i++) {
-			wcd->tx_chs[i].ch_num = tx_slot[i];
-			INIT_LIST_HEAD(&wcd->tx_chs[i].list);
-		}
+	wcd->num_tx_port = tx_num;
+	for (i = 0; i < tx_num; i++) {
+		wcd->tx_chs[i].ch_num = tx_slot[i];
+		INIT_LIST_HEAD(&wcd->tx_chs[i].list);
 	}
 
 	return 0;
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
