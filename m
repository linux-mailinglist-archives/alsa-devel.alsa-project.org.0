Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D91241B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 23:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048831833;
	Thu,  2 May 2019 23:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048831833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556832491;
	bh=1wWZnCMI23jPg0mvKxaQ7D+Em4yLxp+gu2yHL9xv560=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=daogF44krjn5qQqRy7gl26UxDnY7ZUuoFZOnpcvM7fMH6AjswOpJ+helGapaS/AW6
	 0pKn8ixWg8ovfWz2XKPSf1BENw4I2yGHNXDw3AZnV5Z9ok3ahgAgUu/WVGQlsiPjhP
	 J001kDR//vM+fQR6f9UIagOUb2V6wNmOqGEKCzI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F70F896C7;
	Thu,  2 May 2019 23:26:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BF44F896C7; Thu,  2 May 2019 23:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB933F89693;
 Thu,  2 May 2019 23:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB933F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yr0XJphL"
Received: by mail-lf1-x142.google.com with SMTP id v1so2981733lfg.5;
 Thu, 02 May 2019 14:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LmJLwu8PryyPhWnHUW6TKE+to79Ilvg/5YwmdKDWgHE=;
 b=Yr0XJphL6I9E7o/YkEQlPdD++lxHpaciq+vMXwCk86hZYktMYx2t86IrdOUQYi9Ms2
 +fJEeVPqWDrYUIppqigrX+cxZaC+qUrr9LZwmYz2SuYryCW8JwqfEiSjeZV88fJEFED9
 vMBW5bHmympvDyhEPuN3wN7RY3paVIDMSzWU/5/pAVZ6QtxlLNXFDFO9cAzEsIKFmvKy
 JeN+N8//7GCCnZscA7roxh1FlRmPx1m/jlr2cjpAUKMMIYzPeNFN+kPFAhdvMxG4kmj9
 2PzYI0FhqzpDBjedsQLXpThoQUBh7rQrnK/3q7+PgPK1XiooC0yBjShECi9mwnOL5xgA
 OMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LmJLwu8PryyPhWnHUW6TKE+to79Ilvg/5YwmdKDWgHE=;
 b=s/rWQkIT/1g4djht8YjjiG/XmDe2aL6Eo1pbCiEjVXnVb8Ae/os7YJUbz+DQIubp6S
 Ei0Xc+kcTCdE+XDOgs+TC2Wv0FD+Cge1MOlLJULWWgR2c09aGrGSdJJgED2Ip/Re2VGC
 60cQG9LaODxqrwu+K2AhBKiJnjVZ5BRTrDoOWIMgkOYXHPLpV/10Hw8Oxv6w8kSAbPF7
 EcZp7QQjkiEot2y/5XEDsI9QAKCK9Pr4NeCUmgtXv0TqrSL3Qj/SndoqlVNDpU4pP/Zf
 geuFOooS5UeoWWxLklaXmM9lhSXWaxSkflPHdJOg+v3Ba+mETx5isH02B68AD9eilYxe
 57ZQ==
X-Gm-Message-State: APjAAAU6Y9isyY+jjkKein3jVYaX/1LIKQ6zdEAxoCnDqNBZg9OJ8GLg
 JQlDnfOCBZefDMQpYUeRmz+TfmBtSzs=
X-Google-Smtp-Source: APXvYqzd1LaXXMi3ddumNYIl+KToTLH/L0c+ioh8yjQoez3ghXd4jWyGvozdeestQ/imNIH0va2R6Q==
X-Received: by 2002:a19:550d:: with SMTP id n13mr3087872lfe.127.1556832378148; 
 Thu, 02 May 2019 14:26:18 -0700 (PDT)
Received: from boron.home (159.92-220-243.customer.lyse.net. [92.220.243.159])
 by smtp.gmail.com with ESMTPSA id t9sm42266lfk.20.2019.05.02.14.26.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 14:26:17 -0700 (PDT)
From: stian.skjelstad@gmail.com
To: patch@alsa-project.org
Date: Thu,  2 May 2019 23:26:15 +0200
Message-Id: <20190502212615.11457-1-stian.skjelstad@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Stian Skjelstad <stian.skjelstad@gmail.com>
Subject: [alsa-devel] [PATCH - maemo fixes 1/1] maemo plugin has two crashes
	I was able to see in a valgrind log from another user:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Stian Skjelstad <stian.skjelstad@gmail.com>

