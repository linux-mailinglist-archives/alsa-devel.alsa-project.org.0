Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01A75948A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 13:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9430E1F7;
	Wed, 19 Jul 2023 13:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9430E1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689767080;
	bh=CfgKLGH3Z8ObYSNnn/H48ibZhkX7RS6ADUlcss6qFI8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XMOpQPFDcTl/W7lfyof5DTGP+mBnAMBnMDSzw8WSYBlS1pDSMgPBIBmg4ptXfH73l
	 thul6zPSmWjDa4Hq/gMTZYbfNDtEuTww01oCPWzxG0bd2xl1UOj7+GUl0nuTnEIQTe
	 b6FbQ3ApEZLqliopaOyu+1TvV9BwZYEDyR508ivk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5DF1F80520; Wed, 19 Jul 2023 13:43:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F72F8032D;
	Wed, 19 Jul 2023 13:43:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F229F8047D; Wed, 19 Jul 2023 13:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17D07F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 13:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D07F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LduMIvKs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jVPLnwKE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E84D1FEBC;
	Wed, 19 Jul 2023 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689767018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=D7k0jAiof48Gr3Y20c1akB3ktrrFyapC002SOgteJ7A=;
	b=LduMIvKsiyfG1Ta+w+L86vOySHxXDbhXeZuGpZIG8z5iO2x4tNxwl+an5z2VI7nbsvsvhJ
	PR89o4sn7nx9+QIXdUdVmAkEKYT4Ix05vfkMKmnDi29qN38pNIqDqCgmZwZF+FAmV8EypY
	9LFNPL6Ln73IIOaGskzqAOLtlPql0JU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689767018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=D7k0jAiof48Gr3Y20c1akB3ktrrFyapC002SOgteJ7A=;
	b=jVPLnwKEQIxTBPdstFeM4LdulqQJr40rMTMb+u4Pu5RCMApGwPUY4fZj2bOBp+dPmrxb4G
	UGeGG8DJpCbqBtCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3763513460;
	Wed, 19 Jul 2023 11:43:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2qYBDWrMt2QnagAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 11:43:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: [PATCH] selftests: ALSA: Add test-pcmtest-driver to .gitignore
Date: Wed, 19 Jul 2023 13:43:36 +0200
Message-Id: <20230719114336.18409-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L42QLR7GGF4RYXRCPCAPQTHQU2AA3N5Z
X-Message-ID-Hash: L42QLR7GGF4RYXRCPCAPQTHQU2AA3N5Z
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L42QLR7GGF4RYXRCPCAPQTHQU2AA3N5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It was forgotten to add the new binary to .gitignore.  Let's fix it.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 tools/testing/selftests/alsa/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/alsa/.gitignore b/tools/testing/selftests/alsa/.gitignore
index 2b0d11797f25..12dc3fcd3456 100644
--- a/tools/testing/selftests/alsa/.gitignore
+++ b/tools/testing/selftests/alsa/.gitignore
@@ -1,2 +1,3 @@
 mixer-test
 pcm-test
+test-pcmtest-driver
-- 
2.35.3

