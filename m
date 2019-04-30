Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F3F1CC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B96C16A4;
	Tue, 30 Apr 2019 10:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B96C16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611768;
	bh=yjWkufP2Di0Bbemdv1s1JjyFyCxT1geWEGlqBNw+qDI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2OB3NlVISufjO052sbMX9lrzNEJpOP3et4dmekUH5GaKyshyjE0cGeJRsyjqyqBj
	 4kvSB8NW4OU7zPUbAoVBP0uaqCsiGp8m1qIeh/PlK7MN4pZlpiu5WAancZAAHJ3xUx
	 xwOXtu3JKiu9ar9J9cPVoajT2guIK/7CK+OC8SZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7AEF89727;
	Tue, 30 Apr 2019 10:06:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2FB2F896FA; Tue, 30 Apr 2019 09:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAA21F896AA;
 Tue, 30 Apr 2019 09:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAA21F896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="llN9DBWi"
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 44tYb81Hdyz1XLFjP;
 Tue, 30 Apr 2019 09:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1556610596;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:From:Reply-To:Sender;
 b=llN9DBWiLpuHPAcMp5SVF+hWF8ILzOoNcRykdu0SBEMJd13C3k1npuEa0921mQnAi
 +K5Fb2xkpKdIAd+E4o9xSHeu8WH12sRPr0cLCFJquv1djbHPKB8aE76H5ID2u8h3dP
 s1Ni73DZRh7hrDwu3dSzp27IDQIajAu9zimTS3+c=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 44tYb811jPz1CC;
 Tue, 30 Apr 2019 09:49:56 +0200 (CEST)
X-AuditID: 0a3aad14-cc5ff7000000410a-5e-5cc7fe232aba
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id 06.43.16650.32EF7CC5;
 Tue, 30 Apr 2019 09:49:56 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 44tYb76MkWz5fw;
 Tue, 30 Apr 2019 09:49:55 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Tue, 30 Apr 2019 09:49:54 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Tue, 30 Apr 2019 13:08:41 +0530
Message-ID: <1556609923-14093-3-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wTZxjHee/646X2luMAfSzVyQ0ZGn+APyY6syxhJqjJmFuymK2JO8ZB
 G2iLdy1akhFYggbUIaZxpUgjLNNtrYowNmJEpagMAjLIxKANiWgMYMfQwUhkv+52YPvH/nve
 7/N8nu/7fvNikrmsNWCLzcELNq6I1ehUuh0XVqxP+bvblD4VRJm/DAaJzAvny9WZTafriLfJ
 7ObfP9dke4/6te8RH+l25vFFlhJe2PjWJzqz98GAtvj75MP9N94vR+eM1SgWA70Fep9Uomqk
 wwztIaCi/5haOVxF8GOFV6McAggaB3/VyoiGToWbw9NSjXECbYSaIUqWSVqA2vpmQq7jaRuE
 PJ1quVbRq6F1/gdSrin6XQjUv0CK80oYuVP1nx5L58DIsFsjr2SkmaH+5cp4HPTUPVYp6wE6
 x8dJBV0F7mGP+iSivVFj3qixs4j4DiXm8+kl1oxtW9I3CLm8WJqeseFTu7UFKRkmtKP5YH4Q
 0RixeqpwqtvEqLkS0WUNoq2YYBOp/FJJeiXXnucyc6L5gOAs4kXWQBl/3mNi4l/KojPXahFF
 i90WRIBJNoHK7r5lYqg8zlXKC3YFC6IkrGKXUQU4x8TQBZyDL+T5Yl5Y7L6JMQvU9nnJME7g
 C/jD+ZYix2KbXUGhmJgYZml0J9qWwLFBtBnrJW/vn9IKSizmrKKlYAFfruDMohpBe1EW7px7
 2EAyKpvdxhuWUbv+knhanjQ7bS9vYDBSwN40MYlRjciWSTSCpAzjqU0yrJe+asQbqCQ5rrgF
 MQJt+lpi6It66Jq+gsDXPotgrGaWBPelRg3MtF3VQNfZSi0MXfFqwVN7GkOf76QO/GHfEvjm
 2cQS+CrUoAd/IETD/cEvGfBMhBkYbapPkIjrieCZqgP4qbkDIBQ+Z4DAwztJ8M/khBFGq2eM
 8PRRxUq49OzpKhjorEmGntE/UuBa+berYbylMhWO//YgFbrCfWnQd7dl7aQULCEFe8B3Ww7W
 wTn+J9gFNfI6Qzl6Z9dR/2R/bdyZIw1lm1ubLh7kP7a2VVWJj/a59q7zuQcKj7StX7N92xdj
 uOuG58WJ42MdH+52Zx27PvyGoz2UVXnw/P6l9/SHwrdeSzvBGAuT98/Nnrq9RtOdUpZzbfBV
 c8/OHTW9gTPO5y2Nrc45/2cVM2nrPtg6feiU6/Wyjt7n+y5nsCrRzGWsJQWR+xd/zXr/RAQA
 AA==
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH 3/5] pcm: dsnoop: Added "hw_ptr_alignment"
	option in configuration for slave pointer alignment
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

