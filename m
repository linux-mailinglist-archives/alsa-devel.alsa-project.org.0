Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581C1EF5F1
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 12:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502A1166F;
	Fri,  5 Jun 2020 12:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502A1166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591354723;
	bh=aftpXunH1eDQjPXFO8QI2IEzKcVO0kd6k1ZnXlRllyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUNPshN7di5FwXP8Om0XpU1Qx6m4GJ/gkNO+mmYAphwQAKgm9K/JzOARcvuXrXFXa
	 kMsB7JBs5vX9LrDmAsig/AknA5KesdpywiHwd+NJRfQtBrYyVW21MwuRenZ5og1FY4
	 6V3HVcDwEZCPhyemvXRjBHk982L7o4grqGfXMyxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 335A5F801ED;
	Fri,  5 Jun 2020 12:56:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 319E3F80132; Fri,  5 Jun 2020 12:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E1E3F80132
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 12:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E1E3F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="imIUKZaE"
X-UUID: 452175213f474d4f84d19a4d95870696-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aftpXunH1eDQjPXFO8QI2IEzKcVO0kd6k1ZnXlRllyc=; 
 b=imIUKZaEboJB+oYJioFi8Jf7gpXIPl8fkBtXskcquOfpS1GrHlHu5Tm/rk4clIdBrfK0XgRD8I8Ll4/kG6CaK053VqtXv+HpFhexz8/jQWaVWOa85syyuFQDnqMocVEckNyTK9NG1UecQHmimBO6gC5yuX7XwiOqxGtQLST99O0=;
X-UUID: 452175213f474d4f84d19a4d95870696-20200605
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1145695321; Fri, 05 Jun 2020 18:35:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 18:35:51 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 18:35:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>, <hariprasad.kelam@gmail.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: mediatek: mt6358: add dmic-mode
 property
Date: Fri, 5 Jun 2020 18:33:42 +0800
Message-ID: <1591353222-18576-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: B6D503AACFAC6336B1F99D24FEE7774998F44BBDEEE0678BB989AFCEBCD95E0C2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, howie.huang@mediatek.com,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

QWRkcyBkbWljLW1vZGUgcHJvcGVydHkgYW5kIHVwZGF0ZXMgZXhhbXBsZS4NCg0KU2lnbmVkLW9m
Zi1ieTogSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OC50eHQgfCA2ICsrKysrKw0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDYzNTgudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OC50eHQNCmluZGV4IDU0NjU3MzAuLjU5YTcz
ZmYgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
bXQ2MzU4LnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L210NjM1OC50eHQNCkBAIC0xMCw5ICsxMCwxNSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KIC0g
Y29tcGF0aWJsZSA6ICJtZWRpYXRlayxtdDYzNTgtc291bmQiLg0KIC0gQXZkZC1zdXBwbHkgOiBw
b3dlciBzb3VyY2Ugb2YgQVZERA0KIA0KK09wdGlvbmFsIHByb3BlcnRpZXM6DQorLSBtZWRpYXRl
ayxkbWljLW1vZGUgOiBJbmRpY2F0ZXMgaG93IG1hbnkgZGF0YSBwaW5zIGFyZSB1c2VkIHRvIHRy
YW5zbWl0IHR3bw0KKwljaGFubmVscyBvZiBQRE0gc2lnbmFsLiAwIG1lYW5zIHR3byB3aXJlcywg
MSBtZWFucyBvbmUgd2lyZS4gRGVmYXVsdA0KKwl2YWx1ZSBpcyAwLg0KKw0KIEV4YW1wbGU6DQog
DQogbXQ2MzU4X3NuZCB7DQogCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzU4LXNvdW5kIjsN
CiAJQXZkZC1zdXBwbHkgPSA8Jm10NjM1OF92YXVkMjhfcmVnPjsNCisJbWVkaWF0ZWssZG1pYy1t
b2RlID0gPDA+Ow0KIH07DQotLSANCjEuOC4xLjEuZGlydHkNCg==

