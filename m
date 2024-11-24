Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A79D785C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2024 22:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15B184C;
	Sun, 24 Nov 2024 22:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15B184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732483985;
	bh=mGp/QW4GGJqzYdlj4i4dqEAqtm6KsJCQlGOFIoS+uy4=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uJ0bEFI6oEBGMqk8RJ4rdg02irW0YJkyCMHWNDFtIj/YBWPQTyVeHN5rhEtgf5xx3
	 7YUjS9IE0oX6yjBxKsIuduRVTD4tFVByx91Il6WsKyGbb2Sywhg/xntW3K/l1pd5hP
	 SflOpbrv5h+FXi6hYZDSIgoYl6q9D5AdwB4BjJQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD56F80528; Sun, 24 Nov 2024 22:32:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48253F805C2;
	Sun, 24 Nov 2024 22:32:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15826F80496; Sun, 24 Nov 2024 22:32:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0964DF800F0
	for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2024 22:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0964DF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=glyphic.com header.i=@glyphic.com header.a=rsa-sha256
 header.s=google header.b=H9d+tonz
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53dd8b7796dso2167082e87.1
        for <alsa-devel@alsa-project.org>;
 Sun, 24 Nov 2024 13:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=glyphic.com; s=google; t=1732483884; x=1733088684;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YKeY2UUXWHUTXYRq8c032Y2cPfzGt5wWX6kGK2NTcRM=;
        b=H9d+tonzfWlDSxhlHITQY8mZdxaDqztb51VkCUBjtKHvUXqgvj+cABZy+R7j+7VtGc
         KXgRb3FQkw5uw1peeoumW7bgWjwsXKR9o8zCOjD/twd0dbJu0okLrPmyDRpiOWPWRz29
         ulGuepYYscpzNsjbSgrBhPpUsfBBA82O6i6yrsX3ySeEmXOf6+ErMaCPPZoPvsXDZRYF
         zbHPi71xLLb0G0dh2V6HlIW0ghdSEdY56cIYVE2LE+eOWU+qUIWfWp1Jx9FcsQ19ewur
         pX79n/rWkTursk6VBSvAG7yl8tnHZCJt87aLoFVe0CQZPapfziaJp0ULM68ttHK2YoI8
         koZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732483884; x=1733088684;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKeY2UUXWHUTXYRq8c032Y2cPfzGt5wWX6kGK2NTcRM=;
        b=En0LuDdkXGh6GStVnL0V/vvr0JVNRvEdEoqVtSeq3r0q9JlB9HDiP5O92JjLdfMBEI
         0cqMFgBR+MqTSYXFO3JXZ5jroYlEww+ZU8R+IhIIyZKjG6Hf56lw6oeA+irLN/NBIFO7
         NExpfg5jiqZ+olvAj3xtzSjqEndtvU453MW4XjP6YmaHQ64H+/fZjlxFHgD7F9FSv3y9
         HmFZO2IVxuT221p3hOoQ6Mx6NaLrT2EYqef3NxeEONvI3nP3mEzx7vJTurAzqIFU5L0g
         cjA28Qa3enYPBL2T/ADp7iJvmpFqmuvr/2eDNCKeIUz47KrDOzpe3yHdqW14npqHieuf
         hStQ==
X-Gm-Message-State: AOJu0Yy+uSyo6xna63sxqmXIZi8kbvykCP48TaOZsSizCk5I5wEyDvvy
	m9Z7gddStLbDRrYXLHwCUYD5vc+q0yn2sM0QaulK0UklDPB4cbi7lA3Y81S4WFxdZpQabuS/qZa
	optdWXAN2hiqG4TfkBVqFXlTCymmIcVVyKI5S+Gkv++vdgyRsjXA=
X-Gm-Gg: ASbGnctGPV7fZ+gBnNR2U75CWOTrqTZdyxohJVWxxqPDGO1cHn75gVm++duQbBBtOce
	43EQSarcXR/TZ+aIppUORsNcHlPwVh6c=
X-Google-Smtp-Source: 
 AGHT+IEfGmZ0bwmqq+lPu6JEV5fpUB6MbvlnsT75wHXdTrNRPIlIfwKW4T9pxN9e2cUnRXOu/TRvwxEXHSCdrOMTLHA=
X-Received: by 2002:a05:6512:b1c:b0:53d:db99:c7ca with SMTP id
 2adb3069b0e04-53ddb99e849mr1653482e87.4.1732483884221; Sun, 24 Nov 2024
 13:31:24 -0800 (PST)
MIME-Version: 1.0
From: Mark Lentczner <mark@glyphic.com>
Date: Sun, 24 Nov 2024 13:31:13 -0800
Message-ID: 
 <CAPnksqRok7xGa4bxq9WWimVV=28-7_j628OmrWLS=S0=hzaTHQ@mail.gmail.com>
Subject: kernel snd seq bugs: SND_SEQ_EVENT_CLIENT_CHANGE &
 SND_SEQ_EVENT_PORT_CHANGE
To: alsa-devel@alsa-project.org
Message-ID-Hash: BH6I3RYUSUGVYTJQCD253WLUGDAKYNKH
X-Message-ID-Hash: BH6I3RYUSUGVYTJQCD253WLUGDAKYNKH
X-MailFrom: mark@glyphic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BH6I3RYUSUGVYTJQCD253WLUGDAKYNKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SSdtIHRoZSBhdXRob3Igb2YgYW1pZGltaW5kZXIgLSBhIHV0aWxpdHkgdGhhdCBrZWVwcyB0cmFj
ayBvZiBkZXNpcmVkDQpjb25uZWN0aW9ucyBiZXR3ZWVuIEFMU0EgU2VxIChNSURJKSBwb3J0cy4N
Cg0KSSd2ZSBmb3VuZCBhIGJ1ZyBpbiB0aGUga2VybmVsIHBhcnQgb2YgdGhlIEFMU0EgU2VxdWVu
Y2VyLCBhbmQgYW0gbm90IHN1cmUNCndoZXJlIG9yIGhvdyB0byByZXBvcnQgaXQuDQoNClN1bW1h
cnk6DQpUaGUgZXZlbnRzOg0KKiBTTkRfU0VRX0VWRU5UX0NMSUVOVF9DSEFOR0UgaXMgbmV2ZXIg
c2VudA0KKiBTTkRfU0VRX0VWRU5UX1BPUlRfQ0hBTkdFIGlzIG5vdCBzZW50IG9uIGNvbW1vbiBw
b3J0IGNoYW5nZXMgKG5hbWUgYW5kDQpwb3J0IGluZm8pDQoNCkkgaGF2ZSBhIGxvdCBvZiBkZXRh
aWwgb24gdGhlc2UgYnVncywgd2hhdCBvdGhlciBzb2Z0d2FyZSBjYXVzZXMgdGhlbSB0byBiZQ0K
YSBwcm9ibGVtIChQdXJlRGF0YSksIGFuZCB3aGVyZSB0aGUgbWlzc2luZyBjb2RlIGluIHRoZSBr
ZXJuZWwNCnNvdW5kL2NvcmUvc2VxIGZpbGVzIGlzLg0KDQpCZWZvcmUgSSBkdW1wIGFsbCB0aGUg
ZGV0YWlscyBpbiB0aGlzIGZvcnVtLi4uLiB3aGVyZSBpcyB0aGUgcmlnaHQgcGxhY2UNCmZvciBt
ZSB0byByZXBvcnQgYW5kL29yIGRpc2N1c3MgdGhpcz8NCg0KLSBNYXJrDQo=
