Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BEABF9BF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 May 2025 17:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72EF601E1;
	Wed, 21 May 2025 17:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72EF601E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747842265;
	bh=5j3oTgh0mBfCWVDgXw+mjH5H06sG3RYDKsCavItnPXg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kr3RSIS9OTheO6wdBAeU+cGmaugCQEAPo0cjXQvgeMCF9JIdiN+s1SUVl56pvsouP
	 d5FC3wXb6vStCj7I65fJ9BoYLyVsDwJ8t50uOcDCe1Of8CYtxucz7Q40pzBjz1Op5K
	 h8Sffh/JQKzIrWrJgPJw6BDIux1X3468zbXwBE00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52CD1F805A9; Wed, 21 May 2025 17:43:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F72F801F7;
	Wed, 21 May 2025 17:43:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB78F80553; Wed, 21 May 2025 17:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5B9F800C1
	for <alsa-devel@alsa-project.org>; Wed, 21 May 2025 17:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5B9F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1841953e88356800-webhooks-bot@alsa-project.org>
In-Reply-To: <1841953e882fb500-webhooks-bot@alsa-project.org>
References: <1841953e882fb500-webhooks-bot@alsa-project.org>
Subject: Behringer UMC404HD volume low,
 "cannot load mixer controls: No such file or directory",
 and erroneously remapped channels
Date: Wed, 21 May 2025 17:43:48 +0200 (CEST)
Message-ID-Hash: WXPI4JR6PFBD3RCN7FAVCGJORV7PQJGN
X-Message-ID-Hash: WXPI4JR6PFBD3RCN7FAVCGJORV7PQJGN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXPI4JR6PFBD3RCN7FAVCGJORV7PQJGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #564 was opened from mikelpr:

alright so this is a weird one: I've got a fedora install and two openSUSE installs, one older but dist upgraded to today and a newer one, also dist upgraded to today, and the fedora is updated too.

now, on the fedora install and the newer openSUSE install the volume on my UMC404HD does not reach what is 100% on the older suse install and on Windows. it's more like 50%. I've tried using alsamixer but it fails when selecting the soundcard with `cannot load mixer controls: No such file or directory`. possibly noteworthy is that I share home dir on the suse installs so it's not user config. I also did a diff on /etc between both installs and could find nothing that seemed out of the ordinary.

also, at some point an update was pushed that remapped channels from FL FR RL RR to Line A and Line B, two channels each, and on the Direct profile to FL FC FR LFE. I've got no strong opinions on the Line A/B split on the default profile but definitely FL FC FR LFE is wrong for this card.

please lmk what data to gather

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/564
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
