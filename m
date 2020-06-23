Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F749205005
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 13:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB7A11793;
	Tue, 23 Jun 2020 13:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB7A11793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592910474;
	bh=CcaM225zZP7WnZ1PC960F675Ck0YgebshhPK0DXhRCI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JxXNYbVDNjDCrEBXqki+PNHeJDEhJ+DpxNhohKjqEhf9yTKgoo8wt9VHPG+EcuAa/
	 qhabFE6ujELvWyJRxLgGCVAbtb/oZ1YC//sBH/0859XpM7vgCrZ6yKWLhJI2KRkxAd
	 0LCvnVzWgbzNxfqW21KOWX881nh8OD+1k9xYGQus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFDBF800B2;
	Tue, 23 Jun 2020 13:06:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45028F80234; Tue, 23 Jun 2020 13:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id B53D2F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 13:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53D2F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="WbyJeYa1"
X-UUID: 1746d2d9aaf84717a1868fe194cb0ea4-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CcaM225zZP7WnZ1PC960F675Ck0YgebshhPK0DXhRCI=; 
 b=WbyJeYa1YmwygxexZSRYMyPs+OMDQevvaC4W3kSL4FPHWPL7grOxDWN6fl7h0S2so88lZd9WHzAJLLq3fJQgV6Y6I4dbQW1w3rdfAecDj0pKbHfKiBlRDbTKa0iYVGGggX04cR05a73V+Luxu65JHBkh2+ZVB2B2EvxvPlT8Mis=;
X-UUID: 1746d2d9aaf84717a1868fe194cb0ea4-20200623
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1849796380; Tue, 23 Jun 2020 19:05:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 19:03:25 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Jun 2020 19:03:19 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Alexander Tsoy <alexander@tsoy.me>, Jussi
 Laako <jussi@sonarnerd.net>, Nick Kossifidis <mickflemm@gmail.com>, Dmitry
 Panchenko <dmitry@d-systems.ee>, Chris Wulff <crwulff@gmail.com>,
 Jesus Ramos <jesus-ramos@live.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] sound: usb: quirks: add quirk for Samsung USBC Headset (AKG)
Date: Tue, 23 Jun 2020 19:03:23 +0800
Message-ID: <1592910203-24035-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 0C8C2E45E79FA20259A2A0BA8BD54FE967742A430CC67CFC5A05F99C5875173C2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-usb@vger.kernel.org, stable@vger.kernel.org,
 Chihhao Chen <chihhao.chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>
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

V2UndmUgZm91bmQgU2Ftc3VuZyBVU0JDIEhlYWRzZXQgKEFLRykgKFZJRDogMHgwNGU4LCBQSUQ6
IDB4YTA1MSkNCm5lZWQgYSB0aW55IGRlbGF5IGFmdGVyIGVhY2ggY2xhc3MgY29tcGxpYW50IHJl
cXVlc3QuDQpPdGhlcndpc2UgdGhlIGRldmljZSBtaWdodCBub3QgYmUgYWJsZSB0byBiZSByZWNv
Z25pemVkIGVhY2ggdGltZXMuDQoNClNpZ25lZC1vZmYtYnk6IENoaWhoYW8gQ2hlbiA8Y2hpaGhh
by5jaGVuQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVs
LmxpbkBtZWRpYXRlay5jb20+DQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KLS0tDQogc291
bmQvdXNiL3F1aXJrcy5jIHwgICAgOCArKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9x
dWlya3MuYw0KaW5kZXggYmNhMDE3OS4uZWJiYTI5YSAxMDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9x
dWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQpAQCAtMTY3Myw2ICsxNjczLDE0IEBA
IHZvaWQgc25kX3VzYl9jdGxfbXNnX3F1aXJrKHN0cnVjdCB1c2JfZGV2aWNlICpkZXYsIHVuc2ln
bmVkIGludCBwaXBlLA0KIAkgICAgIGNoaXAtPnVzYl9pZCA9PSBVU0JfSUQoMHgwOTUxLCAweDE2
YWQpKSAmJg0KIAkgICAgKHJlcXVlc3R0eXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVf
Q0xBU1MpDQogCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQorDQorCS8qDQorCSAqIFNhbXN1
bmcgVVNCQyBIZWFkc2V0IChBS0cpIG5lZWQgYSB0aW55IGRlbGF5IGFmdGVyIGVhY2gNCisJICog
Y2xhc3MgY29tcGxpYW50IHJlcXVlc3QuIChNb2RlbCBudW1iZXI6IEFBTTYyNVIgb3IgQUFNNjI3
UikNCisJICovDQorCWlmIChjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MDRlOCwgMHhhMDUxKSAm
Jg0KKwkgICAgKHJlcXVlc3R0eXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfQ0xBU1Mp
DQorCQl1c2xlZXBfcmFuZ2UoNTAwMCwgNjAwMCk7DQogfQ0KIA0KIC8qDQotLSANCjEuNy45LjUN
Cg==

