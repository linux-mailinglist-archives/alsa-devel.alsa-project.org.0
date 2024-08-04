Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70042946E49
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2024 12:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5A24828;
	Sun,  4 Aug 2024 12:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5A24828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722766781;
	bh=PL/1DnSYl9TaYtPOKFyTEimnNlOgZV9PF1X4W7zUZ/0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IiciKQM+aOYlrYJeP2OOFx2nE2Oi6nCZeaBYbT33OSyLSnn/ag5Ruhb8gYvmE2vct
	 sw+wAxzOiDqV0cXZrhDC7oXofI1ZSJ0zUUzOiTWHnbz1D8JITzpn6hiR9W1ps2FBU9
	 L5yxc+o57iCbvE6kb2u4wDP4nFfDBoeVqK9Pavz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF5B9F805D6; Sun,  4 Aug 2024 12:19:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBEBF805D6;
	Sun,  4 Aug 2024 12:19:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3C2DF80448; Sun,  4 Aug 2024 12:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C0EC6F800E3
	for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2024 12:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0EC6F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722766527728527308-webhooks-bot@alsa-project.org>
References: <1722766527728527308-webhooks-bot@alsa-project.org>
Subject: a52 plugin Unknown field card error
Message-Id: <20240804101529.A3C2DF80448@alsa1.perex.cz>
Date: Sun,  4 Aug 2024 12:15:29 +0200 (CEST)
Message-ID-Hash: OCP22QGLWUUTZGD7T2BQXD7QM65T5VZF
X-Message-ID-Hash: OCP22QGLWUUTZGD7T2BQXD7QM65T5VZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCP22QGLWUUTZGD7T2BQXD7QM65T5VZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #405 was edited from DocMAX:

```
pcm.a52 {
  @args [CARD]
  @args.CARD {
    type string
  }
  type rate
  slave {
    pcm {
      type a52
      bitrate 448
      channels 6
      card $CARD
    }
    rate 48000
  }
}

a52:CARD=Adapter
    USB SPDIF Adapter
    Plugin to convert multichannel stream to A52 (AC3) bitstream

[root@desktop ~]# speaker-test -c6 -Da52

speaker-test 1.2.12

Playback device is a52
Stream parameters are 48000Hz, S16_LE, 6 channels
Using 16 octaves of pink noise
ALSA lib pcm_rate.c:1701:(_snd_pcm_rate_open) Unknown field card
Playback open error: -22,Invalid argument
```
how to fix this error?
running arch linux all updated

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/405
Repository URL: https://github.com/alsa-project/alsa-lib
