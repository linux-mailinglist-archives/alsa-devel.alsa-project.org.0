Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCDF1D0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E7D16B7;
	Tue, 30 Apr 2019 10:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E7D16B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611813;
	bh=ZWfb7l6+OOQV7ho8QQfHejbcFoCBO1pjL6G4Er8wNNU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lu7rfWfoH/NlUn4MVo17hqGfJBrr7OVld2NREZ+Fi+dheGlWAeSKP3ZVGxe3JPoK8
	 UfcncHF+OEIoAL1wdl2RMAi1DBwGK6NRc9YZfNB4aHH25jqLmj+e1FkHzO1xs5uOo7
	 m9TSaO8DN9HzJNaHU//RYLNVe0LKsTEkEHDFaenw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D599CF8972A;
	Tue, 30 Apr 2019 10:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B65ADF896F3; Tue, 30 Apr 2019 09:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B05CF80759;
 Tue, 30 Apr 2019 09:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B05CF80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="fcIjrztF"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 44tYb93lrdz1XLG6y;
 Tue, 30 Apr 2019 09:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1556610597;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:From:Reply-To:Sender;
 b=fcIjrztFJIKf53dDzesf0ECDgFb8N/e7CWWNt9l0eKG/lK04a3ks5O0EVSXGBUqH4
 Ry5S1VKApFzkNfozAHYYZKwKjYdsaVBQX5u/ILvK68t0pHSvJNG61jiCmp8+LPRh/l
 cKYyXX5o8z3uD0XezGyL1MboblXJ2JG7FHgccFy4=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44tYb93S87z6CjQSN;
 Tue, 30 Apr 2019 09:49:57 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-7a-5cc7fe257b51
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id CA.07.32648.52EF7CC5;
 Tue, 30 Apr 2019 09:49:57 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44tYb91GsYz6CjZrT;
 Tue, 30 Apr 2019 09:49:57 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Tue, 30 Apr 2019 09:49:55 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Tue, 30 Apr 2019 13:08:42 +0530
Message-ID: <1556609923-14093-4-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SWUwTaxTH+Wa6TCtDpkMLhwrGTESJiQiKUqUx8iRxJcGHm3ub4CDTJVIg
 M4UI3geuuS7FFW0MICJRXALiJeiDWyQUsbhAhGABNXUnWrE2Lrku1TiTgu2DL1/O9z/nd/75
 /vkInD6l1BO2UgfHl7IljEItUy/vSFmQ+sNjyuh2aQwjQ27M0HGmRm44caQBW4nndX7Yrshr
 3NWuzMf+VBuLuRJbJccvXLFJbW379BUvdyZsveC01qD3dC1SEUBlwVCvF9UiNUFT9Rh8HW2f
 uvyHoGnfMVn4cg5B6+RhhYQoqLlwwxtU1iKC0FLJcGCYlGSc4qHuaCcm1fHUcgg0/Y+kWkal
 wv2moEyqSWo91HV+U4adZ8H4oBOXahW1Aca9LoW0khZnhgeSwuMauNXwQhZeD9Dz6hUeRmeD
 y1svP4ioxqixxqixFoS1IZ2Zy6i0Zy/LNKTzRZxQnZGZvrnM3oXCGVKX0OXbZjeiCMTEkvaA
 x0TL2Uqhyu5GSwiM0ZHmalGKKyorrrKygrWQryjhBEZPJt9bbaLjf8lCRZHdJgi2slI3AgJn
 tGSep89Ek8VsVTXHl4UxN5pJyJhE0kJsMNGUhXVwWziunOOnuzkEwQC57JtoqOE5C7fVbCtx
 TLeZFBLFxMTQCdGdaFuMULnRYiJW9N4orSCFctYu2CxTeFIYp6fVCHobZesTSTwkMpTUtVaU
 /nLVJ5PA3DDRuqhGhPSjcSTmFk8qJThW/J4RPyBnShFppsQItOiUyFB7lPBocj+C5kufEAxf
 aVSCLzAQB2c7nsbBWI9TC3fvD+ug2/9dB4GWfxLh+PM3eghdfZkCvZP186D7zjXx6AnMg/62
 ljRxuGs++Fw70iE0+jILgtv7l0DQPbAUvgydzwbfTrcBQo+bjfD5gc8IrYOnc+H8ufZc6A1e
 yQX/8brVsNfpWgO+04F1cLavMx++fGwt8IthYmKYhc03pTAdrOM3YU6pkdfpa9DsicV/36Ji
 01o+P9Q+sL55xht3pxwiC9p2T9w5qc1burbh7bH9BSMXRrVY0scxY1/qeAGXv8Zs6orRvE4/
 McNbH5Ln3Myp8GxL1fybpq1r+Gtwp/yD6kjWxXVzDM/0BssLz2VV75OOrMF39EChoWfjjJFV
 T/+YGPueMPd6bj8bSPAzMsHKZs7HeYH9CWjZ6io4BAAA
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH 4/5] pcm: restructuring sw params function
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

