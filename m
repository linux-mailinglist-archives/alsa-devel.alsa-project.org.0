Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBE77A5B9
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 11:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04C874C;
	Sun, 13 Aug 2023 11:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04C874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691917454;
	bh=U81i57m015UzoD+TdPgAJg0ZBeIzHy4rgAfpheajBO0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Rm4xVDL1voBry7BU+CrC0Se6Aqvp12fYmVt5yCI9ehTLnY+I+gIfCbHpQ2v3gndk2
	 Qdi5KTPfhhplcdxN6n9G7cjhl16SQvyyKbBOfBWU46Q+lvjy+cbTTS7Y5XJi91QJri
	 elqYBBz2WH7U3ePe0PzOjJ5CZC4CsVCT7uUEK2NM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A2A3F80510; Sun, 13 Aug 2023 11:03:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D47F80254;
	Sun, 13 Aug 2023 11:03:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59465F8025F; Sun, 13 Aug 2023 11:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE71F80016
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 11:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE71F80016
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691917389619487524-webhooks-bot@alsa-project.org>
References: <1691917389619487524-webhooks-bot@alsa-project.org>
Subject: "alsactl restore" does not load the driver state
Message-Id: <20230813090318.59465F8025F@alsa1.perex.cz>
Date: Sun, 13 Aug 2023 11:03:18 +0200 (CEST)
Message-ID-Hash: I3BF2LZAMLAOBD6L2CUKAFQK3LBYSCDR
X-Message-ID-Hash: I3BF2LZAMLAOBD6L2CUKAFQK3LBYSCDR
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3BF2LZAMLAOBD6L2CUKAFQK3LBYSCDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #229 was opened from YuGiOhJCJ:

Hello,

When I type "alsactl restore", it does not load the driver state.

Steps to reproduce:
1. Open a first terminal dedicated to alsa-mixer
2. Open a second terminal where you will type the following commands
3. In the first terminal, press F4, set the audio volume for capture to 40
4. In the second terminal, type "sudo alsactl store" in order to save the driver state to /var/lib/alsa/asound.state
5. In the first terminal, set the audio volume for capture to 35
6. In the second terminal, type "sudo alsactl restore" in order to load the driver state to /var/lib/alsa/asound.state

Expected results: I should see in the first terminal that the audio volume for capture is restored to 40.

Current results: I see in the first terminal that the audio volume for capture is not restored to 40. It is still set to 35!

How to fix that please?

Thank you.
Best regards.

About my system:

Packages:
- alsa-lib-1.2.9
- alsa-plugins-1.2.7.1
- alsa-utils-1.2.9

Operating system: Slackware 14.2 (64-bit)

Architecture: x86_64

Kernel: Linux 5.18.10

![image](https://github.com/alsa-project/alsa-utils/assets/2247896/d4cc947f-b8db-493f-bf03-f18af9c821b3)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/229
Repository URL: https://github.com/alsa-project/alsa-utils
