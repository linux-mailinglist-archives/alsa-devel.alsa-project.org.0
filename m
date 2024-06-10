Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFEE901BEF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 09:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CBC083E;
	Mon, 10 Jun 2024 09:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CBC083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718004844;
	bh=IuIsFhXL/uDJaCoJygD7MayclCOL9CZ5Pn3YqP+JhIQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uB0Dwiw/x5Xo7zMZQ7t0R5NT+wb0sbjdckuTRXsvjQrKZWW41eXRxRGZF6JDn2HDD
	 5vkPNPiMTA9b8JybKo0EOtyY5PVXPjWgrjhDbvcMnHFgJXGkuXBv701gzRS3fZ1RI9
	 pd5+qawfpMncAlRCPcREAZ8Q5EsxNnOpsPxA9EyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25F34F8059F; Mon, 10 Jun 2024 09:33:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DF5F8028D;
	Mon, 10 Jun 2024 09:33:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49456F8028D; Mon, 10 Jun 2024 09:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD02F80114
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 09:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD02F80114
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1718004783011383772-webhooks-bot@alsa-project.org>
References: <1718004783011383772-webhooks-bot@alsa-project.org>
Subject: Onboard Speaker does not work and Internal Mic (DMIC) isn't detected
 on Dell Latitude 7350 Detachable
Message-Id: <20240610073327.49456F8028D@alsa1.perex.cz>
Date: Mon, 10 Jun 2024 09:33:27 +0200 (CEST)
Message-ID-Hash: 5TLNWPTQG5ZI7U6FKABK4DXVDKQY27TE
X-Message-ID-Hash: 5TLNWPTQG5ZI7U6FKABK4DXVDKQY27TE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TLNWPTQG5ZI7U6FKABK4DXVDKQY27TE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #424 was edited from DeepHarsora-Dell:

Installed Fedora Rawhide on Dell Latitude 7350 Detachable resulting in no-audio output from onboard speaker and in-built mic (DMIC) can't be detected. (SKU - 0x0C64)

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
