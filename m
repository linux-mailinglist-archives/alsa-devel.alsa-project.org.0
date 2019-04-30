Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB2EF1D4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:10:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CE016CB;
	Tue, 30 Apr 2019 10:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CE016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611852;
	bh=Nc1RsfuVcvZYKrE6ysYDvS97ixbGJH3kJQrveXFwJHw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJZXPHfxOsi2h2cFwGK6ftVJAlLs9DKPUI0ugZl04vFc5iu322Z5i6k6JVdJjOmL9
	 Hh95xUrWYPk5uQywiKEoL9gLAop1sb6Jc1lQnAhbE2LR+4y5i3/zAopDrrlNQRjIYW
	 m60sGSFvMxt65/Z14NLbNeZg2cJQZUVxOr/9AcLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AEA1F89732;
	Tue, 30 Apr 2019 10:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6642F8962C; Tue, 30 Apr 2019 09:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04748F896F0;
 Tue, 30 Apr 2019 09:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04748F896F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="rwzXubel"
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 44tYbB5FBhz4f3kZB;
 Tue, 30 Apr 2019 09:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1556610598;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:From:Reply-To:Sender;
 b=rwzXubelxUT9yPHohxc80uBaDvWXMMdmNgQ35dFvDZhPLl059/ZoyCG9rfWNbQJIV
 BXveWEh4CkxuuVMu0B7yrgOIhpRHVyFnuGnu/dmT2pJrsxA52vAlLncQh5fpjs0Kce
 pKIc1gmL9+VL8OyXUjBhMSm5rxMyi1VWGZ8a+nxg=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44tYbB4yw6z1CT;
 Tue, 30 Apr 2019 09:49:58 +0200 (CEST)
X-AuditID: 0a3aad0c-d19ff700000039d6-7a-5cc7fe26c224
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 4E.9F.14806.62EF7CC5;
 Tue, 30 Apr 2019 09:49:58 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44tYbB2tpNz6CjZrN;
 Tue, 30 Apr 2019 09:49:58 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Tue, 30 Apr 2019 09:49:57 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Tue, 30 Apr 2019 13:08:43 +0530
Message-ID: <1556609923-14093-5-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxTVxjHe25fOHRcvNxCeSig5o41mcFSUSe+Rk00xGSyLFkWtyZ6kUvb
 0EJzbykvyUw1kSrxDSVoS2CbUXFuiDI+4FyC60BSNhat2tnZgVucIcRoM6jK5tu9Fmw/+OXk
 Of/n+T3/nH8OltNnUnTYWu3k+GrWxqjUCvWq7vzF+hfDJuPZvQtKbl73EyXdXW5lyck2L7Fe
 Xnphao+q1Of5NuUj4jP1mgrOZnVxfNG6HWpLePyA0nEpu/6vn5+q3OiyphmlYqCWwXPPblUz
 UmOa8hLwz2CfMn7pQbDvd68ifvkOQU/HiFxCVJQeBkPRlGaEcSaVB4eDpCTLKR5a2i8QUq2h
 qmDq/AGVVCuo9yA4GkBSTVJb4eiT7+Vx5/kQ/m3/6zqVKoNwqFUlraTFmeBoTnw8AwLee4r4
 eoCfJiZm0YXQGjqhPIIoX9KYL2nsK0ScQ9pKzuiyG4tXGo0GvpwTGo1LDDtr7L0onmJaPxo6
 ZfYjCiMmjXz8cNhEK1mX0GD3o+WYYLLIykZRSi+vqWiwsIJlO19r4wRGR+Zd22KiNW9kobbc
 bhUEa021HwGWM5lk6fCQiSYr2IZGjq+JY36UixVMNmnGZSaaMrNOrorjHBw/112NMQPkyv9F
 wwyeM3P1lVabc67N5JNIJpPR2uROsi2BU/1oKU4TvX3PxBWk4GDtgtU8i+fEcXpOTaAjaIUu
 m9z0XGQoqWuprX7jqssjgRk00VlJjQQ5iW4jMTcNWSzBaeIHTfgBmStFlDErJqDiUyJDncMQ
 9edBoPMqgs7+GIIZzzUCzgbuKmDwcpsSIk/+U0H07xgJIU+UhumjVzQwvT+UCb/eCmZB38gD
 gKd3x3Lg4vhoLky+HMqH6J5DDMTctxh4NhB4V5zrLYCB8/cLIDLVooepYxG9pC2CsQeXCsVj
 phBOtMQWw1jrXgP86Bk3iKsOFsHtjgEjhPu/KZ4UsyTELLd3XpWydLLOt2Q5qyYep3Ojbcc/
 Jv5t37yz8crSk1u6+j9tnrA9Gu/9ele46Q8fm15YIOua1/HBaVn69Ax+py76xZ2bYZ3/4nqv
 1r3AUb/2E9kGRXSh9viNNVWudb/sWF4nTMdc+U1Fkb7wLvfkn7I7Ef3jug913fNevv/l503W
 smXBe4a21cir7QlsffjDxm29OQ5GIVjYJYvkvMC+AiZPUk45BAAA
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH 5/5] pcm: Update pcm->avail_min with
	needed_slave_avail_min, after reading unaligned frames
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

