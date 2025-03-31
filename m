Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37668A76F7F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Mar 2025 22:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2697B601FD;
	Mon, 31 Mar 2025 22:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2697B601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743453676;
	bh=DkOJkAJjPbLtcp6Ja8VjPzB1IWZLjlJMBB0Jk7+Zu3E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rt6ELNgoF/gBHmqDwJ0zxfxyxdgXuuZ3OxAjNPt/QR4phsIAUwKw1pIF1b8+UL+wS
	 A5txHwA3LLoYmHebYAS+e3/aJ2o4r8iDZsIuUD9FCD6xdJE5umsehx+IIgSpk7tFPL
	 /gRx4HOs57Nr7aAYOywW5oCVgQMsPZZIGf4ge+Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3195BF805B6; Mon, 31 Mar 2025 22:40:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18964F805BA;
	Mon, 31 Mar 2025 22:40:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27BA8F8013D; Mon, 31 Mar 2025 22:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABD5F80095
	for <alsa-devel@alsa-project.org>; Mon, 31 Mar 2025 22:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABD5F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1831fddaa08fb500-webhooks-bot@alsa-project.org>
In-Reply-To: <1831fddaa087b800-webhooks-bot@alsa-project.org>
References: <1831fddaa087b800-webhooks-bot@alsa-project.org>
Subject: Difference in behaviour between physical devices and virtual
 endpoints
Date: Mon, 31 Mar 2025 22:40:49 +0200 (CEST)
Message-ID-Hash: BSEE62BZV62BAMEVLNBDGFBH6CKICLYY
X-Message-ID-Hash: BSEE62BZV62BAMEVLNBDGFBH6CKICLYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSEE62BZV62BAMEVLNBDGFBH6CKICLYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #447 was opened from reuk:

As a disclaimer, there's a good chance this is user error/misunderstanding rather than a bug, but I'd appreciate any insights to help me understand the behaviour I'm seeing.

# Environment

- Fedora 41 x86_64
- alsa-lib-devel-1.2.13-3

# Steps

- Run `aseqdump -u 1` in a terminal
- Connect ProtoZOA hardware via USB
- Launch QjackCtl -> Graph, then connect the ProtoZOA's MIDI 2.0 output port (0) to `aseqdump`'s input port.

<img width="535" alt="Image" src="https://github.com/user-attachments/assets/17bf6a74-f83d-41b4-afc6-05413a7ab0a9" />

- Observe that `aseqdump` reports a new subscription from `24:0 -> 128:0` (the client IDs may vary, the important thing is that the subscription is between to ports with ID `0`).
- Move one of the controllers on the ProtoZOA. Observe that `aseqdump` reports channel voice events on group 0 with source `24:1`.

<img width="502" alt="Image" src="https://github.com/user-attachments/assets/2dfc5929-123f-4e33-abbb-ea0c2635c730" />

- Connect `aseqdump` to port `1:Group 1 (FB1, FB2)`, and interact with the ProtoZOA. Observe that `aseqdump` still reports channel voice events on group 0 with source `24:1`.
- Now, build and run the [seq-ump-example](https://github.com/alsa-project/alsa-lib/blob/master/test/seq-ump-example.c).
- Connect the ProtoZOA to the ACMESynth input, and the ACMESynth output to `aseqdump` as shown. Observe that `aseqdump` does **not** report channel voice events when interacting with the ProtoZOA.

<img width="790" alt="Image" src="https://github.com/user-attachments/assets/71349cd6-14b8-4df9-8ee6-ca1091c2f4f0" />

- Finally, update the connections as shown, so that `aseqdump` is connected to ACMESynth's `1:Group 1 (Filter 1)` output. Observe that `aseqdump` now reports channel voice events with source `128:1` when interacting with the ProtoZOA.

<img width="772" alt="Image" src="https://github.com/user-attachments/assets/57f4e767-b2d6-4156-8514-578851d5ed62" />

# TL;DR

When we subscribe to a USB `MIDI 2.0` port, we receive messages from all of the endpoint's ports. Messages are dispatched to the appropriate port based on the message group.

When we subscribe to a virtual UMP endpoint's `MIDI 2.0` port, this appears to *only* subscribe to that single port, and not to the rest of the ports on the endpoint, so that messages addressed to specific groups get lost.

# Questions

- Is this difference in behaviour between hardware and virtual endpoints intentional?
- What is the "correct" way to subscribe to all UMP events from an endpoint? Should I subscribe just to the `MIDI 2.0` endpoint, or to all ports on the endpoint, or something else?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/447
Repository URL: https://github.com/alsa-project/alsa-lib
