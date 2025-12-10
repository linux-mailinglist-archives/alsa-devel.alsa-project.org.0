Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5BCB95CA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 17:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2374A60206;
	Fri, 12 Dec 2025 17:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2374A60206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765558381;
	bh=2+wMymk8tznEbQ9UdqYdb6rwCbzZsgR50rC9kCpgN0U=;
	h=From:To:In-Reply-To:Subject:Date:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=s6Bzvje6zGTwGVzD+97jQtqvhXFekhAiOKi7dCHc4pHVwQWpcA5B1wxlw2v1oA2KO
	 zcdpsTFN+DxyUEFO0mFBDnMgf7nRtPCkDZ1Bb9iCthnYcPToS01BRFAaT+OW+35OWs
	 fWcxFopRMUwr2v5mYmOuUlgcp83lHEvEQMclPOU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 938DCF805D8; Fri, 12 Dec 2025 17:52:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D83F805D2;
	Fri, 12 Dec 2025 17:52:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C881FF804CF; Wed, 10 Dec 2025 08:27:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C84EFF80088
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 08:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C84EFF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=mknH1JPE
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251210072724epoutp0151860e40055564bc7580baa99043ee23~-yfeb6cYP0884708847epoutp01Z
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 07:27:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251210072724epoutp0151860e40055564bc7580baa99043ee23~-yfeb6cYP0884708847epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765351644;
	bh=wH+M6qF7/W8bRybYhC/9RmTpdakVNQj4xJsNok1DRCI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=mknH1JPEZyip/aF0KpsQSjFjxmUStEWcA4FO/xfaYhn1b1TQggzTy7DXF+PKxwlA1
	 5KSUgL1JR+q1QE3y8hn3dcVV/tDas2FUFdXP6HszsZxGqtE4VprTMmxzKTOuSw4guj
	 o0ypdA+AB7YoCY0HUbjMQKWAPN99xvSQzHdWTQOk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251210072723epcas2p44e2af1d1fd7d883110965eab1fc33ee8~-yfd5Vwvn2736527365epcas2p4M;
	Wed, 10 Dec 2025 07:27:23 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.202]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dR6k31FBjz3hhTC; Wed, 10 Dec
	2025 07:27:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251210072722epcas2p4b9b1502712f5808a7a86979f4e6c8a81~-yfc1N6122736527365epcas2p4K;
	Wed, 10 Dec 2025 07:27:22 +0000 (GMT)
Received: from KORCO117793 (unknown [12.80.201.208]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251210072722epsmtip20cf7411e96a6112fbaeed502cfd85da3~-yfcy0kiA0133101331epsmtip2p;
	Wed, 10 Dec 2025 07:27:22 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMy9wrrz?= <seungbin.lee@samsung.com>
To: <tiwai@suse.de>, <perex@perex.cz>, <alsa-devel@alsa-project.org>,
	<'linux-sound@vger.kernel.org'>, <'gregkh@linuxfoundation.org'>
In-Reply-To: 
Subject: [PATCH] ASoC: soc-compress: Fix race condition in soc_compr_open_fe
Date: Wed, 10 Dec 2025 16:27:22 +0900
Message-ID: <000301dc69a6$6ccc05b0$46641110$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adxpoc/sHMnnPv/JTgWwVcDCZRPqCwAAmEbgAABJN2AAACB2EA==
Content-Language: ko
X-CMS-MailID: 20251210072722epcas2p4b9b1502712f5808a7a86979f4e6c8a81
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251210072722epcas2p4b9b1502712f5808a7a86979f4e6c8a81
References: 
 <CGME20251210072722epcas2p4b9b1502712f5808a7a86979f4e6c8a81@epcas2p4.samsung.com>
X-MailFrom: seungbin.lee@samsung.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AY6VYM7M5XEC5DM3JXCIFJNLRY5YQ4FH
X-Message-ID-Hash: AY6VYM7M5XEC5DM3JXCIFJNLRY5YQ4FH
X-Mailman-Approved-At: Fri, 12 Dec 2025 16:52:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AY6VYM7M5XEC5DM3JXCIFJNLRY5YQ4FH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Maintainers, Takashi and Jaroslav,

I am writing to respectfully follow up on a patch I submitted to the alsa-devel mailing list and Patchwork

I would like to bring up an important issue regarding the interaction between soc_compr_trigger_fe and snd_soc_dpcm_runtime_update.

If the soc_compr_trigger_fe function is called during the execution of snd_soc_dpcm_runtime_update, it may lead to unintended
modification of the FE's DPCM runtime update variable. As a result, the BE list associated with the FE could become detached,
preventing proper closure of the BE.

Ex)When repeatedly switching between deep playback and offload playback during MP3 playback

To prevent this race condition, access to this critical section should be protected using snd_soc_dpcm_mutex_lock. Ensuring mutual
exclusion during these operations will maintain the integrity of the BE list and avoid potential resource leaks.

I understand that you have a large backlog of patches to review. If you have had a chance to look at it and found any issues, or if
there's anything I need to fix or clarify, please let me know. I would be happy to prepare a v2 version if necessary.

Thank you very much for your time and attention to this matter.

Best regards,

Change-Id: Ibfd1712e6baf41a30afa357a91ada83d205f968b
Signed-off-by: Seungbin Lee <seungbin.lee@samsung.com>
---
 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index fc8db54352541..1a2a3fe6a2340 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -286,6 +286,8 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 	snd_soc_card_mutex_lock(fe->card);
 
+	snd_soc_dpcm_mutex_lock(fe);
+
 	ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
 	if (ret < 0)
 		goto out;
@@ -315,6 +317,8 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
+	snd_soc_dpcm_mutex_unlock(fe);
+
 	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
-- 
2.34.1

