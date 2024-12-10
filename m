Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216C9EAC4E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 10:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AA8DEC;
	Tue, 10 Dec 2024 10:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AA8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733823399;
	bh=pSiNmEoUeD01DWGrA9yXlcSi7ybVqnfEr3QDXN4zs7s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MvUbNQ9ct4ipDgkJPeMTW3ku/vH5cy2erkbdUxCBgh4GF62e3DAMt4mpQzsA44toN
	 VCvGFdZ0gCqtpl99WV0gIUeRKoME5V2zTgbRAtpHeX0YH2WKd1HiTD0y+mGibpw2NM
	 IdsnuVEu/1itf0RV3i3ttwsjXWupkBi12DBJzsvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 504FCF805C7; Tue, 10 Dec 2024 10:36:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B460EF805B2;
	Tue, 10 Dec 2024 10:36:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61109F80482; Tue, 10 Dec 2024 10:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AA8F8032D
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 10:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7AA8F8032D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733823362109579086-webhooks-bot@alsa-project.org>
References: <1733823362109579086-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-soundwire: Correct FixedBootSequence for dmic info
Message-Id: <20241210093604.61109F80482@alsa1.perex.cz>
Date: Tue, 10 Dec 2024 10:36:04 +0100 (CET)
Message-ID-Hash: 3XL2MKRPY64D7VCIGHNGIEUVMT7CJS7A
X-Message-ID-Hash: 3XL2MKRPY64D7VCIGHNGIEUVMT7CJS7A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XL2MKRPY64D7VCIGHNGIEUVMT7CJS7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #485 was opened from ujfalusi:

Replace the curly brackets with square brackets.
The curly ones break the FixedBootSequence parsing by resetting the sequence.
If the /var/lib/alsa/card0.conf.d is not present then UCM will fail because all sequences before the dmic is lost, including the card-init:

# alsactl init
alsa-lib main.c:619:(execute_cfgsave) unable to open file '/var/lib/alsa/card0.conf.d/42-sof-hdmi.conf': No such file or directory alsa-lib main.c:2456:(set_fixedboot_user) Unable to execute force boot sequence

The full sequence supposed to be:
card-init
ctl-remap
cs42l43
dmic
hdmi

Fixes: 9fa70add7638 ("sof-hda-dsp,sof-soundwire: add CaptureMicInfoFile fields for dmics")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/485
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/485.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
