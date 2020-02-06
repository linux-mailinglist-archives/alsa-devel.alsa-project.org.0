Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E51153FCC
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 09:15:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1AB166D;
	Thu,  6 Feb 2020 09:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1AB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580976909;
	bh=7+daM/hpGmKp292QE9EcLpF8TIxjl2XD5MArXJjlDA4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bjb7ADqSMvMokCqdDgpW1slYL0MJ59L1Gok92V2D1xp5hS/dpdMAbI+T7SvUYfWX/
	 mslFBU+IulJNO1S/CeWurWaCaykLpowqjp6gmOngCDgilZOfMkLDMCzVA1gjN/3ZPv
	 Y5BS6hFeP/qnStVGYP+vCblTlpnuM313WKGTGo+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD30F8015B;
	Thu,  6 Feb 2020 09:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904ACF80162; Thu,  6 Feb 2020 09:13:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C2EF80051;
 Thu,  6 Feb 2020 09:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C2EF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="iItXR6TE"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 48Crly2S41z4f3lwJ;
 Thu,  6 Feb 2020 09:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key3-intmail; t=1580976798;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=iItXR6TEz/AuZiY5qNxYinDDRX9CrFbjuBLncfAYmNLZMxELElonTmisA8jvZSk60
 cxQXAg/+Eu9P8v0HWNgxyNhblDC0c4R8EMXS5gwJz1Qc6RPvt47FXTnAI+uSAmd5EM
 s9X35NQr+TtXKPWUkGCaA8hJ+swyXnVOpZikCWcg=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 48Crly1s64z6CjR46;
 Thu,  6 Feb 2020 09:13:18 +0100 (CET)
X-AuditID: 0a3aad10-8b5ff70000004724-64-5e3bca9e47ca
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 74.C9.18212.E9ACB3E5;
 Thu,  6 Feb 2020 09:13:18 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 48Crly07bNzW7H;
 Thu,  6 Feb 2020 09:13:18 +0100 (CET)
Received: from vchannaiah-VirtualBox.bmh.apac.bosch.com (10.168.128.129) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1847.3; Thu, 6 Feb 2020 09:13:16 +0100
From: <vanitha.channaiah@in.bosch.com>
To: <vanitha.channaiah@in.bosch.com>, <patch@alsa-project.org>
Date: Thu, 6 Feb 2020 13:43:01 +0530
Message-ID: <1580976781-6642-1-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.168.128.129]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgl+LIzCtJLcpLzFFi42LhslorqzvvlHWcwd3rbBZXLh5isli7vIHV
 YtG0mUwOzB4bPjexecxqX80ewBTFZZOSmpNZllqkb5fAlfFizznmgjVCFT9fvWFrYOzi72Lk
 5JAQMJF413OArYuRi0NIYDqTxNETJ5ggnN2MEuu+nmaGcBqZJB5um88O0sImoCZx5NoHMFtE
 wE5i0t3VjF2MHBzMAjYSc/uzQcLCAkkS57fdZAMJswioSLROYgQJ8wr4Spy9eZsZYrGcxM1z
 ncwQcUGJkzOfsIDYzAISEgdfvICqUZJ4c/Ix4wRGvllIymYhKVvAyLSKUTQt1aAs19zS0EKv
 KCm1uMrAUC85P3cTIySwBHYw7jyVdoiRiYPxEKMpB5OSKC9HrXWcEF9SfkplRmJxRnxRaU5q
 sZIUb/2bzlghYbhwcWlSbmZxcWZ+3iFGCQ5mJRHe8/qWcUK8KYmVValF+RBthxilOViUxHnT
 OfxjhATSE0tSs1NTC1KLYLLWHBxKEryHjgMtFCxKTU+tSMvMKYFJK8nyMjIwMAiJIcsgW8vE
 wXmI0ZiDB2i310mgEbzFBYm5xZnpUO2SEO1CMFGE1lOM5lLivI0ngHoEQLIZpXlwW6VkeNcH
 WsUJiSJJIHS+YrzJyMGoJMybBbKQB5jyEPZJ8DaAgkgQKojQZLQUqEfgLIfE4Q+7GCWmrF/I
 JjH57RMuidVv5nFLLL4zl0dix5f1fBKX+jYLSty6OF1IYufJS0ISZ5YeF5aYsKZRTGLlloli
 El9mXxSX2PJqiYTElakLpSXWPDwnLXGv64uMxPmD/YoSZ65u0pL4c32ptsS9Ka16IPP0JCb/
 3aAn8XvrPAOJl3P3Gkic/PfSCGj8fROgUUetgbIfrCX2rLxoI7H51DtbiXvHJju+AgYmEzAw
 pb0tQIFZkliCJTChogjfSTUwupoUaLRPmGLenVt5/7hw5cxv0pUhX9/qfdKTnxlQdjuo4uba
 OW8uvf7NyuDu/3HnDK0zi5kF4h6FZ6lWZjULvjJUiCm/cSzg56z6pckLdBzb/4isunB8yspU
 Scu4kxyv9c+9+3k8L/+vwdSlUYY3VAP+2bZsd5A8UVQQfE6jT+rL2uw+nbc9SizFGYmGWsxF
 xYkAW5M+zRMEAAA=
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - 1/1] pcm: direct: Round down of slave_hw_ptr
	when buffer size is two period size
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

From: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

For buffer size equal to two period size, the start position
of slave_hw_ptr is rounded down in order to avoid xruns

For e.g.:
Considering below parameters and its values:
Period size = 96 (0x60)
Buffer size = 192 (0xC0)
Timer ticks = 1
avail_min = 0x60
slave_hw_ptr = unaligned value during dmix_start()

Issue:
- Initial, app_ptr = hw_ptr = 0
- Application fills buffer size of data. so app_ptr = 0xC0, hw_ptr = 0
- During dmix_start(), current slave_hw_ptr is not rounded down. current slave_hw_ptr would be 0x66
- slave_hw_ptr is keep on updating at the hardware 0x67, 0x68, 0x69
- The diff calculation between old_slave_hw_ptr(0x66) and new_slave_hw_ptr(0x69)
  results in avail = 0x6
- After 1 snd_pcm_period_elapsed(), slave_hw_ptr = 0xC0
- The result of avail = 0x5A which is less than avail_min(0x60)
- Here, xruns will be observed

Fix:
- Initial, app_ptr = hw_ptr = 0
- Application fills buffer size of data. so app_ptr = 0xC0, hw_ptr = 0
- Round down of slave_hw_ptr during dmix_start() leads to below calculation:
- During dmix_start(), slave_hw_ptr rounded to 0x60 (old slave_hw_ptr)
- The diff calculation between old_slave_hw_ptr(0x60) and new_slave_hw_ptr(0x69)
  results in avail = 0x9
- After 1 snd_pcm_period_elapsed(), slave_hw_ptr = 0xC0
- The result of avail = 0x60 which is avail_min(0x60)
- Here, xruns can be avoided

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 54d9900..a201fa3 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2043,10 +2043,14 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 {
+    /*
+     * For buffer size equal to two period size, slave_hw_ptr is rounded down
+     * to avoid xruns
+     */
 
 	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
 		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
-		pcm->buffer_size <= pcm->period_size * 2))
+		pcm->buffer_size < pcm->period_size * 2))
 		dmix->slave_appl_ptr =
 			((dmix->slave_appl_ptr + dmix->slave_period_size - 1) /
 			dmix->slave_period_size) * dmix->slave_period_size;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
