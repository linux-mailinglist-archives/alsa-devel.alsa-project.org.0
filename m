Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27D315D2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D756E1612;
	Fri, 31 May 2019 22:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D756E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559333301;
	bh=D046BpcQav76vDqmBX8pZBDOMSXpxIwRgeCThQf8eaI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKqzuifL5e5EE1Y5X+aNdeSve0amZmOzUQdf2E5X4MJbfb3H9N6mJtfDd7pxVmLAt
	 4CX3fpQNkJJTQXdyyDA1I5DQFJ/PU030OpaKI+HvAW0mO8VOuZkjf406FSRVgPI9ze
	 WyzDqqLWSdn7DPNIRW5+/p/TzV4ZWByqOQeOPB7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36465F896E4;
	Fri, 31 May 2019 22:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25C99F896E4; Wed, 29 May 2019 10:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B56B9F8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 10:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56B9F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com
 header.i=@resnulli-us.20150623.gappssmtp.com header.b="HfhL8wqC"
Received: by mail-wm1-x341.google.com with SMTP id 7so856967wmo.2
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EBIy8akgJJVzGMeoN5L9X2jn2x1GxoKHTkHoU0+i4ZQ=;
 b=HfhL8wqCiookSl50jiJuT1YB5TlSuMeuNrqU2tWcfEUtEQ/AmjA+cvuYkaVQ4gKcHN
 wSRpxcuZF/NNGH2Y5MLanq3MH+ekyD5LIGY1quGY/RW5R5wx60RM2QX8PBTXSjr2f0LE
 GrSfel5vdtBCsk+50onjqOuy0SlHUJmcYWNmZ+DBqkKeGydvzo7ncC0b4i0ZsrazeUrf
 deHnMa1fNBN0eEKOkh+v4Ss0TZu+V2tywk5KUFTt/qlnJ5I7ACVuMx3DbtH06LlW1z78
 GWgSB5/zjVexZBSTTMUPM0xJTUHJ53ZnuNkmkf6Oq1DG3cc4TV4/F0AGW1Mtw4DTfMaA
 KOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EBIy8akgJJVzGMeoN5L9X2jn2x1GxoKHTkHoU0+i4ZQ=;
 b=hkiGaqTWL6BXqe5HVBGD9iuByUK38JumkaCHb94oUonjrl2i35piucdSiLCGCye3zU
 Cmz55GPnZwWhE3j1bsUtg642T+zqrGG/LmX76HfzVOUO546NYDc6hOURfrD8Hh/i5/PX
 KPHrzA/h0Px8mO4P2Qis8QIWo3euiLrJ0X1Y77aQstAcfg6u7OTxfkyGbU9re5wu1GAj
 fwoiRupTMHJsTcnXFzbnU872S/M25NPAa+cm02mjnrOcirHccghYci6h2w1vImjSldcw
 g62AU8ZTftPV1FX1NJzO4FOdYhinXwxlB0tF0WoNTuUjiGcO74HQYhBksdzr1HrC/mMH
 +8LA==
X-Gm-Message-State: APjAAAVKrYufyDPpEQItikKipADdr+f4XKOHXGuyfkPz5PGjwZd+mUCU
 yOFljDFbIJ0Zng0SO0DQhq2cxA==
X-Google-Smtp-Source: APXvYqxVQa+Y+auwZsalqmIXIrSP2DzX25u2YHdLtGqKGkI2wS47Xd0Zk+TI/HfX1YOt5NBkbVB2tg==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr5434256wml.159.1559117094718; 
 Wed, 29 May 2019 01:04:54 -0700 (PDT)
Received: from localhost (ip-89-177-126-215.net.upcbroadband.cz.
 [89.177.126.215])
 by smtp.gmail.com with ESMTPSA id u9sm3165755wme.48.2019.05.29.01.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 01:04:53 -0700 (PDT)
Date: Wed, 29 May 2019 10:04:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20190529080452.GE2252@nanopsycho>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-6-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528142424.19626-6-geert@linux-m68k.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Approved-At: Fri, 31 May 2019 22:06:35 +0200
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 David Howells <dhowells@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH 5/5] [RFC] devlink: Fix uninitialized error
 code in devlink_fmsg_prepare_skb()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6MjQ6MjRQTSBDRVNULCBnZWVydEBsaW51eC1tNjhrLm9y
ZyB3cm90ZToKPldpdGggZ2NjIDQuMToKPgo+ICAgIG5ldC9jb3JlL2RldmxpbmsuYzogSW4gZnVu
Y3Rpb24g4oCYZGV2bGlua19mbXNnX3ByZXBhcmVfc2ti4oCZOgo+ICAgIG5ldC9jb3JlL2Rldmxp
bmsuYzo0MzI1OiB3YXJuaW5nOiDigJhlcnLigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBp
biB0aGlzIGZ1bmN0aW9uCj4KPkluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3Rh
cnQgZW50cmllcywgYW4gdW5pbml0aWFsaXplZCBlcnJvcgo+Y29kZSB3aWxsIGJlIHJldHVybmVk
Lgo+Cj5GaXggdGhpcyBieSBwcmVpbml0aWFsaXppbmcgZXJyIHRvIHplcm8uCj4KPkZpeGVzOiAx
ZGI2NGU4NzMzZjY1MzgxICgiZGV2bGluazogQWRkIGRldmxpbmsgZm9ybWF0dGVkIG1lc3NhZ2Ug
KGZtc2cpIEFQSSIpCj5TaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgo+LS0tCj5JIGRvbid0IGtub3cgaWYgdGhpcyBjYW4gcmVhbGx5IGhhcHBl
biwgYW5kIGlmIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4KPlBlcmhhcHMgZXJyIHNob3VsZCBiZSBp
bml0aWFsaXplZCB0byBzb21lIHZhbGlkIGVycm9yIGNvZGUgaW5zdGVhZD8KCjAgaXMgY29ycmVj
dCBoZXJlLgpBY2tlZC1ieTogSmlyaSBQaXJrbyA8amlyaUBtZWxsYW5veC5jb20+CgpUaGFua3Mh
Cgo+LS0tCj4gbmV0L2NvcmUvZGV2bGluay5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvbmV0L2NvcmUvZGV2bGlu
ay5jIGIvbmV0L2NvcmUvZGV2bGluay5jCj5pbmRleCBkNDNiYzUyYjg4NDBkNzZiLi45MTM3N2U0
ZWFlOWE0M2MxIDEwMDY0NAo+LS0tIGEvbmV0L2NvcmUvZGV2bGluay5jCj4rKysgYi9uZXQvY29y
ZS9kZXZsaW5rLmMKPkBAIC00MzIxLDggKzQzMjEsOCBAQCBkZXZsaW5rX2Ztc2dfcHJlcGFyZV9z
a2Ioc3RydWN0IGRldmxpbmtfZm1zZyAqZm1zZywgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiB7Cj4g
CXN0cnVjdCBkZXZsaW5rX2Ztc2dfaXRlbSAqaXRlbTsKPiAJc3RydWN0IG5sYXR0ciAqZm1zZ19u
bGF0dHI7Cj4rCWludCBlcnIgPSAwOwo+IAlpbnQgaSA9IDA7Cj4tCWludCBlcnI7Cj4gCj4gCWZt
c2dfbmxhdHRyID0gbmxhX25lc3Rfc3RhcnRfbm9mbGFnKHNrYiwgREVWTElOS19BVFRSX0ZNU0cp
Owo+IAlpZiAoIWZtc2dfbmxhdHRyKQo+LS0gCj4yLjE3LjEKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
