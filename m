Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F58FE297
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 11:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867B8845;
	Thu,  6 Jun 2024 11:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867B8845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717665955;
	bh=UU+Z4ko3OCYQnQRIwrwwfFabbCftg3SRQTV3WWiA4uo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QxcOLvdSH9MTD8ULZv3EAmedbAgBn07JbSb5o0sf1SL+iKVE22jgaVd8L59z3LtDv
	 8aX2MTeLwqEF0s8251ECmOJTqjTfp2bwjhbgyr5uCkP12pnNtJ71zwfTD7buN4/FmO
	 1KL8lQDvKBglMdZ+fWrrLFlQJUgVMxKE9wWpaBzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD68F805AA; Thu,  6 Jun 2024 11:25:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C68E8F805A1;
	Thu,  6 Jun 2024 11:25:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F184F8025A; Thu,  6 Jun 2024 11:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CB7F80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 11:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83CB7F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1717665927301321983-webhooks-bot@alsa-project.org>
References: <1717665927301321983-webhooks-bot@alsa-project.org>
Subject: Onboard Speaker does not work and Internal Mic (DMIC) isn't detected
 on Dell Latitude 7350 Detachable
Message-Id: <20240606092530.4F184F8025A@alsa1.perex.cz>
Date: Thu,  6 Jun 2024 11:25:30 +0200 (CEST)
Message-ID-Hash: MFUUPDMHHDMKAFQ4NCIORV6WFVISFLOY
X-Message-ID-Hash: MFUUPDMHHDMKAFQ4NCIORV6WFVISFLOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFUUPDMHHDMKAFQ4NCIORV6WFVISFLOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #424 was opened from DeepHarsora-Dell:

Installed Fedora Rawhide on Dell Latitude 7350 Detachable resulting in no-audio output from onboard speaker and in-built mic (DMIC) can't be detected.

Updated the SUT with the following

1. Topology built rightly.
2. Noticed proper SOF Machine driver in upstream as on v.6.10-rc1, able to load the topology.
3. Updated the UCM2 config files as per [[ALSA_UCM_README]](https://github.com/alsa-project/alsa-ucm-conf/blob/master/README.md)

Below is the error found while alsaucm reload

[linuxengg@fedora ~]$ sudo alsaucm reload
ALSA lib ucm_subs.c:807:(uc_mgr_get_substituted_value) variable '${var:__RegEx}' is not defined in this context!
ALSA lib parser.c:2024:(parse_verb_file) error: /sof-soundwire/HiFi.conf failed to parse device ALSA lib main.c:1554:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -22
alsaucm: error failed to open sound card hw:0: Invalid argument

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/424
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
