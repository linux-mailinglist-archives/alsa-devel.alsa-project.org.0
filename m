Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB62A551
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A73081742;
	Sat, 25 May 2019 18:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A73081742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801527;
	bh=aa2Gtq2bhpsgHUB8QWTrfnT2Jfyv8VmDJHkvMHyi/Zg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=utsPZxiIDamuPlv8PS6jukSGjg1GfXT623a0TwqlDd24cz1fEJtQExUUOuxaHWGZC
	 wSn34k2R6yPiqd1rKGpbBjyPjmCschRgCwFzgzymbm3IMzvrpLKUtDBbwZ3m1NJkYe
	 poz8UY9WnOj+JPINBi9LhxO3wCQc6Nz/Vp3AxhGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97DF1F8970B;
	Sat, 25 May 2019 18:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01372F89707; Sat, 25 May 2019 18:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C67FF806F7
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C67FF806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZV5jA5v5"
Received: by mail-wr1-x444.google.com with SMTP id r7so12779161wrr.13
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1LlOtACKjbEr/GliRByNyiFfoBZkDJEiHct/H5BNOuY=;
 b=ZV5jA5v5EdN40oeJfD4arM0grlVd263pi7HCfu/Lc0qtmkGH6d5JkHX4RLYsVFdo7p
 RxxjsRkFcC3QtLx+gTS7jcGmaZb71ntgsbN8wtjFp5ovd1e8g1cmsNQ9K4Qd5sxVgFzi
 g1PtXq+RM5z3TsGHjJ7KOI/qavbiq7v7ao+zXTa8wXBnh2RhTZVGA9Pzoy02MxBUS9th
 XkP83HXw2qGBW46cSdiN9KuONPMA21B2CtuaYs2KgH0RDSfFhRAk6m4m++OrwiemvWoC
 1etX1l5ZhdKBlg91SWsWmqQNpLC5KWeZhjl8AEXmoeNEg5rPmVScInG4vBtHdTPpsklu
 Hnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1LlOtACKjbEr/GliRByNyiFfoBZkDJEiHct/H5BNOuY=;
 b=VLi08Q0q1vTcY6rSVnMSMoAAeRGJUNOToo7Tv8+COoY1sb9eP1QyoCLx7FDOmUL7GF
 BkkHdQB+kWNQqMsxeGKVnv/aryi0clz5b2eZw/xWcvBdCMlt/i2An+2tPab8DLEdSS5j
 v8d5xjxVliFYCegQngiLlnUOC7kaIUk/V8QK/gOATYvMOH8aZpFIGysXzc9cTP+gXTiI
 +naWfPares4TRgbrE7HtIG2l3PbMcn9lrCDXw6TXduMJzwEpaHgVHTZFoswuQhaokaF/
 lx6BdAfu8IIa03EFWZq4zbhI22OncAIlikdhcqrDoTyP8iugQrCtBpgItAfHnkbgZkcf
 LL6g==
X-Gm-Message-State: APjAAAXFDMj+aqW4z/AEDhwzM9dQw7BcGT7F7yHZJJk+uH3aYwaECVho
 MOa2NI9ilVK7zOzxVvhJQyo=
X-Google-Smtp-Source: APXvYqyTO2kOLZBGZBHawTkZ0RtUqR/jB9g+6yvYM7oTKfsB/3wBtPdMWgtfwwH/UI2W4r3SWneX/A==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr16454565wrm.98.1558801410917; 
 Sat, 25 May 2019 09:23:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:16 +0200
Message-Id: <20190525162323.20216-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 0/7] Allwinner H6 SPDIF support
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

Kkg2IERNQSBzdXBwb3J0IElTIFJFUVVJUkVEKgoKQWxsd2lubmVyIEg2IFNvQyBoYXMgYSBTUERJ
RiBjb250cm9sbGVyIGNhbGxlZCBPbmUgV2lyZSBBdWRpbyAoT1dBKSB3aGljaAppcyBkaWZmZXJl
bnQgZnJvbSB0aGUgcHJldmlvdXMgSDMgZ2VuZXJhdGlvbiBhbmQgbm90IGNvbXBhdGlibGUuCgpE
aWZmZXJlbmNlIGFyZSBhbiBpbmNyZWFzZSBvZiBmaWZvIHNpemVzLCBzb21lIG1lbW9yeSBtYXBw
aW5nIGFyZSBkaWZmZXJlbnQKYW5kIHRoZXJlIGlzIG5vdyB0aGUgcG9zc2liaWxpdHkgdG8gb3V0
cHV0IHRoZSBtYXN0ZXIgY2xvY2sgb24gYSBwaW4uCgpBY3R1YWxseSBhbGwgdGhlc2UgZmVhdHVy
ZXMgYXJlIHVudXNlZCBhbmQgb25seSBhIGJpdCBmb3IgZmx1c2hpbmcgdGhlIFRYCmZpZm8gaXMg
cmVxdWlyZWQuCgpBbHNvIHRoaXMgc2VyaWVzIHJlcXVpcmVzIHRoZSBETUEgd29ya2luZyBvbiBI
NiwgYSBmaXJzdCB2ZXJzaW9uIGhhcyBiZWVuCnN1Ym1pdHRlZCBieSBKZXJuZWogxaBrcmFiZWNb
MV0gYnV0IGhhcyBub3QgYmVlbiBhY2NlcHRlZCB5ZXQuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTg5MDExCgpD
aGFuZ2VzIHNpbmNlIHYyOgogLSBTcGxpdCBxdWlya3MgYW5kIEg2IHN1cHBvcnQgcGF0Y2gKIC0g
QWRkIHNwZWNpZmljIHNlY3Rpb24gZm9yIHF1aXJrcyBjb21tZW50CgpDaGFuZ2VzIHNpbmNlIHYx
OgogLSBSZW1vdmUgSDMgY29tcGF0aWJsZQogLSBBZGQgVFggZmlmbyBiaXQgZmx1c2ggcXVpcmtz
CiAtIEFkZCBINiBiaW5kaW5ncyBpbiBTUERJRiBkcml2ZXIKCkNsw6ltZW50IFDDqXJvbiAoNyk6
CiAgZHQtYmluZGluZ3M6IHNvdW5kOiBzdW40aS1zcGRpZjogQWRkIEFsbHdpbm5lciBINiBjb21w
YXRpYmxlCiAgQVNvQzogc3VuNGktc3BkaWY6IE1vdmUgcXVpcmtzIHRvIHRoZSB0b3AKICBBU29D
OiBzdW40aS1zcGRpZjogQWRkIFRYIGZpZm8gYml0IGZsdXNoIHF1aXJrcwogIEFTb0M6IHN1bjRp
LXNwZGlmOiBBZGQgc3VwcG9ydCBmb3IgSDYgU29DCiAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBB
ZGQgU1BESUYgbm9kZSBmb3IgQWxsd2lubmVyIEg2CiAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBo
NjogRW5hYmxlIFNQRElGIGZvciBCZWVsaW5rIEdTMQogIGFybTY0OiBkZWZjb25maWc6IEVuYWJs
ZSBTdW40aSBTUERJRiBtb2R1bGUKCiAuLi4vYmluZGluZ3Mvc291bmQvc3VueGksc3VuNGktc3Bk
aWYudHh0ICAgICAgfCAgMyArLQogLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmst
Z3MxLmR0cyAgIHwgIDQgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1o
Ni5kdHNpICB8IDM4ICsrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBzb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYyAg
ICAgICAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrLS0tCiA1IGZpbGVzIGNoYW5nZWQs
IDg4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
