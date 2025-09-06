Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BCB46AB7
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Sep 2025 11:56:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D80C601FD;
	Sat,  6 Sep 2025 11:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D80C601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757152601;
	bh=qzLM3sh7Gdha4OVg5x9ntk3dC00W+Z8qXgGqq4lc4QM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p7AwDuCpmTrbTYXbUs/KBo/I2xuG2WVYDuxgRBK3YG2JbnFOuhAa3ceT5j/mRRCX6
	 wXBCfrDE1X3plBzu4subJhqb9YCMar9DEhf7agu0okcvm9kae49AWcFC7Rw+2nDtaA
	 VUqLEYx6mzh6Mej5SC6qVaRj7P35CwqhkAoRWfM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 901EEF805D4; Sat,  6 Sep 2025 11:56:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA53F805C3;
	Sat,  6 Sep 2025 11:56:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7913AF80495; Sat,  6 Sep 2025 11:55:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF16F8010B
	for <alsa-devel@alsa-project.org>; Sat,  6 Sep 2025 11:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF16F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1862a8f06614cc00-webhooks-bot@alsa-project.org>
In-Reply-To: <1862a8f0602d8900-webhooks-bot@alsa-project.org>
References: <1862a8f0602d8900-webhooks-bot@alsa-project.org>
Subject: No sound, only dummy output since updating alsa-lib to 1.2.14
Date: Sat,  6 Sep 2025 11:55:58 +0200 (CEST)
Message-ID-Hash: RCMO3IOV7Z4AOGHY476EOYR5TVZFTVOQ
X-Message-ID-Hash: RCMO3IOV7Z4AOGHY476EOYR5TVZFTVOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCMO3IOV7Z4AOGHY476EOYR5TVZFTVOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #475 was opened from aaaaadrien:

Hello,

Since an update on Fedora Linux 42, Audio card not detected, GNOME only shows "Dummy Output".
No sound over speakers or HDMI.
I downgraded the package alsa-lib (from alsa-lib-0:1.2.14-3.fc42.x86_64 to alsa-lib-0:1.2.13-4.fc42.x86_64) and now i have sound again.
Tested with OpenSuse Tumbleweed Live ISO GNOME, with libasound2-1.2.14, i reproduce the issue.

So i think it's not a distro issue but an ALSA Issue. That's why i open a bug here.

Laptop model : Dell Latitude 3510
Audio Device : Intel Comet Lake PCH-LP cAVS
driver: sof-audio-pci-intel-cnl
API: ALSA 
version: k6.16.4-200.fc42.x86_64 
status: kernel-api

Reproducible: Always

Steps to Reproduce:
1. Update alsa-lib to 1.2.14-3.fc42.x86_64
2. Reboot
3. See you only have dummy output

Actual Results:
No sound

Expected Results:
Sound always here !

Additional Information:
Laptop model : Dell Latitude 3510
Audio Device : Intel Comet Lake PCH-LP cAVS
driver: sof-audio-pci-intel-cnl
API: ALSA 
version: k6.16.4-200.fc42.x86_64 
status: kernel-api

I opened a bug on Red Hat bugzilla yesterday but i enclose the link if you want to see the commands and checks i tested : https://bugzilla.redhat.com/show_bug.cgi?id=2393552

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/475
Repository URL: https://github.com/alsa-project/alsa-lib
