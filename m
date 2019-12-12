Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5E11D60D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 19:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3758116EE;
	Thu, 12 Dec 2019 19:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3758116EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576176218;
	bh=R+Kk70/sV0RWbWhAigmFxL9qYDPaRKnrGWCh2vJ6atI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tR8FpV+gCN3H3pVdIVT6OMNKmdj/zqApRNZGpAIEk8fzookwj84uJxeTNHKuaZ0oz
	 mR2tteQ+RVGXj2fEtNug95J5iPJX6PFcIZiMYpCic0qtLyLU8lEd6+JJ+iw/7Vm6Nu
	 eyV6BV1p3YHjN/b97H4fuSkTIOTgVS687bhecCb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF3BF801D8;
	Thu, 12 Dec 2019 19:41:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B30F8020C; Thu, 12 Dec 2019 19:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC2FF800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 19:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC2FF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jNYnQoHT"
Received: by mail-wr1-x444.google.com with SMTP id c14so3860316wrn.7
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
 :references:user-agent:content-transfer-encoding;
 bh=72YajA1rnf1+0GYcRZg+w7DqemoBrj7bzh2eLFUJiCE=;
 b=jNYnQoHT9D/iVwOUAeI1nYXpjIriEoi9Dw5l2o9FH2p/aEb+0YBuSa9axL/yreKfaq
 di+zCTiZj7gbHshdS5Y93GwwfD+rw3u9hwsdKLLlXyPe6zNVmCpaM6zIgdU+T61xCM3c
 QYv9CuD4Q6beHt6nMaR8GNpKLwk7obh9YzSAUv8VeCaG7hmhxaanGMcrSYbV7p9nQtHD
 UVDWO+7uAryoOkuMcvyKqw2rhgfRREpsAwjdP9T4wxgCQygIN5MAaPN0Fb8g/chmATOv
 06WVcz23ABetfzmtG5CA+MjyvkWTR9T0uJgs9jT7ZMiv96jiGpktQluK+X/M1YQ5U8Uh
 YVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
 :in-reply-to:references:user-agent:content-transfer-encoding;
 bh=72YajA1rnf1+0GYcRZg+w7DqemoBrj7bzh2eLFUJiCE=;
 b=f6Qt1KUz/tZr6z5oP72SXT5LY4K1AXedPaxLy/gYw+v0CZX6baEeqztIRZAwIe3rCU
 ico+DLKjcASbQTDOidIxXwNeecjKE+/bQAtb+Gi2GL3iWX5c23Qrn0V6d8+iewfGZnby
 k46biwiBKCNiLEP9vPtNrpFxALRLVYkjcE49oUW11n49E+EXPu6LMuhJl/2M6PLtonxG
 +iKL1tMIFP7jriCEXxNJ0b0tPZ6DPpjlmOPa8GVNBBi6RYe7CZD9fQABphJyFFHxN/Ci
 8FdwPjHMwRimSxbNtr6KIIZtylXtQYfUTnyOodDCNieLGhYfzhhUGz8b9n+1mf/FYM6J
 EmTg==
X-Gm-Message-State: APjAAAXCeerAmZhNjtsb1ja8EqAA2RopA7jCA5SJI608zvtqCTCzS3OM
 0QtWAKJAxosZjC7OXbRYbtg=
X-Google-Smtp-Source: APXvYqx8ZThmxV87EE0UzwxMrK2+QTlXaMc9wq2IkRJkHgaXl++grGfqBwQvYlBMrQV4hI1I2Y1oUw==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr8246259wro.105.1576176108476; 
 Thu, 12 Dec 2019 10:41:48 -0800 (PST)
Received: from localhost ([5.59.90.131])
 by smtp.gmail.com with ESMTPSA id k8sm7056412wrl.3.2019.12.12.10.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 10:41:47 -0800 (PST)
From: Vicente Bergas <vicencb@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 12 Dec 2019 19:41:46 +0100
MIME-Version: 1.0
Message-ID: <8dec2d95-f483-44a9-8223-0f8f3de33238@gmail.com>
In-Reply-To: <5708082a-680f-4107-aaf8-a39d76037d77@gmail.com>
References: <5708082a-680f-4107-aaf8-a39d76037d77@gmail.com>
User-Agent: Trojita
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel]
	=?iso-8859-1?q?WARNING=3A_CPU=3A_3_PID=3A_1_at_=5F?=
	=?iso-8859-1?q?=5Fflush=5Fwork=2Eisra=2E47+0x22c/0x248?=
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVGh1cnNkYXksIERlY2VtYmVyIDEyLCAyMDE5IDEyOjA5OjIxIEFNIENFVCwgVmljZW50ZSBC
ZXJnYXMgd3JvdGU6Cj4gSGksCj4gc2luY2UgdjUuNS1yYzEgZm91ciBlcXVhbCBjb25zZWN1dGl2
ZSB0cmFjZXMgYXBwZWFyZWQgdGhhdCBzZWVtIHJlbGF0ZWQgdG8KPiByb2NrY2hpcCBzb3VuZC4g
QXMgaSB3YXNuJ3Qgc3VyZSB0byB3aG9tIHNlbnQgdGhlIHJlcG9ydCBqdXN0IGFkZGVkCj4gZXZl
cnlib2R5IGZyb20KPiAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgc291bmQvc29jL3JvY2tj
aGlwL3JrMzM5OV9ncnVfc291bmQuYwo+IHdoaWNoIGlzIHRoZSBmaWxlIGNvbnRhaW5nIG9uZSBv
ZiB0aGUgZnVuY3Rpb25zIGluIHRoZSB0cmFjZS4KPgo+IEJ5IHRoZSB3YXksIHNvdW5kIHdvcmtz
IGZpbmUuIEFmdGVyIGFsbCB0cmFjZXMsIHRoZXJlIGlzIHRoaXMgbWVzc2FnZSB0aGF0Cj4gY291
bGQgYWxzbyBiZSByZWxhdGVkOgo+IFsgICAgMC42MjUzNTRdIGRhNzIxOSA4LTAwMWE6IFVzaW5n
IGRlZmF1bHQgREFJIGNsayBuYW1lczogCj4gZGE3MjE5LWRhaS13Y2xrLCBkYTcyMTktZGFpLWJj
bGsKPgo+IFJlZ2FyZHMsCj4gIFZpY2VudGUuCgpQbGVhc2UsIGlnbm9yZSB0aGlzIGVtYWlsLiBU
aGUgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBzb2x2ZWQgd2l0aApodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdC9jb21taXQvP2g9
Zm9yLTUuNSZpZD00YmYyZTM4NWFhNTljMmZhZTVmODgwYWEyNWNmZDJiNDcwMTA5MDkzCgpSZWdh
cmRzLAogIFZpY2Vuw6cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