snd_pcm_wait() is waiting for longer time more than two periodic size as
avail is less than avail_min by few frames.
This is because the hw_ptr read from the kernel during snd_pcm_start()
is not period aligned which is ahead of few (Nperiod + 1)frames.

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_direct.c | 7 ++++---
 src/pcm/pcm_dmix.c   | 2 ++
 src/pcm/pcm_dshare.c | 2 ++
 src/pcm/pcm_dsnoop.c | 5 ++++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 411a035..b56da85 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2043,11 +2043,12 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 {
-	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
-
+	/* For buffer size less than two period size, the start position
+	 * of slave app ptr is rounded up in order to avoid xruns
+	 */
 	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
 		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
-		pcm->buffer_size <= pcm->period_size * 2))
+		pcm->buffer_size < pcm->period_size * 2))
 		dmix->slave_appl_ptr =
 			((dmix->slave_appl_ptr + dmix->slave_period_size - 1) /
 			dmix->slave_period_size) * dmix->slave_period_size;
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index dcde40d..274726e 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -562,6 +562,7 @@ static int snd_pcm_dmix_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	dmix->hw_ptr %= pcm->period_size;
 	dmix->appl_ptr = dmix->last_appl_ptr = dmix->hw_ptr;
+	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	return 0;
 }
@@ -571,6 +572,7 @@ static int snd_pcm_dmix_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 	int err;
 
 	snd_pcm_hwsync(dmix->spcm);
+	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	err = snd_timer_start(dmix->timer);
 	if (err < 0)
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 45e2597..3847645 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -333,6 +333,7 @@ static int snd_pcm_dshare_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	dshare->hw_ptr %= pcm->period_size;
 	dshare->appl_ptr = dshare->last_appl_ptr = dshare->hw_ptr;
+	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	return 0;
 }
@@ -342,6 +343,7 @@ static int snd_pcm_dshare_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dshare)
 	int err;
 
 	snd_pcm_hwsync(dshare->spcm);
+	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	err = snd_timer_start(dshare->timer);
 	if (err < 0)
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index d08b624..2bbbc2d 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -278,6 +278,7 @@ static int snd_pcm_dsnoop_reset(snd_pcm_t *pcm)
 	dsnoop->hw_ptr %= pcm->period_size;
 	dsnoop->appl_ptr = dsnoop->hw_ptr;
 	dsnoop->slave_appl_ptr = dsnoop->slave_hw_ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dsnoop);
 	return 0;
 }
 
@@ -285,12 +286,13 @@ static int snd_pcm_dsnoop_start(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dsnoop = pcm->private_data;
 	int err;
-	
+
 	if (dsnoop->state != SND_PCM_STATE_PREPARED)
 		return -EBADFD;
 	snd_pcm_hwsync(dsnoop->spcm);
 	snoop_timestamp(pcm);
 	dsnoop->slave_appl_ptr = dsnoop->slave_hw_ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dsnoop);
 	err = snd_timer_start(dsnoop->timer);
 	if (err < 0)
 		return err;
@@ -627,6 +629,7 @@ int snd_pcm_dsnoop_open(snd_pcm_t **pcmp, const char *name,
 	dsnoop->max_periods = opts->max_periods;
 	dsnoop->var_periodsize = opts->var_periodsize;
 	dsnoop->sync_ptr = snd_pcm_dsnoop_sync_ptr;
+	dsnoop->hw_ptr_alignment = opts->hw_ptr_alignment;
 
  retry:
 	if (first_instance) {
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
