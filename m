Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED5F1746
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 14:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2245A1697;
	Wed,  6 Nov 2019 14:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2245A1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573047456;
	bh=dWfQyyWO+IjQZWU6qxgiszlypQsY4kpSghCwAiU86dU=;
	h=Date:In-Reply-To:From:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EdhgysDZsxLzp2ZBlFROf+gzUuwTVbhUWwqr3HiGeUaQMFaedWDGQqYXuLVAJ4wWJ
	 EzYAkd/wHJtQFgDjrpGmfQRU4B3DDQXgIiZzb3T8WgbrLNTS9DX3iQahs4DiXZgRmv
	 vmjG7rgK6eS9Ez4k6LZOyXHEXfWFZSf3+2g09W8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40658F8060F;
	Wed,  6 Nov 2019 14:35:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 926D2F803F4; Wed,  6 Nov 2019 13:05:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBCCCF8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 13:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCCCF8015B
Received: by mail-io1-f69.google.com with SMTP id l22so17892838iob.6
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 04:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:content-transfer-encoding;
 bh=aKg1YSdsDPM3kPA3fqKhhycFO79pL2xKpjm55teHNCY=;
 b=iWEESW7eL1pjNl98JfW3axurnt4NUInINZTQ1yo8B68D4Rak+Xy0vIuASlwf+1WyVN
 LcwjJc8POBjcqkwupEhTML1Srafbkm8/EJFJ6IupXUJ48HIzqxRZGjjLmh1iHWal7eku
 W8bRynYjXk2ya3OIMHfT19eRWvm1hZ9ZL8uO7GtEix+5x9WlDLeHG1foU7YPzSEl/L5R
 b2hYs306ZfwYg5xTGIkPP1vkNiehIr7lgYs2mvCe7rBqC9Rwftgc8+Px1iv0d0EMP5yp
 wZ9X3VQJMS5UfyhKL7jRlkQgGlgtsl/u+2kl3K5G6XVYcR8im/rjIB7Ja+TNJzee8FqK
 mE/Q==
X-Gm-Message-State: APjAAAVq/RorMJbwqXEtMI9R4t8XqwM15fMOobi5HuIujEEOU3VHPwCj
 w0HxIEs04/d8RN4+hNmhPE5MtxZrTgAfcIIiQX65EVMHx9iC
X-Google-Smtp-Source: APXvYqxbEDmuTSe9QWi+sDEkhFWu6TGHEN2DzY5XjJ94jH89o5JRK0ApeKbFTZF7NhYFevjVQa7JVfPLI6AvXEUrFUaAbBj8u9hQ
MIME-Version: 1.0
X-Received: by 2002:a92:1613:: with SMTP id r19mr1645229ill.10.1573041900998; 
 Wed, 06 Nov 2019 04:05:00 -0800 (PST)
Date: Wed, 06 Nov 2019 04:05:00 -0800
In-Reply-To: <0000000000004dfaf005969d1755@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b9dd9c0596ac5b94@google.com>
From: syzbot <syzbot+f1048ebddb93befb085f@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, alsa-devel-owner@alsa-project.org, 
 alsa-devel@alsa-project.org, bhelgaas@google.com, broonie@kernel.org, 
 kirr@nexedi.com, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
 lkundrak@v3.sk, maxime.ripard@bootlin.com, perex@perex.cz, 
 peron.clem@gmail.com, robh@kernel.org, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com, tiwai@suse.de
X-Mailman-Approved-At: Wed, 06 Nov 2019 14:35:01 +0100
Subject: Re: [alsa-devel] INFO: task hung in snd_timer_close
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoNCg0KY29tbWl0IGIyMDQ1MzAzMTQ3MjU0
ZDAxYjFkYjkwYTgzZTVkZjM4MzJjNDI2NGINCkF1dGhvcjogQ2zDqW1lbnQgUMOpcm9uIDxwZXJv
bi5jbGVtQGdtYWlsLmNvbT4NCkRhdGU6ICAgTW9uIE1heSAyNyAyMDowNjoyMSAyMDE5ICswMDAw
DQoNCiAgICAgZHQtYmluZGluZ3M6IHNvdW5kOiBzdW40aS1zcGRpZjogQWRkIEFsbHdpbm5lciBI
NiBjb21wYXRpYmxlDQoNCmJpc2VjdGlvbiBsb2c6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L2Jpc2VjdC50eHQ/eD0xNGFjZWNiNGUwMDAwMA0Kc3RhcnQgY29tbWl0OiAgIGE5OWQ4
MDgwIExpbnV4IDUuNC1yYzYNCmdpdCB0cmVlOiAgICAgICB1cHN0cmVhbQ0KZmluYWwgY3Jhc2g6
ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE2YWNlY2I0
ZTAwMDAwDQpjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9s
b2cudHh0P3g9MTJhY2VjYjRlMDAwMDANCmtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD04YzVlMmVjYTNmMzFmOWJmDQpkYXNoYm9hcmQgbGlu
azogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWYxMDQ4ZWJkZGI5M2Jl
ZmIwODVmDQpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9y
ZXByby5zeXo/eD0xMjZiYzY1OGUwMDAwMA0KDQpSZXBvcnRlZC1ieTogc3l6Ym90K2YxMDQ4ZWJk
ZGI5M2JlZmIwODVmQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20NCkZpeGVzOiBiMjA0NTMwMzE0
NzIgKCJkdC1iaW5kaW5nczogc291bmQ6IHN1bjRpLXNwZGlmOiBBZGQgQWxsd2lubmVyIEg2ICAN
CmNvbXBhdGlibGUiKQ0KDQpGb3IgaW5mb3JtYXRpb24gYWJvdXQgYmlzZWN0aW9uIHByb2Nlc3Mg
c2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
