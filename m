Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D34162B7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Sep 2021 18:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3153315F2;
	Thu, 23 Sep 2021 18:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3153315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632413143;
	bh=HKJ62ec0H3rRqwouVaEOlCdmeDwscUCB9fggww1qtqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PXgDjvI6KGs+HLGu+ogyb02EuqupHJ56Nr4XheJmZDNFdIsrrWRGF5p9BjFAu2G3c
	 jMJyckfxmP7rOUuIaRUNk+6PqgZ8+pZMBWFuCGeJz10/GnoLzahqndtc1GBi4kkO4D
	 7JzPTfzvkcebfY0RF19kHkNl91DHkObA6fxtl9mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B244F8026A;
	Thu, 23 Sep 2021 18:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3078F80268; Thu, 23 Sep 2021 18:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 039C8F8013F
 for <alsa-devel@alsa-project.org>; Thu, 23 Sep 2021 18:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039C8F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="S9Sw4KaT"; 
 dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="qLgcomT0"
Message-ID: <20210923153311.225307347@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1632413059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HKJ62ec0H3rRqwouVaEOlCdmeDwscUCB9fggww1qtqs=;
 b=S9Sw4KaTyb9s7Z3KdYbFaJAvUzjpHUVpUTxvyQ3jFIhlWRMGgqgxLk8/cDw3/6XKvUpZZp
 dhPkgsAfepaag4dai3tsQG8H1SEb6OcdSZOt4ZOJ+L5fXItf38KOz+VqvC3n7RURS0RvCQ
 AOymsMXCjVfXsiR5+QYlShryPPOPagMf/WTMdP3bCxY4nDARQHkLdyUfBjfybnlnp7aDF4
 +1FziWh42JVQop5OoCpYLsWFXx4DjgT4Pae3ReQR206O4iu4W5dBMixmm0/zU/iKuBBxQg
 Lzba969dREamrSViMjsujMdwDyfjxU3YaUi5eaDsZEB1EpwUfhtSN4rB5GULJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1632413059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HKJ62ec0H3rRqwouVaEOlCdmeDwscUCB9fggww1qtqs=;
 b=qLgcomT0elm/TlKSiEwnkZ3rD3NJKvPZV3pfy2RnYzqCkiviMbALY7urqFmSkwiw4ven3n
 7eMZvc1fRymbs4Dw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 00/11] hrtimers: Cleanup hrtimer_forward() [ab]use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 23 Sep 2021 18:04:18 +0200 (CEST)
Cc: alsa-devel@alsa-project.org, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Intel Corporation <linuxwwan@intel.com>,
 David Airlie <airlied@linux.ie>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Loic Poulain <loic.poulain@linaro.org>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Daniel Vetter <daniel@ffwll.ch>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 M Chetan Kumar <m.chetan.kumar@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QSByZWNlbnQgc3l6Ym90IHJlcG9ydCB1bmVhcnRoZWQgYWJ1c2Ugb2YgaHJ0aW1lcl9mb3J3YXJk
