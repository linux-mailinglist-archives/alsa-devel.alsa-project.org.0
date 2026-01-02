Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BBACEE78C
	for <lists+alsa-devel@lfdr.de>; Fri, 02 Jan 2026 13:14:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36FD56017E;
	Fri,  2 Jan 2026 13:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36FD56017E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767356067;
	bh=oTZFXvm4SeykKOn+uHkur9ln2AuSOhSdCo6pL5c/hFA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VtnVU6YYy+wZnPbuaWiC3hZY7DlgU0gOFqFNPJgoI1+21cTVdUspF8GJ4AwS2aXa8
	 ztVQ99aspk2LP7kAVYh9i04n8e8zquyZkwrcakh3rUkXDzHshjuer+4332+J7/79V9
	 cBpWwnE/iAEMM7iIc3AXC0A2WJsqRq5PgIOVnMyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C705F805D2; Fri,  2 Jan 2026 13:13:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCED1F805D9;
	Fri,  2 Jan 2026 13:13:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8C7F8032D; Fri,  2 Jan 2026 13:12:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 97566F80086
	for <alsa-devel@alsa-project.org>; Fri,  2 Jan 2026 13:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97566F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1886e8df29d02a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/671@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/671@alsa-project.org>
Subject: Remove outdated DisableSequence elements
Date: Fri,  2 Jan 2026 13:12:31 +0100 (CET)
Message-ID-Hash: F3CKOYHF5TJQQEX7BIUMVVCYP3A4T2VJ
X-Message-ID-Hash: F3CKOYHF5TJQQEX7BIUMVVCYP3A4T2VJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3CKOYHF5TJQQEX7BIUMVVCYP3A4T2VJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #671 was opened from mstrozek:

cs42l43's 'Headset Microphone' and 'Microphone' devices were both used
to control mic mute LED in the past, but this was changed [1] to only
allow the built-in microphones to control the LED. Thus clean up the
DisableSequences to remove the switching off that is no longer needed.
Also, cs42l45 had those Sequences copied over from cs42l43, so remove 
them here as well.

[1]: https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/common/ctl/led.conf

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/671
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/671.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
