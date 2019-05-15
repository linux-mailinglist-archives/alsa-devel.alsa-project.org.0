Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8161E885
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E04416B0;
	Wed, 15 May 2019 08:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E04416B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902969;
	bh=2aytasbJFN9tX5A/BtdPtYh/Y5pOX7oGTCujQGc2mO4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFgwHHPArFppCMxJIORGgJZYUsu87TC4A6QqhhA7Umi/WrT3wD5tq6JeueR62ZuyB
	 zrRzTjKvCwyrxiy1p3z9AA57EENDjJfznk+MzjF4YXhFOLQyMyV3veRTnggkE2ZYXs
	 jEKdn9O+VBdRlFVHTKEUeYyJ+tpjLOc5rfuw8KcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A02AF89747;
	Wed, 15 May 2019 08:45:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4557DF89737; Wed, 15 May 2019 08:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF79F896B2;
 Wed, 15 May 2019 08:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF79F896B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="hcl8x5/G"
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 453lRF3VbDz1XLDR6;
 Wed, 15 May 2019 08:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902697;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=hcl8x5/G7oDQt8Iwxy6Ilp5TKsxGZ6EjOYf3KwpBDb2trjHyD/hdhgkZLoFC8uurf
 4Jiyt71Lnk0LauvlLgsW7AFyyPl4WDiHZUtTnDfVth7fIzzgXq3TrH4b8OXgLtiTR3
 l8Ilby35qFSvPpn6rXIspa5W9MHtsGh3FMmXVqps=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 453lRF37xCz1Tk;
 Wed, 15 May 2019 08:44:57 +0200 (CEST)
X-AuditID: 0a3aad0c-d01ff700000039d6-03-5cdbb569f645
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 76.F3.14806.965BBDC5;
 Wed, 15 May 2019 08:44:57 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 453lRF0nwBz6Cjg7y;
 Wed, 15 May 2019 08:44:57 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:55 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:35 +0530
Message-ID: <1557901597-19215-5-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA21SbUwTZxznuZZydD12Pd7+FjRyRrO50JWXKSKKb4nEBF32kXRxhxztsb7A
 XUtAsww3zVyN8QWitog4BN/BRtRQom6WuawTdHUOtWVkMMeQAZLZfVG27I4W2w/79nt+L8/v
 uV8Ol1HuBA3OWWwsb2FMtEIpVxZ2LszmrgX1uoZRouCh34sVdJ5tiC941j2JFbQddWLr5CXu
 F58pSlxfXEwo6b67631ZmbKogjVxtSz/7tqPlMb+X1+h6oC6bnqvI74BXU1yIBwHMh96x9Y4
 UCJOkU4MPr+xwoGUIv4awdBMqyJ8uISg1XMXk1wKchl8OziTIOEUMht+/+2IQsIykofDze45
 TzJZA57d++awnFwKv3hnZRImyK0w+cfNOQzkInhy78s5nEhug+t/jcjDr9gKwdPTEb8afM6n
 8vD9ALfHxyPZxdA0eDz+ECJdMTZXjO0Uwi6gtEpWV2vW5a7S6bR8OSvs1OVod1jNV1B4TlUP
 utNu8CISR7SKqG0L6ql4plaoN3vRezhGpxJ7KkUqqdxaUW9kBON23m5iBVpDZP64RU8lv6YF
 e7mZEwTOavEiwGV0ClGW9VhPERVM/U6Wt4ZjXpSBy+l0woBv01OkgbGxH7NsNcvPq6txnAZi
 +1WxUM2zBraukjPZ5mV6IYHi4uKotFglthbDE70oD1eJ3QHpCkKoZswCZ4jEF4Tj1Dwbjf6A
 VmrSiSIpQ0qq0W553arJJAanHump1BghmpxAT5C4WzKRJ4VV4p8a7QMiQ5pIHSGjodwOMUNe
 wKFvphfByZ6/ETRd/koBD3pdCXBx8uQbcHqoRQXfH2p5EwL+YxR4fA8oaB4IaeDSyL0M6B8O
 ZMKwI5QJ928fzALvqam3of/nK8th9lHHO3DuxO5sGG7aq4We0GUtNP7j1oLv32e50jEPjjxv
 XQGhZv9K8E8/LhTVmdVw47y/CHqOXiuG/nbHOhj+rnE9+G61bJgQx8TEMVdxAWlMG2P7nzEj
 bPTrNA0oaY0rVJM/1F3ViAYg//r6++dzug4PbPykM9neW7qMdS5x/wR1jrFjnX1VTycWh7pS
 Cvs+fAsbKxlsXSL7wL/W9zCrYrMQ0lfdQX8GU63nivctHS1t83CjU3nOF3sMs/vLPKakTely
 dbup5uw3Zxa8HC+zF095dgRH0g7YP+3Kt9BywcjkLJfxAvMfY1qMcEMEAAA=
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 4/6] pcm: direct: Round up of slave_app_ptr
	pointer if buffer size is less than 2 period size.
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

For buffer size less than two period size, the start position
of slave_app_ptr is rounded up in order to avoid xruns
For e.g.:
Considering below parameters and its values
Period size = 96
Buffer size = 191
slave_appl_ptr = slave_hw_ptr = unaligned value

Issue:
- During the start of the stream, app_ptr = hw_ptr = 0
- Application writes one period of data in the buffer i.e
  app_ptr = 96, hw_ptr = 0
- Now, the avail is just period-1 frames available.
  avail = hw_ptr + buffer_size - app_ptr = 95
  i.e. shortage of 1 frame space
- so application is waiting for the 1frame space to be available.
- slave_app_ptr and slave_hw_ptr would get updated to lower values
- This could lead to under run to occur.

Fix:
If we round Up the slave_app_ptr pointer,
- During the start of the stream, app_ptr = hw_ptr = 0
- Application writes one period of data in the buffer i.e
  app_ptr = 96, hw_ptr = 0
- Round Up of slave_app_ptr pointer leads to below calculation:
- slave_app_ptr rounded to 96
- slave_app_ptr and slave_hw_ptr would get updated to larger value nearing to 2 period size
- avail = greater than period size.
- Here, there is a lower chance of under run.

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_direct.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 54d9900..b56da85 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2043,10 +2043,12 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 {
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
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