Issue: After partial read of unaligned frames, snd_pcm_wait()
would block for the pcm->avail_min which would result in
blocking of snd_pcm_wait() for longer periods i.e more than
one period as specified by avail_min

Fix: After reading unaligned frames, set the pcm->avail_min
to the needed available frames so that snd_pcm_wait() blocks till
needed available frames.
Once needed available frames are read, set back the original
pcm->avail_min

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm.c       | 21 +++++++++++++++++++++
 src/pcm/pcm_local.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index f0db545..f361eb1 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -973,6 +973,7 @@ int snd_pcm_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 		__snd_pcm_unlock(pcm);
 		return err;
 	}
+	pcm->original_avail_min = pcm->avail_min;
 	__snd_pcm_unlock(pcm);
 	return 0;
 }
@@ -7267,6 +7268,17 @@ void snd_pcm_areas_from_bufs(snd_pcm_t *pcm, snd_pcm_channel_area_t *areas,
 	snd_pcm_unlock(pcm);
 }
 
+static void snd_pcm_set_avail_min(snd_pcm_t *pcm, snd_pcm_uframes_t avail)
+{
+	if (avail != pcm->avail_min) {
+		snd_pcm_sw_params_t swparams;
+
+		snd_pcm_sw_params_current(pcm, &swparams);
+		swparams.avail_min = avail;
+		_snd_pcm_sw_params_internal(pcm, &swparams);
+	}
+}
+
 snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_t *areas,
 				     snd_pcm_uframes_t offset, snd_pcm_uframes_t size,
 				     snd_pcm_xfer_areas_func_t func)
@@ -7274,6 +7286,7 @@ snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_
 	snd_pcm_uframes_t xfer = 0;
 	snd_pcm_sframes_t err = 0;
 	snd_pcm_state_t state;
+	snd_pcm_uframes_t needed_slave_avail_min = 0;
 
 	if (size == 0)
 		return 0;
@@ -7332,6 +7345,14 @@ snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_
 		if (err < 0)
 			break;
 		frames = err;
+		pcm->unaligned_frames += frames;
+		pcm->unaligned_frames %= pcm->period_size;
+		if (pcm->unaligned_frames) {
+			needed_slave_avail_min = pcm->period_size - pcm->unaligned_frames;
+			snd_pcm_set_avail_min(pcm, needed_slave_avail_min);
+		} else {
+			snd_pcm_set_avail_min(pcm, pcm->original_avail_min);
+		}
 		offset += frames;
 		size -= frames;
 		xfer += frames;
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index e103f72..3fdffb4 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -210,6 +210,8 @@ struct _snd_pcm {
 	snd_pcm_tstamp_type_t tstamp_type;	/* timestamp type */
 	unsigned int period_step;
 	snd_pcm_uframes_t avail_min;	/* min avail frames for wakeup */
+	snd_pcm_uframes_t unaligned_frames;
+	snd_pcm_uframes_t original_avail_min;
 	int period_event;
 	snd_pcm_uframes_t start_threshold;
 	snd_pcm_uframes_t stop_threshold;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
