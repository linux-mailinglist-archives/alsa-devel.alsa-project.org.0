Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9381E889
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC84A16C4;
	Wed, 15 May 2019 08:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC84A16C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557903009;
	bh=pTUMRlK/NBjOZTZFNLyuihcwzGM4kmE+dWSJLCLCHWc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwPeArC6TzwE21iFqUKuXHsMDKpGO6TumZVEM0HFD7LWbLLvYJddsIW0iW7w10Q6D
	 aJAT3it5iZMMQS9kOoIe1EWqbntzXP3ycPhOGMvpdpgiCdeHTN871pW2UPPtJikOCX
	 vw7w/IfEEbOWVveeh6du89uB7xY9CR2If2pDl3zQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FC9F8974D;
	Wed, 15 May 2019 08:45:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6154DF89708; Wed, 15 May 2019 08:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A52F89708;
 Wed, 15 May 2019 08:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A52F89708
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="ErEuyC2k"
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 453lRG5W62z1XLGMJ;
 Wed, 15 May 2019 08:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902698;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=ErEuyC2kuAycXUZ76yE91GaaUmwrQ8a1NJWHDLbToNuizcnaSwFuVYP5cda3HxJMN
 Gcn0QiQjYMMVxGxOksdChMlEXXhV6+0mgP9qNvu1fCH8e7UDT5j0gSFx/xxbjfrUJO
 M0q1ZIm7izmsvTzGZGFg7+/8t8D2xr+HA6HBjiYU=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 453lRG5Dh9z1CT;
 Wed, 15 May 2019 08:44:58 +0200 (CEST)
X-AuditID: 0a3aad14-cc5ff7000000410a-0f-5cdbb56ae04e
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id CC.D8.16650.A65BBDC5;
 Wed, 15 May 2019 08:44:58 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 453lRG3cr1z5gM;
 Wed, 15 May 2019 08:44:58 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:57 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:36 +0530
Message-ID: <1557901597-19215-6-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sb0wbZRzH+9yV9mh65Dja8bOMRbtsMyxjIGyUrU6m0ZBFwDfsxdLIDrnS
 alvIXSFQ3+BcMaBOIA1hVQeBoYSuZiu4IGgWbssCTHDDyt+ly8LQyaAhLhriIPOOAu0L31y+
 z/f3+zzfPN8cgdPXlDrC6nCynIOx6RUqueqYP/XQ+9/PmzLc/n2G4D0BM/i/rYsz/Nm3jBk6
 Wy9iefL8q0/PKfK9n/iU+X13PnwHP6MylrE2azXLHT5xVmV57p/AKsd0Ndcv9Cvq0NyuRhRP
 AJUNT3yCshGpCJpqw+By709xkcMVBOHAGr5z2GgKKiREQe2HW1OrSklrqEOwuNCy6eMUB81f
 XsUknUS9Cu2t/2xqObUPgr61TU1ShdD9bByLRO+B2YkGXNLxVBFc/+uhXNK0uDPfFcYj+4kw
 evGRPHI/wPDjx3iEfRE8U21xTYjyxqx5Y9Y6ENaLtGY2o9qemZOdkc6VsrwrIzP9vQp7AEX6
 1AygZ4JZQBSB9GrS2TlvouOYar7WLqAjBKbXkufNopVQWlFWa2F4SwlXZWN5vY7cffeUiU7a
 sfmqUruV560VDgEBges15JmXZkw0WcbUuliuIoIJKIWQ65PJcqLIRFPljJP9gGUrWW57epwg
 9ECW9IuBiRxbztaYrTbn9lifSiKZTEbvip3ExmJEvICyCLWY3dAnXkHylYydt5Zv4S9EcHrb
 jaJjKEeXTBqlWEqaWqocO6m63eTUyrSJ1sYMouQSmkVib0lklgSrxV81mgdkilRR4pYZhV7p
 FhmqMR7uL19AcGngbwSTg14leFo7CQiFxxOgx/8wAWaGGzTw82+TWrixtKGFcMdHydC+8EQH
 60OLqTD5b9de6Lk3vReWv+7YDzeX2w7AjTs/ip/h8AEY6e14WWQDabD+6x9pEPK402F9ejEb
 Vs+NHIFVYfwo3L/2aQ6E6gUDrD+4ZISAe8YIa3MhI1ye+OYkfHfFd3JJLBMTy8y1zkllOhnn
 /5S55UZfp6tD6nffapkLWdyciy+xTNQPDB4/a2jOu5srS2k/SCV40enCqdyapgJfZdXzN+C1
 Ic+p+tmsPLvhzYXbjtyjX/zyA3eC7ykqLjhdbC78TH3MNTrW9VXY6xhJ616xfD5mazkfdBX0
 u58O6kZ/tz7ymAKv7/EpVw5rhj6eDTY/eFtWvKGX8xYmMw3neOY/iQMVOkQEAAA=
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 5/6] pcm: restructuring sw params function
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

snd_pcm_sw_params() is reformatted by using _snd_pcm_sw_params_internal()
function.
Critical section of snd_pcm_sw_param() is moved to
_snd_pcm_sw_params_internal(). This allows to call the snd_pcm_sw_params()
function from an internal function which has already locked the API mutex.
Calling snd_pcm_sw_params() from an internal function with locked
API mutex would end up in an deadlock because recursive locking is not
supported.
This patch doesnot change the behavior or the functionality.
To avoid double lock conditions, a separate _snd_pcm_sw_params_internal()
function is added which can be used internally by any other
functions in alsa-lib

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