KCkgd2hpY2ggY2FuIGNhdXNlCnJ1bmF3YXkgdGltZXJzIGhvZ2dpbmcgdGhlIENQVSBpbiB0aW1l
ciBleHBpcnkgY29udGV4dCBieSByZWFybWluZyB0aGUKdGltZXIgaW4gdGhlIHBhc3Qgb3ZlciBh
bmQgb3Zlci4KClRoaXMgaGFwcGVucyB3aGVuIHRoZSBjYWxsZXIgdXNlcyB0aW1lci0+ZXhwaXJ5
IGZvciB0aGUgJ25vdycgYXJndW1lbnQgb2YKaHJ0aW1lcl9mb3J3YXJkKCkuIFRoYXQgd29ya3Mg
YXMgbG9uZyBhcyB0aGUgdGltZXIgZXhwaXJ5IGlzIG9uIHRpbWUsIGJ1dApjYW4gY2F1c2UgYSBs
b25nIHBlcmlvZCBvZiByZWFybS9maXJlIGxvb3BzIHdoaWNoIGhvZyB0aGUgQ1BVLiBFeHBpcmlu
ZwpsYXRlIGNhbiBoYXZlIHZhcmlvdXMgY2F1c2VzLCBidXQgb2J2aW91c2x5IHZpcnR1YWxpemF0
aW9uIGlzIHByb25lIHRvIHRoYXQKZHVlIHRvIFZDUFUgc2NoZWR1bGluZy4KClRoZSBjb3JyZWN0
IHVzYWdlIG9mIGhydGltZXJfZm9yd2FyZCgpIGlzIHRvIGhhbmQgdGhlIGN1cnJlbnQgdGltZSB0
byB0aGUKJ25vdycgYXJndW1lbnQgd2hpY2ggZW5zdXJlcyB0aGF0IHRoZSBuZXh0IGV2ZW50IG9u
IHRoZSBwZXJpb2RpYyB0aW1lIGxpbmUKaXMgcGFzdCBub3cuIFRoaXMgaXMgd2hhdCBocnRpbWVy
X2ZvcndhcmRfbm93KCkgcHJvdmlkZXMuCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhZGRyZXNzZXMg
dGhpczoKCiAgICAxKSBBZGQgYSBkZWJ1ZyBtZWNoYW5pc20gdG8gdGhlIGhydGltZXIgZXhwaXJ5
IGxvb3AKCiAgICAyKSBDb252ZXJ0IGFsbCBocnRpbWVyX2ZvcndhcmQoKSB1c2FnZSBvdXRzaWRl
IG9mIGtlcm5lbC90aW1lLyB0bwogICAgICAgdXNlIGhydGltZXJfZm9yd2FyZF9ub3coKS4KCiAg
ICAzKSBDb25maW5lIGhydGltZXJfZm9yd2FyZCgpIHRvIGtlcm5lbC90aW1lLyBjb3JlIGNvZGUu
CgpUaGUgbWFjODAyMTFfaHdzaW0gcGF0Y2ggaGFzIGFscmVhZHkgYmVlbiBwaWNrZWQgdXAgYnkg
dGhlIHdpcmVsZXNzCm1haW50YWluZXIgYW5kIGFsbCBvdGhlciBwYXRjaGVzIHdoaWNoIGFmZmVj
dCB1c2FnZSBvdXRzaWRlIHRoZSBjb3JlIGNvZGUKY2FuIGJlIHBpY2tlZCB1cCBieSB0aGUgcmVs
ZXZhbnQgc3Vic3lzdGVtcy4gSWYgYSBtYWludGFpbmVyIHdhbnRzIG1lIHRvCnBpY2sgYSBwYXJ0
aWN1bGFyIHBhdGNoIHVwLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGUgbGFzdCBwYXRjaCB3aGlj
aCBjb25maW5lcyBocnRpbWVyX2ZvcndhcmQoKSB3aWxsIGJlIHBvc3Rwb25lZCB1bnRpbCBhbGwK
b3RoZXIgcGF0Y2hlcyBoYXZlIGJlZW4gbWVyZ2VkIGludG8gTGludXMgdHJlZS4KClRoZSBzZXJp
ZXMgaXMgYWxzbyBhdmFpbGFibGUgZnJvbSBnaXQ6CgogICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RnbHgvZGV2ZWwuZ2l0IGhydGltZXIKClRoYW5rcywK
Cgl0Z2x4Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wbXUuYyAgICAgICAgfCAgICAy
IC0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21hYzgwMjExX2h3c2ltLmMgIHwgICAgNCArLQogZHJp
dmVycy9uZXQvd3dhbi9pb3NtL2lvc21faXBjX2ltZW0uYyAgfCAgICA0ICstCiBkcml2ZXJzL3Bv
d2VyL3Jlc2V0L2x0YzI5NTItcG93ZXJvZmYuYyB8ICAgIDQgLS0KIGluY2x1ZGUvbGludXgvaHJ0
aW1lci5oICAgICAgICAgICAgICAgIHwgICAyNiAtLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS9s
aW51eC9wb3NpeC10aW1lcnMuaCAgICAgICAgICAgfCAgICAzICsrCiBrZXJuZWwvc2lnbmFsLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTQgKy0tLS0tLS0tCiBrZXJuZWwvdGltZS9ocnRp
bWVyLmMgICAgICAgICAgICAgICAgICB8ICAgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystCiBrZXJuZWwvdGltZS9pdGltZXIuYyAgICAgICAgICAgICAgICAgICB8ICAgMTMgKysr
KysrKysKIGtlcm5lbC90aW1lL3Bvc2l4LXRpbWVycy5jICAgICAgICAgICAgIHwgICA0MiArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiBrZXJuZWwvdGltZS90aWNrLWludGVybmFsLmggICAg
ICAgICAgICB8ICAgIDEgCiBuZXQvY2FuL2JjbS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDIgLQogc291bmQvZHJpdmVycy9wY3NwL3Bjc3BfbGliLmMgICAgICAgICAgfCAgICAyIC0K
IDEzIGZpbGVzIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKyksIDczIGRlbGV0aW9ucygtKQoK
