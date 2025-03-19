Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DEA696C2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Mar 2025 18:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7E5602D9;
	Wed, 19 Mar 2025 18:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7E5602D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742406275;
	bh=/GcFSjvHk+T5nKyvJ55AkE7wQIqH7Zs5UB596cUslVU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d9eKIv71AoZm4MGm8MWv69s+grZ4iScy0Nid1Uv0t4XThZQ7S9abJBlPCFym3YbIm
	 1YxF5tB/+C6EtjPvuVATzZ8ECRdOQnkTQP711H/+XZ6PCfc6l+ZBgyGy26k/k6hM8+
	 7ev6+8sTDKLEog7gMrpN5TDyTRhw1JbUdANeEgKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8DA3F805A0; Wed, 19 Mar 2025 18:44:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 728F4F805B3;
	Wed, 19 Mar 2025 18:44:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 251E4F805A0; Wed, 19 Mar 2025 18:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E3CF8001D
	for <alsa-devel@alsa-project.org>; Wed, 19 Mar 2025 18:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E3CF8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182e453a9b4f4400-webhooks-bot@alsa-project.org>
In-Reply-To: <182e453a9b3f8900-webhooks-bot@alsa-project.org>
References: <182e453a9b3f8900-webhooks-bot@alsa-project.org>
Subject: Fiio K7 Pro USB DAC no Alsamixer Volume Level
Date: Wed, 19 Mar 2025 18:43:46 +0100 (CET)
Message-ID-Hash: 3ITWEPZMSFS64AKISUWGOAML5ZN67Q3N
X-Message-ID-Hash: 3ITWEPZMSFS64AKISUWGOAML5ZN67Q3N
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ITWEPZMSFS64AKISUWGOAML5ZN67Q3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #444 was opened from Starfoxfs:

Hi,

i cant set any Volume Level on Fiio K7 Pro USB DAC. Alsamixer says "This Sound Device does not have any controls"

I use Wine with sound-alsa Output directly because of SampleRate for Audio Apps, but Volume is to high and i cant change it.

I can change the Pipewire or Pulse Volumes but this has no effect to the Alsa Volume.

Heres the alsa-info

[alsa-info.txt](https://github.com/user-attachments/files/19347989/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/444
Repository URL: https://github.com/alsa-project/alsa-lib
