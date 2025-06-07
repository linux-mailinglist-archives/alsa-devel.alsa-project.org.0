Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47417AD0D70
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jun 2025 14:32:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FCAF601F8;
	Sat,  7 Jun 2025 14:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FCAF601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749299551;
	bh=j6uTQBtOgf42Pn2As/vxfhmsj+XzmL7hf7u7ZYhrmrU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tWMfgxsFWKfIIrcXCZ9XmOMrCJaQRk7rdDFpVekAbgTVXdG2j9TXbnRTU5WF+WJ1G
	 SPYbRpo/+ePcNUEOI3VKLAU6Cwzc2AdKTX1RWvF5skPW2GHTRkg3Sxk8gERz1EeKYh
	 S9E/os3a9X7eelFq95i9eIA83Di+j1/Hazu6+eqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B080F805C4; Sat,  7 Jun 2025 14:31:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADA0F805B4;
	Sat,  7 Jun 2025 14:31:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5375F80212; Sat,  7 Jun 2025 14:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B701F800D2
	for <alsa-devel@alsa-project.org>; Sat,  7 Jun 2025 14:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B701F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1846c2a337b82500-webhooks-bot@alsa-project.org>
In-Reply-To: <1846c2a337a1e700-webhooks-bot@alsa-project.org>
References: <1846c2a337a1e700-webhooks-bot@alsa-project.org>
Subject: SSL BigSix support
Date: Sat,  7 Jun 2025 14:31:53 +0200 (CEST)
Message-ID-Hash: RGZL2IQP2XJA2P22FWPUK4UN3ICGQ4DH
X-Message-ID-Hash: RGZL2IQP2XJA2P22FWPUK4UN3ICGQ4DH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGZL2IQP2XJA2P22FWPUK4UN3ICGQ4DH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #575 was opened from melonexe:

The SSL BigSix doesn't seem to have a UCM as far as I can see, I've tried to follow the example set by the other devices but I can't seem to get the syntax right according to the output of: 

 alsaucm -c hw:2 dump text

ALSA lib parser.c:2021:(parse_master_file) Incompatible syntax 6 in USB-Audio.conf
ALSA lib main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:2 use case configuration -22
alsaucm: error failed to open sound card hw:2: Invalid argument

I have included what I have done so far, if you could point me in the right direction to resolving the above error I would be extremely grateful. Thanks for your work on this project.

The SSL Big six is a 16 in 16 out Class compliant audio interface https://solidstatelogic.com/products/big-six?tab=documentsanddownloads

[GH comments.tar.gz](https://github.com/user-attachments/files/20638642/GH.comments.tar.gz)

Thanks

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/575
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