snd_pcm_sw_params() is reformatted by using
_snd_pcm_sw_params_internal() function

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm.c        | 12 +-----------
 src/pcm/pcm_local.h  |  1 +
 src/pcm/pcm_params.c | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 3a71d79..f0db545 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -968,21 +968,11 @@ int snd_pcm_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 	}
 #endif
 	__snd_pcm_lock(pcm); /* forced lock due to pcm field change */
-	err = pcm->ops->sw_params(pcm->op_arg, params);
+	err = _snd_pcm_sw_params_internal(pcm, params);
 	if (err < 0) {
 		__snd_pcm_unlock(pcm);
 		return err;
 	}
-	pcm->tstamp_mode = params->tstamp_mode;
-	pcm->tstamp_type = params->tstamp_type;
-	pcm->period_step = params->period_step;
-	pcm->avail_min = params->avail_min;
-	pcm->period_event = sw_get_period_event(params);
-	pcm->start_threshold = params->start_threshold;
-	pcm->stop_threshold = params->stop_threshold;
-	pcm->silence_threshold = params->silence_threshold;
-	pcm->silence_size = params->silence_size;
-	pcm->boundary = params->boundary;
 	__snd_pcm_unlock(pcm);
 	return 0;
 }
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index d52229d..e103f72 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -661,6 +661,7 @@ static inline int muldiv_near(int a, int b, int c)
 	return n;
 }
 
+int _snd_pcm_sw_params_internal(snd_pcm_t *pcm, snd_pcm_sw_params_t *params);
 int snd_pcm_hw_refine(snd_pcm_t *pcm, snd_pcm_hw_params_t *params);
 int _snd_pcm_hw_params_internal(snd_pcm_t *pcm, snd_pcm_hw_params_t *params);
 #undef _snd_pcm_hw_params
diff --git a/src/pcm/pcm_params.c b/src/pcm/pcm_params.c
index 8826bc3..3ba05fb 100644
--- a/src/pcm/pcm_params.c
+++ b/src/pcm/pcm_params.c
@@ -2439,3 +2439,24 @@ int _snd_pcm_hw_params_internal(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 	return 0;
 }
 
+int _snd_pcm_sw_params_internal(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
+{
+	int err;
+
+	assert(pcm && params);
+	assert(pcm->setup);
+	err = pcm->ops->sw_params(pcm->op_arg, params);
+	if (err < 0)
+		return err;
+	pcm->tstamp_mode = params->tstamp_mode;
+	pcm->tstamp_type = params->tstamp_type;
+	pcm->period_step = params->period_step;
+	pcm->avail_min = params->avail_min;
+	pcm->period_event = sw_get_period_event(params);
+	pcm->start_threshold = params->start_threshold;
+	pcm->stop_threshold = params->stop_threshold;
+	pcm->silence_threshold = params->silence_threshold;
+	pcm->silence_size = params->silence_size;
+	pcm->boundary = params->boundary;
+	return 0;
+}
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