* maximum write size was calculated in words (16bit), but checked against
  byte-size length. This causes memcpy later to overflow the buffer
  (normally by up to 12KB).
* remove a double free (by marking free'd data with NULL)

* mmap returns MMAP_FAILED on error, not NULL

I suspect that this plugin/driver might have other issues aswell, since I
am unable to find any logic for checking DSP buffer status, and no
implementation for odelay reporting.

Author: Stian Skjelstad <stian.skjelstad@gmail.com>
Signed-off-by: Stian Skjelstad <stian.skjelstad@gmail.com>

diff --git a/maemo/alsa-dsp.c b/maemo/alsa-dsp.c
index 7e04f6a..3307384 100644
--- a/maemo/alsa-dsp.c
+++ b/maemo/alsa-dsp.c
@@ -135,18 +135,18 @@ static snd_pcm_sframes_t alsa_dsp_transfer(snd_pcm_ioplug_t * io,
 	snd_pcm_alsa_dsp_t *alsa_dsp = io->private_data;
 	DENTER();
 	char *buf;
-	int words;
+	int bytes, words;
 	ssize_t result;
 
-	words = size * alsa_dsp->bytes_per_frame;
-	words /= 2;
-	DPRINT("***** Info: words %d size %lu bpf: %d\n", words, size,
-	       alsa_dsp->bytes_per_frame);
-	if (words > alsa_dsp->dsp_protocol->mmap_buffer_size) {
-		DERROR("Requested too much data transfer (playing only %d)\n",
-		       alsa_dsp->dsp_protocol->mmap_buffer_size);
-		words = alsa_dsp->dsp_protocol->mmap_buffer_size;
+	bytes = size * alsa_dsp->bytes_per_frame;
+	DPRINT("***** Info: samples %lu * bpf %d => bytes %d\n",
+	       size, alsa_dsp->bytes_per_frame, bytes);
+	if (bytes > alsa_dsp->dsp_protocol->mmap_buffer_size) {
+		DERROR("Requested too much data transfer (requested %d, playing only %d)\n",
+		       bytes, alsa_dsp->dsp_protocol->mmap_buffer_size);
+		bytes = alsa_dsp->dsp_protocol->mmap_buffer_size;
 	}
+	words = bytes / 2;
 	if (alsa_dsp->dsp_protocol->state != STATE_PLAYING) {
 		DPRINT("I did nothing - No start sent\n");
 		alsa_dsp_start(io);
diff --git a/maemo/dsp-ctl.c b/maemo/dsp-ctl.c
index 5bcda36..ac05942 100644
--- a/maemo/dsp-ctl.c
+++ b/maemo/dsp-ctl.c
@@ -93,6 +93,7 @@ static void dsp_ctl_close(snd_ctl_ext_t * ext)
 	snd_ctl_dsp_t *dsp_ctl = ext->private_data;
 	DENTER();
 	free(dsp_ctl->controls);
+	dsp_ctl->controls = NULL;
 	free_control_list(&(dsp_ctl->playback_devices));
 	free_control_list(&(dsp_ctl->recording_devices));
 //      free(dsp_ctl);
diff --git a/maemo/dsp-protocol.c b/maemo/dsp-protocol.c
index af67251..32193d3 100644
--- a/maemo/dsp-protocol.c
+++ b/maemo/dsp-protocol.c
@@ -194,7 +194,7 @@ int dsp_protocol_open_node(dsp_protocol_t * dsp_protocol, const char *device)
 	    mmap((void *)0, dsp_protocol->mmap_buffer_size,
 		 PROT_READ | PROT_WRITE, MAP_SHARED, dsp_protocol->fd, 0);
 
-	if (dsp_protocol->mmap_buffer == NULL) {
+	if (dsp_protocol->mmap_buffer == MAP_FAILED) {
 		report_dsp_protocol("Cannot mmap data buffer", dsp_protocol);
 		ret = -ENOMEM;
 		goto unlock;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
